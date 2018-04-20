LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; --Esta libreria sera necesaria si usais conversiones CONV_INTEGER
USE ieee.numeric_std.all;

ENTITY controladores_IO IS  
  PORT (	boot			: IN  STD_LOGIC; 
			CLOCK_50    : IN  std_logic; 
			addr_io     : IN  std_logic_vector(7 downto 0); 
			wr_io  		: in  std_logic_vector(15 downto 0); 
			rd_io 		: out std_logic_vector(15 downto 0); 
			wr_out 		: in  std_logic; 
			rd_in 		: in  std_logic; 
			ps2_clk 		: inout std_logic;
			ps2_data		: inout std_logic;
			led_verdes  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
			led_rojos   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			display		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			power_display : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			keys			: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			switches		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			vga_cursor : out std_logic_vector(15 downto 0);
			vga_cursor_enable : out std_logic); 	
END controladores_IO; 

ARCHITECTURE Structure OF controladores_IO IS
	
	type IO_address_space is array (22 downto 0) of std_logic_vector (15 downto 0); --Perque compili mes rapid.
	
	SIGNAL ports : IO_address_space;

	CONSTANT LEDV_P	 			: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"05"; 
	CONSTANT LEDR_P 				: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"06";
	CONSTANT KEY_P					: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"07";
	CONSTANT SWITCH_P				: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"08";
	CONSTANT POWER_DISPLAY_P 	: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"09";	
	CONSTANT DISPLAY_P 			: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"0A"; 
	CONSTANT KEYBOARD_READ_P	: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"0F";
	CONSTANT KEYBOARD_ST_P		: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"10";
	CONSTANT RAND_P				: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"14";
	CONSTANT MS_COUNT_P			: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"15";

	COMPONENT keyboard_controller is
   Port (clk        : in    STD_LOGIC;
          reset      : in    STD_LOGIC;
          ps2_clk    : inout STD_LOGIC;
          ps2_data   : inout STD_LOGIC;
          read_char  : out   STD_LOGIC_VECTOR (7 downto 0);
          clear_char : in    STD_LOGIC;
          data_ready : out   STD_LOGIC);
	END COMPONENT;
	
	COMPONENT counter_ms IS 
	PORT (
		CLOCK_50 		: IN 		std_logic;
		ms_to_count		: IN	 	std_logic_vector(15 downto 0);
		ms_value			: OUT		std_logic_vector(15 downto 0);
		cycles_counted : OUT 	std_logic_vector(15 downto 0);
		write_enable	: IN 		std_logic
	);
	END COMPONENT;
	
	signal read_char_bus : STD_LOGIC_VECTOR (7 downto 0);
	signal clear_char_bus : STD_LOGIC := '0' ;
	signal data_ready_bus : STD_LOGIC := '0' ;
	
	signal bus_ms_to_count 		: STD_LOGIC_VECTOR (15 downto 0);
	signal bus_ms_value			: STD_LOGIC_VECTOR (15 downto 0);
	signal bus_cycles_counted 	: STD_LOGIC_VECTOR (15 downto 0);
	signal ms_counter_we			: std_logic;
	
BEGIN

		keyboard_controller0 : keyboard_controller
		port map(
			clk => CLOCK_50,
			reset => boot,
			ps2_clk => ps2_clk,
			ps2_data => ps2_data,
			read_char =>read_char_bus,
			clear_char=> clear_char_bus,
			data_ready => data_ready_bus
		);
		
		counter_ms0 : counter_ms 
		PORT MAP(
			CLOCK_50 		=> CLOCK_50,
			ms_to_count 	=> bus_ms_to_count,
			cycles_counted => bus_cycles_counted,
			ms_value			=> bus_ms_value,
			write_enable	=> ms_counter_we
		);

		led_verdes <= ports(conv_integer(LEDV_P))(7 DOWNTO 0);  -- port 5
		led_rojos  <= ports(conv_integer(LEDR_P))(7 DOWNTO 0);  -- port 6
		
		display 			<= ports(conv_integer(DISPLAY_P));
		power_display 	<= ports(conv_integer(POWER_DISPLAY_P))(3 DOWNTO 0);
		
		rd_io	<= X"000" & "000" & data_ready_bus 	WHEN rd_in = '1' AND addr_io = KEYBOARD_ST_P 	ELSE
					X"00" & read_char_bus				WHEN rd_in = '1' AND addr_io = KEYBOARD_READ_P 	ELSE
					bus_ms_value							WHEN rd_in = '1' AND addr_io = MS_COUNT_P			ELSE
					bus_cycles_counted					WHEN rd_in = '1' AND addr_io = RAND_P				ELSE
					ports(conv_integer(addr_io)) 		WHEN rd_in = '1';  -- Reads
		
		PROCESS (CLOCK_50)
		BEGIN
			
			IF rising_edge(CLOCK_50) THEN
				IF clear_char_bus = '1' THEN
					clear_char_bus <= '0';
				END IF;
				
				IF wr_out = '1' AND addr_io /= KEYBOARD_ST_P THEN
					ports(conv_integer(addr_io)) <= wr_io ; -- Writes
					
				ELSIF wr_out = '1' AND addr_io = MS_COUNT_P THEN
					bus_ms_to_count <= wr_io; 
				
				ELSIF wr_out = '1' THEN
					clear_char_bus <= '1';
				END IF;
				
				ports(conv_integer(KEY_P)) 	<= X"000" & keys;
				ports(conv_integer(SWITCH_P)) <=  X"00" & switches;
			END IF;
		
		END PROCESS;
		
		ms_counter_we <= wr_out WHEN addr_io = MS_COUNT_P ELSE
								'0';
		
		vga_cursor <= X"0000";
		vga_cursor_enable <= '0';
		
END Structure;

--##############################################################################################################
--##############################################################################################################
--##############################################################################################################

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY counter_ms IS 
	PORT (
		CLOCK_50 		: IN 	std_logic;
		ms_to_count		: IN 	std_logic_vector(15 downto 0);
		ms_value			: OUT std_logic_vector(15 downto 0);
		cycles_counted : OUT std_logic_vector(15 downto 0);
		write_enable	: IN 	std_logic
	 );
END counter_ms;

ARCHITECTURE Structure OF counter_ms IS

	SIGNAL counter_cyc 		: std_logic_vector (15 downto 0) := X"0000";
	SIGNAL tmp_ms_counter	: std_logic_vector (15 downto 0) := X"0000";

BEGIN

	-- Every time the process is triggered 20ns past, then 
	-- 50.000 cycles are equal to 1ms
	
	PROCESS (CLOCK_50) 
	BEGIN
		IF rising_edge(CLOCK_50) THEN
			IF counter_cyc = 0 THEN
				counter_cyc <= X"C350";
				IF tmp_ms_counter > 0 AND write_enable = '0' THEN
					tmp_ms_counter <= tmp_ms_counter - 1;
				ELSIF write_enable = '1' THEN
					tmp_ms_counter <= ms_to_count;
				END IF;
			ELSE  
				counter_cyc <= counter_cyc - 1;
			END IF;
		END IF;
	END PROCESS;

	ms_value	<= tmp_ms_counter;
	cycles_counted <= counter_cyc;

END Structure;

