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
	
BEGIN
	
	controller : PROCESS (inta, clk)
	BEGIN
	
		IF rising_edge(inta) THEN
		
			IF inta = '1' THEN
			
				IF timer_intr = '1' THEN
					timer_inta <= '1';
					iid <= TIMER;
				ELSIF key_intr = '1' THEN
					key_inta <= '1';
					iid <= KEYS;
				ELSIF switch_intr = '1' THEN
					switch_inta <= '1';
					iid <= SWITCHES;
				ELSIF ps2_intr = '1' THEN
					ps2_inta <= '1';
					iid <= PS2;
				END IF;
			
			END IF;
		 ELSE
		 
				timer_inta 	<= '0';
				key_inta		<= '0';
				switch_inta <= '0';
				ps2_inta		<= '0';
		
		END IF;
	
	END PROCESS;
	

	
	intr <= key_intr OR ps2_intr OR switch_intr OR timer_intr;

END Structure;
