LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY datapath IS
    PORT (clk      : IN  STD_LOGIC;
          op       : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
			 func 	 : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          wrd      : IN  STD_LOGIC;
          addr_a   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          immed    : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 immed_reg: IN	 STD_LOGIC;
          immed_x2 : IN  STD_LOGIC;
          datard_m : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          ins_dad  : IN  STD_LOGIC;
          pc       : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          in_d     : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
          addr_m   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          data_wr  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 eval		 : OUT STD_LOGIC);
END datapath;

ARCHITECTURE Structure OF datapath IS

	COMPONENT alu IS
    PORT (x  	: IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          y  	: IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          op 	: IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
			 func	: IN	STD_LOGIC_VECTOR (2 DOWNTO 0);
          w  	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 z		: OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT regfile IS
    PORT (clk    : IN  STD_LOGIC;
          wrd    : IN  STD_LOGIC;
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
	--SIGNAL alu_zero		: STD_LOGIC;
	
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
		wrd => wrd,
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
						alu_out	WHEN others;
	
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
						
	data_wr	<= reg_b;
	addr_m	<= mux_addr;
						 	 
END Structure;