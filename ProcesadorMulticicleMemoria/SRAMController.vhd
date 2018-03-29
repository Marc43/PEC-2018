library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

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
	
	TYPE states_t IS (IDLE_ST, RD_ST, WR_ST); 
	
	SIGNAL state : states_t := IDLE_ST;
	
	signal data_ext : std_logic_vector (15 downto 0);

begin

		estado: PROCESS (clk) -- Calculates the state to jump
		BEGIN
		
			IF rising_edge(clk) THEN
			
				CASE state IS
					WHEN IDLE_ST =>
						IF WR = '1' THEN
							state <= WR_ST;
						ELSE
							state <= RD_ST; 
						END IF;
					WHEN RD_ST =>
						state <= IDLE_ST;
					WHEN WR_ST =>
						state <= IDLE_ST;
				END CASE;
			END IF;
		END PROCESS;
		
		senyales: PROCESS (clk) -- Checks the actual state and assigns the signals for the jumping state
		BEGIN
		  
		  IF rising_edge(clk) THEN
		    
    		    CASE state IS
		        WHEN WR_ST | RD_ST => -- goes to IDLE (ensures that writes nor reads are performed)
		          SRAM_DQ <= "XXXXXXXXXXXXXXXX"; 
		          SRAM_OE_N <= '1'; -- Output not enabled 
		          SRAM_CE_N <= '1'; -- Chip input not enabled
		          SRAM_WE_N <= '1'; -- Write not enabled
		        WHEN IDLE_ST =>
		          IF WR = '0' THEN -- goes to RD
		             SRAM_OE_N <= '0';
		             SRAM_CE_N <= '0';
		             SRAM_UB_N <= '0'; 
		             SRAM_LB_N <= '0'; 
		          --ELSE THEN -- goes to WR
		            
		            -- TODO
		            
		          END IF;
		       END CASE;
		    END IF;
		  
		END PROCESS;
			
		SRAM_ADDR 	<= "00" & address;
		
		data_ext		<= X"11" & SRAM_DQ (7 downto 0) when SRAM_DQ (7) = '1' else
							X"00" & SRAM_DQ (7 downto 0);
							
		dataReaded	<= data_ext when state = RD_ST and byte_m = '1' else
							SRAM_DQ	when state = RD_ST and byte_m = '0' else
							SRAM_DQ;
		
		-- TODO, where is the readed data obtained????????? !!!!!•

end comportament;
