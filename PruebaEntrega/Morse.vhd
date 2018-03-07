LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
--USE IEEE.std_logic_arith.all; 
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;

ENTITY Morse IS
	PORT (CLOCK_50  : IN STD_LOGIC;
			SW        : IN STD_LOGIC_VECTOR  (2 DOWNTO 0);
			KEY		 : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
			LEDR		 : OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
			LEDG		 : OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
			HEX0      : OUT std_logic_vector (6 downto 0));
END Morse;

ARCHITECTURE Structure OF Morse IS

	COMPONENT clockGen IS
	GENERIC (INITIAL_VALUE : INTEGER);
	PORT (CLOCK_IN :IN STD_LOGIC;
			CLOCK_OUT: OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT Display7 IS 
	PORT (VALOR : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
   bitsCaracter : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT SwitchToMorse IS
	PORT (CHAR : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			MorseVector : OUT STD_LOGIC_VECTOR (11 DOWNTO 0);
			START_VEC   : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
	END COMPONENT;
	
	SIGNAL CLOCK_HS : STD_LOGIC;
	SIGNAL MorseCode: STD_LOGIC_VECTOR (11 DOWNTO 0);
	SIGNAL START_V	 : STD_LOGIC_VECTOR  (3 DOWNTO 0); -- [15, 0] start at maximum (also length)
	SIGNAL RESET	 : STD_LOGIC := '0';
	
BEGIN

	clock : clockGen
	GENERIC MAP(INITIAL_VALUE => 25_000_000)
	PORT MAP(CLOCK_IN => CLOCK_50,
	CLOCK_OUT => CLOCK_HS);
	
	visor0 : Display7
	Port Map( VALOR => SW,
	bitsCaracter => HEX0);
	
	morse0 : SwitchToMorse
	PORT MAP (CHAR => SW,
	MorseVector => MorseCode,
	START_VEC   => START_V);
	
	PROCESS (CLOCK_HS, KEY)
		VARIABLE ITERATOR  	: INTEGER := 0;
		VARIABLE INI_MORSE 	: STD_LOGIC;
		VARIABLE WIP			: STD_LOGIC;
		VARIABLE FIRST			: STD_LOGIC := '1';
	BEGIN
		
		IF RESET = '0' THEN
			
			INI_MORSE := '0';
			WIP := '0';
			RESET <= '1';
	
		ELSIF KEY(1) = '0' AND KEY(1)'last_value = '1' THEN -- Start the sequence
			INI_MORSE := '1';
		
		ELSIF KEY(0) = '0' AND KEY(0)'last_value = '1' THEN -- Abort the sequence
			WIP := '0';
			LEDR(0) <= '0';
	
		ELSIF falling_edge(CLOCK_HS) THEN
		   -- If it's time to print, and the morse has started
			IF FIRST = '1' THEN
				FIRST := '0';
				INI_MORSE := '0';
				
			ELSIF INI_MORSE = '1' THEN
				ITERATOR := to_integer(UNSIGNED(START_V));
				INI_MORSE := '0';
				WIP := '1';
			END IF;
			
			IF ITERATOR < 0 THEN --We finished the morse sequence
				WIP := '0';
			END IF;
			
			IF WIP = '1' THEN
				IF MorseCode(ITERATOR) = '1' THEN
					LEDR(0) <= '1';
				ELSE
					LEDR(0) <= '0';
				END IF;
				ITERATOR := ITERATOR - 1;
			END IF;
		END IF;
		
		LEDG(0) <= not WIP;
		
	END PROCESS;
	
END Structure;	

