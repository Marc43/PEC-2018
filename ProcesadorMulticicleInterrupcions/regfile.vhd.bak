LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; 
USE ieee.numeric_std.all;        

ENTITY regfile IS
    PORT (clk    		: IN  STD_LOGIC;
          wrd_gp  	: IN  STD_LOGIC;
			 wrd_sys		: IN	STD_LOGIC;
			 RD_SYS_GP	: IN 	STD_LOGIC;
          d     		: IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_a 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d 		: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          a      		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          b      		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END regfile;

ARCHITECTURE Structure OF regfile IS

	type register_set is array (7 downto 0) of std_logic_vector(15 downto 0); -- 8 registres de 16 bits cadascun
	
	SIGNAL regs_gp 	: register_set; -- General purpose registers
	SIGNAL regs_sys 	: register_set; -- System registers
	
BEGIN

	PROCESS (clk)
	BEGIN
	
		IF rising_edge(clk) THEN
			IF wrd_gp = '1' THEN
				regs_gp(conv_integer(addr_d)) <= d;
			ELSIF wrd_sys = '1' THEN
				regs_sys(conv_integer(addr_d)) <= d;
			END IF;
		END IF;
	
	END PROCESS;
	
	a <= regs_gp(conv_integer(addr_a)) WHEN RD_SYS_GP = '0' ELSE
		  regs_sys(conv_integer(addr_a));
		  
	b <= regs_gp(conv_integer(addr_b));

END Structure;