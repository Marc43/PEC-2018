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
			led_rojos   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); 
END controladores_IO; 

ARCHITECTURE Structure OF controladores_IO IS
	
	type IO_address_space is array (7 downto 0) of std_logic_vector (15 downto 0);
	
	SIGNAL ports : IO_address_space;

	CONSTANT LED_V : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"05"; --5
	CONSTANT LED_R : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"06"; --6

BEGIN

		led_verdes <= ports(conv_integer(LED_V))(7 DOWNTO 0);  -- port 5
		led_rojos  <= ports(conv_integer(LED_R))(7 DOWNTO 0);  -- port 6
		
		rd_io	<= ports(conv_integer(addr_io)) WHEN rd_in 	= '1'; -- Reads
		
		ports(conv_integer(addr_io)) <= wr_io WHEN wr_out 	= '1'; -- Writes
		
END Structure;