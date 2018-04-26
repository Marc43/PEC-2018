LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY pulsadores IS 
	PORT (
		boot 		: IN STD_LOGIC;
		clk  		: IN STD_LOGIC;
		inta 		: IN STD_LOGIC;
		keys 		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		intr		: OUT STD_LOGIC;
		rd_key 	: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
	);
	
ARCHITECTURE Structure OF pulsadores IS

 SIGNAL read_keys : STD_LOGIC_VECTOR (3 DOWNTO 0); -- Stores the read keys the last time (the state)

BEGIN
	-- Luego lo comentamos
	state : PROCESS (keys)
	BEGIN
	
		IF intr = '0' THEN
			read_keys <= keys; 	-- Update the state and
			intr <= '1'; 			-- Trigger an interruption
		ELSE
			IF inta = '1' THEN
				intr <= '0';
			END IF;
		END IF;
		
	END PROCESS;

END Structure;
	
--##############################################################################################################
--##############################################################################################################
--##############################################################################################################
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY interruptores IS 
	PORT (
		boot 		: IN STD_LOGIC;
		clk  		: IN STD_LOGIC;
		inta 		: IN STD_LOGIC;
		switches	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		intr		: OUT STD_LOGIC;
		rd_sw 	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
	);
	
ARCHITECTURE Structure OF pulsadores IS

 SIGNAL read_sw : STD_LOGIC_VECTOR (3 DOWNTO 0); -- Stores the read sw the last time (the state)

BEGIN

	state : PROCESS (switches)
	BEGIN
	
	
	
	END PROCESS;

END Structure;
	
--##############################################################################################################
--##############################################################################################################
--##############################################################################################################
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY timer IS
	PORT (
		boot 		: IN STD_LOGIC;
		inta 		: IN STD_LOGIC;
		CLOCK_50 : IN STD_LOGIC;
		intr		: OUT STD_LOGIC;
	);