LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY alu IS
    PORT (x  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          y  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          op : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
			 f  : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          w  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END alu;

ARCHITECTURE Structure OF alu IS
	--ops
	CONSTANT ARITHLOG_op	: STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";
	CONSTANT MOV_op		: STD_LOGIC_VECTOR (1 DOWNTO 0) := "01";
	CONSTANT CMP_op		: STD_LOGIC_VECTOR (1 DOWNTO 0) := "10";
	CONSTANT EXT_op		: STD_LOGIC_VECTOR (1 DOWNTO 0) := "11";
	
	--f_codes
	--ARITHLOG
	CONSTANT AND_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "000";
	CONSTANT OR_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "001";
	CONSTANT XOR_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "010";
	CONSTANT NOT_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "011";
	CONSTANT ADD_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "100";
	CONSTANT SUB_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "101";
	CONSTANT SHA_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "110";
	CONSTANT SHL_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "111";
	
	-- MOV
	CONSTANT MOVI_f	: STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";
	CONSTANT MOVHI_f	: STD_LOGIC_VECTOR (2 DOWNTO 0) := "001";
	
	-- CMP
	CONSTANT CMPLT_f		: STD_LOGIC_VECTOR (2 DOWNTO 0):= "000";
	CONSTANT CMPLE_f	 	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "001";
	CONSTANT CMPEQ_f		: STD_LOGIC_VECTOR (2 DOWNTO 0):= "011";
	CONSTANT CMPLTU_f		: STD_LOGIC_VECTOR (2 DOWNTO 0):= "100";
	CONSTANT CMPLEU_f		: STD_LOGIC_VECTOR (2 DOWNTO 0):= "101";
	
	-- ARITHEXT
	CONSTANT MUL_f			: STD_LOGIC_VECTOR (2 DOWNTO 0):= "000";
	CONSTANT MULH_f	 	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "001";
	CONSTANT MULHU_f		: STD_LOGIC_VECTOR (2 DOWNTO 0):= "010";
	CONSTANT DIV_f			: STD_LOGIC_VECTOR (2 DOWNTO 0):= "100";
	CONSTANT DIVU_f		: STD_LOGIC_VECTOR (2 DOWNTO 0):= "101";

BEGIN

--    	 WITH op SELECT -- 00 MOVI | 01 MOVHI | 10 ADD
--			w <= 	y WHEN MOV_,
--					y(7 DOWNTO 0) & x(7 DOWNTO 0) WHEN MOVHI,
--					x + y WHEN ADD,
--					(others => 'X') WHEN others;
	
			w 	<= y WHEN op = MOV_op AND f = MOVI_f ELSE
					y(7 DOWNTO 0) & x(7 DOWNTO 0) WHEN op = MOV_op AND f = MOVHI_f ELSE
					--comparaciones
					X"0001" WHEN op = CMP_op AND f = CMPLT_f AND signed(x) < signed(y) ELSE
					X"0000" WHEN op = CMP_op AND f = CMPLT_f AND signed(x) >= signed(y) ELSE
					
					X"0001" WHEN op = CMP_op AND f = CMPLE_f AND signed(x) <= signed(y) ELSE
					X"0000" WHEN op = CMP_op AND f = CMPLE_f AND signed(x) > signed(y) ELSE
					
					X"0001" WHEN op = CMP_op AND f = CMPEQ_f AND x = y ELSE
					X"0000" WHEN op = CMP_op AND f = CMPEQ_f AND x /= y ELSE
					
					X"0001" WHEN op = CMP_op AND f = CMPLTU_f AND unsigned(x) < 	unsigned(y) ELSE
					X"0000" WHEN op = CMP_op AND f = CMPLTU_f AND unsigned(x) >= unsigned(y) ELSE
					
					X"0000" WHEN op = CMP_op AND f = CMPLEU_f AND unsigned(x) <= unsigned(y) ELSE
					X"0001" WHEN op = CMP_op AND f = CMPLEU_f AND unsigned(x) > 	unsigned(y) ELSE
					
					x + y WHEN op = ARITHLOG_op ELSE
					(others => 'X');
END Structure;