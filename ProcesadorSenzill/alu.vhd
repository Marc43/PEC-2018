LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY alu IS
    PORT (x  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          y  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          op : IN  STD_LOGIC;
          w  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END alu;

ARCHITECTURE Structure OF alu IS
BEGIN

    -- Aqui iria la definicion del comportamiento de la ALU
	 WITH op SELECT --0 MOVI / 1 MOVHI
	 w <= y	WHEN '0',
			y(7 DOWNTO 0) & x(7 DOWNTO 0) WHEN others;

END Structure;