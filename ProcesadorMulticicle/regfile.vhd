LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; --Esta libreria sera necesaria si usais conversiones CONV_INTEGER
USE ieee.numeric_std.all;        --Esta libreria sera necesaria si usais conversiones TO_INTEGER

ENTITY regfile IS
    PORT (clk    : IN  STD_LOGIC;
          wrd    : IN  STD_LOGIC;
          d      : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_a : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_b : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          a      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          b      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END regfile;

ARCHITECTURE Structure OF regfile IS
	type register_set is array (7 downto 0) of std_logic_vector(15 downto 0); -- 8 registres de 16 bits cadascun
	
	SIGNAL regs : register_set;
BEGIN

	PROCESS (clk)
	BEGIN
	
		IF rising_edge(clk) AND wrd = '1' THEN
			regs(conv_integer(addr_d)) <= d;
		END IF;
	
	END PROCESS;
	
	a <= regs(conv_integer(addr_a)); -- El valor de sortida (lectura) es sempre el registre indicat
	b <= regs(conv_integer(addr_b));


END Structure;