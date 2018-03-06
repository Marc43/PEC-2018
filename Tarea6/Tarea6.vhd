LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
ENTITY Tarea6 IS
 PORT( KEY : IN std_logic_vector(0 downto 0);
 SW : IN std_logic_vector(0 downto 0);
 HEX0 : OUT std_logic_vector(6 downto 0);
 HEX1 : OUT std_logic_vector(6 downto 0);
 HEX2 : OUT std_logic_vector(6 downto 0);
 HEX3 : OUT std_logic_vector(6 downto 0);
 LEDR : OUT std_logic_vector(2 downto 0));
END Tarea6; 

ARCHITECTURE Structure OF Tarea6 IS
	 COMPONENT driver7Segmentos IS
	 PORT( codigoCaracter : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	 bitsCaracter : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	 END COMPONENT;
	 
	 SIGNAL cnt : STD_LOGIC_VECTOR(2 DOWNTO 0);
	 
BEGIN 

	visor0 : driver7Segmentos
	Port Map( codigoCaracter => cnt + 3,
 bitsCaracter => HEX0);
	visor1 : driver7Segmentos
	Port Map( codigoCaracter => cnt + 2,
 bitsCaracter => HEX1);
	visor2 : driver7Segmentos
	Port Map( codigoCaracter => cnt + 1,
 bitsCaracter => HEX2);
	visor3 : driver7Segmentos
	Port Map( codigoCaracter => cnt,
 bitsCaracter => HEX3);
 
	PROCESS (KEY) 
	BEGIN
		IF falling_edge(KEY(0)) THEN
			IF SW = "1" THEN
				cnt <= cnt - 1;
			ELSE 
				cnt <= cnt + 1;
			END IF;
		END IF;
	END PROCESS;
   
END Structure;