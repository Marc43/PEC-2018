LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE IEEE.std_logic_arith.all; 
USE ieee.std_logic_unsigned.all; 

ENTITY Tarea7b IS 
  PORT( CLOCK_50 : IN std_logic; 
		HEX0  : OUT std_logic_vector(6 downto 0); 
		HEX1  : OUT std_logic_vector(6 downto 0); 
		HEX2  : OUT std_logic_vector(6 downto 0); 
		HEX3  : OUT std_logic_vector(6 downto 0)); 
END Tarea7b; 

ARCHITECTURE Structure OF Tarea7b IS 

	COMPONENT Display7 IS 
	PORT (VALOR : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
   bitsCaracter : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT clockGen IS
	GENERIC (INITIAL_VALUE : INTEGER);
	PORT (CLOCK_IN :IN STD_LOGIC;
			CLOCK_OUT: OUT STD_LOGIC);
	END COMPONENT;
	
	SIGNAL CLOCK_1  : STD_LOGIC;
	SIGNAL TO_PRINT : STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN 

	display0 : Display7 
	PORT MAP(VALOR => TO_PRINT(3 DOWNTO 0),
	bitsCaracter => HEX0);
	
	display1 : Display7 
	PORT MAP(VALOR => TO_PRINT(7 DOWNTO 4),
	bitsCaracter => HEX1);
	
	display2 : Display7 
	PORT MAP(VALOR => TO_PRINT(11 DOWNTO 8),
	bitsCaracter => HEX2);
	
	display3 : Display7 
	PORT MAP(VALOR => TO_PRINT(15 DOWNTO 12),
	bitsCaracter => HEX3);
	
	clock0 : clockGen
	GENERIC MAP(INITIAL_VALUE => 50_000_000)
	PORT MAP(CLOCK_IN => CLOCK_50,
	CLOCK_OUT => CLOCK_1);
	
	PROCESS (CLOCK_1) 
	BEGIN
		IF rising_edge(CLOCK_1) THEN
			TO_PRINT <= TO_PRINT + 1;
		END IF;
	END PROCESS;
	
END Structure;