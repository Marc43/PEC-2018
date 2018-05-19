LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY exception_controller IS
	PORT (
		clk : IN STD_LOGIC;
		ilegal_instr 		: IN STD_LOGIC;
		mem_instr			: IN STD_LOGIC;
		unaligned_access 	: IN STD_LOGIC;
		intr					: IN STD_LOGIC;
		div_zero				: IN STD_LOGIC;
		exception_cause	: OUT STD_LOGIC_VECTOR (3 downto 0);
		exception 			: OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE Structure OF exception_controller IS

	CONSTANT ILEGAL_INSTRUCTION_E : STD_LOGIC_VECTOR (3 downto 0) := "0000";
	CONSTANT UNALIGNED_ACCESS_E	: STD_LOGIC_VECTOR (3 downto 0) := "0001";
	CONSTANT DIVIDE_BY_ZERO_E		: STD_LOGIC_VECTOR (3 downto 0) := "0100";
	CONSTANT INTERRUPT_E				: STD_LOGIC_VECTOR (3 downto 0) := "1111";
	CONSTANT NO_EXCEPTION			: STD_LOGIC_VECTOR (3 downto 0) := "0101";

	SIGNAL unaligned_access_exception : STD_LOGIC := '0';
	
	SIGNAL cause : STD_LOGIC_VECTOR (3 downto 0);
BEGIN

	PROCESS (clk)
	BEGIN
	
		IF rising_edge(clk) THEN -- This is needed to be available on saving the cause at the SYSTEM cycle...
			cause <= ilegal_instr & unaligned_access_exception & intr & div_zero;
		END IF;
	
	END PROCESS;

	unaligned_access_exception <= unaligned_access WHEN mem_instr = '1' ELSE '0';
	
	exception <= ilegal_instr OR unaligned_access_exception OR intr OR div_zero;
	
	exception_cause <= ILEGAL_INSTRUCTION_E WHEN cause(3) = '1' ELSE
							 UNALIGNED_ACCESS_E	 WHEN cause(2) = '1' ELSE
							 INTERRUPT_E			 WHEN cause(1) = '1' ELSE
							 DIVIDE_BY_ZERO_E		 WHEN cause(0) = '1' ELSE
							 NO_EXCEPTION; -- By the moment 

END Structure;