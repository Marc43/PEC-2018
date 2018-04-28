LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;

ENTITY unidad_control IS
    PORT (boot      : IN  STD_LOGIC;
          clk       : IN  STD_LOGIC;
          datard_m  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 aluout	  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 intr 	  : IN  STD_LOGIC;
			 eval		  : IN  STD_LOGIC;
			 intr_l	  : IN  STD_LOGIC; -- This one is provided by the controller
			 intr_d	  : OUT STD_LOGIC; -- This one really indicates when an interrupt must be performed 
			 intr_enabled : IN STD_LOGIC;
			 inta		  : OUT STD_LOGIC;
          op        : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			 func		  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          wrd_gp    : OUT STD_LOGIC;
			 wrd_sys   : OUT STD_LOGIC;
			 rd_sys_gp : OUT STD_LOGIC;
          addr_a    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          immed     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 immed_reg : OUT STD_LOGIC;
          pc        : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 pcup		  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          ins_dad   : OUT STD_LOGIC;
          in_d      : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
          immed_x2  : OUT STD_LOGIC;
          wr_m      : OUT STD_LOGIC;
          word_byte : OUT STD_LOGIC;
			 wr_port	  : OUT STD_LOGIC;
			 rd_port	  : OUT STD_LOGIC;
			 e_int	  : OUT STD_LOGIC;
			 d_int	  : OUT STD_LOGIC;
			 ret_int	  : OUT STD_LOGIC);
END unidad_control;

ARCHITECTURE Structure OF unidad_control IS

	COMPONENT control_l IS
    PORT (ir        : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 eval		  : IN  STD_LOGIC;
          op        : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			 func		  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          ldpc      : OUT STD_LOGIC;
          wrd_gp    : OUT STD_LOGIC;
			 wrd_sys   : OUT STD_LOGIC;
			 rd_sys_gp : OUT STD_LOGIC;
          addr_a    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          immed     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 immed_reg : OUT STD_LOGIC;
          wr_m      : OUT STD_LOGIC;
          in_d      : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			 tknbr	  : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
          immed_x2  : OUT STD_LOGIC;
          word_byte : OUT STD_LOGIC;
			 wr_port	  : OUT STD_LOGIC;
			 rd_port	  : OUT STD_LOGIC;
			 e_int	  : OUT STD_LOGIC;
			 d_int	  : OUT STD_LOGIC;
			 ret_int   : OUT STD_LOGIC;
			 inta		  : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT multi IS
    port(clk       : IN  STD_LOGIC;
         boot      : IN  STD_LOGIC;
         ldpc_l    : IN  STD_LOGIC;
         wrd_gp_l  : IN  STD_LOGIC;
         wrd_sys_l : IN  STD_LOGIC;
         wr_m_l    : IN  STD_LOGIC;
         w_b       : IN  STD_LOGIC;
			intr_l	 : IN  STD_LOGIC;
			intr		 : OUT STD_LOGIC;
			intr_enabled : IN STD_LOGIC;
         ldpc      : OUT STD_LOGIC;
         wrd_gp    : OUT STD_LOGIC;
			wrd_sys	 : OUT STD_LOGIC;
         wr_m      : OUT STD_LOGIC;
         ldir      : OUT STD_LOGIC;
         ins_dad   : OUT STD_LOGIC;
         word_byte : OUT STD_LOGIC);
	END COMPONENT;
	
	SIGNAL bus_ir			: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL bus_immed		: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL bus_immed_des	: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL bus_word_byte	: STD_LOGIC;
	SIGNAL bus_ldpc		: STD_LOGIC;
	SIGNAL bus_wr_m		: STD_LOGIC;
	SIGNAL bus_wrd_gp		: STD_LOGIC;
	SIGNAL bus_wrd_sys	: STD_LOGIC;
--	SIGNAL bus_rd_sys_gp : STD_LOGIC;

	SIGNAL multi_ldpc		: STD_LOGIC;
	SIGNAL multi_ldir		: STD_LOGIC;
	
	SIGNAL instrPC_mux_instrIR : STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL instr_mux_and			: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL pcmas2_mux_oldpc		: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL pc_mux_startaddr		: STD_LOGIC_VECTOR (15 DOWNTO 0);
	
	SIGNAL new_pc					: STD_LOGIC_VECTOR (15 DOWNTO 0);
	
	SIGNAL tknbr_pc				: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL bus_tknbr				: STD_LOGIC_VECTOR (1 DOWNTO 0);
	
BEGIN

	control_l0 : control_l
	PORT MAP (
		ir 			=>	bus_ir,
		eval			=> eval,
		op				=>	op,
		func			=> func,
		ldpc			=> bus_ldpc,
		wrd_gp		=>	bus_wrd_gp,
		wrd_sys		=>	bus_wrd_sys,
		rd_sys_gp   => rd_sys_gp,
		addr_a		=> addr_a,
		addr_b		=> addr_b,
		addr_d		=> addr_d,
		immed			=> bus_immed,
		immed_reg   => immed_reg,
		wr_m			=>	bus_wr_m,
		in_d			=> in_d,
		tknbr			=> bus_tknbr,
		immed_x2		=> immed_x2,
		word_byte 	=> bus_word_byte,
		wr_port		=> wr_port,
		rd_port		=> rd_port,
		e_int			=> e_int,
		d_int			=> d_int,
		ret_int		=> ret_int,
		inta			=> inta
	);
	
	multi0 : multi
	PORT MAP (
		clk			=>	clk,
		boot			=> boot,
		intr_l		=> intr_l,
		intr			=> intr_d,
		intr_enabled=> intr_enabled,
		ldpc_l		=> bus_ldpc,
		wrd_gp_l		=>	bus_wrd_gp,
		wrd_sys_l	=> bus_wrd_sys,
		wr_m_l		=>	bus_wr_m,
		w_b			=> bus_word_byte,
		ldpc			=> multi_ldpc,
		wrd_gp		=>	wrd_gp,
		wrd_sys		=> wrd_sys,
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
	
	
	tknbr_pc	<= 		  new_pc + 2 						WHEN bus_tknbr = "00" ELSE -- Implicit seq.
							  new_pc + 2 + bus_immed_des 	WHEN bus_tknbr = "01" ELSE -- BNZ && BZ
							  aluout		 						WHEN bus_tknbr = "10" ELSE -- Direct from the regfile
							  new_pc + 2; 															-- To change when CALLS is implemented
							  
	WITH multi_ldpc SELECT
		pcmas2_mux_oldpc	<= new_pc		WHEN '0',
									tknbr_pc		WHEN others;
								
	WITH boot SELECT
		pc_mux_startaddr	<= pcmas2_mux_oldpc 	WHEN '0',
									X"C000"				WHEN others;

	pc 	<= new_pc;
	pcup 	<= new_pc + 2; -- Si se lanzase una interrupcion justo cuando lanzamos un branch, esto no funcionaría?
								-- Esto es debido a que un salto seria interrumpido y en vez de almacenar la direccion
								-- de salto almacenariamos el pc+2, lo cual es un poco estupido...
	
	PROCESS (clk, boot) 
	BEGIN
	
		IF rising_edge(clk) THEN
		
			bus_ir <= instr_mux_and;
			new_pc <= pc_mux_startaddr;
			
		END IF;
	
	END PROCESS;
	
	immed 			<= bus_immed;
	bus_immed_des	<= STD_LOGIC_VECTOR(shift_left(unsigned(bus_immed), 1));
	
	-- Hay que añadirle a multi todo el estado system... con las escrituras en los registros etc. analogo a el estado DEMW con losregistros gp
	-- Falta tambien añadirle la señal interrupt a multi, que saldra del interrupt controller, si se nos olvida esto estamos DEPDEP
	
END Structure;