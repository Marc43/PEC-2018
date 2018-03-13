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
	
	immed		<= X"00" & ir(7 DOWNTO 0) WHEN instr_code = "0101" AND ir (7) = '0' ELSE
					X"FF" & ir(7 DOWNTO 0) WHEN instr_code = "0101" AND ir (7) = '1';
	op			<= ir(8) WHEN instr_code = "0101";
	addr_a	<= ir(11 DOWNTO 9) WHEN instr_code = "0101"; --and ir(8) = '1';
	addr_d 	<= ir(11 DOWNTO 9) WHEN instr_code = "0101";
	
	ldpc <= '0' WHEN ir = X"FFFF" ELSE
		     '1';
		  
	wrd <= '1' WHEN instr_code = "0101" ELSE
		    '0';

END Structure;