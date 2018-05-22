LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;        

ENTITY TLB IS

	PORT(
		clk: 			IN STD_LOGIC;
		vtag: 		IN STD_LOGIC_VECTOR(3 downto 0); --Tag Virtual a leer
		ptag_wr:		IN STD_LOGIC_VECTOR(3 downto 0);	--Tag Fisico a escribir
		vtag_wr:		IN STD_LOGIC_VECTOR(3 downto 0); --Tag Virtual a escribir
		vtag_wrd:	IN STD_LOGIC;	--Permiso de escritura del Tag Virtual
		ptag_wrd:	IN STD_LOGIC;	--Permiso de escritura del Tag Fisico
		boot:			IN STD_LOGIC; 	
		valid_wr: 	IN STD_LOGIC;	--Senyal de validez a escribir en el nuevo tag fisico
		read_only_wr:		IN STD_LOGIC; --Senyal de read_only a escribir en el nuevo tag fisico
		wr_table_entry:	IN STD_LOGIC_VECTOR(2 downto 0); --Entrada de la tabla a escribir
		flush:				IN STD_LOGIC; --Si hace falta flushear el TLB
		
		ptag_rd:			OUT STD_LOGIC_VECTOR(3 downto 0); --Tag Fisico eido del TLB
		valid_rd:		OUT STD_LOGIC;	--Senyal de validez del tag Fisico leido del TLB
		read_only_rd:	OUT STD_LOGIC;	--Senyal de read_only del tag Fisico leido del TLB
		hit:				OUT STD_LOGIC	--'1' si ha habido acierto de TLB, 0 si no
	);
	
END TLB;

ARCHITECTURE Structure of TLB IS
	CONSTANT TLB_SIZE : INTEGER := 8; --8 Entradas
	CONSTANT TLB_TAG_LENGTH : INTEGER := 4; --De 4 bits cada una
	
	type VTAG_MEM is array (TLB_SIZE-1 downto 0) of STD_LOGIC_VECTOR(TLB_TAG_LENGTH-1 DOWNTO 0);
	type PTAG_MEM is array (TLB_SIZE-1 downto 0) of STD_LOGIC_VECTOR(TLB_TAG_LENGTH+1 DOWNTO 0);

	SIGNAL vtags	: VTAG_MEM;
	SIGNAL ptags	: PTAG_MEM;
	--+1 because we need 2 extra bits
	--The format of the PTAG is 	5 4 3      2      1      0 		<bit>
	--										v r TAG(3) TAG(2) TAG(1) TAG(0)	<content>
	BEGIN
		
		Process(clk, boot) is 
		begin
			IF boot='1' THEN
				--Inicialitzar entrades TLB
				vtags(0) <= X"C";
				ptags(0) <= "11"& X"C";
				
				vtags(1) <= X"8";
				ptags(1) <= "10"&X"8";
				
			ELSIF rising_edge(clk) THEN
				IF flush='1' THEN
					ptags <= (others => (others => '0'));
					--No estoy seguro de esto de arriba. La documentacion no lo especifica mucho.
					--No se si deberia provocar misses de TLB o fallos de TLB. De la forma que esta
					--Ahora provocara fallos de TLB. Supongo que mal no esta. No sabia como cambiar
					--Solo el bit de validez de cada entrada asi que lo pongo todo a cero
					
				ELSIF vtag_wrd = '1' THEN --Escriptura al TAG VIRTUAL
					vtags(to_integer(unsigned(wr_table_entry))) <= vtag;
				ELSIF ptag_wrd = '1' THEN--Escriptura al TAG FISIC		
					ptags(to_integer(unsigned(wr_table_entry))) <= valid_wr & read_only_wr & ptag_wr;
				ELSE	--Lectura
					valid_rd <= '0';
					read_only_rd <= '1';
					ptag_rd <= (others=>'0');
					hit <= '0';
					FOR i in 0 to TLB_SIZE-1 loop
						IF vtags(i) = vtag THEN
							hit <= '1';
							ptag_rd <= ptags(i)(3 DOWNTO 0);
							read_only_rd <= ptags(i)(4);
							valid_rd <= ptags(i)(5);
							exit;
							--No he tret l'aigua clara de si l'exit es sintetitzable
						END IF;
					END LOOP;
				END IF;
			END IF;
		end process;
END Structure;