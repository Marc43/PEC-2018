LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY pulsadores IS 
	PORT (
		boot 		: IN STD_LOGIC;
		clk  		: IN STD_LOGIC;
		inta 		: IN STD_LOGIC;
		keys 		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		intr		: OUT STD_LOGIC;
		rd_key 	: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
end pulsadores;

ARCHITECTURE Structure OF pulsadores IS

 SIGNAL read_keys : STD_LOGIC_VECTOR (3 DOWNTO 0); -- Stores the read keys the last time (the state)

 SIGNAL bus_intr : STD_LOGIC := '0';
 
BEGIN

	state : PROCESS (keys, inta)
	BEGIN
	--???
		IF rising_edge(keys) AND bus_intr = '0' THEN
			read_keys <= keys; 	-- Update the state and
			bus_intr <= '1'; 			-- Trigger an interruption
		ELSE
			IF inta = '1' THEN
				bus_intr <= '0';
			END IF;
		END IF;
		
	END PROCESS;
	
	intr	 <= bus_intr;
	rd_key <= read_keys; 

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
		rd_sw 	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end interruptores;

ARCHITECTURE Structure OF pulsadores IS

 SIGNAL read_sw : STD_LOGIC_VECTOR (3 DOWNTO 0); -- Stores the read sw the last time (the state)
 
 SIGNAL bus_intr: STD_LOGIC := '0';
 
BEGIN

	state : PROCESS (switches, inta)
	BEGIN
	--???
		IF rising_edge(switches) AND bus_intr = '0' THEN
			read_sw <= switches; 	-- Update the state and
			bus_intr <= '1'; 				-- Trigger an interruption
		ELSE
			IF inta = '1' THEN
				bus_intr <= '0';
			END IF;
		END IF;
		
	END PROCESS;
	
	intr	<= bus_intr: 
	rd_sw <= read_sw; 

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
		intr		: OUT STD_LOGIC
	);

end timer;

ARCHITECTURE Structure OF timer IS

	SIGNAL cnt 		: STD_LOGIC_VECTOR (21 downto 0);
	CONSTANT ms50 	: STD_LOGIC_VECTOR (21 downto 0):= X"2625A0";
	
	signal bus_intr : std_logic := '0';

BEGIN

	counter : PROCESS (CLOCK_50, inta) 
	BEGIN
		IF boot = '1' THEN
			cnt <= (others=>'0');		
		ELSIF rising_edge(CLOCK_50) THEN
			IF inta = '1' THEN 
				cnt <= (others=>'0');
				bus_intr <= '0';
			ELSIF cnt = ms50 THEN
				cnt  <= (others=>'0');
				bus_intr <= '1';
			ELSE 
				cnt <= cnt + 1;
			END IF;
		END IF;
	
	END PROCESS;
	
	intr <= bus_intr;

END Structure;