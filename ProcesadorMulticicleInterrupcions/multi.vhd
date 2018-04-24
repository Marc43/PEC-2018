library ieee;
USE ieee.std_logic_1164.all;

entity multi is
    port(clk       : IN  STD_LOGIC;
         boot      : IN  STD_LOGIC;
         ldpc_l    : IN  STD_LOGIC;
         wrd_gp_l  : IN  STD_LOGIC;
			wrd_sys_l : IN	 STD_LOGIC;
         wr_m_l    : IN  STD_LOGIC;
         w_b       : IN  STD_LOGIC;
			interrupt : IN  STD_LOGIC;
         ldpc      : OUT STD_LOGIC;
         wrd_gp    : OUT STD_LOGIC;
			wrd_sys	 : OUT STD_LOGIC;
         wr_m      : OUT STD_LOGIC;
         ldir      : OUT STD_LOGIC;
         ins_dad   : OUT STD_LOGIC;
         word_byte : OUT STD_LOGIC);
end entity;

architecture Structure of multi is

TYPE states_t IS (IDLE, FETCH, DEMW, SYSTEM);

SIGNAL state : states_t := IDLE;

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
					
					IF interrupt = '0' THEN
						state <= FETCH;
					ELSE
						state <= SYSTEM;
					END IF;
					
				WHEN SYSTEM	=>
					state <= FETCH;
					
			END CASE;
		
		END IF;
		
	END PROCESS;
	
	ldpc			<= ldpc_l		when state=DEMW OR 
											  state=SYSTEM else '0';
	
	wrd_sys		<= wrd_sys_l	when state=DEMW OR state=SYSTEM else '0';
	wrd_gp		<= wrd_gp_l 	when state=DEMW 	else '0';
	wr_m			<= wr_m_l 		when state=DEMW 	else '0';
	word_byte	<= w_b			when state=DEMW	else '0';
	ins_dad 		<=	'1'			when state=DEMW 	else '0';
	ldir 			<= '1'			when state=FETCH 	else '0';

end Structure;
