LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY proc IS
    PORT (boot     : IN  STD_LOGIC;
          clk      : IN  STD_LOGIC;
          datard_m : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          addr_m   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END proc;

ARCHITECTURE Structure OF proc IS

	 COMPONENT unidad_control IS
	 PORT(boot   : IN  STD_LOGIC;
         clk    : IN  STD_LOGIC;
         ir     : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
         op     : OUT STD_LOGIC;
         wrd    : OUT STD_LOGIC;
         addr_a : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         addr_d : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         immed  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
         pc     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
	 END COMPONENT;
	 
	 COMPONENT datapath IS
	 PORT(clk    : IN STD_LOGIC;
         op     : IN STD_LOGIC;
         wrd    : IN STD_LOGIC;
         addr_a : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         addr_d : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         immed  : IN STD_LOGIC_VECTOR(15 DOWNTO 0));
	 END COMPONENT;
	 
	 SIGNAL bus_op, bus_wrd							: STD_LOGIC;
	 SIGNAL bus_immed 								: STD_LOGIC_VECTOR(15 DOWNTO 0); 
	 SIGNAL bus_addr_a, bus_addr_d 				: STD_LOGIC_VECTOR(2 DOWNTO 0);
	 
BEGIN

	c0 : unidad_control
	PORT MAP (
		boot		=> boot,
		clk		=> clk,
		ir			=> datard_m,
		op			=> bus_op,
		wrd		=> bus_wrd,
		addr_a	=> bus_addr_a,
 		addr_d	=> bus_addr_d,
		immed		=> bus_immed,
		pc			=> addr_m
	);

	e0 : datapath
	PORT MAP (
		clk 		=> clk,
		op			=> bus_op,
		wrd		=> bus_wrd,
		addr_a	=> bus_addr_a,
		addr_d	=> bus_addr_d,
		immed		=>	bus_immed
	);
	
END Structure;