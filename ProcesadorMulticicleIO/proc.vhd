LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY proc IS
    PORT (clk       : IN  STD_LOGIC;
          boot      : IN  STD_LOGIC;
          datard_m  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_m    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          data_wr   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          wr_m      : OUT STD_LOGIC;
          word_byte : OUT STD_LOGIC;
			 wr_port	  : OUT STD_LOGIC;
			 rd_port	  : OUT STD_LOGIC;
			 addr_port : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			 rd_io	  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		    wr_io	  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END proc;

ARCHITECTURE Structure OF proc IS

COMPONENT unidad_control IS
    PORT (boot      : IN  STD_LOGIC;
          clk       : IN  STD_LOGIC;
          datard_m  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 aluout	  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 eval		  : IN  STD_LOGIC;
          op        : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			 func		  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          wrd       : OUT STD_LOGIC;
          addr_a    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          immed     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          pc        : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 pcup      : OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
          ins_dad   : OUT STD_LOGIC;
          in_d      : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
          immed_x2  : OUT STD_LOGIC;
			 immed_reg : OUT STD_LOGIC;
          wr_m      : OUT STD_LOGIC;
          word_byte : OUT STD_LOGIC;
			 wr_port	  : OUT STD_LOGIC;
			 rd_port	  : OUT STD_LOGIC);
END COMPONENT;

COMPONENT datapath IS
    PORT (clk      : IN  STD_LOGIC;
          op       : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			 func		 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          wrd      : IN  STD_LOGIC;
          addr_a   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          immed    : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 immed_reg : IN STD_LOGIC;
          immed_x2 : IN  STD_LOGIC;
          datard_m : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          ins_dad  : IN  STD_LOGIC;
          pc       : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 pcup     : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          in_d     : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
          addr_m   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          data_wr  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 aluout	 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 eval		 : OUT STD_LOGIC;
			 rd_io	 : IN	 STD_LOGIC_VECTOR(15 DOWNTO 0);
			 wr_io	 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 addr_port: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END COMPONENT;

COMPONENT Display7 IS
 PORT(VALOR : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
 bitsCaracter : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT;

SIGNAL bus_op 				: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL bus_wrd				: STD_LOGIC;
SIGNAL bus_addr_a 		: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL bus_addr_b			: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL bus_addr_d 		: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL bus_immed			: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL bus_pc				: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL bus_pcup			: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL bus_ins_dad		: STD_LOGIC;
SIGNAL bus_in_d			: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL bus_immed_x2		: STD_LOGIC;
SIGNAL bus_wr_m			: STD_LOGIC;
SIGNAL bus_word_byte		: STD_LOGIC;
--SIGNAL bus_wr_port		: STD_LOGIC;

SIGNAL bus_addr_m			: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL bus_data_wr		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL bus_func			: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL bus_immed_reg		: STD_LOGIC;

SIGNAL bus_eval			: STD_LOGIC;
SIGNAL bus_aluout			: STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN

	unidad_control0 : unidad_control
	PORT MAP (
		boot 		=> boot,
		clk		=> clk,
		datard_m => datard_m,
		aluout	=> bus_aluout,
		eval		=> bus_eval,
		op			=> bus_op,
		func		=> bus_func,
		wrd		=> bus_wrd,
		addr_a	=> bus_addr_a,
		addr_b	=> bus_addr_b,
		addr_d	=> bus_addr_d,
		immed		=> bus_immed,
		immed_reg => bus_immed_reg,
		pc			=> bus_pc,
		pcup		=> bus_pcup,
		ins_dad	=> bus_ins_dad,
		immed_x2	=> bus_immed_x2,
		wr_m		=> bus_wr_m,
		word_byte=> bus_word_byte,
		in_d 		=> bus_in_d,
		wr_port	=> wr_port,
		rd_port  => rd_port
	);
	
	datapath0 : datapath
	PORT MAP (
		clk		=> clk,
		op			=> bus_op,
		func		=> bus_func,
		wrd		=>	bus_wrd,
		addr_a	=> bus_addr_a,
		addr_b	=> bus_addr_b,
		addr_d	=> bus_addr_d,
		immed		=> bus_immed,
		immed_x2	=>	bus_immed_x2,
		immed_reg => bus_immed_reg,
		datard_m	=> datard_m,
		ins_dad	=> bus_ins_dad,
		pc			=> bus_pc,
		pcup		=> bus_pcup,
		in_d		=> bus_in_d,
		addr_m	=> addr_m,
		data_wr	=> data_wr,
		aluout   => bus_aluout,
		eval		=> bus_eval,
		rd_io		=> rd_io,
		wr_io		=> wr_io,
		addr_port => addr_port
	);
	
	wr_m <= bus_wr_m;
	word_byte <= bus_word_byte;
	
END Structure;