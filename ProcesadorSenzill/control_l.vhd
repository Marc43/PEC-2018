LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY control_l IS
    PORT (ir     : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          op     : OUT STD_LOGIC;
          ldpc   : OUT STD_LOGIC;
          wrd    : OUT STD_LOGIC;
          addr_a : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          immed  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END control_l;

ARCHITECTURE Structure OF control_l IS
	SIGNAL instr_code : STD_LOGIC_VECTOR (3 DOWNTO 0);
BEGIN

	instr_code <= ir(15 DOWNTO 12);
	
	ldpc	<= '1'; -- By default always active
	wrd	<= '1';
	
	immed		<= ir(7 DOWNTO 0);
	op			<= ir(8);
	addr_a	<= ir(11 DOWNTO 9);
	addr_d 	<= ir(11 DOWNTO 9);
	
	IF ir = 0xFFFF THEN
		ldpc	<= not ldpc; -- HALT CPU
	END IF;

	IF addr_a != addr_d THEN
		wrd <= not wrd; -- Write not allowed
	END IF;
	
	--CASE instr_code IS
	--	WHEN "0101" =>
	--		immed		<= ir(7 DOWNTO 0);
	--		op			<= ir(8);
	--		addr_a	<= ir(11 DOWNTO 9);
	--		addr_d 	<= ir(11 DOWNTO 9);
	--		ldpc 		<= '1'; -- Increase PC
	--		wrd		<= '1'; -- Regfile write permission
	--	WHEN others =>
	--		ldpc 		<= '0'; -- Stop 
	--END CASE;
		
END Structure;