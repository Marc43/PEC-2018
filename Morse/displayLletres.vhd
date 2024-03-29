LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Display7 IS
 PORT(VALOR : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
 bitsCaracter : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END Display7;

ARCHITECTURE Structure OF Display7 IS
BEGIN

	WITH VALOR SELECT 
		bitsCaracter <= "0001000" WHEN "000",
							 "0000011" WHEN "001",
							 "1000110" WHEN "010",
							 "0100001" WHEN "011",
							 "0000110" WHEN "100",
							 "0001110" WHEN "101",
							 "0010000" WHEN "110",
							 "0001001" WHEN "111",
							 "0000110" WHEN others;
END Structure;