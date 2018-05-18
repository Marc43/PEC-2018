LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Display7 IS
 PORT(enable : IN STD_LOGIC;
		VALOR  : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		bitsCaracter : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END Display7;

ARCHITECTURE Structure OF Display7 IS
	SIGNAL mux_bits : STD_LOGIC_VECTOR (6 DOWNTO 0);
BEGIN

	WITH VALOR SELECT 
		mux_bits <= 	 "1000000" WHEN "0000",
							 "1111001" WHEN "0001",
							 "0100100" WHEN "0010",
							 "0110000" WHEN "0011",
							 "0011001" WHEN "0100",
							 "0010010" WHEN "0101",
							 "0000010" WHEN "0110",
							 "1111000" WHEN "0111",
							 "0000000" WHEN "1000",
							 "0011000" WHEN "1001",
							 "0001000" WHEN "1010",
							 "0000000" WHEN "1011",
							 "1000110" WHEN "1100",
							 "1000000" WHEN "1101",
							 "0000110" WHEN "1110",
							 "0001110" WHEN "1111",
							 "0000110" WHEN others;
							 
	bitsCaracter <= mux_bits WHEN enable = '1' ELSE
	
						 "1111111";
	
END Structure;