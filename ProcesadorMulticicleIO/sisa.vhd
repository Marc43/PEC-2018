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
			 LEDG   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
			 LEDR   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
			 KEY	  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
          SW     : in  std_logic_vector(9 downto 0);
			 HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			 HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			 HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			 HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END sisa;

ARCHITECTURE Structure OF sisa IS

	component proc IS
    PORT (clk       : IN  STD_LOGIC;
          boot      : IN  STD_LOGIC;
          datard_m  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_m    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          data_wr   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          wr_m      : OUT STD_LOGIC;
          word_byte : OUT STD_LOGIC;
			 wr_port	  : OUT STD_LOGIC;
			 rd_port	  : OUT STD_LOGIC;
			 addr_port : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			 rd_io	  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		    wr_io	  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
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
	
  COMPONENT controladores_IO IS  
  PORT (	boot			: IN  STD_LOGIC; 
			CLOCK_50    : IN  std_logic; 
			addr_io     : IN  std_logic_vector(7 downto 0); 
			wr_io  		: in  std_logic_vector(15 downto 0); 
			rd_io 		: out std_logic_vector(15 downto 0); 
			wr_out 		: in  std_logic; 
			rd_in 		: in  std_logic; 
			led_verdes  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
			led_rojos   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			display		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			power_display : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			keys			: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			switches		: IN STD_LOGIC_VECTOR (7 DOWNTO 0)); 
	END COMPONENT; 
	
	COMPONENT Display7 IS
	PORT(
		enable 			: IN STD_LOGIC;
		VALOR 			: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		bitsCaracter 	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT;
	
	signal gboot : std_logic;
	
	signal clk_proc		 	: std_logic := '0';	-- Wires between devices
	signal bus_addr			: std_logic_vector (15 downto 0);
	signal bus_data_wr		: std_logic_vector (15 downto 0);
	signal bus_wr_m			: std_logic;
   signal bus_word_byte		: std_logic;
	
	signal bus_data_rd		: std_logic_vector (15 downto 0); -- Out from devices
	
	signal bus_addr_io		: std_logic_vector (7 downto 0);
	signal bus_wr_io			: std_logic_vector (15 downto 0);
	signal bus_rd_io			: std_logic_vector (15 downto 0);
	signal bus_wr_port		: std_logic;
	signal bus_rd_port		: std_logic;
	
	signal ticks : std_logic_vector (2 downto 0) := "000";
	
	signal bus_display : std_logic_vector (15 downto 0);
	signal bus_power_display : std_logic_vector (3 downto 0);
	
BEGIN

	clk_calc : process (CLOCK_50)
	begin
		if rising_edge(CLOCK_50) then
			ticks <= ticks+1;
			if ticks="111" then
				clk_proc <= not clk_proc;
			end if;
		end if;
	end process;
	proc0 : proc
	port map (
		clk 		=> clk_proc,
		boot 		=> gboot,
		datard_m	=> bus_data_rd,
		addr_m	=> bus_addr,
		data_wr	=> bus_data_wr,
		wr_m		=> bus_wr_m,
		word_byte=> bus_word_byte,
		wr_port	=> bus_wr_port,
		rd_port	=> bus_rd_port,
		addr_port => bus_addr_io,
		rd_io	  	=> bus_rd_io,
		wr_io		=> bus_wr_io
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
	
	controladores_IO0 : controladores_IO
	port map (
		boot			=> gboot,
		CLOCK_50 	=> CLOCK_50,
		addr_io  	=> bus_addr_io,
		wr_io  		=> bus_wr_io,
		rd_io 		=> bus_rd_io,
		wr_out 		=> bus_wr_port,
		rd_in 		=> bus_rd_port, 
		led_verdes  => LEDG,
		led_rojos   => LEDR,
		display		=> bus_display,
		power_display	=> bus_power_display,
		keys			=> KEY,
		switches		=> SW(7 DOWNTO 0)
	);
	
	
	display0 : Display7
	port map (
		enable 		 => bus_power_display(0),
		bitsCaracter => HEX0,
		VALOR			 => bus_display(3 downto 0)	
	);
	
	display1 : Display7
	port map (
		enable 		 => bus_power_display(1),
		bitsCaracter => HEX1,
		VALOR			 => bus_display(7 downto 4)	
	);
	
	display2 : Display7
	port map (
		enable 		 => bus_power_display(2),
		bitsCaracter => HEX2,
		VALOR			 => bus_display(11 downto 8)	
	);
	
	display3 : Display7
	port map (
		enable 		 => bus_power_display(3),
		bitsCaracter => HEX3,
		VALOR			 => bus_display(15 downto 12)	
	);
	
	gboot <= SW(9);
		
END Structure;