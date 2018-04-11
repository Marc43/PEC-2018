library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;


entity SRAMController is
    port (clk         : in    std_logic;
          SRAM_ADDR   : out   std_logic_vector(17 downto 0);
          SRAM_DQ     : inout std_logic_vector(15 downto 0);
          SRAM_UB_N   : out   std_logic;
          SRAM_LB_N   : out   std_logic;
          SRAM_CE_N   : out   std_logic := '1';
          SRAM_OE_N   : out   std_logic := '1';
          SRAM_WE_N   : out   std_logic := '1';
			 
          address     : in    std_logic_vector(15 downto 0) := "0000000000000000";
          dataReaded  : out   std_logic_vector(15 downto 0);
          dataToWrite : in    std_logic_vector(15 downto 0);
          WR          : in    std_logic;
          byte_m      : in    std_logic := '0');
end SRAMController;

architecture comportament of SRAMController is                 
	
	TYPE states_t IS (IDLE_ST, BRANCH_ST, RD_ST, WR_ST, RES_ST); --En RES_ST recogemos resultado/escribimos
	
	SIGNAL state : states_t := IDLE_ST;
	SIGNAL next_state : states_t := IDLE_ST;
	
	signal data_ext : std_logic_vector (15 downto 0);
	signal permiso_lectura	: std_logic;
	signal permiso_escritura: std_logic;

begin

		estado: PROCESS (clk) -- Calculates the state to jump
		BEGIN
			IF rising_edge(clk) THEN
				state <= next_state;
			END IF;
		END PROCESS;
		
		salidas: PROCESS (state) -- Checks the actual state and assigns the signals for the jumping state
		BEGIN
			CASE state IS
				WHEN IDLE_ST => -- outputs to IDLE (ensures that writes nor reads are performed)
					SRAM_OE_N <= '1'; -- Output not enabled 
					SRAM_CE_N <= '0'; -- Chip input not enabled
					SRAM_WE_N <= '1'; -- Write not enabled
					SRAM_LB_N <= '1';
					SRAM_UB_N <= '1';
					
					next_state <= BRANCH_ST;
					
				WHEN BRANCH_ST=>
					SRAM_CE_N <= '0';
					IF(WR = '0') THEN
						SRAM_DQ <= "ZZZZZZZZZZZZZZZZ";
						next_state <= RD_ST;
					ELSE
						SRAM_DQ <= dataToWrite;
						next_state <= WR_ST;
					END IF;
					
				WHEN RD_ST =>
				
					IF(byte_m = '1') THEN
						SRAM_LB_N <= address(0);
						SRAM_UB_N <= not address(0); --Si la direccion es par, addr(0) vale 0
					ELSE
						SRAM_UB_N 	<= '0'; 
						SRAM_LB_N 	<= '0';
					END IF;
					
					SRAM_OE_N 	<= '0';
					next_state	<= RES_ST;
					
				WHEN WR_ST =>-- goes to WR
					IF(byte_m = '1') THEN
						SRAM_LB_N <= address(0);
						SRAM_UB_N <= not address(0); --Si la direccion es par, addr(0) vale 0
					ELSE
						SRAM_UB_N 	<= '0'; 
						SRAM_LB_N 	<= '0';
					END IF;
					SRAM_WE_N <= '0';
					next_state <= RES_ST;
					
				WHEN RES_ST =>
					CASE WR IS 
						WHEN '0' => --lectura
							
							IF byte_m = '1' AND address(0) = '1' THEN
								data_ext <= STD_LOGIC_VECTOR(shift_right(signed(SRAM_DQ), 8));
							
							ELSIF byte_m = '1' AND address(0) = '0' THEN
								data_ext <= STD_LOGIC_VECTOR(resize(signed(data_ext(7 DOWNTO 0)), 16));
							ELSE
								data_ext <= SRAM_DQ;
							END IF;
						WHEN OTHERS => --escritura
					END CASE;
					next_state <= IDLE_ST;
			END CASE;
		END PROCESS;
		
		SRAM_ADDR 	<= "00" & std_logic_vector(shift_right(unsigned(address), 1));
		dataReaded	<= data_ext;
		
end comportament;
