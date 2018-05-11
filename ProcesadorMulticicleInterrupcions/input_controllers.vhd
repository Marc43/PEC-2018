LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY input_controllers IS
	PORT (
		boot 					: IN STD_LOGIC;
		clk  					: IN STD_LOGIC;
		pulsadores_inta	: IN STD_LOGIC;
		switches_inta		: IN STD_LOGIC;
		ps2_inta				: IN STD_LOGIC;
		timer_inta			: IN STD_LOGIC;
		keys 					: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		switches				: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		ps2_clk 				: INOUT STD_LOGIC;
		ps2_data				: INOUT STD_LOGIC;
		clear_char 			: IN    STD_LOGIC;
		read_char			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_ready			: OUT STD_LOGIC;
		pulsadores_intr	: OUT STD_LOGIC;
		switches_intr		: OUT STD_LOGIC;
		ps2_intr				: OUT STD_LOGIC;
		timer_intr			: OUT STD_LOGIC;
		rd_key 				: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		rd_sw 				: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END input_controllers;

ARCHITECTURE Structure of input_controllers IS

	COMPONENT keyboard_controller_intr is
	Port (clk         : in    STD_LOGIC;
			 reset      : in    STD_LOGIC;
			 ps2_clk    : inout STD_LOGIC;
			 ps2_data   : inout STD_LOGIC;
			 read_char  : out   STD_LOGIC_VECTOR (7 downto 0);
			 clear_char : in    STD_LOGIC;
			 data_ready : out   STD_LOGIC;
			 intr			: out	  STD_LOGIC;
			 inta			: in   STD_LOGIC
			 );
	END COMPONENT;

	COMPONENT pulsadores IS 
	PORT (
		boot 		: IN STD_LOGIC;
		clk  		: IN STD_LOGIC;
		inta 		: IN STD_LOGIC;
		keys 		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		intr		: OUT STD_LOGIC;
		rd_key 	: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
	END COMPONENT;
	
	COMPONENT interruptores IS 
	PORT (
		boot 		: IN STD_LOGIC;
		clk  		: IN STD_LOGIC;
		inta 		: IN STD_LOGIC;
		switches	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		intr		: OUT STD_LOGIC;
		rd_sw 	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	END COMPONENT;
	
	COMPONENT timer IS
	PORT (
		boot 		: IN STD_LOGIC;
		inta 		: IN STD_LOGIC;
		CLOCK_50 : IN STD_LOGIC;
		intr		: OUT STD_LOGIC
	);
	END COMPONENT;
	
--	signal read_char_bus : STD_LOGIC_VECTOR (7 downto 0);
--	signal data_ready_bus : STD_LOGIC := '0' ;
	
BEGIN

	keyboard_controller_intr0 : keyboard_controller_intr
	PORT MAP (
		clk 			=> clk,
		reset 		=> boot,
		ps2_clk		=> ps2_clk,
		ps2_data 	=> ps2_data,
		read_char	=> read_char,
		clear_char	=> clear_char,
		data_ready	=> data_ready,
		intr			=> ps2_intr,
		inta			=> ps2_inta
	);
				
	pulsadores0 : pulsadores
	PORT MAP (
		boot		=> boot,
		clk 		=> clk,
		inta 		=> pulsadores_inta,
		keys 		=> keys,
		intr 		=> pulsadores_intr,
		rd_key 	=> rd_key
	);
	
	interruptores0 : interruptores
	PORT MAP (
		boot 		=> boot,
		clk 		=> clk,
		inta		=> switches_inta,
		switches => switches,
		intr		=> switches_intr,
		rd_sw		=> rd_sw
	);
	
	timer0 : timer 
	PORT MAP (
		boot		=> boot,
		inta		=> timer_inta,
		CLOCK_50 => clk,
		intr		=> timer_intr
	);
	
	

END Structure;
		
--##############################################################################################################
--##############################################################################################################
--##############################################################################################################

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

 SIGNAL last_keys : STD_LOGIC_VECTOR (3 DOWNTO 0) := (others => 'X'); -- Stores the read keys the last time (the state)

 SIGNAL bus_intr : STD_LOGIC := '0';
 
BEGIN

	state : PROCESS (clk)
	BEGIN
		IF rising_edge(clk) AND bus_intr = '0' THEN
			last_keys <= keys; 	
		END IF;
		
	END PROCESS;
	
	bus_intr <= '1' WHEN keys /= last_keys AND inta = '0' AND boot = '0' ELSE
					'0';
					
	intr	 <= bus_intr;
	rd_key <= last_keys; 

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

ARCHITECTURE Structure OF interruptores IS

 SIGNAL last_sw : STD_LOGIC_VECTOR (7 DOWNTO 0) := (others => 'X'); -- Stores the read sw the last time (the state)
 
 SIGNAL bus_intr: STD_LOGIC := '0';
 
BEGIN

--	state : PROCESS (switches, inta)
--	BEGIN
--	--???
--		IF switches /= read_sw AND bus_intr = '0' THEN
--			read_sw <= switches; 		-- Update the state and
--			bus_intr <= '1'; 				-- Trigger an interruption
--		ELSE
--			IF inta = '1' THEN
--				bus_intr <= '0';
--			END IF;
--		END IF;
--		
--	END PROCESS;
--	
--	intr	<= bus_intr;
--	rd_sw <= read_sw; 
	
	
	state : PROCESS (clk)
	BEGIN
		IF rising_edge(clk) AND bus_intr = '0' THEN
			last_sw <= switches;
		END IF;
		
	END PROCESS;
	
	bus_intr <= '1' WHEN switches /= last_sw AND inta = '0' AND boot = '0' ELSE
					'0';
					
	intr	 <= bus_intr;
	rd_sw  <= last_sw; 

END Structure;
	
--##############################################################################################################
--##############################################################################################################
--##############################################################################################################

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

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
	CONSTANT ms50 	: STD_LOGIC_VECTOR (23 downto 0):= X"2625A0";
	--2625A0 2625A0 2625A0 2625A0 2625A0 2625A0
	signal bus_intr : std_logic := '0';

BEGIN

	counter : PROCESS (CLOCK_50) 
	BEGIN
		IF boot = '1' THEN
			cnt <= (others=>'0');		
		ELSIF rising_edge(CLOCK_50) THEN
		
			cnt <= cnt + 1;
			IF cnt = ms50 THEN
				bus_intr <= '1'; -- REMEMBER SALTPEPPER
				cnt <= (others =>'0');
			ELSIF inta = '1' THEN
				bus_intr <= '0';
			END IF;
			
		END IF;
	END PROCESS;
	
--	intr <= '1' WHEN bus_intr = '1' AND inta = '0' ELSE
--	
--			  '0';

	intr <= bus_intr WHEN boot = '0' ELSE
			  
			  '0';


END Structure;

--##############################################################################################################
--##############################################################################################################
--##############################################################################################################

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


ENTITY keyboard_controller_intr is
Port (clk         : in    STD_LOGIC;
		 reset      : in    STD_LOGIC;
		 ps2_clk    : inout STD_LOGIC;
		 ps2_data   : inout STD_LOGIC;
		 read_char  : out   STD_LOGIC_VECTOR (7 downto 0);
		 clear_char : in    STD_LOGIC;
		 data_ready : out   STD_LOGIC;
		 intr			: out	  STD_LOGIC;
		 inta			: in   STD_LOGIC
		 );
END keyboard_controller_intr;

ARCHITECTURE Structure OF keyboard_controller_intr IS

	COMPONENT keyboard_controller is
	Port (clk         : in    STD_LOGIC;
			 reset      : in    STD_LOGIC;
			 ps2_clk    : inout STD_LOGIC;
			 ps2_data   : inout STD_LOGIC;
			 read_char  : out   STD_LOGIC_VECTOR (7 downto 0);
			 clear_char : in    STD_LOGIC;
			 data_ready : out   STD_LOGIC);
	END COMPONENT;
	
	signal bus_data_ready : std_logic;
	signal bus_acknoledge : std_logic;

BEGIN

	keyboard_controller0 : keyboard_controller
	port map(
		clk 			=> clk,
		reset 		=> reset,
		ps2_clk 		=> ps2_clk,
		ps2_data 	=> ps2_data,
		read_char 	=> read_char,
		clear_char	=> bus_acknoledge,
		data_ready 	=> bus_data_ready
	);
	
	bus_acknoledge <= clear_char OR inta;
	
	data_ready <= bus_data_ready;
	intr		  <= bus_data_ready AND NOT bus_acknoledge; 
	
	-- Both signals are equivalent, in order to preserve the original 
	-- structure we maintaned the data_ready signal.
	-- the same will be applied to inta and clear_char
	
END Structure;