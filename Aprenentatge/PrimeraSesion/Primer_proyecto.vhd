LIBRARY ieee;
USE ieee.std_logic_1164.all; 

ENTITY Primer_proyecto IS 
	PORT( KEY : IN STD_LOGIC_VECTOR  (1 DOWNTO 0);
	      LEDG : OUT STD_LOGIC_VECTOR (2 DOWNTO 2));
END Primer_proyecto;

ARCHITECTURE Structure OF Primer_proyecto IS 
BEGIN 
	LEDG(2) <= not(KEY(0)) AND not(KEY(1));
END Structure;
