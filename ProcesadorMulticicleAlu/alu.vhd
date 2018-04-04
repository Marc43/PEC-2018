LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY alu IS
    PORT (x  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          y  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          op : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
          w  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END alu;

ARCHITECTURE Structure OF alu IS
	constant MOVI	: STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
	constant MOVHI	: STD_LOGIC_VECTOR(1 DOWNTO 0) := "01";
	constant ADD	: STD_LOGIC_VECTOR(1 DOWNTO 0) := "10";

BEGIN

    	 WITH op SELECT -- 00 MOVI | 01 MOVHI | 10 ADD
			w <= 	y WHEN MOVI,
					y(7 DOWNTO 0) & x(7 DOWNTO 0) WHEN MOVHI,
					x + y WHEN ADD,
					(others => 'X') WHEN others;

END Structure;