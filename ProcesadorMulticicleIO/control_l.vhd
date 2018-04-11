LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY control_l IS
    PORT (ir        : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 eval		  : IN  STD_LOGIC;
          op        : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			 func		  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          ldpc      : OUT STD_LOGIC;
          wrd       : OUT STD_LOGIC;
          addr_a    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          immed     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 immed_reg : OUT STD_LOGIC;
          wr_m      : OUT STD_LOGIC;
          in_d      : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			 tknbr	  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
          immed_x2  : OUT STD_LOGIC;
          word_byte : OUT STD_LOGIC;
			 wr_port	  : OUT STD_LOGIC;
			 rd_port	  : OUT STD_LOGIC);
END control_l;

ARCHITECTURE Structure OF control_l IS
	-- Op. codes
	CONSTANT ARITHLOG	: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
	CONSTANT CMP		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0001";
	CONSTANT ADDI		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0010";
	CONSTANT ARITHEXT	: STD_LOGIC_VECTOR (3 DOWNTO 0) := "1000";
	CONSTANT MOV 		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0101";
	CONSTANT BRANCH	: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0110";
	CONSTANT LD 		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0011";
	CONSTANT ST 		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0100";
	CONSTANT IO			: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0111";
	CONSTANT JUMP		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "1010";
	CONSTANT LDB 		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "1101";
	CONSTANT STB 		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "1110";
	CONSTANT HALT		: STD_LOGIC_VECTOR (3 DOWNTO 0) := "1111"; 
	
	-- Alu operation codes
	
	CONSTANT ARITHLOG_op	: STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";
	CONSTANT MOV_op		: STD_LOGIC_VECTOR (2 DOWNTO 0) := "001";
	CONSTANT CMP_op		: STD_LOGIC_VECTOR (2 DOWNTO 0) := "010";
	CONSTANT EXT_op		: STD_LOGIC_VECTOR (2 DOWNTO 0) := "011";
	CONSTANT BYPASSX_op	: STD_LOGIC_VECTOR (2 DOWNTO 0) := "100";
	CONSTANT BYPASSY_op	: STD_LOGIC_VECTOR (2 DOWNTO 0) := "101";

	-- Alu function codes
	-- ARITHLOG
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
	
	--Branch and JMP codes
	CONSTANT BZ   : STD_LOGIC := '0';
	CONSTANT BNZ  : STD_LOGIC := '1';
	CONSTANT JZ   : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";
	CONSTANT JNZ  : STD_LOGIC_VECTOR (2 DOWNTO 0) := "001";
	CONSTANT JMP  : STD_LOGIC_VECTOR (2 DOWNTO 0) := "011";
	CONSTANT JAL  : STD_LOGIC_VECTOR (2 DOWNTO 0) := "100";
	
	SIGNAL op_code 	: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL f_code		: STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL reg_d		: STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL reg_src1	: STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL reg_src2	: STD_LOGIC_VECTOR (2 DOWNTO 0);
	
	SIGNAL branch_f : STD_LOGIC; 
	SIGNAL jmp_f	 : STD_LOGIC_VECTOR (2 DOWNTO 0);
	
	SIGNAL immed_ma	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL immed_alu	: STD_LOGIC_VECTOR (7 DOWNTO 0);
	
BEGIN

	op_code 		<= ir(15 DOWNTO 12);
	reg_d			<= ir(11 DOWNTO 9);
	reg_src1		<= ir (8 DOWNTO 6);
	reg_src2		<= ir (2 DOWNTO 0);
	
	branch_f <= ir(8);
	jmp_f		<= ir(2 DOWNTO 0);
	
	f_code	<= ir(5	DOWNTO 3);
	
	addr_a 	<= 	reg_d WHEN op_code = MOV ELSE
	
						reg_src1;
	
	addr_b 	<= reg_src2 WHEN 	op_code = ARITHLOG OR
										op_code = CMP 		 ELSE
					reg_d;
					
	addr_d 	<= reg_d;
	
	immed_ma 	<= ir(5 DOWNTO 0);
	immed_alu	<= ir(7 DOWNTO 0);
	
	immed			<= 	std_logic_vector(resize(signed(immed_ma), immed'length)) WHEN 	op_code = ADDI OR
																												op_code = LD 	OR
																												op_code = LDB 	OR
																												op_code = ST 	OR
																												op_code = STB	ELSE
					
							std_logic_vector(resize(signed(immed_alu), immed'length));

	op		<= ARITHLOG_op	WHEN 	   op_code = LD			OR 
											op_code = ST			OR 
											op_code = LDB			OR 
											op_code = STB 			OR
											op_code = ADDI 		OR
											op_code = ARITHLOG 	ELSE
				
				MOV_op 		WHEN		op_code = MOV 			ELSE
			
				CMP_op		WHEN		op_code = CMP 			ELSE
				
				EXT_op		WHEN		op_code = ARITHEXT 	ELSE
				
				BYPASSX_op  WHEN		op_code = JUMP 		ELSE
				
				BYPASSY_op; -- IO

	func	<= ADD_f 	WHEN	op_code = LD	OR 
									op_code = ST	OR 
									op_code = LDB	OR 
									op_code = STB 	OR
									op_code = ADDI ELSE
				
				MOVI_f 	WHEN	op_code = MOV 	AND
									ir(8) = '0'		ELSE

				MOVHI_f 	WHEN 	op_code = MOV 	AND
									ir(8) = '1'		ELSE
				f_code;
				
	ldpc	<=	'0' 	WHEN op_code = HALT 	ELSE
				'1';
	
	wr_m	<= '1' 	WHEN op_code = ST 	OR 
							  op_code = STB 	ELSE		
				'0'; 
			
	in_d	<= "11"	WHEN op_code = IO	AND ir(8) = '0' 	ELSE -- IN 
	
				"10"  WHEN op_code = JUMP AND jmp_f = JAL ELSE
				
				"01" 	WHEN op_code = LD 	OR
							  op_code = LDB 	ELSE
				"00";
				
	tknbr <= "10" WHEN (op_code = JUMP AND jmp_f = JZ  AND eval = '1') OR
							 (op_code = JUMP AND jmp_f = JNZ AND eval = '0') OR
							 (op_code = JUMP AND jmp_f = JMP) 					 OR 
							 (op_code = JUMP AND jmp_f = JAL) 					 ELSE
							 
				"01" WHEN (op_code = BRANCH AND branch_f = BZ  AND eval = '1') OR
							 (op_code = BRANCH AND branch_f = BNZ AND eval = '0') ELSE
							 
				"00";
								
	immed_reg	<= '1' WHEN op_code = ADDI OR		-- 1 when we choose the value from the immediate
									op_code = ST	OR		-- 0 when we choose it from the register b
									op_code = STB 	OR
									op_code = LD	OR
									op_code = LDB	OR
									op_code = MOV	ELSE
						
						'0';					
				
	immed_x2 	<= 	'1' WHEN op_code = LD OR
										op_code = ST OR
										op_code = BRANCH ELSE		
							'0';
					
	word_byte 	<= '1' WHEN op_code = LDB OR
									op_code = STB ELSE		
						'0'; -- Note that could be "NOT immed_x2"
						
	wrd			<= '0' WHEN op_code = HALT 	OR
									op_code = STB 		OR
									op_code = ST		OR
									op_code = BRANCH  OR	
								  (op_code = JUMP AND (jmp_f = JZ OR jmp_f = JNZ OR jmp_f = JMP)) OR
								  (op_code = IO	AND ir(8) = '1') ELSE
						'1';
						
	wr_port	<= '1' WHEN op_code = IO AND ir(8) = '1' 	ELSE
	
					'0';
					
	-- rd_port is unimplemented by the moment
	rd_port	<= '1' WHEN op_code = IO AND ir(8) = '0' 	ELSE
	
					'0';
	
	
END Structure;