library ieee;
use ieee.std_logic_1164.all;

entity test_mem is
end test_mem;

architecture comportament of test_mem is
  
  component SRAMController is
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
  end component;
  
  signal clk    : std_logic := '0';
  signal addr   : STD_LOGIC_VECTOR (15 downto 0);
  signal dataRD : std_logic_vector (15 downto 0);
  signal byte   : std_logic;
  signal wri    : std_logic := '0';
  signal dataWR : std_logic_vector (15 downto 0); 
  
begin
  
  controller0 : SRAMController
  port map (
    clk => clk,
    address => addr,
    dataReaded => dataRD,
    WR  => wri,
    byte_m => byte,
    dataToWrite => dataWR
  );
  
  wri 	<= not wri after 5 ns; 
  clk 	<= not clk after 10 ns;
  
end comportament;