LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY exception_controller IS
	PORT (
		clk : IN STD_LOGIC;
		boot : IN STD_LOGIC;
		calls_instr 			: IN STD_LOGIC;
		spec_ilegal_instr 	: IN STD_LOGIC;
		intr_enabled 			: IN STD_LOGIC;
		ilegal_instr 			: IN STD_LOGIC;
		mem_instr				: IN STD_LOGIC;
		unaligned_access 		: IN STD_LOGIC;
		protected_mem_access : IN STD_LOGIC;
		intr						: IN STD_LOGIC;
		div_zero					: IN STD_LOGIC;
		
		itlb_hit				: IN STD_LOGIC;
		dtlb_hit				: IN STD_LOGIC;
		itlb_valid			: IN STD_LOGIC;
		dtlb_valid			: IN STD_LOGIC;
		read_only_write		: IN STD_LOGIC;
		fetch						: IN STD_LOGIC;
		
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
	CONSTANT ITLB_MISS_E						: STD_LOGIC_VECTOR (3 downto 0) := "0110";
	CONSTANT DTLB_MISS_E						: STD_LOGIC_VECTOR (3 downto 0) := "0111";
	CONSTANT ITLB_INVALID_E					: STD_LOGIC_VECTOR (3 downto 0) := "1000";
	CONSTANT DTLB_INVALID_E					: STD_LOGIC_VECTOR (3 downto 0) := "1001";
	CONSTANT PROTECTED_MEM_ITLB_E			: STD_LOGIC_VECTOR (3 downto 0) := "1010";
	CONSTANT PROTECTED_MEM_DTLB_E 		: STD_LOGIC_VECTOR (3 downto 0) := "1011";
	CONSTANT RDONLY_WRITE_DTLB_E			: STD_LOGIC_VECTOR (3 downto 0) := "1100";
	CONSTANT SPEC_ILEGAL_INSTR_E			: STD_LOGIC_VECTOR (3 downto 0) := "1101";
	CONSTANT CALLS_INSTR_E					: STD_LOGIC_VECTOR (3 downto 0) := "1110";
	CONSTANT INTERRUPT_E						: STD_LOGIC_VECTOR (3 downto 0) := "1111";
	
	CONSTANT NO_EXCEPTION					: STD_LOGIC_VECTOR (3 downto 0) := "0101";

	SIGNAL unaligned_access_exception : STD_LOGIC := '0';
	SIGNAL filter_intr : STD_LOGIC := '0';
	SIGNAL pm_access_dtlb : STD_LOGIC := '0'; -- protected memory exception data tlb
	SIGNAL pm_access_itlb : STD_LOGIC := '0'; -- protected memory exception ins tlb
	
	SIGNAl itlb_miss_exception : STD_LOGIC := '0'; 
	SIGNAl dtlb_miss_exception : STD_LOGIC := '0'; 

	SIGNAl itlb_invalid_exception : STD_LOGIC := '0'; 
	SIGNAl dtlb_invalid_exception : STD_LOGIC := '0'; 

	SIGNAl dtlb_read_only_write_exception : STD_LOGIC := '0';
	
	--SIGNAL dummy_to_zero : STD_LOGIC := '0';

	SIGNAL cause : STD_LOGIC_VECTOR (14 downto 0);

BEGIN

	filter_intr <= (intr AND intr_enabled);

	PROCESS (clk)
	BEGIN
	
		IF rising_edge(clk) THEN -- This is needed to be available on saving the cause at the SYSTEM cycle...
			cause <= ilegal_instr & unaligned_access_exception & '0' & '0' &
						div_zero & itlb_miss_exception & dtlb_miss_exception & itlb_invalid_exception &
						dtlb_invalid_exception &
						pm_access_itlb & pm_access_dtlb & dtlb_read_only_write_exception &
						spec_ilegal_instr & calls_instr & filter_intr;
		END IF;
		
		-- CAUSE:
				--
				-- 14: ilegal instruction
				-- 13: Unaligned acces
				-- 12: overflow by floatig point (unimplemented)
				-- 11: division by floating point (unimplemented)
				-- 10: division by zero instruction
				-- 9: miss instruction TLB
				-- 8: miss Data TLB
				-- 7: invalid page Instruction TLB
				-- 6: invalid page Data TLB
				-- 5: protected page Instruction TLB
				-- 4: protected page Data TLB
				-- 3: read_only
				-- 2: spec_ilegal_instr
				-- 1: calls_instr
				-- 0: filter intr

	END PROCESS;
	

	exception <= NOT boot AND (ilegal_instr OR unaligned_access_exception OR div_zero OR itlb_miss_exception OR dtlb_miss_exception OR itlb_invalid_exception OR dtlb_invalid_exception OR pm_access_itlb OR pm_access_dtlb OR dtlb_read_only_write_exception OR spec_ilegal_instr OR calls_instr OR filter_intr);
	
	aggresive_exception <= NOT boot AND (ilegal_instr OR unaligned_access_exception OR div_zero OR itlb_miss_exception OR dtlb_miss_exception OR itlb_invalid_exception OR dtlb_invalid_exception OR pm_access_itlb OR pm_access_dtlb OR dtlb_read_only_write_exception OR spec_ilegal_instr OR calls_instr);
	
	exception_cause <= ILEGAL_INSTRUCTION_E 	WHEN cause(14) = '1' ELSE
							 UNALIGNED_ACCESS_E		WHEN cause(13) = '1' ELSE
							 DIVIDE_BY_ZERO_E		 	WHEN cause(10) = '1' ELSE
							 ITLB_MISS_E				WHEN cause(9) = '1' ELSE
							 DTLB_MISS_E				WHEN cause(8) = '1' ELSE
							 RDONLY_WRITE_DTLB_E		WHEN cause(7) = '1' ELSE
							 DTLB_INVALID_E			WHEN cause(6) = '1' ELSE
							 PROTECTED_MEM_ITLB_E	WHEN cause(5) = '1' ELSE
							 PROTECTED_MEM_DTLB_E	WHEN cause(4) = '1' ELSE
							 RDONLY_WRITE_DTLB_E		WHEN cause(3) = '1' ELSE
							 SPEC_ILEGAL_INSTR_E		WHEN cause(2) = '1' ELSE
							 CALLS_INSTR_E				WHEN cause(1) = '1' ELSE
							 INTERRUPT_E			 	WHEN cause(0) = '1' ELSE
							 
							 NO_EXCEPTION; -- By the moment 
							 
	-- Supposing that no more than one exception can be triggered at once this works fine,
	-- otherwise a system of priorities is defined implicitly by the WHEN ELSE we defined.
	
	unaligned_access_exception <= unaligned_access WHEN mem_instr = '1' ELSE '0';
	
	pm_access_dtlb <= protected_mem_access WHEN mem_instr = '1' ELSE '0';
	pm_access_itlb <= protected_mem_access WHEN fetch = '1' ELSE '0';
	itlb_miss_exception <= (NOT itlb_hit) WHEN fetch = '1' ELSE '0';
	dtlb_miss_exception <= (NOT dtlb_hit) WHEN mem_instr = '1' ELSE '0';
	itlb_invalid_exception <= (NOT itlb_valid) WHEN fetch = '1' ELSE '0';
	dtlb_invalid_exception <= (NOT dtlb_valid) WHEN mem_instr = '1' ELSE '0';
	
	dtlb_read_only_write_exception <= read_only_write WHEN mem_instr = '1' ELSE '0';
	
	mem_exception <= unaligned_access_exception OR itlb_miss_exception OR dtlb_miss_exception;
	
END Structure;