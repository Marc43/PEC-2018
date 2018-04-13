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
			switches		: IN STD_LOGIC_VECTOR (7 DOWNTO 0)); 
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
	COMPONENT keyboard_controller is
   Port (clk        : in    STD_LOGIC;
          reset      : in    STD_LOGIC;
          ps2_clk    : inout STD_LOGIC;
          ps2_data   : inout STD_LOGIC;
          read_char  : out   STD_LOGIC_VECTOR (7 downto 0);
          clear_char : in    STD_LOGIC;
          data_ready : out   STD_LOGIC);
	END COMPONENT;
	
	signal read_char_bus : STD_LOGIC_VECTOR (7 downto 0);
	signal clear_char_bus : STD_LOGIC := '0' ;
	signal data_ready_bus : STD_LOGIC := '0' ;
	
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

		led_verdes <= ports(conv_integer(LEDV_P))(7 DOWNTO 0);  -- port 5
		led_rojos  <= ports(conv_integer(LEDR_P))(7 DOWNTO 0);  -- port 6
		
		display 			<= ports(conv_integer(DISPLAY_P));
		power_display 	<= ports(conv_integer(POWER_DISPLAY_P))(3 DOWNTO 0);
		
		rd_io	<= X"000" & "000" & data_ready_bus WHEN rd_in = '1' AND addr_io = KEYBOARD_ST_P ELSE
					X"00" & read_char_bus	WHEN rd_in = '1' AND addr_io = KEYBOARD_READ_P ELSE
					ports(conv_integer(addr_io)) WHEN rd_in = '1';  -- Reads
		
		PROCESS (CLOCK_50)
		BEGIN
			
			
			IF rising_edge(CLOCK_50) THEN
				IF clear_char_bus = '1' THEN
					clear_char_bus <= '0';
				END IF;
				
				IF wr_out = '1' AND addr_io /= KEYBOARD_ST_P THEN
					ports(conv_integer(addr_io)) <= wr_io ; -- Writes
				ELSIF wr_out = '1' THEN
					clear_char_bus <= '1';
				END IF;
				
				ports(conv_integer(KEY_P)) 	<= X"000" & keys;
				ports(conv_integer(SWITCH_P)) <=  X"00" & switches;
			END IF;
		
		END PROCESS;
		
END Structure;