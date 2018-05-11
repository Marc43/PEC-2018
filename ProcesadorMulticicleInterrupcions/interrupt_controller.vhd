LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY interrupt_controller IS
	PORT (
		boot 			: IN STD_LOGIC;
		clk			: IN STD_LOGIC;
		inta			: IN STD_LOGIC;
		key_intr 	: IN STD_LOGIC;
		ps2_intr		: IN STD_LOGIC;
		switch_intr	: IN STD_LOGIC;
		timer_intr	: IN STD_LOGIC;
		intr			: OUT STD_LOGIC;
		key_inta		: OUT STD_LOGIC;
		ps2_inta		: OUT STD_LOGIC;
		switch_inta : OUT STD_LOGIC;
		timer_inta	: OUT STD_LOGIC;
		iid			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END interrupt_controller;

ARCHITECTURE Structure OF interrupt_controller IS

	CONSTANT TIMER 	: STD_LOGIC_VECTOR := X"00";
	CONSTANT KEYS		: STD_LOGIC_VECTOR := X"01";
	CONSTANT SWITCHES : STD_LOGIC_VECTOR := X"02";
	CONSTANT PS2	 	: STD_LOGIC_VECTOR := X"03";
	
	--SIGNAL clear : STD_LOGIC := '0';
	--SIGNAL bus_intr : STD_LOGIC := '0'; 
	SIGNAL bus_timer_inta : STD_LOGIC := '0';
	SIGNAL bus_key_inta : STD_LOGIC := '0';
	SIGNAL bus_switch_inta : STD_LOGIC := '0';
	SIGNAL bus_ps2_inta : STD_LOGIC := '0';
	
	SIGNAL control_dec : STD_LOGIC_VECTOR (3 downto 0) := "0000";
	
BEGIN
--	
--	controller : PROCESS (clk)
--	BEGIN
--	
--		IF rising_edge(clk) THEN
--				
--			IF clear = '1' THEN
--				
--				timer_inta 	<= '0';
--				key_inta		<= '0';
--				switch_inta <= '0';
--				ps2_inta		<= '0';
--				clear 		<= '0';
--			
--			END IF;
--			
--			IF inta = '1' AND clear = '0' THEN
--				IF timer_intr = '1' THEN
--					timer_inta <= '1';
--					clear <= '1';
--					iid <= TIMER;
--				ELSIF key_intr = '1' THEN
--					key_inta <= '1';
--					clear <= '1';
--					iid <= KEYS;
--				ELSIF switch_intr = '1' THEN
--					switch_inta <= '1';
--					clear <= '1';
--					iid <= SWITCHES;
--				ELSIF ps2_intr = '1' THEN
--					ps2_inta <= '1';
--					clear <= '1';
--					iid <= PS2;
--				END IF;
--			END IF;
--		 
--			
--		
--		END IF;
--	
--	END PROCESS;
--	
--	intr 	<= key_intr OR ps2_intr OR switch_intr OR timer_intr;
	
	PROCESS (clk)
	BEGIN
	
		IF rising_edge(clk) THEN
			control_dec <= timer_intr & key_intr & switch_intr & ps2_intr; -- Control iid
		END IF;
	
	END PROCESS;
	
	bus_timer_inta 	<= '1' WHEN timer_intr = '1' 		AND inta 	= '1' 					ELSE '0';
	bus_key_inta	  	<= '1' WHEN timer_intr = '0' AND key_intr 	= '1' AND inta = '1' ELSE '0';
	bus_switch_inta	<= '1' WHEN timer_intr = '0' AND key_intr 	= '0' AND switch_intr	= '1' AND inta = '1' 							ELSE '0';
	bus_ps2_inta	  	<= '1' WHEN timer_intr = '0' AND key_intr 	= '0' AND switch_intr	= '0' AND ps2_intr = '1' AND inta = '1' 	ELSE '0';
	
	intr <= (key_intr OR ps2_intr OR switch_intr OR timer_intr) AND NOT inta;
	
	timer_inta 	<= bus_timer_inta;
	key_inta 	<= bus_key_inta;
	switch_inta <= bus_switch_inta;
	ps2_inta 	<= bus_ps2_inta;
	
	iid <= TIMER 	 WHEN control_dec(3) = '1'	ELSE
			 KEYS  	 WHEN control_dec(2) = '1' ELSE
			 SWITCHES WHEN control_dec(1) = '1' ELSE
			 PS2;
			 
	
END Structure;
