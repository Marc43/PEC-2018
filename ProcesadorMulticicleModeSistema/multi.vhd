library ieee;
USE ieee.std_logic_1164.all;

entity multi is
    port(clk       : IN  STD_LOGIC;
         boot      : IN  STD_LOGIC;
			mode		 : IN	 STD_LOGIC;
			in_d_l	 : IN  STD_LOGIC_VECTOR(2 downto 0);
			tknbr_l	 : IN  STD_LOGIC_VECTOR(1 downto 0);
			alu_op_l	 : IN	 STD_LOGIC_VECTOR(2 downto 0);
			rd_sys_gp_l : IN STD_LOGIC;
         ldpc_l    : IN  STD_LOGIC;
         wrd_gp_l  : IN  STD_LOGIC;
			wrd_sys_l : IN	 STD_LOGIC;
         wr_m_l    : IN  STD_LOGIC;
         w_b       : IN  STD_LOGIC;
			exception_l	 : IN  STD_LOGIC;
			inta_l	 : IN  STD_LOGIC;
			calls_instr_l : IN STD_LOGIC;
			e_int_l	 : IN	 STD_LOGIC;
			d_int_l	 : IN  STD_LOGIC;
			ret_int_l : IN  STD_LOGIC;
			mem_instr_l	: OUT STD_LOGIC;
			exception		 : OUT STD_LOGIC;
			ldpc      : OUT STD_LOGIC;
         wrd_gp    : OUT STD_LOGIC;
			wrd_sys	 : OUT STD_LOGIC;
         wr_m      : OUT STD_LOGIC;
         ldir      : OUT STD_LOGIC;
         ins_dad   : OUT STD_LOGIC;
         word_byte : OUT STD_LOGIC;
			in_d		 : OUT STD_LOGIC_VECTOR (2 downto 0);
			tknbr		 : OUT STD_LOGIC_VECTOR (1 downto 0);
			alu_op	 : OUT STD_LOGIC_VECTOR (2 downto 0);
			rd_sys_gp : OUT STD_LOGIC;
			inta		 : OUT STD_LOGIC;
			calls_instr : OUT STD_LOGIC;
			e_int		 : OUT STD_LOGIC;
			d_int		 : OUT STD_LOGIC;
			ret_int	 : OUT STD_LOGIC;
			mem_instr	: OUT STD_LOGIC
			);
end entity;

--tknbr, in_d and alu op are added to multi because when we enter the
--SYSTEM cycle the instruction that preceeded the cycle is the one that
--determines the output of control_l, we need to ensure that the S5 is loaded
--into the PC, and that the PCup is loaded into S1

architecture Structure of multi is

TYPE states_t IS (FETCH, DEMW, SYSTEM);

SIGNAL state : states_t := FETCH;

-- Execution Modes
CONSTANT USER_MODE : STD_LOGIC := '0';
CONSTANT SYSTEM_MODE : STD_LOGIC := '1';

SIGNAL bus_calls_instr : STD_LOGIC := '0';

begin

	PROCESS (clk, boot)
	BEGIN
		
		IF boot = '1' THEN
			state <= FETCH;
		else
			state <= state;
			IF rising_edge(clk) THEN
				if state = FETCH then
					state <= DEMW;
				else
					if state = DEMW and (exception_l='1') then
						state <= SYSTEM;
					else
						state <= FETCH;
					end if;
				end if;
			end if;
		end if;
				
	END PROCESS;
	
	ldpc			<= ldpc_l		when state=DEMW or state=SYSTEM else '0';
	
	wrd_sys		<= wrd_sys_l	when state=DEMW AND (exception_l = '0' OR bus_calls_instr = '1') else -- Enable writing when calls_instr = '1' 

						'0';
						
	wrd_gp		<= wrd_gp_l 	when state=DEMW AND exception_l = '0' else '0';
	wr_m			<= wr_m_l 		when state=DEMW AND exception_l = '0' else '0';
	word_byte	<= w_b			when state=DEMW	else '0';
	ins_dad 		<=	'1'			when state=DEMW 	else '0'; -- This will make SYSTEM to load instructions
																			 -- overwriting contents in bus_ir 
	in_d			<= "100"			when state=SYSTEM else 
						in_d_l;  -- "100" is the value to take pcup and drive it to 'd'
						
	tknbr			<= "10"			when state=SYSTEM	else 		-- "10" is the value to write a register value into the PC
	
						"00"			when ret_int_l = '1' AND mode=USER_MODE else  -- "00" is the value to write PC+2 into PC, we avoid retint doing bad stuff
						
						tknbr_l;  
	
	alu_op		<= "100"			when state=SYSTEM	else 
						alu_op_l		when state=DEMW; -- "100" is the alu operation BYPASSX, useful to bypass a value from the regfile
						
	rd_sys_gp	<= '1' 			when state=SYSTEM	else
						rd_sys_gp_l;	-- '1' indicates reading from sys regfile 
						
	ldir 			<= '1'			when state=FETCH 	else '0';
	
	exception	<= '1' 			when state=SYSTEM else '0'; -- Check...
	
	inta			<= inta_l;		--when state=DEMW	else '0';
	
	bus_calls_instr <= calls_instr_l WHEN state=DEMW AND mode=USER_MODE else '0'; 
	
	-- multi only changes the signal exception to tell every other module
	-- to execute the procedure so at the end of the cycle we can do
	-- the fetch of the RSG correctly
	
	e_int 	<=   e_int_l WHEN state=DEMW AND mode=SYSTEM_MODE else '0'; 
	
	d_int 	<=   d_int_l WHEN state=DEMW AND mode=SYSTEM_MODE else '0';
	
	ret_int 	<= ret_int_l WHEN state=DEMW AND mode=SYSTEM_MODE else '0';
	
	calls_instr <= bus_calls_instr;

end Structure;
