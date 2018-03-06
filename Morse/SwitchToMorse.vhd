LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE IEEE.std_logic_arith.all; 
USE ieee.std_logic_unsigned.all;

ENTITY SwitchToMorse IS 
	PORT (CHAR : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			MorseVector : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
			START_VEC   : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END SwitchToMorse;

ARCHITECTURE Structure OF SwitchToMorse IS 
BEGIN

	WITH CHAR SELECT
		MorseVector <= "ZZZZZZ101110" WHEN "000", --A
						   "ZZ1110101010" WHEN "001", --B
						   "111010111010" WHEN "010", --C
						   "ZZZZ11101010" WHEN "011", --D
						   "ZZZZZZZZZZ10"	WHEN "100", --E
						   "ZZ1010111010" WHEN "101", --F
						   "ZZ1110111010" WHEN "110", --G
						   "ZZZZ10101010" WHEN "111", --H
						   "ZZZZZZZZ1111"	WHEN others;
					
	WITH CHAR SELECT	
	   START_VEC <=   "0101" WHEN "000",
							"1001" WHEN "001",
							"1011" WHEN "010",
							"0111" WHEN "011",	
							"0001" WHEN "100",
							"1001" WHEN "101",
							"1001" WHEN "110",
							"0111" WHEN "111",
							"0011" WHEN others;
					
END Structure;

