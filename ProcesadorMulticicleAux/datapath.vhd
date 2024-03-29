LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY datapath IS
	PORT (clk    : IN STD_LOGIC;
          op     : IN STD_LOGIC;
          wrd    : IN STD_LOGIC;
          addr_a : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          immed  : IN STD_LOGIC_VECTOR(15 DOWNTO 0));
END datapath;


ARCHITECTURE Structure OF datapath IS

    -- Aqui iria la declaracion de las entidades que vamos a usar
    -- Usaremos la palabra reservada COMPONENT ...
    -- Tambien crearemos los cables/buses (signals) necesarios para unir las entidades
	COMPONENT alu IS 
	PORT ( x  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          y  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          op : IN  STD_LOGIC;
          w  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT regfile IS
	PORT (clk    : IN  STD_LOGIC;
          wrd    : IN  STD_LOGIC;
          d      : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_a : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
          a      : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
	END COMPONENT;
	SIGNAL alu_out, regfile_out	: STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
	reg0 : regfile
	PORT MAP(
		clk 		=> clk,
		wrd 		=> wrd,
		addr_a 	=> addr_a,
		addr_d 	=> addr_d,
		d 			=> alu_out,
		a 			=> regfile_out
	);
	

	alu0 : alu
	PORT MAP(
		op 		=> op,
		x			=> regfile_out,
		y			=> immed,
		w			=> alu_out
	);
 
END Structure;