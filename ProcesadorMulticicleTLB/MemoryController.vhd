library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MemoryController is
    port (CLOCK_50  : in  std_logic;
			 addr      : in  std_logic_vector(15 downto 0);
          wr_data   : in  std_logic_vector(15 downto 0);
          rd_data   : out std_logic_vector(15 downto 0);
          we        : in  std_logic;
          byte_m    : in  std_logic;
			 mode : in std_logic;

          SRAM_ADDR : out   std_logic_vector(17 downto 0);
          SRAM_DQ   : inout std_logic_vector(15 downto 0);
          SRAM_UB_N : out   std_logic;
          SRAM_LB_N : out   std_logic;
          SRAM_CE_N : out   std_logic := '1';
          SRAM_OE_N : out   std_logic := '1';
          SRAM_WE_N : out   std_logic := '1';
			 			 
			 vga_addr : out std_logic_vector(12 downto 0);
			 vga_we : out std_logic;
			 vga_wr_data : out std_logic_vector(15 downto 0);
			 vga_rd_data : in std_logic_vector(15 downto 0);
			 vga_byte_m : out std_logic;
			 unaligned_access	: out std_logic
			 );
end MemoryController;

architecture comportament of MemoryController is
	
	component SRAMController is
    port (clk         : in    std_logic;
          SRAM_ADDR   : out   std_logic_vector(17 downto 0);
          SRAM_DQ     : inout std_logic_vector(15 downto 0);
          SRAM_UB_N   : out   std_logic;
          SRAM_LB_N   : out   std_logic;
          SRAM_CE_N   : out   std_logic := '1';
          SRAM_OE_N   : out   std_logic := '1';
          SRAM_WE_N   : out   std_logic := '1';
			 
          address     : in    std_logic_vector(15 downto 0) := "0000000000000000";
          dataReaded  : out   std_logic_vector(15 downto 0);
          dataToWrite : in    std_logic_vector(15 downto 0);
          WR          : in    std_logic;
          byte_m      : in    std_logic := '0');
	end component;
	
	signal bus_addr 	: std_logic_vector (15 downto 0);
	signal bus_datawr	: std_logic_vector (15 downto 0);
	--signal bus_datard	: std_logic_vector;
	signal bus_we		: std_logic;
	signal bus_byte	: std_logic;
	--signal bus_unaligned_access : std_logic;
	
	signal instr_memory_limit : std_logic_vector (15 downto 0) := X"C000"; -- Any address >= to this one is invalid to write
	signal vga_lower_limit : std_logic_vector (15 downto 0) := X"A000";
	signal vga_upper_limit : std_logic_vector (15 downto 0) := X"B2BE";
	
	signal sys_lower_limit : std_logic_vector (15 downto 0) := X"8000";
	signal sys_upper_limit : std_logic_vector (15 downto 0) := X"FFFF"; -- by the moment the VGA does not cause exceptions
	
begin
	
	controller0 : SRAMController
	PORT MAP (
		clk 			=> CLOCK_50,
		SRAM_ADDR 	=> SRAM_ADDR,
		SRAM_DQ 		=> SRAM_DQ,
		SRAM_UB_N 	=> SRAM_UB_N,
		SRAM_LB_N	=> SRAM_LB_N,
		SRAM_CE_N	=> SRAM_CE_N,
		SRAM_OE_N	=> SRAM_OE_N,
		SRAM_WE_N	=> SRAM_WE_N,
		
		address		=> bus_addr,
		dataReaded	=> rd_data,
		dataToWrite	=> bus_datawr,
		WR				=> bus_we,
		byte_m		=> bus_byte
	);
	
	bus_we 		<= we when unsigned(addr) < unsigned(instr_memory_limit) else
						'0';
						
	bus_addr		<= addr;
	bus_datawr	<= wr_data;
	bus_byte 	<= byte_m;
	
	vga_addr <= addr(12 DOWNTO 0);
	vga_we <= we WHEN unsigned(addr) >= unsigned(vga_lower_limit) AND 
							unsigned(addr) <= unsigned(vga_upper_limit) ELSE
				 '0';
				 
	vga_wr_data <= wr_data;
	vga_byte_m  <= byte_m;
	
	unaligned_access <= '1' WHEN byte_m = '0' AND addr(0) = '1' ELSE -- Word access
							  
							  '0'; 
	
--	prot_access <= '1' WHEN ((unsigned(addr) >= unsigned(sys_lower_limit) AND unsigned(addr) < unsigned(vga_lower_limit)) OR
--									(unsigned(addr) >  unsigned(vga_upper_limit) AND unsigned(addr) <= unsigned(sys_upper_limit))) AND mode = '0' ELSE
--									
--						'0'; 
									
	--unaligned_access <= bus_unaligned_access;
	
end comportament;
