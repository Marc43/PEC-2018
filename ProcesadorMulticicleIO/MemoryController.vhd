library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MemoryController is
    port (CLOCK_50  : in  std_logic;
			 addr      : in  std_logic_vector(15 downto 0);
          wr_data   : in  std_logic_vector(15 downto 0);
          rd_data   : out std_logic_vector(15 downto 0);
          we        : in  std_logic;
          byte_m    : in  std_logic;

          SRAM_ADDR : out   std_logic_vector(17 downto 0);
          SRAM_DQ   : inout std_logic_vector(15 downto 0);
          SRAM_UB_N : out   std_logic;
          SRAM_LB_N : out   std_logic;
          SRAM_CE_N : out   std_logic := '1';
          SRAM_OE_N : out   std_logic := '1';
          SRAM_WE_N : out   std_logic := '1');
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
	
	signal instr_memory_limit : std_logic_vector (15 downto 0) := X"C000"; -- Any address >= to this one is invalid to write
	
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
	
	bus_we 		<= we when addr < instr_memory_limit else
						'0';
						
	bus_addr		<= addr;
	bus_datawr	<= wr_data;
	bus_byte 	<= byte_m;

end comportament;
