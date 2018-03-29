LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY sisa IS
    PORT (CLOCK_50  : IN    STD_LOGIC;
          SRAM_ADDR : out   std_logic_vector(17 downto 0);
          SRAM_DQ   : inout std_logic_vector(15 downto 0);
          SRAM_UB_N : out   std_logic;
          SRAM_LB_N : out   std_logic;
          SRAM_CE_N : out   std_logic := '1';
          SRAM_OE_N : out   std_logic := '1';
          SRAM_WE_N : out   std_logic := '1';
          SW        : in std_logic_vector(9 downto 9));
END sisa;

ARCHITECTURE Structure OF sisa IS

	component proc IS
    PORT (clk       : IN  STD_LOGIC;
          boot      : IN  STD_LOGIC;
          datard_m  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_m    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          data_wr   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          wr_m      : OUT STD_LOGIC;
          word_byte : OUT STD_LOGIC);
	END component;

	component MemoryController is
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
	end component;
	
	signal clk_proc		 	: std_logic := '0';	-- Wires between devices
	signal bus_addr			: std_logic_vector (15 downto 0);
	signal bus_data_wr		: std_logic_vector (15 downto 0);
	signal bus_wr_m			: std_logic;
   signal bus_word_byte		: std_logic;
	
	signal bus_data_rd		: std_logic_vector (15 downto 0); -- Out from devices
	
BEGIN

	clk_calc : process (CLOCK_50)
		variable ticks : std_logic_vector (2 downto 0) := "000";
	begin
	
			if ticks = "111" then
				
				clk_proc <= not clk_proc; -- As the signal is assigned at the 
												  -- end of the process, the 7th will be the 8th tick
			end if;
			
			ticks := ticks + 1;
			
	end process;
	
	proc0 : proc
	port map (
		clk 		=> clk_proc,
		boot 		=> SW(9),
		datard_m	=> bus_data_rd,
		addr_m	=> bus_addr,
		data_wr	=> bus_data_wr,
		wr_m		=> bus_wr_m,
		word_byte=> bus_word_byte
	);
	
	mem_ctrl0 : MemoryController
	port map (
		CLOCK_50 => CLOCK_50,
		addr		=> bus_addr,
		wr_data	=> bus_data_wr,
		rd_data	=> bus_data_rd,
		we			=> bus_wr_m,
		byte_m	=> bus_word_byte,
		SRAM_ADDR=> SRAM_ADDR,
		SRAM_DQ	=> SRAM_DQ,
		SRAM_UB_N=> SRAM_UB_N,
		SRAM_LB_N=> SRAM_LB_N,
		SRAM_CE_N=>	SRAM_CE_N,
		SRAM_OE_N=> SRAM_OE_N,
		SRAM_WE_N=> SRAM_WE_N
	);
	
END Structure;