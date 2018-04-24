LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY datapath IS
    PORT (clk      : IN  STD_LOGIC;
          op       : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			 func 	 : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          wrd_gp   : IN  STD_LOGIC;
			 wrd_sys  : IN  STD_LOGIC;
			 rd_sys_gp: IN  STD_LOGIC;
          addr_a   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          immed    : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 immed_reg: IN	 STD_LOGIC;
          immed_x2 : IN  STD_LOGIC;
          datard_m : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          ins_dad  : IN  STD_LOGIC;
          pc       : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 pcup		 : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          in_d     : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
          addr_m   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          data_wr  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 aluout	 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 eval		 : OUT STD_LOGIC;
			 rd_io	 : IN	 STD_LOGIC_VECTOR(15 DOWNTO 0);
			 wr_io	 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 addr_port : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			 e_int	 : IN STD_LOGIC;
			 d_int	 : IN STD_LOGIC;
			 ret_int	 : IN STD_LOGIC);
END datapath;

ARCHITECTURE Structure OF datapath IS

	COMPONENT alu IS
    PORT (x  	: IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          y  	: IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          op 	: IN  STD_LOGIC_VECTOR (2 DOWNTO 0);
			 func	: IN	STD_LOGIC_VECTOR (2 DOWNTO 0);
          w  	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 z		: OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT regfile IS
    PORT (clk    : IN  STD_LOGIC;
          wrd_gp : IN  STD_LOGIC;
			 wrd_sys: IN  STD_LOGIC;
			 RD_SYS_GP : IN 	STD_LOGIC;
			 e_int  : IN  STD_LOGIC;
			 d_int  : IN  STD_LOGIC;
			 ret_int: IN  STD_LOGIC;
          d      : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_a : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          a      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          b      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
	END COMPONENT;
	
	SIGNAL reg_a			: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL reg_b			: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL mux_immed		: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL mux_immed_reg	: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL mux_dreg		: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL mux_addr		: STD_LOGIC_VECTOR (15 DOWNTO 0);
	SIGNAL alu_out			: STD_LOGIC_VECTOR (15 DOWNTO 0);
	
BEGIN

	alu0 : alu
	PORT MAP (
		x 		=> reg_a,
		y 		=> mux_immed_reg,
		op		=> op,
		func 	=> func,
		w		=> alu_out,
		z		=> eval
	);
	
	regfile0 : regfile
   PORT MAP (
		clk => clk,
		wrd_gp => wrd_gp,
		wrd_sys => wrd_sys,
		RD_SYS_GP => rd_sys_gp,
		e_int => e_int,
		d_int => d_int,
		ret_int => ret_int,
		d	=> mux_dreg,
		addr_a => addr_a,
		addr_b => addr_b,
		addr_d => addr_d,
		a => reg_a,
		b => reg_b
	);
	
	WITH in_d SELECT		-- Data output or data from memory (loads)
		mux_dreg <= alu_out 	WHEN "00",
						datard_m	WHEN "01",
						pcup		WHEN "10",	 -- JAL
						rd_io		WHEN others; -- IO
	
	WITH immed_x2 SELECT -- Normal operations or memory access (aligment) 
		mux_immed <= immed 															WHEN '0',
					    STD_LOGIC_VECTOR(shift_left(unsigned(immed), 1))	WHEN '1',
						 immed															WHEN others;
						 
	WITH immed_reg SELECT 
		mux_immed_reg <=	reg_b 		WHEN '0',
								mux_immed	WHEN '1',
								mux_immed	WHEN others;
						 
	WITH ins_dad SELECT
		mux_addr <= pc 		WHEN '0',
						alu_out	WHEN '1',
						pc			WHEN others;
						
	data_wr	 <= reg_b;
	aluout	 <= alu_out;
	addr_m	 <= mux_addr;
	wr_io		 <= alu_out; 				-- para el OUT, aunque tambien se podria coger directamente el registro B...
	addr_port <= immed(7 DOWNTO 0);	-- Tanto para OUT como para IN, en caso que sea otra llamada wr_out = '0' && rd_in = '0'
	
	-- Just connect the wires, the control will allow the write if necessary
				
END Structure;