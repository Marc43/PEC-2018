LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY exception_controller IS
	PORT (
		clk : IN STD_LOGIC;
		calls_instr 			: IN STD_LOGIC;
		spec_ilegal_instr 	: IN STD_LOGIC;
		intr_enabled 			: IN STD_LOGIC;
		ilegal_instr 			: IN STD_LOGIC;
		mem_instr				: IN STD_LOGIC;
		unaligned_access 		: IN STD_LOGIC;
		protected_mem_access : IN STD_LOGIC;
		intr						: IN STD_LOGIC;
		div_zero					: IN STD_LOGIC;
		exception_cause		: OUT STD_LOGIC_VECTOR (3 downto 0);
		exception 				: OUT STD_LOGIC;
		mem_exception 			: OUT STD_LOGIC;
		aggresive_exception	: OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE Structure OF exception_controller IS

	CONSTANT ILEGAL_INSTRUCTION_E 		: STD_LOGIC_VECTOR (3 downto 0) := "0000";
	CONSTANT UNALIGNED_ACCESS_E			: STD_LOGIC_VECTOR (3 downto 0) := "0001";
	CONSTANT DIVIDE_BY_ZERO_E				: STD_LOGIC_VECTOR (3 downto 0) := "0100";
	CONSTANT PROTECTED_MEM_ACCESS_E 		: STD_LOGIC_VECTOR (3 downto 0) := "1011";
	CONSTANT SPEC_ILEGAL_INSTR_E			: STD_LOGIC_VECTOR (3 downto 0) := "1101";
	CONSTANT CALLS_INSTR_E					: STD_LOGIC_VECTOR (3 downto 0) := "1110";
	CONSTANT INTERRUPT_E						: STD_LOGIC_VECTOR (3 downto 0) := "1111";
	
	CONSTANT NO_EXCEPTION					: STD_LOGIC_VECTOR (3 downto 0) := "0101";

	SIGNAL unaligned_access_exception : STD_LOGIC := '0';
	SIGNAL filter_intr : STD_LOGIC := '0';
   SIGNAL pm_access_e : STD_LOGIC := '0'; -- protected memory exception
	
	SIGNAL cause : STD_LOGIC_VECTOR (6 downto 0);

BEGIN

	filter_intr <= (intr AND intr_enabled);

	PROCESS (clk)
	BEGIN
	
		IF rising_edge(clk) THEN -- This is needed to be available on saving the cause at the SYSTEM cycle...
			cause <= ilegal_instr & unaligned_access_exception & div_zero & pm_access_e & spec_ilegal_instr & calls_instr & filter_intr;
		END IF;
		
		-- CAUSE:
				-- 6: ilegal_instr
				-- 5: unaligned_access_exception
				-- 4: div_zero
				-- 3: pm_access_e
				-- 2: spec_ilegal_instr
				-- 1: calls_instr
				-- 0: filter intr

	END PROCESS;

	exception <= ilegal_instr OR unaligned_access_exception OR div_zero OR pm_access_e OR spec_ilegal_instr OR calls_instr OR filter_intr;
	
	aggresive_exception <= ilegal_instr OR unaligned_access_exception OR div_zero OR pm_access_e OR spec_ilegal_instr OR calls_instr;
	
	exception_cause <= ILEGAL_INSTRUCTION_E 	WHEN cause(6) = '1' ELSE
							 UNALIGNED_ACCESS_E		WHEN cause(5) = '1' ELSE
							 DIVIDE_BY_ZERO_E		 	WHEN cause(4) = '1' ELSE
							 PROTECTED_MEM_ACCESS_E WHEN cause(3) = '1' ELSE
							 SPEC_ILEGAL_INSTR_E		WHEN cause(2) = '1' ELSE
							 CALLS_INSTR_E				WHEN cause(1) = '1' ELSE
							 INTERRUPT_E			 	WHEN cause(0) = '1' ELSE
							 
							 NO_EXCEPTION; -- By the moment 
							 
	-- Supposing that no more than one exception can be triggered at once this works fine,
	-- otherwise a system of priorities is defined implicitly by the WHEN ELSE we defined.

	mem_exception <= '1' WHEN (unaligned_access = '1' OR protected_mem_access = '1') AND mem_instr = '1' ELSE '0'; 
	
	unaligned_access_exception <= unaligned_access WHEN mem_instr = '1' ELSE '0';
	pm_access_e <= protected_mem_access WHEN mem_instr = '1' ELSE '0';
	
END Structure;