library ieee;
USE ieee.std_logic_1164.all;

entity multi is
    port(clk       : IN  STD_LOGIC;
         boot      : IN  STD_LOGIC;
         ldpc_l    : IN  STD_LOGIC;
         wrd_l     : IN  STD_LOGIC;
         wr_m_l    : IN  STD_LOGIC;
         w_b       : IN  STD_LOGIC;
         ldpc      : OUT STD_LOGIC;
         wrd       : OUT STD_LOGIC;
         wr_m      : OUT STD_LOGIC;
         ldir      : OUT STD_LOGIC;
         ins_dad   : OUT STD_LOGIC;
         word_byte : OUT STD_LOGIC);
end entity;

architecture Structure of multi is

TYPE states_t IS (IDLE, FETCH, DEMW);

SIGNAL state : states_t;

begin

	PROCESS (clk, boot)
	BEGIN
	
		IF boot = '1' THEN
		
			state <= IDLE;
			
		ELSIF rising_edge(clk) THEN
		
			CASE state IS
				WHEN IDLE 	=>
					IF boot = '0' THEN
						state <= FETCH; -- Boot edged to 0
					END IF;
				WHEN FETCH 	=>
				
					state <= DEMW;
				
				WHEN DEMW	=>
				
					state <= FETCH;
			END CASE;
			
		END IF;
		
	END PROCESS;
	
	PROCESS (state)
	BEGIN
		
		CASE state IS
			WHEN IDLE 	=>
			
					ldpc 	<= '0';
					wrd 	<= '0';
					wr_m	<=	'0';
					word_byte 	<= '0'; 
					ins_dad		<=	'0';
					ldir			<=	'0';
			
			WHEN FETCH 	=>
			
					ldpc	<= '0';
					wrd	<= '0';
					wr_m	<= '0';
					word_byte 	<= '0';
					ins_dad		<= '0'; -- MEM[PC]
					ldir			<= '1'; -- Copy to IR
			
			WHEN DEMW 	=>
				
					ldpc 	<= ldpc_l;
					wrd	<= wrd_l;
					wr_m	<= wr_m_l;
					word_byte 	<= w_b;
					ins_dad		<= '1'; -- To do stores from the ALU
					ldir			<=	'0';
			
		END CASE;
		
	END PROCESS;

end Structure;
