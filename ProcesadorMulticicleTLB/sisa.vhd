LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY sisa IS
    PORT (CLOCK_50  : IN    STD_LOGIC;
          SRAM_ADDR : out   std_logic_vector(17 downto 0);
          SRAM_DQ   : inout std_logic_vector(15 downto 0);
          SRAM_UB_N : out   std_logic;
          SRAM_LB_N : out   std_logic;
          SRAM_CE_N : out   std_logic := '1';
          SRAM_OE_N : out   std_logic := '1';
          SRAM_WE_N : out   std_logic := '1';
			 PS2_CLK	  : inout std_logic;
			 PS2_DAT   : inout std_logic;
			 LEDG   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
			 LEDR   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
			 KEY	  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
          SW     : IN  std_logic_vector(9 downto 0);
			 VGA_R  : OUT STD_LOGIC_VECTOR (7 downto 0);
			 VGA_G  : OUT STD_LOGIC_VECTOR (7 downto 0);
			 VGA_B  : OUT STD_LOGIC_VECTOR (7 downto 0);
			 VGA_HS : OUT STD_LOGIC;
			 VGA_VS : OUT STD_LOGIC;
			 HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			 HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			 HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			 HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END sisa;

ARCHITECTURE Structure OF sisa IS

	component proc IS
    PORT (clk       : IN  STD_LOGIC;
			 clk_tlb	  : IN  STD_LOGIC;
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
			 div_zero  : OUT STD_LOGIC;
			 ilegal_instr : OUT STD_LOGIC;
			 intr_enabled : OUT STD_LOGIC;
			 mem_exception: IN STD_LOGIC;
			 calls_instr 			: OUT STD_LOGIC;
			 spec_ilegal_instr 	: OUT STD_LOGIC;
			 mode : OUT STD_LOGIC;
			 prot_access	: OUT STD_LOGIC
			 );
	END component;

	component MemoryController is
    port (CLOCK_50  : in  std_logic;
			 addr      : in  std_logic_vector(15 downto 0);
          wr_data   : in  std_logic_vector(15 downto 0);
          rd_data   : out std_logic_vector(15 downto 0);
          we        : in  std_logic;
          byte_m    : in  std_logic;
			 mode : in std_logic;

          SRAM_ADDR : out   std_logic_vector(17 downto 0);
          SRAM_DQ   : inout std_logic_vector(15 downto 0);
          SRAM_UB_N : out   std_logic;
          SRAM_LB_N : out   std_logic;
          SRAM_CE_N : out   std_logic := '1';
          SRAM_OE_N : out   std_logic := '1';
          SRAM_WE_N : out   std_logic := '1';
			 			 
			 vga_addr : out std_logic_vector(12 downto 0);
			 vga_we : out std_logic;
			 vga_wr_data : out std_logic_vector(15 downto 0);
			 vga_rd_data : in std_logic_vector(15 downto 0);
			 vga_byte_m : out std_logic;
			 unaligned_access	: out std_logic;
			 prot_access : out std_logic
);
	end component;
	
  COMPONENT controladores_IO IS  
  PORT (	boot			: IN  STD_LOGIC; 
			CLOCK_50    : IN  std_logic; 
			inta			: IN  STD_LOGIC;
			intr			: OUT STD_LOGIC;
			addr_io     : IN  std_logic_vector(7 downto 0); 
			wr_io  		: in  std_logic_vector(15 downto 0); 
			rd_io 		: out std_logic_vector(15 downto 0); 
			wr_out 		: in  std_logic; 
			rd_in 		: in  std_logic;
			ps2_clk 		: inout std_logic;
			ps2_data		: inout std_logic;
			led_verdes  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
			led_rojos   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			display		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			power_display : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			keys			: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			switches		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			vga_cursor : out std_logic_vector(15 downto 0);
			vga_cursor_enable : out std_logic); 
	END COMPONENT; 
	
	COMPONENT exception_controller IS
	PORT (
		clk : IN STD_LOGIC;
		calls_instr 			: IN STD_LOGIC;
		spec_ilegal_instr 	: IN STD_LOGIC;
		intr_enabled 			: IN STD_LOGIC;
		ilegal_instr 			: IN STD_LOGIC;
		mem_instr				: IN STD_LOGIC;
		unaligned_access 		: IN STD_LOGIC;
		protected_mem_access : IN STD_LOGIC;
		intr						: IN STD_LOGIC;
		div_zero					: IN STD_LOGIC;
		exception_cause		: OUT STD_LOGIC_VECTOR (3 downto 0);
		exception 				: OUT STD_LOGIC;
		mem_exception : OUT STD_LOGIC
	);
	END COMPONENT; 
	
	COMPONENT vga_controller is
    port(clk_50mhz      : in  std_logic; -- system clock signal
         reset          : in  std_logic; -- system reset
--         blank_out      : out std_logic; -- vga control signal
--         csync_out      : out std_logic; -- vga control signal
         red_out        : out std_logic_vector(7 downto 0); -- vga red pixel value
         green_out      : out std_logic_vector(7 downto 0); -- vga green pixel value
         blue_out       : out std_logic_vector(7 downto 0); -- vga blue pixel value
         horiz_sync_out : out std_logic; -- vga control signal
         vert_sync_out  : out std_logic; -- vga control signal
         --
         addr_vga          : in std_logic_vector(12 downto 0);
         we                : in std_logic;
         wr_data           : in std_logic_vector(15 downto 0);
         rd_data           : out std_logic_vector(15 downto 0);
         byte_m            : in std_logic;
         vga_cursor        : in std_logic_vector(15 downto 0);  -- simplemente lo ignoramos, este controlador no lo tiene implementado
         vga_cursor_enable : in std_logic);                     -- simplemente lo ignoramos, este controlador no lo tiene implementado
	end COMPONENT;
	
	COMPONENT Display7 IS
	PORT(
		enable 			: IN STD_LOGIC;
		VALOR 			: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		bitsCaracter 	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT;
	
	signal gboot : std_logic;
	
	signal clk_proc		 	: std_logic := '0';	-- Wires between devices
	signal bus_addr			: std_logic_vector (15 downto 0);
	signal bus_data_wr		: std_logic_vector (15 downto 0);
	signal bus_wr_m			: std_logic;
   signal bus_word_byte		: std_logic;
	
	signal bus_data_rd		: std_logic_vector (15 downto 0); -- Out from devices
	
	signal bus_addr_io		: std_logic_vector (7 downto 0);
	signal bus_wr_io			: std_logic_vector (15 downto 0);
	signal bus_rd_io			: std_logic_vector (15 downto 0);
	signal bus_wr_port		: std_logic;
	signal bus_rd_port		: std_logic;
	
	signal ticks : std_logic_vector (2 downto 0) := "000";
	
	signal bus_display : std_logic_vector (15 downto 0);
	signal bus_power_display : std_logic_vector (3 downto 0);
	
	signal bus_vga_addr 		: std_logic_vector (12 downto 0);
	signal bus_vga_we 		: std_logic;
	signal bus_vga_wr_data 	: std_logic_vector(15 downto 0);
	signal bus_vga_rd_data 	: std_logic_vector(15 downto 0);
	signal bus_vga_byte_m 	: std_logic;
	signal bus_vga_cursor 	: std_logic_vector (15 downto 0);
	signal bus_vga_cursor_enable : std_logic;
	
	signal bus_vga_r : std_logic_vector (7 downto 0);
	signal bus_vga_g : std_logic_vector (7 downto 0);
	signal bus_vga_b : std_logic_vector (7 downto 0);
	
	signal bus_inta  : std_logic;
	signal bus_intr  : std_logic;
	
	signal bus_exception_cause 		: std_logic_vector (3 downto 0);
	signal bus_unaligned_access 		: std_logic;
	signal bus_mem_instr					: std_logic;
	signal bus_div_zero					: std_logic;
	signal bus_exception 				: std_logic;	
	signal bus_ilegal_instr 			: std_logic;
	signal bus_intr_enabled 			: std_logic;
	signal bus_unaligned_exception 	: std_logic;
	signal bus_calls_instr 				: std_logic;
	signal bus_spec_ilegal_instr 		: std_logic;
	
	signal bus_mode : std_logic;
	signal bus_prot_access : std_logic;
	signal bus_mem_exception : std_logic;

BEGIN

	clk_calc : process (CLOCK_50)
	begin
		if rising_edge(CLOCK_50) then
			ticks <= ticks+1;
		end if;
	end process;
	
	clk_proc <= ticks(2);
	
	proc0 : proc
	port map (
		clk 		=> clk_proc,
		clk_tlb	=> CLOCK_50, --Perque les lectures es fan dins un process i aixi no va tard el tlb. Sorry Josep
		boot 		=> gboot,
		exception => bus_exception,
		inta		=> bus_inta,
		exception_cause => bus_exception_cause,
		datard_m	=> bus_data_rd,
		addr_m	=> bus_addr,
		data_wr	=> bus_data_wr,
		wr_m		=> bus_wr_m,
		word_byte=> bus_word_byte,
		wr_port	=> bus_wr_port,
		rd_port	=> bus_rd_port,
		addr_port => bus_addr_io,
		rd_io	  	=> bus_rd_io,
		wr_io		=> bus_wr_io,
		mem_instr 	=> bus_mem_instr, 
		div_zero 	=> bus_div_zero,
		ilegal_instr => bus_ilegal_instr,
		intr_enabled => bus_intr_enabled,
		mem_exception => bus_mem_exception,
		calls_instr => bus_calls_instr,
		spec_ilegal_instr => bus_spec_ilegal_instr,
		mode => bus_mode
	);
	
	mem_ctrl0 : MemoryController
	port map (
		CLOCK_50 => CLOCK_50,
		addr		=> bus_addr,
		wr_data	=> bus_data_wr,
		rd_data	=> bus_data_rd,
		we			=> bus_wr_m,
		byte_m	=> bus_word_byte,
		SRAM_ADDR=> SRAM_ADDR,
		SRAM_DQ	=> SRAM_DQ,
		SRAM_UB_N=> SRAM_UB_N,
		SRAM_LB_N=> SRAM_LB_N,
		SRAM_CE_N=>	SRAM_CE_N,
		SRAM_OE_N=> SRAM_OE_N,
		SRAM_WE_N=> SRAM_WE_N,
		vga_addr => bus_vga_addr,
		vga_we 	=> bus_vga_we,
		vga_wr_data => bus_vga_wr_data,
		vga_rd_data => bus_vga_rd_data,
		vga_byte_m => bus_vga_byte_m,
		unaligned_access => bus_unaligned_access,
		prot_access => bus_prot_access,
		mode => bus_mode
	);
	
	controladores_IO0 : controladores_IO
	port map (
		boot			=> gboot,
		CLOCK_50 	=> CLOCK_50,
		inta			=> bus_inta,
		intr			=> bus_intr,
		addr_io  	=> bus_addr_io,
		wr_io  		=> bus_wr_io,
		rd_io 		=> bus_rd_io,
		wr_out 		=> bus_wr_port,
		rd_in 		=> bus_rd_port,
		ps2_clk 		=> PS2_CLK,
		ps2_data		=> PS2_DAT,
		led_verdes  => LEDG,
		led_rojos   => LEDR,
		display		=> bus_display,
		power_display	=> bus_power_display,
		keys			=> KEY,
		switches		=> SW(7 DOWNTO 0),
		vga_cursor => bus_vga_cursor,
		vga_cursor_enable => bus_vga_cursor_enable
	);
	
	exception_controller0 : exception_controller 
	port map (
		clk => clk_proc,
		calls_instr 		=> bus_calls_instr,
		spec_ilegal_instr => bus_spec_ilegal_instr,
		intr_enabled 		=> bus_intr_enabled,
		ilegal_instr 		=> bus_ilegal_instr,
		mem_instr	 		=> bus_mem_instr,
		unaligned_access 	=> bus_unaligned_access,
		protected_mem_access => bus_prot_access,
		intr					=> bus_intr,
		div_zero				=> bus_div_zero,
		exception_cause	=> bus_exception_cause,
		exception 			=> bus_exception,
		mem_exception		=> bus_mem_exception
		);

	vga_controller0 : vga_controller
	port map (
		clk_50mhz      => CLOCK_50,
		reset          => gboot,
--		blank_out      => 
--		csync_out      => 
		red_out        => bus_vga_r,
		green_out      => bus_vga_g,
		blue_out       => bus_vga_b,
		horiz_sync_out => VGA_HS,
		vert_sync_out  => VGA_VS,
		addr_vga       => bus_vga_addr,
		we             => bus_vga_we,
		wr_data        => bus_vga_wr_data,
		rd_data        => bus_vga_rd_data,
		byte_m         => bus_vga_byte_m,
		vga_cursor     => bus_vga_cursor,
		vga_cursor_enable => bus_vga_cursor_enable
	);
	
	
	display0 : Display7
	port map (
		enable 		 => bus_power_display(0),
		bitsCaracter => HEX0,
		VALOR			 => bus_display(3 downto 0)	
	);
	
	display1 : Display7
	port map (
		enable 		 => bus_power_display(1),
		bitsCaracter => HEX1,
		VALOR			 => bus_display(7 downto 4)	
	);
	
	display2 : Display7
	port map (
		enable 		 => bus_power_display(2),
		bitsCaracter => HEX2,
		VALOR			 => bus_display(11 downto 8)	
	);
	
	display3 : Display7
	port map (
		enable 		 => bus_power_display(3),
		bitsCaracter => HEX3,
		VALOR			 => bus_display(15 downto 12)	
	);
	
	gboot <= SW(9);
	
	
	VGA_R <= "0000" & bus_vga_r(3 DOWNTO 0);
	VGA_G <= "0000" & bus_vga_g(3 DOWNTO 0);
	VGA_B <= "0000" & bus_vga_b(3 DOWNTO 0);
		
END Structure;