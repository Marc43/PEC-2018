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
			led_verdes  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
			led_rojos   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			display		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			power_display : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			keys			: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			switches		: IN STD_LOGIC_VECTOR (7 DOWNTO 0)); 
END controladores_IO; 

ARCHITECTURE Structure OF controladores_IO IS
	
	type IO_address_space is array (255 downto 0) of std_logic_vector (15 downto 0);
	
	SIGNAL ports : IO_address_space;

	CONSTANT LEDV_P	 			: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"05"; 
	CONSTANT LEDR_P 				: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"06";
	CONSTANT KEY_P					: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"07";
	CONSTANT SWITCH_P				: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"08";
	CONSTANT POWER_DISPLAY_P 	: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"09";	
	CONSTANT DISPLAY_P 			: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"0A"; 
	
BEGIN

		led_verdes <= ports(conv_integer(LEDV_P))(7 DOWNTO 0);  -- port 5
		led_rojos  <= ports(conv_integer(LEDR_P))(7 DOWNTO 0);  -- port 6

		display 			<= ports(conv_integer(DISPLAY_P));
		power_display 	<= ports(conv_integer(POWER_DISPLAY_P))(3 DOWNTO 0);
		
		rd_io	<= ports(conv_integer(addr_io)) WHEN rd_in 	= '1'; -- Reads
		
		PROCESS (CLOCK_50)
		BEGIN
		
			IF rising_edge(CLOCK_50) THEN
				IF wr_out 	= '1' THEN
					ports(conv_integer(addr_io)) <= wr_io; -- Writes
				END IF;
				
				ports(conv_integer(KEY_P)) 	<= key;
				ports(conv_integer(SWITCH_P)) <= switch;
				
			END IF;
		
		END PROCESS;
		
END Structure;