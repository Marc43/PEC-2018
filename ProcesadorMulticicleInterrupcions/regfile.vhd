LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; 
USE ieee.numeric_std.all;        

ENTITY regfile IS
    PORT (clk    		: IN  STD_LOGIC;
          wrd_gp  	: IN  STD_LOGIC;
			 wrd_sys		: IN	STD_LOGIC;
			 RD_SYS_GP	: IN 	STD_LOGIC;
			 intr			: IN  STD_LOGIC;
			 e_int		: IN  STD_LOGIC;
			 d_int		: IN  STD_LOGIC;
			 ret_int    : IN  STD_LOGIC;
          d     		: IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_a 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          a      		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          b      		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 intr_enabled : OUT STD_LOGIC
			 );
END regfile;

ARCHITECTURE Structure OF regfile IS

	type register_set is array (7 downto 0) of std_logic_vector(15 downto 0); -- 8 registres de 16 bits cadascun
	
	SIGNAL regs_gp 	: register_set; -- General purpose registers
	SIGNAL regs_sys 	: register_set := ((others => (others => '0'))); -- System registers
	
	CONSTANT PSWup 	: STD_LOGIC_VECTOR (2 DOWNTO 0) := "111";
	CONSTANT PSWold	: STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";	
BEGIN

	PROCESS (clk)
	BEGIN
	
		IF rising_edge(clk) THEN
			IF wrd_gp = '1' THEN
				regs_gp(conv_integer(addr_d)) <= d;
			ELSIF wrd_sys = '1' THEN
				IF e_int = '1' THEN
					-- EI
					regs_sys(conv_integer(PSWup)) <= regs_sys(conv_integer(PSWup))(15 DOWNTO 2) & '1' & regs_sys(conv_integer(PSWup))(0); -- Bit that indicates enabled/disabled interruptions
				ELSIF d_int = '1' THEN
					-- DI
					regs_sys(conv_integer(PSWup)) <= regs_sys(conv_integer(PSWup))(15 DOWNTO 2) & '0' & regs_sys(conv_integer(PSWup))(0);
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
		END IF;
	
	END PROCESS;
	
	a <= regs_gp(conv_integer(addr_a)) WHEN RD_SYS_GP = '0' ELSE
	
		  regs_sys(conv_integer(addr_a));
		  
	b <= regs_gp(conv_integer(addr_b));
	
	intr_enabled <= regs_sys(conv_integer(PSWup))(1); -- Bit indicating if interrupts are enabled or not

END Structure;
