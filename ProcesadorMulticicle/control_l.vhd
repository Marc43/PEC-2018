LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY control_l IS
    PORT (ir        : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          op        : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
          ldpc      : OUT STD_LOGIC;
          wrd       : OUT STD_LOGIC;
          addr_a    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          immed     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          wr_m      : OUT STD_LOGIC;
          in_d      : OUT STD_LOGIC;
          immed_x2  : OUT STD_LOGIC;
          word_byte : OUT STD_LOGIC);
END control_l;

ARCHITECTURE Structure OF control_l IS
	-- Op. codes
	--TYPE opcode_t	IS STD_LOGIC_VECTOR (3 DOWNTO 0);

	CONSTANT ARITHLOG	: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
	CONSTANT CMP		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0001";
	CONSTANT ADDI		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0010";
	CONSTANT ARITHEXT	: STD_LOGIC_VECTOR (3 DOWNTO 0) := "1000";
	CONSTANT MOV 		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0101";
	CONSTANT LD 		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0011";
	CONSTANT ST 		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0100";
	CONSTANT LDB 		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "1101";
	CONSTANT STB 		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "1110";
	CONSTANT HALT		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "1111"; 
	
	-- Function codes
	
	-- ARITHLOG
	CONSTANT AND_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "000";
	CONSTANT OR_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "001";
	CONSTANT XOR_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "010";
	CONSTANT NOT_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "011";
	CONSTANT ADD_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "100";
	CONSTANT SUB_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "101";
	CONSTANT SHA_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "110";
	CONSTANT SHL_f	: STD_LOGIC_VECTOR (2 DOWNTO 0):= "111";
	
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
	
	-- Alu operations
	CONSTANT MOVI	: STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
	CONSTANT MOVHI	: STD_LOGIC_VECTOR(1 DOWNTO 0) := "01";
	CONSTANT ADD	: STD_LOGIC_VECTOR(1 DOWNTO 0) := "10";
	
	SIGNAL op_code 	: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL f_code		: STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL reg_src1	: STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL reg_src2	: STD_LOGIC_VECTOR (2 DOWNTO 0);
	
	SIGNAL immed_ma	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL immed_alu	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	
BEGIN

	op_code 		<= ir(15 DOWNTO 12);
	reg_src1		<= ir(11 DOWNTO 9);
	reg_src2		<=	ir(8	DOWNTO 6);
	
	f_code		<= ir(5	DOWNTO 3);
	
	addr_a 	<= reg_src1 when op_code = MOV else
					reg_src2;
	
	addr_b 	<= reg_src1;
	addr_d 	<= reg_src1;
	
	immed_ma 	<= ir(5 DOWNTO 0);
	immed_alu	<= ir(7 DOWNTO 0);
	
	immed			<= std_logic_vector(resize(signed(immed_ma), immed'length)) WHEN 		op_code = ADDI OR
																												op_code = LD 	OR
																												op_code = LDB 	OR
																												op_code = ST 	OR
																												op_code = STB	ELSE
					
					std_logic_vector(resize(signed(immed_alu), immed'length)) WHEN 		op_code = MOV;

	op		<= ADD 	WHEN 		op_code = LD	OR 
									op_code = ST	OR 
									op_code = LDB	OR 
									op_code = STB 	ELSE
				
				MOVI 	WHEN		op_code = MOV 	AND
									ir(8) = '0' 	ELSE 	-- MOVI
				
				MOVHI WHEN		op_code = MOV 	AND 
									ir(8) = '1'; 			-- MOVHI
				
	ldpc	<=	'0' 	WHEN op_code = HALT ELSE
				'1';
	
	wr_m	<= '1' 	WHEN op_code = ST 	OR 
							  op_code = STB 	ELSE		
				'0'; 
				
	in_d	<= '1' 	WHEN op_code = LD 	OR
							  op_code = LDB 	ELSE
				'0';
				
	immed_x2 	<= '1' WHEN op_code = LD OR
									op_code = ST ELSE		
						'0';
					
	word_byte 	<= '1' WHEN op_code = LDB OR
									op_code = STB ELSE		
						'0'; -- Note that could be "NOT immed_x2"
						
	wrd			<= '0' WHEN op_code = HALT OR
									op_code = STB 	OR
									op_code = ST	ELSE
						'1';
	
END Structure;