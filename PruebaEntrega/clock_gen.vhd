LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE IEEE.std_logic_arith.all; 
USE ieee.std_logic_unsigned.all;

ENTITY clockGen IS
	GENERIC (INITIAL_VALUE : INTEGER);
	PORT (CLOCK_IN : IN STD_LOGIC;
			CLOCK_OUT: OUT STD_LOGIC);
END clockGen;

ARCHITECTURE Structure OF clockGen IS
BEGIN

	PROCESS (CLOCK_IN)
		VARIABLE COUNTER : INTEGER := INITIAL_VALUE;
	BEGIN
		IF falling_edge(CLOCK_IN) THEN
			IF COUNTER = 0 THEN
				COUNTER := INITIAL_VALUE;
				CLOCK_OUT <= '1';
			ELSE
				COUNTER := COUNTER - 1;
				CLOCK_OUT <= '0';
			END IF;
		END IF;
	END PROCESS;
	
END Structure;
