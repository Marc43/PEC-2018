library ieee;
USE ieee.std_logic_1164.all;

entity multi is
    port(clk       : IN  STD_LOGIC;
         boot      : IN  STD_LOGIC;
			in_d_l	 : IN  STD_LOGIC_VECTOR(1 downto 0);
			tknbr_l	 : IN  STD_LOGIC_VECTOR(1 downto 0);
			alu_op_l	 : IN	 STD_LOGIC_VECTOR(2 downto 0);
			rd_sys_gp_l : IN STD_LOGIC;
         ldpc_l    : IN  STD_LOGIC;
         wrd_gp_l  : IN  STD_LOGIC;
			wrd_sys_l : IN	 STD_LOGIC;
         wr_m_l    : IN  STD_LOGIC;
         w_b       : IN  STD_LOGIC;
			intr_l	 : IN  STD_LOGIC;
			intr_enabled : IN STD_LOGIC;
			intr		 : OUT STD_LOGIC;
			ldpc      : OUT STD_LOGIC;
         wrd_gp    : OUT STD_LOGIC;
			wrd_sys	 : OUT STD_LOGIC;
         wr_m      : OUT STD_LOGIC;
         ldir      : OUT STD_LOGIC;
         ins_dad   : OUT STD_LOGIC;
         word_byte : OUT STD_LOGIC;
			in_d		 : OUT STD_LOGIC_VECTOR (1 downto 0);
			tknbr		 : OUT STD_LOGIC_VECTOR (1 downto 0);
			alu_op	 : OUT STD_LOGIC_VECTOR (2 downto 0);
			rd_sys_gp : OUT STD_LOGIC);
end entity;

--tknbr, in_d and alu op are added to multi because when we enter the
--SYSTEM cycle the instruction that preceeded the cycle is the one that
--determines the output of control_l, we need to ensure that the S5 is loaded
--into the PC, and that the PCup is loaded into S1

architecture Structure of multi is

TYPE states_t IS (IDLE, FETCH, DEMW, SYSTEM);

SIGNAL state : states_t := IDLE;

begin

	PROCESS (clk, boot)
		variable interrupt 	: boolean := false;
		variable interrupt_e : boolean := false;
	BEGIN
	
		IF intr_l = '0' THEN
			interrupt := false;
		ELSE	
			interrupt := true;
		END IF;
		
		IF intr_enabled = '0' THEN
			interrupt_e := false;
		ELSE
			interrupt_e := true;
		END IF;
		
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
					
					IF NOT (interrupt AND interrupt_e) THEN
						state <= FETCH;
					ELSE
						state <= SYSTEM;
					END IF;
					
				WHEN SYSTEM	=>
					-- One or more SYSTEM cycles are executed 
					-- once an interruption is triggered
					state <= FETCH;
					
			END CASE;
		
		END IF;
		
	END PROCESS;
	
	ldpc			<= ldpc_l		when state=DEMW else '0';
	
	wrd_sys		<= wrd_sys_l	when state=DEMW   else 
						'1'			when state=SYSTEM else -- Really not necessary, those writes are pretty hardcoded...
						'0';
						
	wrd_gp		<= wrd_gp_l 	when state=DEMW 	else '0';
	wr_m			<= wr_m_l 		when state=DEMW 	else '0';
	word_byte	<= w_b			when state=DEMW	else '0';
	ins_dad 		<=	'1'			when state=DEMW 	else '0';
	in_d			<= in_d_l		when state=DEMW	else "10";  -- "10" is the value to take pcup and drive it to 'd'
	tknbr			<= tknbr_l		when state=DEMW	else "10";  -- "10" is the value to write a register value into the PC
	alu_op		<= alu_op_l		when state=DEMW	else "100"; -- "100" is the alu operation BYPASSX, useful to bypass a value from the regfile
	rd_sys_gp	<= rd_sys_gp_l when state=DEMW	else '1';	-- '1' indicates reading from sys regfile 
	ldir 			<= '1'			when state=FETCH 	else '0';
	
	intr		 	<= '1' when state=SYSTEM else '0'; -- Check...
	
	-- multi only changes the signal intr to tell every other module
	-- to execute the procedure so at the end of the cycle we can do
	-- the fetch of the RSG correctly

end Structure;
