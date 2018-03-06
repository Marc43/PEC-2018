LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Tarea4 IS
 PORT( SW   : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
       HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END Tarea4;

ARCHITECTURE Segmentos7 OF Tarea4 IS 
BEGIN

	WITH SW SELECT 
		HEX0 <= "1000000" WHEN "000",
		        "0000110" WHEN "001",
				  "0100100" WHEN "010",
				  "0110000" WHEN "011",
				  "1111111" WHEN others;
			  
END Segmentos7; 