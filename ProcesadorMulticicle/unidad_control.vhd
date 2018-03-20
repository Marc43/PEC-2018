LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;

ENTITY unidad_control IS
    PORT (boot      : IN  STD_LOGIC;
          clk       : IN  STD_LOGIC;
          datard_m  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          op        : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
          wrd       : OUT STD_LOGIC;
          addr_a    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          immed     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          pc        : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          ins_dad   : OUT STD_LOGIC;
          in_d      : OUT STD_LOGIC;
          immed_x2  : OUT STD_LOGIC;
          wr_m      : OUT STD_LOGIC;
          word_byte : OUT STD_LOGIC);
END unidad_control;


ARCHITECTURE Structure OF unidad_control IS

	COMPONENT control_l IS
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
	END COMPONENT;
	
	COMPONENT multi IS
    port(clk       : IN  STD_LOGIC;
         boot      : IN  STD_LOGIC;
         ldpc_l    : IN  STD_LOGIC;
         wrd_l     : IN  STD_LOGIC;
         wr_m_l    : IN  STD_LOGIC;
         w_b       : IN  STD_LOGIC;
         ldpc      : OUT STD_LOGIC;
         wrd       : OUT STD_LOGIC;
         wr_m      : OUT STD_LOGIC;
         ldir      : OUT STD_LOGIC;
         ins_dad   : OUT STD_LOGIC;
         word_byte : OUT STD_LOGIC);
	END COMPONENT;
	
	SIGNAL bus_ir			: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL bus_word_byte	: STD_LOGIC;
	SIGNAL bus_ldpc		: STD_LOGIC;
	SIGNAL bus_wr_m		: STD_LOGIC;
	SIGNAL bus_wrd			: STD_LOGIC;
	
	SIGNAL multi_ldpc		: STD_LOGIC;
	SIGNAL multi_ldir		: STD_LOGIC;
	
	SIGNAL instrPC_mux_instrIR : STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL instr_mux_and			: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL pcmas2_mux_oldpc		: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL pc_mux_startaddr		: STD_LOGIC_VECTOR (15 DOWNTO 0);
	
	SIGNAL new_pc					: STD_LOGIC_VECTOR (15 DOWNTO 0);
	
BEGIN

	control_l0 : control_l
	PORT MAP (
		ir 			=>	bus_ir,
		op				=>	op,
		ldpc			=> bus_ldpc,
		wrd			=>	bus_wrd,
		addr_a		=> addr_a,
		addr_b		=> addr_b,
		addr_d		=> addr_d,
		immed			=> immed,
		wr_m			=>	bus_wr_m,
		in_d			=> in_d,
		immed_x2		=> immed_x2,
		word_byte 	=> bus_word_byte
	);
	
	multi0 : multi
	PORT MAP (
		clk			=>	clk,
		boot			=> boot,
		ldpc_l		=> bus_ldpc,
		wrd_l			=>	bus_wrd,
		wr_m_l		=>	bus_wr_m,
		w_b			=> bus_word_byte,
		ldpc			=> multi_ldpc,
		wrd			=>	wrd,
		wr_m			=>	wr_m,
		ldir			=>	multi_ldir,
		ins_dad		=>	ins_dad,
		word_byte	=> word_byte
	);
	
	WITH multi_ldir SELECT
		instrPC_mux_instrIR <= datard_m 	WHEN '1',
									  bus_ir	 	WHEN others;
									  
	WITH boot SELECT
		instr_mux_and	<= instrPC_mux_instrIR WHEN '0',
								X"0000"				  WHEN others;
								
	WITH multi_ldpc SELECT
		pcmas2_mux_oldpc	<= new_pc		WHEN '0',
									new_pc + 2 	WHEN others;
								
	WITH boot SELECT
		pc_mux_startaddr	<= pcmas2_mux_oldpc 	WHEN '0',
									X"C000"				WHEN others;
	
	pc <= new_pc;
	PROCESS (clk, boot) 
	BEGIN
	
		IF rising_edge(clk) THEN
		
			bus_ir <= instr_mux_and;
			new_pc <= pc_mux_startaddr;
			
		END IF;
	
	END PROCESS;
	

END Structure;