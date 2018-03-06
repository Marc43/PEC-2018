LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
ENTITY Tarea7a IS
 PORT( CLOCK_50 : IN std_logic;
 HEX0 : OUT std_logic_vector(6 downto 0));
END Tarea7a;

ARCHITECTURE Structure OF Tarea7a IS

	COMPONENT Display7 IS 
	PORT (VALOR : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
   bitsCaracter : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT;

	SIGNAL cnt : STD_LOGIC_VECTOR(23 DOWNTO 0);
	SIGNAL dis : STD_LOGIC_VECTOR( 3 DOWNTO 0);
	
BEGIN

   visor0 : Display7
	Port Map( VALOR => dis,
	bitsCaracter => HEX0);

	PROCESS (CLOCK_50)
	BEGIN
		IF RISING_EDGE(CLOCK_50) THEN
			cnt <= cnt + 1;
			IF cnt(23) = '1' THEN
				cnt <= "000000000000000000000000";
				IF dis = "1001" THEN -- Modulo 10 would be great also...
					dis <= "0000";
				ELSE
					dis <= dis + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;
	
END Structure;