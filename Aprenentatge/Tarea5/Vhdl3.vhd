LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY driver7Segmentos IS

 PORT( codigoCaracter : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
 bitsCaracter : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
 
END driver7Segmentos;

ARCHITECTURE Conversor OF driver7Segmentos IS
BEGIN

	WITH codigoCaracter SELECT 
		bitsCaracter <= "0001001" WHEN "000",
							 "1000000" WHEN "001",
							 "1000111" WHEN "010",
							 "0001000" WHEN "011",
							 "0111111" WHEN others;
							
END Conversor;