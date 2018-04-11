LIBRARY ieee;
USE ieee.std_logic_1164.all;
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

BEGIN
		led_verdes <= X"00";
		led_rojos  <= X"00";
		rd_io		  <= X"0000";
		
END Structure;