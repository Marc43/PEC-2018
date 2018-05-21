LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; 
USE ieee.numeric_std.all;        

ENTITY TLB IS

	PORT(
		clk: 			IN STD_LOGIC;
		vtag: 		IN STD_LOGIC_VECTOR(3 downto 0);
		ptag_wr:		IN STD_LOGIC_VECTOR(3 downto 0);
		vtag_wrd:	IN STD_LOGIC;
		ptag_wrd:	IN STD_LOGIC;
		boot:			IN STD_LOGIC; 
		valid_wr: 	IN STD_LOGIC;
		read_only_wr:		IN STD_LOGIC;
		wr_table_entry:	IN STD_LOGIC_VECTOR(3 downto 0);	
		
		ptag_rd:			OUT STD_LOGIC_VECTOR(3 downto 0);
		valid_rd:		OUT STD_LOGIC;
		read_only_rd:	OUT STD_LOGIC;
		hit:				OUT STD_LOGIC
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
				--Inicialitzar entrades TLB?
			ELSIF rising_edge(clk) THEN
				IF vtag_wrd = '1' THEN --Escriptura al TAG VIRTUAL
					vtags(CONV_INTEGER(wr_table_entry)) <= vtag;
				ELSIF ptag_wrd = '1' THEN--Escriptura al TAG FISIC		
					ptags(CONV_INTEGER(wr_table_entry)) <= valid_wr & read_only_wr & ptag_wr;
				ELSE	--Lectura
					valid_rd <= '0';
					read_only_rd <= '1';
					ptag_rd <= (others=>'0');
					hit <= '0';
					FOR i in 0 to TLB_SIZE -1 loop
						IF vtags(i) = vtag THEN
							hit <= '1';
							ptag_rd <= ptags(i)(3 DOWNTO 0);
							read_only_rd <= ptags(i)(4);
							valid_rd <= ptags(i)(5);
							exit;
						END IF;
					END LOOP;
				END IF;
			END IF;
		end process;
END Structure;