LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY proc IS
    PORT (clk       : IN  STD_LOGIC;
			 clk_tlb	  : IN STD_LOGIC;
          boot      : IN  STD_LOGIC;
			 exception : IN  STD_LOGIC;
			 inta		  : OUT STD_LOGIC;
			 exception_cause : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
          datard_m  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_m    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          data_wr   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          wr_m      : OUT STD_LOGIC;
          word_byte : OUT STD_LOGIC;
			 wr_port	  : OUT STD_LOGIC;
			 rd_port	  : OUT STD_LOGIC;
			 addr_port : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			 rd_io	  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		    wr_io	  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 mem_instr : OUT STD_LOGIC;
			 div_zero : OUT STD_LOGIC;
			 ilegal_instr : OUT STD_LOGIC;
			 intr_enabled : OUT STD_LOGIC;
			 mem_exception: IN STD_LOGIC; -- To save the address when necessary...
			 calls_instr 			: OUT STD_LOGIC;
			 spec_ilegal_instr 	: OUT STD_LOGIC;
			 mode : OUT STD_LOGIC;
			 valid_dtlb	: OUT STD_LOGIC;
			 valid_itlb : OUT STD_LOGIC;
			 read_only_dtlb : OUT STD_LOGIC;
			 read_only_itlb : OUT STD_LOGIC;
			 hit_dtlb : OUT STD_LOGIC;
			 hit_itlb : OUT STD_LOGIC;
			 prot_access	: OUT STD_LOGIC
			 );
END proc;

ARCHITECTURE Structure OF proc IS

COMPONENT unidad_control IS
    PORT (boot      : IN  STD_LOGIC;
          clk       : IN  STD_LOGIC;
          datard_m  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 aluout	  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
			 eval		  : IN  STD_LOGIC;
			 mode		  : IN STD_LOGIC; -- System or User 
			 exception_l : IN  STD_LOGIC;
			 exception_d : OUT STD_LOGIC;
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
          pc        : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 pcup      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          ins_dad   : OUT STD_LOGIC;
          in_d      : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          immed_x2  : OUT STD_LOGIC;
			 immed_reg : OUT STD_LOGIC;
          wr_m      : OUT STD_LOGIC;
          word_byte : OUT STD_LOGIC;
			 wr_port	  : OUT STD_LOGIC;
			 rd_port	  : OUT STD_LOGIC;
			 e_int	  : OUT STD_LOGIC;
			 d_int	  : OUT STD_LOGIC;
			 ret_int	  : OUT STD_LOGIC;
			 mem_instr : OUT STD_LOGIC;
			 ilegal_instr 			: OUT STD_LOGIC;
			 calls_instr 			: OUT STD_LOGIC;
			 spec_ilegal_instr 	: OUT STD_LOGIC;
			 wrd_ivtlb	: OUT STD_LOGIC;
			 wrd_iptlb	: OUT STD_LOGIC;
			 wrd_dvtlb	: OUT STD_LOGIC;
			 wrd_dptlb	: OUT STD_LOGIC
);

END COMPONENT;

COMPONENT datapath IS
    PORT (reset	 : IN  STD_LOGIC;
			 clk      : IN  STD_LOGIC;
          op       : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			 func		 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          wrd_gp   : IN  STD_LOGIC;
			 wrd_sys  : IN  STD_LOGIC;
			 rd_sys_gp: IN  STD_LOGIC;
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
          in_d     : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			 exception : IN	 STD_LOGIC;
          addr_m   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          data_wr  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 aluout	 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 eval		 : OUT STD_LOGIC;
			 rd_io	 : IN	 STD_LOGIC_VECTOR(15 DOWNTO 0);
			 wr_io	 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 addr_port: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			 intr_enabled : OUT STD_LOGIC;
			 e_int	 : IN  STD_LOGIC;
			 d_int	 : IN  STD_LOGIC;
			 ret_int  : IN  STD_LOGIC;
			 exception_cause : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			 div_zero : OUT STD_LOGIC;
			 mem_exception: IN STD_LOGIC;
			 mode		  : OUT STD_LOGIC -- System or User 		 
			 );
END COMPONENT;

COMPONENT TLB IS
	PORT(
		clk: 			IN STD_LOGIC;
		vtag: 		IN STD_LOGIC_VECTOR(3 downto 0); --Tag Virtual a leer
		ptag_wr:		IN STD_LOGIC_VECTOR(3 downto 0);	--Tag Fisico a escribir
		vtag_wr:		IN STD_LOGIC_VECTOR(3 downto 0); --Tag virtual a escribir
		vtag_wrd:	IN STD_LOGIC;	--Permiso de escritura del Tag Virtual
		ptag_wrd:	IN STD_LOGIC;	--Permiso de escritura del Tag Fisico
		boot:			IN STD_LOGIC; 	
		valid_wr: 	IN STD_LOGIC;	--Senyal de validez a escribir en el nuevo tag fisico
		read_only_wr:		IN STD_LOGIC; --Senyal de read_only a escribir en el nuevo tag fisico
		wr_table_entry:	IN STD_LOGIC_VECTOR(3 downto 0); --Entrada de la tabla a escribir
		flush:				IN STD_LOGIC; --Si hace falta flushear el TLB
		ptag_rd:			OUT STD_LOGIC_VECTOR(3 downto 0); --Tag Fisico eido del TLB
		valid_rd:		OUT STD_LOGIC;	--Senyal de validez del tag Fisico leido del TLB
		read_only_rd:	OUT STD_LOGIC;	--Senyal de read_only del tag Fisico leido del TLB
		hit:				OUT STD_LOGIC	--'1' si ha habido acierto de TLB, 0 si no
	);
	
END COMPONENT;
constant vga_lower_limit : std_logic_vector (15 downto 0) := X"A000";
constant vga_upper_limit : std_logic_vector (15 downto 0) := X"B2BE";

SIGNAL bus_op 				: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL bus_wrd_gp			: STD_LOGIC;
SIGNAL bus_wrd_sys		: STD_LOGIC;
SIGNAL bus_rd_sys_gp		: STD_LOGIC;
SIGNAL bus_addr_a 		: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL bus_addr_b			: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL bus_addr_d 		: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL bus_immed			: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL bus_pc				: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL bus_pcup			: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL bus_ins_dad		: STD_LOGIC;
SIGNAL bus_in_d			: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL bus_immed_x2		: STD_LOGIC;
SIGNAL bus_wr_m			: STD_LOGIC;
SIGNAL bus_word_byte		: STD_LOGIC;

SIGNAL bus_addr_m			: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL bus_data_wr		: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL bus_func			: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL bus_immed_reg		: STD_LOGIC;

SIGNAL bus_eval			: STD_LOGIC;
SIGNAL bus_aluout			: STD_LOGIC_VECTOR (15 DOWNTO 0);

SIGNAL bus_e_int			: STD_LOGIC;
SIGNAL bus_d_int			: STD_LOGIC;
SIGNAL bus_ret_int		: STD_LOGIC;
SIGNAL bus_exception			: STD_LOGIC;
--SIGNAL bus_intr_enabled : STD_LOGIC;

SIGNAL bus_mode : STD_LOGIC;

SIGNAL bus_wrd_ivtlb : STD_LOGIC;
SIGNAL bus_wrd_iptlb : STD_LOGIC;
SIGNAL bus_wrd_dvtlb : STD_LOGIC;
SIGNAL bus_wrd_dptlb : STD_LOGIC;

SIGNAL bus_valid_itlb	: STD_LOGIC;
SIGNAL bus_valid_dtlb	: STD_LOGIC;

SIGNAL bus_read_only_itlb	: STD_LOGIC;
SIGNAL bus_read_only_dtlb	: STD_LOGIC;

SIGNAL bus_ptag_itlb	: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL bus_ptag_dtlb	: STD_LOGIC_VECTOR(3 DOWNTO 0);

SIGNAL bus_hit_itlb	: STD_LOGIC;
SIGNAL bus_hit_dtlb	: STD_LOGIC;

BEGIN

	unidad_control0 : unidad_control
	PORT MAP (
		boot 		=> boot,
		clk		=> clk,
		datard_m => datard_m,
		aluout	=> bus_aluout,
		eval		=> bus_eval,
		mode		=> bus_mode,
		exception_l	=> exception,
		exception_d		=> bus_exception,
		inta		=> inta,
		op			=> bus_op,
		func		=> bus_func,
		wrd_gp	=> bus_wrd_gp,
		wrd_sys  => bus_wrd_sys,
		rd_sys_gp => bus_rd_sys_gp,
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
		rd_port  => rd_port,
		e_int		=> bus_e_int,
		d_int		=> bus_d_int,
		ret_int	=> bus_ret_int,
		mem_instr => mem_instr,
		ilegal_instr => ilegal_instr,
		calls_instr => calls_instr,
		spec_ilegal_instr => spec_ilegal_instr,
		wrd_ivtlb => bus_wrd_ivtlb,
		wrd_iptlb => bus_wrd_iptlb,
		wrd_dvtlb => bus_wrd_dvtlb,
		wrd_dptlb => bus_wrd_dptlb
	);
	
	datapath0 : datapath
	PORT MAP (
		reset		=> boot,
		clk		=> clk,
		op			=> bus_op,
		func		=> bus_func,
		wrd_gp	=>	bus_wrd_gp,
		wrd_sys	=>	bus_wrd_sys,
		rd_sys_gp => bus_rd_sys_gp,
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
		exception		=> bus_exception,
		addr_m	=> bus_addr_m,
		data_wr	=> data_wr,
		aluout   => bus_aluout,
		eval		=> bus_eval,
		rd_io		=> rd_io,
		wr_io		=> wr_io,
		addr_port => addr_port,
		intr_enabled => intr_enabled,
		e_int		=> bus_e_int,
		d_int		=> bus_d_int,
		ret_int	=> bus_ret_int,
		div_zero => div_zero,
		exception_cause => exception_cause,
		mem_exception => mem_exception,
		mode	=> bus_mode
	);
	
	tlbIns : tlb
	PORT MAP(
		boot => boot,
		clk => clk_tlb,
		vtag => bus_addr_m(15 downto 12),
		ptag_wr => bus_aluout(11 downto 8),
		vtag_wr => bus_aluout(11 downto 8),
		vtag_wrd => bus_wrd_ivtlb,
		ptag_wrd => bus_wrd_iptlb,
		valid_wr => bus_aluout(13),
		read_only_wr => bus_aluout(12),
		wr_table_entry => bus_aluout(2 downto 0),
		flush => '0',
		ptag_rd => bus_ptag_itlb,
		valid_rd => bus_valid_itlb,
		read_only_rd => bus_read_only_itlb,
		hit => bus_hit_itlb
	);
	
	tlbDades : tlb
	PORT MAP(
		boot => boot,
		clk => clk_tlb,
		vtag => bus_addr_m(15 downto 12),
		ptag_wr => bus_aluout(11 downto 8),
		vtag_wr => bus_aluout(11 downto 8),
		vtag_wrd => bus_wrd_dvtlb,
		ptag_wrd => bus_wrd_dptlb,
		valid_wr => bus_aluout(13),
		read_only_wr => bus_aluout(12),
		wr_table_entry => bus_aluout(2 downto 0),
		flush => '0',
		ptag_rd => bus_ptag_dtlb,
		valid_rd => bus_valid_dtlb,
		read_only_rd => bus_read_only_dtlb,
		hit => bus_hit_dtlb
	);
	
	wr_m <= bus_wr_m;
	word_byte <= bus_word_byte;
	mode <= bus_mode;

	addr_m <= 	bus_ptag_itlb & bus_addr_m(11 downto 0) WHEN bus_ins_dad = '0' ELSE 
					bus_ptag_dtlb & bus_addr_m(11 downto 0); --Traduccion del TLB guapa
					
	valid_itlb	<= bus_valid_itlb;
	valid_dtlb	<= bus_valid_dtlb;
	read_only_itlb <= bus_read_only_itlb;
	read_only_dtlb	<= bus_read_only_dtlb;
	hit_itlb		<= bus_hit_itlb;
	hit_dtlb		<= bus_hit_dtlb;
	prot_access <= '1' WHEN ((bus_addr_m(15) = '1' AND unsigned(bus_addr_m) < unsigned(vga_lower_limit)) OR
									(unsigned(bus_addr_m) >  unsigned(vga_upper_limit) AND bus_addr_m(15) = '1')) ELSE	
						'0'; 
END Structure;