LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY controladores_IO IS  
  PORT (	boot			: IN  STD_LOGIC; 
			CLOCK_50    : IN  std_logic; 
			inta			: IN  STD_LOGIC;
			intr			: OUT STD_LOGIC;
--			iid			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			addr_io     : IN  std_logic_vector(7 downto 0); 
			wr_io  		: in  std_logic_vector(15 downto 0); 
			rd_io 		: out std_logic_vector(15 downto 0); 
			wr_out 		: in  std_logic; 
			rd_in 		: in  std_logic;
			ps2_clk 		: inout std_logic;
			ps2_data		: inout std_logic;
			led_verdes  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
			led_rojos   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			display		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			power_display : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			keys			: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			switches		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			vga_cursor : out std_logic_vector(15 downto 0);
			vga_cursor_enable : out std_logic); 	
END controladores_IO; 

ARCHITECTURE Structure OF controladores_IO IS
	
	type IO_address_space is array (22 downto 0) of std_logic_vector (15 downto 0); --Perque compili mes rapid.
	
	SIGNAL ports : IO_address_space;

	CONSTANT LEDV_P	 			: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"05"; 
	CONSTANT LEDR_P 				: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"06";
	CONSTANT KEY_P					: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"07";
	CONSTANT SWITCH_P				: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"08";
	CONSTANT POWER_DISPLAY_P 	: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"09";	
	CONSTANT DISPLAY_P 			: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"0A"; 
	CONSTANT KEYBOARD_READ_P	: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"0F";
	CONSTANT KEYBOARD_ST_P		: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"10";
	CONSTANT RAND_P				: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"14";
	CONSTANT MS_COUNT_P			: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"15";
	CONSTANT GETIID_P				: STD_LOGIC_VECTOR (7 DOWNTO 0) := X"16";
	
	COMPONENT interrupt_controller IS
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
	END COMPONENT;
	
	COMPONENT input_controllers IS
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
	END COMPONENT;
	
	COMPONENT counter_ms IS 
	PORT (
		CLOCK_50 		: IN 		std_logic;
		ms_to_count		: IN	 	std_logic_vector(15 downto 0);
		ms_value			: OUT		std_logic_vector(15 downto 0);
		cycles_counted : OUT 	std_logic_vector(15 downto 0);
		write_enable	: IN 		std_logic
	);
	END COMPONENT;

	signal bus_ms_to_count 		: STD_LOGIC_VECTOR (15 downto 0);
	signal bus_ms_value			: STD_LOGIC_VECTOR (15 downto 0);
	signal bus_cycles_counted 	: STD_LOGIC_VECTOR (15 downto 0);
	signal ms_counter_we			: std_logic;
	
	signal bus_key_intr 			: STD_LOGIC;
	signal bus_ps2_intr			: STD_LOGIC;
	signal bus_timer_intr      : STD_LOGIC;
	signal bus_switch_intr		: STD_LOGIC;
	
	signal bus_key_inta 			: STD_LOGIC;
	signal bus_ps2_inta			: STD_LOGIC;
	signal bus_timer_inta      : STD_LOGIC;
	signal bus_switch_inta		: STD_LOGIC;
	
	signal bus_wr_keys			: STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal bus_wr_switches		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	signal clear_char_bus		: STD_LOGIC := '0';
	signal read_char_bus			: STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal data_ready_bus		: STD_LOGIC;
	
	signal bus_iid   : std_logic_vector (7 downto 0);
	
BEGIN
		
		interrupt_controller0 : interrupt_controller
		PORT MAP (
			boot 			=> boot,
			clk  			=> CLOCK_50,
			inta 			=> inta,
			key_intr		=> bus_key_intr,
			ps2_intr		=> bus_ps2_intr,
			switch_intr => bus_switch_intr,
			timer_intr 	=> bus_timer_intr,
			intr			=> intr,
			key_inta 	=> bus_key_inta,
			ps2_inta		=> bus_ps2_inta,
			switch_inta	=> bus_switch_inta,
			timer_inta	=> bus_timer_inta,
			iid			=> bus_iid
		);
		
		input_controllers0 : input_controllers
		PORT MAP (
			boot	=> boot,
			clk	=> CLOCK_50,
			pulsadores_inta	=> bus_key_inta,
			switches_inta		=> bus_switch_inta,
			ps2_inta				=> bus_ps2_inta,
			timer_inta			=> bus_timer_inta,
			keys					=> keys,
			switches				=> switches,
			ps2_clk				=> ps2_clk,
			ps2_data				=> ps2_data,
			clear_char			=> clear_char_bus,
			read_char			=> read_char_bus,
			data_ready			=> data_ready_bus,
			pulsadores_intr	=> bus_key_intr,
			switches_intr		=> bus_switch_intr,
			ps2_intr				=> bus_ps2_intr,
			timer_intr			=> bus_timer_intr,
			rd_key				=> bus_wr_keys,
			rd_sw					=> bus_wr_switches
		);
		
		counter_ms0 : counter_ms 
		PORT MAP(
			CLOCK_50 		=> CLOCK_50,
			ms_to_count 	=> bus_ms_to_count,
			cycles_counted => bus_cycles_counted,
			ms_value			=> bus_ms_value,
			write_enable	=> ms_counter_we
		);

		led_verdes <= ports(conv_integer(LEDV_P))(7 DOWNTO 0);  -- port 5
		led_rojos  <= ports(conv_integer(LEDR_P))(7 DOWNTO 0);  -- port 6
		
		display 			<= ports(conv_integer(DISPLAY_P));
		power_display 	<= ports(conv_integer(POWER_DISPLAY_P))(3 DOWNTO 0);
		
		rd_io	<= X"000" & "000" & data_ready_bus 	WHEN rd_in = '1' AND addr_io = KEYBOARD_ST_P 	ELSE
					X"00" & read_char_bus				WHEN rd_in = '1' AND addr_io = KEYBOARD_READ_P 	ELSE
					bus_ms_value							WHEN rd_in = '1' AND addr_io = MS_COUNT_P			ELSE
					bus_cycles_counted					WHEN rd_in = '1' AND addr_io = RAND_P				ELSE
					X"00" & bus_iid						WHEN rd_in = '1' AND addr_io = GETIID_P 			ELSE
					ports(conv_integer(addr_io)) 		WHEN rd_in = '1';  -- Reads
		
		PROCESS (CLOCK_50)
		BEGIN
			
			IF rising_edge(CLOCK_50) THEN
			
				IF clear_char_bus = '1' THEN
					clear_char_bus <= '0';
				END IF;
				
				IF wr_out = '1' AND addr_io = MS_COUNT_P THEN
					bus_ms_to_count <= wr_io; 
				ELSIF wr_out = '1' AND addr_io = KEYBOARD_ST_P THEN
					--TODO && wr_io diferente de 0!!!!! check it out
					clear_char_bus <= '1';
				ELSIF wr_out = '1' AND addr_io /= GETIID_P THEN
					-- Writes within GETIID port are not allowed!
					ports(conv_integer(addr_io)) <= wr_io ; -- Writes
				END IF;
				
				ports(conv_integer(KEY_P)) 	<= X"000" & bus_wr_keys;
				ports(conv_integer(SWITCH_P)) <=  X"00" & bus_wr_switches;
				
			END IF;
		
		END PROCESS;
		
		ms_counter_we <= wr_out WHEN addr_io = MS_COUNT_P ELSE
							
							  '0';
		
		vga_cursor <= X"0000";
		vga_cursor_enable <= '0';
		
END Structure;

--##############################################################################################################
--##############################################################################################################
--##############################################################################################################

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY counter_ms IS 
	PORT (
		CLOCK_50 		: IN 	std_logic;
		ms_to_count		: IN 	std_logic_vector(15 downto 0);
		ms_value			: OUT std_logic_vector(15 downto 0);
		cycles_counted : OUT std_logic_vector(15 downto 0);
		write_enable	: IN 	std_logic
	 );
END counter_ms;

ARCHITECTURE Structure OF counter_ms IS

	SIGNAL counter_cyc 		: std_logic_vector (15 downto 0) := X"0000";
	SIGNAL tmp_ms_counter	: std_logic_vector (15 downto 0) := X"0000";

BEGIN

	-- Every time the process is triggered 20ns past, then 
	-- 50.000 cycles are equal to 1ms
	
	PROCESS (CLOCK_50) 
	BEGIN
		IF rising_edge(CLOCK_50) THEN
		
			IF write_enable = '1' THEN
				tmp_ms_counter <= ms_to_count;
			END IF;
			
			IF counter_cyc = 0 THEN 
				counter_cyc <= X"C350";
				IF tmp_ms_counter > 0 AND write_enable = '0' THEN
					tmp_ms_counter <= tmp_ms_counter - 1;
				END IF;
			ELSE  
				counter_cyc <= counter_cyc - 1;
			END IF;
		END IF;
	END PROCESS;

	ms_value	<= tmp_ms_counter;
	cycles_counted <= counter_cyc;

END Structure;

