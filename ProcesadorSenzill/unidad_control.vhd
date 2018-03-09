LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;

ENTITY unidad_control IS
    PORT (boot   : IN  STD_LOGIC;
          clk    : IN  STD_LOGIC;
          ir     : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
          op     : OUT STD_LOGIC;
          wrd    : OUT STD_LOGIC;
          addr_a : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          addr_d : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
          immed  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
          pc     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END unidad_control;

ARCHITECTURE Structure OF unidad_control IS

    -- Aqui iria la declaracion de las entidades que vamos a usar
    -- Usaremos la palabra reservada COMPONENT ...
    -- Tambien crearemos los cables/buses (signals) necesarios para unir las entidades
    -- Aqui iria la definicion del program counter
	 
	 COMPONENT control_l IS
	 PORT(ir     : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
         op     : OUT STD_LOGIC;
         ldpc   : OUT STD_LOGIC;
         wrd    : OUT STD_LOGIC;
         addr_a : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         addr_d : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			immed  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
	 END COMPONENT;
	 
	 SIGNAL PC0 	: STD_LOGIC_VECTOR(15 DOWNTO 0); -- Program Counter
	 
	 SIGNAL ldpc0   : STD_LOGIC;
	 
BEGIN

	pc <= PC0;

	control_l0 : control_l
	PORT MAP (
		ir 		=> ir,
		op			=> op,
		ldpc		=> ldpc0,
		wrd		=> wrd,
		addr_a	=> addr_a,
		addr_d	=> addr_d,
		immed		=> immed
	);
	
	PROCESS (clk)
	BEGIN
		IF boot = '1' THEN
		
			PC0 <= X"C000";
			
		ELSIF rising_edge(clk) AND boot = '0' THEN
		
			IF ldpc0 = '1' THEN -- If the CPU is NOT HALTED, PC += 2
				PC0 <= PC0 + 2;
			END IF; 
			
		END IF;
		
	END PROCESS;

    -- Aqui iria la declaracion del "mapeo" (PORT MAP) de los nombres de las entradas/salidas de los componentes
    -- En los esquemas de la documentacion a la instancia de la logica de control le hemos llamado c0
    -- Aqui iria la definicion del comportamiento de la unidad de control y la gestion del PC

END Structure;