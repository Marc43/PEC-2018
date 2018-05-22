LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; 
USE ieee.numeric_std.all;        

ENTITY regfile IS
    PORT (reset		: IN  STD_LOGIC;
			 clk    		: IN  STD_LOGIC;
          wrd_gp  	: IN  STD_LOGIC;
			 wrd_sys		: IN	STD_LOGIC;
			 RD_SYS_GP	: IN 	STD_LOGIC;
			 exception			: IN  STD_LOGIC;
			 e_int		: IN  STD_LOGIC;
			 d_int		: IN  STD_LOGIC;
			 ret_int    : IN  STD_LOGIC;
          d     		: IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_a 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          a      		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          b      		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 intr_enabled	: OUT STD_LOGIC;
			 mode	: OUT STD_LOGIC;
			 addr_m			: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			 mem_exception: IN STD_LOGIC;
			 exception_cause	: IN STD_LOGIC_VECTOR(3 DOWNTO 0)
			 );
END regfile;

ARCHITECTURE Structure OF regfile IS

COMPONENT system_regfile IS
	PORT (
		 reset		: IN  STD_LOGIC;
		 clk    		: IN  STD_LOGIC;
		 wrd	    	: IN  STD_LOGIC;
		 exception	: IN  STD_LOGIC;
		 e_int		: IN  STD_LOGIC;
		 d_int		: IN  STD_LOGIC;
		 ret_int    : IN  STD_LOGIC;
		 d     		: IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		 addr_a 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		 addr_d 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		 a      		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 intr_enabled : OUT STD_LOGIC;
		 mode	: OUT STD_LOGIC;
		 addr_m	: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		 exception_cause : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		 mem_exception: IN STD_LOGIC
	);
END COMPONENT;

COMPONENT generalp_regfile IS
	PORT (
		 clk    		: IN  STD_LOGIC;
		 wrd		  	: IN  STD_LOGIC;
		 d     		: IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		 addr_a 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		 addr_b 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		 addr_d 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		 a      		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 b      		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL bus_sys_a 	: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL bus_gp_a	: STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN

	system_regfile0 : system_regfile
	PORT MAP (
		reset		=> reset,
		clk 		=> clk,
		wrd 		=> wrd_sys,
		exception		=> exception,
		e_int 	=> e_int,
		d_int 	=> d_int,
		ret_int 	=> ret_int,
		d			=> d,
		addr_a	=> addr_a,
		addr_d	=> addr_d,
		a			=> bus_sys_a,
		intr_enabled => intr_enabled,
		mode	=> mode,
		addr_m => addr_m,
		exception_cause => exception_cause,
		mem_exception => mem_exception
	);
	
	generalp_regfile0 : generalp_regfile
	PORT MAP (
		clk 		=> clk,
		wrd 		=> wrd_gp,
		d			=> d,
		addr_a 	=> addr_a,
		addr_b 	=> addr_b,
		addr_d	=> addr_d,
		a		 	=> bus_gp_a,
		b		 	=> b
	);
	
	a <= bus_sys_a WHEN RD_SYS_GP = '1' AND exception = '0' ELSE
	
		  bus_gp_a	WHEN RD_SYS_GP = '0' AND exception = '0' ELSE
		  
		  bus_sys_a; -- If exception = '1' port 'a' is being read from the sys regfile  
	
END Structure;

--##############################################################################################################
--##############################################################################################################
--##############################################################################################################
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; 
USE ieee.numeric_std.all;  

ENTITY system_regfile IS
	PORT (
		 reset		: IN  STD_LOGIC;
		 clk    		: IN  STD_LOGIC;
		 wrd	    	: IN  STD_LOGIC;
		 exception			: IN  STD_LOGIC;
		 e_int		: IN  STD_LOGIC;
		 d_int		: IN  STD_LOGIC;
		 ret_int    : IN  STD_LOGIC;
		 d     		: IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		 addr_a 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		 addr_d 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		 a      		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 intr_enabled : OUT STD_LOGIC;
		 mode : OUT STD_LOGIC;
		 addr_m 		: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 exception_cause	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 mem_exception: IN STD_LOGIC
	);
END system_regfile;
	
ARCHITECTURE Structure OF system_regfile IS

	type register_set is array (7 downto 0) of std_logic_vector(15 downto 0); -- 8 registres de 16 bits cadascun

	SIGNAL regs_sys 	: register_set := ((others => (others => '0'))); -- System registers
	
	SIGNAL stop_saving_addr : STD_LOGIC := '0';
	
	CONSTANT PSWold	: STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";	
	CONSTANT PCret		: STD_LOGIC_VECTOR (2 DOWNTO 0) := "001";
	CONSTANT blackb	: STD_LOGIC_VECTOR (2 DOWNTO 0) := "010"; -- Records what made an exception or except. trigger
	CONSTANT mem_addr	: STD_LOGIC_VECTOR (2 DOWNTO 0) := "011";
	CONSTANT RSG	 	: STD_LOGIC_VECTOR (2 DOWNTO 0) := "101";
	CONSTANT PSWup 	: STD_LOGIC_VECTOR (2 DOWNTO 0) := "111";
	
	CONSTANT ILEGAL_INSTRUCTION_E : STD_LOGIC_VECTOR (3 downto 0) := "0000";
	CONSTANT UNALIGNED_ACCESS_E	: STD_LOGIC_VECTOR (3 downto 0) := "0001";
	CONSTANT DIVIDE_BY_ZERO_E		: STD_LOGIC_VECTOR (3 downto 0) := "0100";
	CONSTANT INTERRUPT_E				: STD_LOGIC_VECTOR (3 downto 0) := "1111";
	
BEGIN

	PROCESS (clk, reset)
	BEGIN
		IF reset = '1' THEN
			regs_sys <= ((others => (others => '0')));
			regs_sys(conv_integer(PSWup)) <= regs_sys(conv_integer(PSWup))(15 DOWNTO 1) & '1'; -- Enable system mode at boot
		ELSIF rising_edge(clk) THEN
		
			IF wrd = '1' THEN
				IF e_int = '1' THEN
					-- EI
--					regs_sys(conv_integer(PSWup)) <= regs_sys(conv_integer(PSWup))(15 DOWNTO 2) & '1' & regs_sys(conv_integer(PSWup))(0); -- Bit that indicates enabled/disabled interruptions
					regs_sys(conv_integer(PSWold)) <= regs_sys(conv_integer(PSWold))(15 DOWNTO 2) & '1' & regs_sys(conv_integer(PSWold))(0); -- Bit that indicates enabled/disabled interruptions
				ELSIF d_int = '1' THEN
					-- DI
--					regs_sys(conv_integer(PSWup)) <= regs_sys(conv_integer(PSWup))(15 DOWNTO 2) & '0' & regs_sys(conv_integer(PSWup))(0);
					regs_sys(conv_integer(PSWold)) <= regs_sys(conv_integer(PSWold))(15 DOWNTO 2) & '0' & regs_sys(conv_integer(PSWold))(0);
				ELSE
					-- WRS
					regs_sys(conv_integer(addr_d)) <= d;
				END IF;
			END IF;
			
			IF ret_int = '1' THEN
			
				regs_sys(conv_integer(PSWup)) <= regs_sys(conv_integer(PSWold));
				
				-- When we return from an interruption we must restore the old state of the processor
				-- Thus, the processor is in the same PC and state as before
				
			END IF;
			
			IF mem_exception = '1' THEN
					regs_sys(conv_integer(mem_addr)) <= addr_m;
			END IF;
			
			IF exception = '1' THEN
				-- The control unit has driven the intr signal to '1'
				-- So we have to handle an interruption
				-- The procedure is the following:
				--		S0 <- S7 	 (PSWold = PSWup)
				--		S1 <- PCup   (Store the return point)
				--		S2 <- 0x000 & exception cause (Black box)
				--		S3 <- MEM_addr
				--		PC <- S5		 (General handler code)
 				--		S7(1) <- '0' (Disable exceptions)
				-- Theoretically a process guarantees the order execution
				-- of the statements, though signals are going to be assigned
				-- once the process is finished...
				
				regs_sys(conv_integer(PSWold)) 	<= regs_sys(conv_integer(PSWup));
				regs_sys(conv_integer(PCret))		<= d; -- d must match PCup
				regs_sys(conv_integer(blackb))	<= X"000" & exception_cause;
				regs_sys(conv_integer(PSWup))		<= regs_sys(conv_integer(PSWup))(15 DOWNTO 2) & '0' & '1'; -- Disable interrupts and switch mode to SYS
			
			END IF;
			
		END IF;
	
	END PROCESS;
	
	a <= regs_sys(conv_integer(addr_a)) WHEN exception = '0' ELSE
	
		  regs_sys(conv_integer(RSG)); -- PC will be overwritten with this value when an interrupt is triggered
	
	intr_enabled <= regs_sys(conv_integer(PSWup))(1); -- Bit indicating if interrupts are enabled or not
	
	mode <= regs_sys(conv_integer(PSWup))(0); -- Indicates the execution mode; sys or user

END Structure;
	
--##############################################################################################################
--##############################################################################################################
--##############################################################################################################
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; 
USE ieee.numeric_std.all;  

ENTITY generalp_regfile IS
	PORT (
		 clk    		: IN  STD_LOGIC;
		 wrd		  	: IN  STD_LOGIC;
		 d     		: IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		 addr_a 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		 addr_b 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		 addr_d 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		 a      		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 b      		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END generalp_regfile;

ARCHITECTURE Structure OF generalp_regfile IS

	type register_set is array (7 downto 0) of std_logic_vector(15 downto 0); -- 8 registres de 16 bits cadascun
	
	SIGNAL regs_gp 	: register_set; -- General purpose registers
	
BEGIN

	PROCESS (clk) 
	BEGIN
	
		IF rising_edge(clk) THEN
		
			IF wrd = '1' THEN
				regs_gp(conv_integer(addr_d)) <= d; 
			END IF;
		
		END IF;
	
	END PROCESS;
	
	a <= regs_gp(conv_integer(addr_a)); 
	
	b <= regs_gp(conv_integer(addr_b));

END Structure;