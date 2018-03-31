-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "03/31/2018 18:29:27"

-- 
-- Device: Altera EP2C20F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	SRAMController IS
    PORT (
	clk : IN std_logic;
	SRAM_ADDR : OUT std_logic_vector(17 DOWNTO 0);
	SRAM_DQ : INOUT std_logic_vector(15 DOWNTO 0);
	SRAM_UB_N : OUT std_logic;
	SRAM_LB_N : OUT std_logic;
	SRAM_CE_N : OUT std_logic;
	SRAM_OE_N : OUT std_logic;
	SRAM_WE_N : OUT std_logic;
	address : IN std_logic_vector(15 DOWNTO 0);
	dataReaded : OUT std_logic_vector(15 DOWNTO 0);
	dataToWrite : IN std_logic_vector(15 DOWNTO 0);
	WR : IN std_logic;
	byte_m : IN std_logic
	);
END SRAMController;

-- Design Ports Information
-- SRAM_DQ[0]	=>  Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[1]	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[2]	=>  Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[3]	=>  Location: PIN_H9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[4]	=>  Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[5]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[6]	=>  Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[7]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[8]	=>  Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[9]	=>  Location: PIN_E9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[10]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[11]	=>  Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[12]	=>  Location: PIN_H10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[13]	=>  Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[14]	=>  Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_DQ[15]	=>  Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[0]	=>  Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[1]	=>  Location: PIN_J19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[2]	=>  Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[3]	=>  Location: PIN_E18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[4]	=>  Location: PIN_AA12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[5]	=>  Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[6]	=>  Location: PIN_W5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[7]	=>  Location: PIN_AB5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[8]	=>  Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[9]	=>  Location: PIN_Y5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[10]	=>  Location: PIN_E19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[11]	=>  Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[12]	=>  Location: PIN_V4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[13]	=>  Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[14]	=>  Location: PIN_J18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[15]	=>  Location: PIN_N6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[16]	=>  Location: PIN_U15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_ADDR[17]	=>  Location: PIN_AA8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_UB_N	=>  Location: PIN_M6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_LB_N	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_CE_N	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_OE_N	=>  Location: PIN_M5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SRAM_WE_N	=>  Location: PIN_AB14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[0]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[1]	=>  Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[2]	=>  Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[3]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[4]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[5]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[6]	=>  Location: PIN_A16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[7]	=>  Location: PIN_A15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[8]	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[9]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[10]	=>  Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[11]	=>  Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[12]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[13]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[14]	=>  Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dataReaded[15]	=>  Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- address[0]	=>  Location: PIN_L21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[1]	=>  Location: PIN_L22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[2]	=>  Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[3]	=>  Location: PIN_D20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[4]	=>  Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[5]	=>  Location: PIN_AB4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[6]	=>  Location: PIN_AA4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[7]	=>  Location: PIN_AA5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[8]	=>  Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[9]	=>  Location: PIN_Y6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[10]	=>  Location: PIN_D19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[11]	=>  Location: PIN_U21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[12]	=>  Location: PIN_AA3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[13]	=>  Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[14]	=>  Location: PIN_K20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- address[15]	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- byte_m	=>  Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- WR	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[0]	=>  Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[1]	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[2]	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[3]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[4]	=>  Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[5]	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[6]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[7]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[8]	=>  Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[9]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[10]	=>  Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[11]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[12]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[13]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[14]	=>  Location: PIN_H14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- dataToWrite[15]	=>  Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF SRAMController IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_SRAM_ADDR : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_SRAM_UB_N : std_logic;
SIGNAL ww_SRAM_LB_N : std_logic;
SIGNAL ww_SRAM_CE_N : std_logic;
SIGNAL ww_SRAM_OE_N : std_logic;
SIGNAL ww_SRAM_WE_N : std_logic;
SIGNAL ww_address : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_dataReaded : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_dataToWrite : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_WR : std_logic;
SIGNAL ww_byte_m : std_logic;
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data_ext[15]~1clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SRAM_DQ~32clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \state.IDLE_ST~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SRAM_UB_N~2clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \SRAM_DQ[0]~0\ : std_logic;
SIGNAL \SRAM_DQ[1]~1\ : std_logic;
SIGNAL \SRAM_DQ[2]~2\ : std_logic;
SIGNAL \SRAM_DQ[3]~3\ : std_logic;
SIGNAL \SRAM_DQ[4]~4\ : std_logic;
SIGNAL \SRAM_DQ[5]~5\ : std_logic;
SIGNAL \SRAM_DQ[6]~6\ : std_logic;
SIGNAL \SRAM_DQ[7]~7\ : std_logic;
SIGNAL \SRAM_DQ[8]~8\ : std_logic;
SIGNAL \SRAM_DQ[9]~9\ : std_logic;
SIGNAL \SRAM_DQ[10]~10\ : std_logic;
SIGNAL \SRAM_DQ[11]~11\ : std_logic;
SIGNAL \SRAM_DQ[12]~12\ : std_logic;
SIGNAL \SRAM_DQ[13]~13\ : std_logic;
SIGNAL \SRAM_DQ[14]~14\ : std_logic;
SIGNAL \SRAM_DQ[15]~15\ : std_logic;
SIGNAL \state.RES_ST~0_combout\ : std_logic;
SIGNAL \state.RES_ST~regout\ : std_logic;
SIGNAL \state.IDLE_ST~0_combout\ : std_logic;
SIGNAL \state.IDLE_ST~regout\ : std_logic;
SIGNAL \SRAM_DQ~32_combout\ : std_logic;
SIGNAL \SRAM_DQ~32clkctrl_outclk\ : std_logic;
SIGNAL \SRAM_DQ[0]$latch~combout\ : std_logic;
SIGNAL \WR~combout\ : std_logic;
SIGNAL \next_state.RD_ST~0_combout\ : std_logic;
SIGNAL \state.RD_ST~regout\ : std_logic;
SIGNAL \SRAM_DQ[0]_418~combout\ : std_logic;
SIGNAL \SRAM_DQ[1]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[2]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[3]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[4]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[5]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[6]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[7]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[8]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[9]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[10]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[11]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[12]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[13]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[14]$latch~combout\ : std_logic;
SIGNAL \SRAM_DQ[15]$latch~combout\ : std_logic;
SIGNAL \state.IDLE_ST~clkctrl_outclk\ : std_logic;
SIGNAL \SRAM_ADDR[0]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[1]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[2]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[3]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[4]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[5]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[6]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[7]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[8]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[9]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[10]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[11]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[12]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[13]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[14]$latch~combout\ : std_logic;
SIGNAL \SRAM_ADDR[15]$latch~combout\ : std_logic;
SIGNAL \next_state.WR_ST~0_combout\ : std_logic;
SIGNAL \state.WR_ST~regout\ : std_logic;
SIGNAL \SRAM_UB_N~2_combout\ : std_logic;
SIGNAL \SRAM_UB_N~2clkctrl_outclk\ : std_logic;
SIGNAL \byte_m~combout\ : std_logic;
SIGNAL \Selector18~0_combout\ : std_logic;
SIGNAL \SRAM_UB_N$latch~combout\ : std_logic;
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \SRAM_LB_N$latch~combout\ : std_logic;
SIGNAL \SRAM_CE_N$latch~combout\ : std_logic;
SIGNAL \data_ext~0_combout\ : std_logic;
SIGNAL \data_ext[15]~1_combout\ : std_logic;
SIGNAL \data_ext[15]~1clkctrl_outclk\ : std_logic;
SIGNAL \data_ext~2_combout\ : std_logic;
SIGNAL \data_ext~3_combout\ : std_logic;
SIGNAL \data_ext~4_combout\ : std_logic;
SIGNAL \data_ext~5_combout\ : std_logic;
SIGNAL \data_ext~6_combout\ : std_logic;
SIGNAL \data_ext~7_combout\ : std_logic;
SIGNAL \data_ext~8_combout\ : std_logic;
SIGNAL \data_ext~9_combout\ : std_logic;
SIGNAL \data_ext~10_combout\ : std_logic;
SIGNAL \data_ext~11_combout\ : std_logic;
SIGNAL \data_ext~12_combout\ : std_logic;
SIGNAL \data_ext~13_combout\ : std_logic;
SIGNAL \data_ext~14_combout\ : std_logic;
SIGNAL \data_ext~15_combout\ : std_logic;
SIGNAL \dataToWrite~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \address~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL data_ext : std_logic_vector(15 DOWNTO 0);

BEGIN

ww_clk <= clk;
SRAM_ADDR <= ww_SRAM_ADDR;
SRAM_UB_N <= ww_SRAM_UB_N;
SRAM_LB_N <= ww_SRAM_LB_N;
SRAM_CE_N <= ww_SRAM_CE_N;
SRAM_OE_N <= ww_SRAM_OE_N;
SRAM_WE_N <= ww_SRAM_WE_N;
ww_address <= address;
dataReaded <= ww_dataReaded;
ww_dataToWrite <= dataToWrite;
ww_WR <= WR;
ww_byte_m <= byte_m;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\data_ext[15]~1clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \data_ext[15]~1_combout\);

\SRAM_DQ~32clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \SRAM_DQ~32_combout\);

\state.IDLE_ST~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \state.IDLE_ST~regout\);

\SRAM_UB_N~2clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \SRAM_UB_N~2_combout\);

-- Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G3
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[0]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(0),
	combout => \SRAM_DQ[0]~0\);

-- Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[1]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(1),
	combout => \SRAM_DQ[1]~1\);

-- Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[2]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(2),
	combout => \SRAM_DQ[2]~2\);

-- Location: PIN_H9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[3]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(3),
	combout => \SRAM_DQ[3]~3\);

-- Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[4]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(4),
	combout => \SRAM_DQ[4]~4\);

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[5]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(5),
	combout => \SRAM_DQ[5]~5\);

-- Location: PIN_F10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[6]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(6),
	combout => \SRAM_DQ[6]~6\);

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[7]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(7),
	combout => \SRAM_DQ[7]~7\);

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[8]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(8),
	combout => \SRAM_DQ[8]~8\);

-- Location: PIN_E9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[9]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(9),
	combout => \SRAM_DQ[9]~9\);

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[10]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(10),
	combout => \SRAM_DQ[10]~10\);

-- Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[11]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(11),
	combout => \SRAM_DQ[11]~11\);

-- Location: PIN_H10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[12]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(12),
	combout => \SRAM_DQ[12]~12\);

-- Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[13]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(13),
	combout => \SRAM_DQ[13]~13\);

-- Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[14]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(14),
	combout => \SRAM_DQ[14]~14\);

-- Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_DQ[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_DQ[15]$latch~combout\,
	oe => \SRAM_DQ[0]_418~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => SRAM_DQ(15),
	combout => \SRAM_DQ[15]~15\);

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(0),
	combout => \dataToWrite~combout\(0));

-- Location: LCCOMB_X1_Y13_N28
\state.RES_ST~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \state.RES_ST~0_combout\ = !\SRAM_DQ~32_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SRAM_DQ~32_combout\,
	combout => \state.RES_ST~0_combout\);

-- Location: LCFF_X1_Y13_N29
\state.RES_ST\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \state.RES_ST~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.RES_ST~regout\);

-- Location: LCCOMB_X1_Y13_N10
\state.IDLE_ST~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \state.IDLE_ST~0_combout\ = !\state.RES_ST~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \state.RES_ST~regout\,
	combout => \state.IDLE_ST~0_combout\);

-- Location: LCFF_X1_Y13_N11
\state.IDLE_ST\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \state.IDLE_ST~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.IDLE_ST~regout\);

-- Location: LCCOMB_X1_Y13_N18
\SRAM_DQ~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ~32_combout\ = (\state.RES_ST~regout\) # (!\state.IDLE_ST~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.RES_ST~regout\,
	datad => \state.IDLE_ST~regout\,
	combout => \SRAM_DQ~32_combout\);

-- Location: CLKCTRL_G2
\SRAM_DQ~32clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \SRAM_DQ~32clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \SRAM_DQ~32clkctrl_outclk\);

-- Location: LCCOMB_X44_Y26_N20
\SRAM_DQ[0]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[0]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[0]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dataToWrite~combout\(0),
	datac => \SRAM_DQ[0]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[0]$latch~combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\WR~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_WR,
	combout => \WR~combout\);

-- Location: LCCOMB_X1_Y13_N0
\next_state.RD_ST~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \next_state.RD_ST~0_combout\ = (!\WR~combout\ & !\state.IDLE_ST~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \WR~combout\,
	datad => \state.IDLE_ST~regout\,
	combout => \next_state.RD_ST~0_combout\);

-- Location: LCFF_X1_Y13_N1
\state.RD_ST\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \next_state.RD_ST~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.RD_ST~regout\);

-- Location: LCCOMB_X1_Y13_N30
\SRAM_DQ[0]_418\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[0]_418~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\SRAM_DQ[0]_418~combout\)) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((!\state.RD_ST~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SRAM_DQ[0]_418~combout\,
	datac => \SRAM_DQ~32clkctrl_outclk\,
	datad => \state.RD_ST~regout\,
	combout => \SRAM_DQ[0]_418~combout\);

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(1),
	combout => \dataToWrite~combout\(1));

-- Location: LCCOMB_X15_Y26_N16
\SRAM_DQ[1]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[1]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[1]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dataToWrite~combout\(1),
	datac => \SRAM_DQ[1]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[1]$latch~combout\);

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(2),
	combout => \dataToWrite~combout\(2));

-- Location: LCCOMB_X39_Y26_N20
\SRAM_DQ[2]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[2]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[2]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dataToWrite~combout\(2),
	datac => \SRAM_DQ[2]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[2]$latch~combout\);

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(3),
	combout => \dataToWrite~combout\(3));

-- Location: LCCOMB_X15_Y26_N14
\SRAM_DQ[3]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[3]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[3]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dataToWrite~combout\(3),
	datac => \SRAM_DQ[3]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[3]$latch~combout\);

-- Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(4),
	combout => \dataToWrite~combout\(4));

-- Location: LCCOMB_X39_Y26_N14
\SRAM_DQ[4]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[4]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[4]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dataToWrite~combout\(4),
	datac => \SRAM_DQ[4]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[4]$latch~combout\);

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(5),
	combout => \dataToWrite~combout\(5));

-- Location: LCCOMB_X20_Y26_N16
\SRAM_DQ[5]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[5]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[5]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dataToWrite~combout\(5),
	datac => \SRAM_DQ[5]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[5]$latch~combout\);

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(6),
	combout => \dataToWrite~combout\(6));

-- Location: LCCOMB_X19_Y26_N16
\SRAM_DQ[6]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[6]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[6]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dataToWrite~combout\(6),
	datac => \SRAM_DQ[6]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[6]$latch~combout\);

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(7),
	combout => \dataToWrite~combout\(7));

-- Location: LCCOMB_X22_Y26_N16
\SRAM_DQ[7]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[7]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[7]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dataToWrite~combout\(7),
	datac => \SRAM_DQ[7]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[7]$latch~combout\);

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(8),
	combout => \dataToWrite~combout\(8));

-- Location: LCCOMB_X39_Y26_N24
\SRAM_DQ[8]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[8]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[8]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dataToWrite~combout\(8),
	datac => \SRAM_DQ[8]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[8]$latch~combout\);

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(9),
	combout => \dataToWrite~combout\(9));

-- Location: LCCOMB_X15_Y26_N20
\SRAM_DQ[9]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[9]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[9]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dataToWrite~combout\(9),
	datac => \SRAM_DQ[9]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[9]$latch~combout\);

-- Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(10),
	combout => \dataToWrite~combout\(10));

-- Location: LCCOMB_X19_Y26_N14
\SRAM_DQ[10]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[10]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[10]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dataToWrite~combout\(10),
	datac => \SRAM_DQ[10]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[10]$latch~combout\);

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(11),
	combout => \dataToWrite~combout\(11));

-- Location: LCCOMB_X22_Y26_N14
\SRAM_DQ[11]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[11]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[11]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dataToWrite~combout\(11),
	datac => \SRAM_DQ[11]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[11]$latch~combout\);

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(12),
	combout => \dataToWrite~combout\(12));

-- Location: LCCOMB_X15_Y26_N22
\SRAM_DQ[12]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[12]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\SRAM_DQ[12]$latch~combout\)) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\dataToWrite~combout\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SRAM_DQ[12]$latch~combout\,
	datac => \dataToWrite~combout\(12),
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[12]$latch~combout\);

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(13),
	combout => \dataToWrite~combout\(13));

-- Location: LCCOMB_X39_Y26_N6
\SRAM_DQ[13]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[13]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\SRAM_DQ[13]$latch~combout\)) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\dataToWrite~combout\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SRAM_DQ[13]$latch~combout\,
	datab => \dataToWrite~combout\(13),
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[13]$latch~combout\);

-- Location: PIN_H14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(14),
	combout => \dataToWrite~combout\(14));

-- Location: LCCOMB_X42_Y26_N14
\SRAM_DQ[14]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[14]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[14]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dataToWrite~combout\(14),
	datac => \SRAM_DQ[14]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[14]$latch~combout\);

-- Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\dataToWrite[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_dataToWrite(15),
	combout => \dataToWrite~combout\(15));

-- Location: LCCOMB_X43_Y26_N16
\SRAM_DQ[15]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_DQ[15]$latch~combout\ = (GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & ((\SRAM_DQ[15]$latch~combout\))) # (!GLOBAL(\SRAM_DQ~32clkctrl_outclk\) & (\dataToWrite~combout\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dataToWrite~combout\(15),
	datac => \SRAM_DQ[15]$latch~combout\,
	datad => \SRAM_DQ~32clkctrl_outclk\,
	combout => \SRAM_DQ[15]$latch~combout\);

-- Location: PIN_L21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(0),
	combout => \address~combout\(0));

-- Location: CLKCTRL_G1
\state.IDLE_ST~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \state.IDLE_ST~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \state.IDLE_ST~clkctrl_outclk\);

-- Location: LCCOMB_X1_Y13_N20
\SRAM_ADDR[0]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[0]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[0]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(0),
	datac => \SRAM_ADDR[0]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[0]$latch~combout\);

-- Location: PIN_L22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(1),
	combout => \address~combout\(1));

-- Location: LCCOMB_X49_Y17_N20
\SRAM_ADDR[1]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[1]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[1]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(1),
	datac => \SRAM_ADDR[1]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[1]$latch~combout\);

-- Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(2),
	combout => \address~combout\(2));

-- Location: LCCOMB_X1_Y25_N16
\SRAM_ADDR[2]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[2]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[2]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(2),
	datac => \SRAM_ADDR[2]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[2]$latch~combout\);

-- Location: PIN_D20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(3),
	combout => \address~combout\(3));

-- Location: LCCOMB_X49_Y25_N20
\SRAM_ADDR[3]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[3]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[3]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(3),
	datac => \SRAM_ADDR[3]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[3]$latch~combout\);

-- Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(4),
	combout => \address~combout\(4));

-- Location: LCCOMB_X29_Y1_N16
\SRAM_ADDR[4]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[4]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[4]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(4),
	datac => \SRAM_ADDR[4]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[4]$latch~combout\);

-- Location: PIN_AB4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(5),
	combout => \address~combout\(5));

-- Location: LCCOMB_X1_Y1_N20
\SRAM_ADDR[5]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[5]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[5]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(5),
	datac => \SRAM_ADDR[5]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[5]$latch~combout\);

-- Location: PIN_AA4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(6),
	combout => \address~combout\(6));

-- Location: LCCOMB_X1_Y1_N14
\SRAM_ADDR[6]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[6]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[6]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(6),
	datac => \SRAM_ADDR[6]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[6]$latch~combout\);

-- Location: PIN_AA5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(7),
	combout => \address~combout\(7));

-- Location: LCCOMB_X4_Y1_N20
\SRAM_ADDR[7]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[7]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[7]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(7),
	datac => \SRAM_ADDR[7]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[7]$latch~combout\);

-- Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(8),
	combout => \address~combout\(8));

-- Location: LCCOMB_X2_Y25_N16
\SRAM_ADDR[8]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[8]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[8]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(8),
	datac => \SRAM_ADDR[8]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[8]$latch~combout\);

-- Location: PIN_Y6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(9),
	combout => \address~combout\(9));

-- Location: LCCOMB_X3_Y1_N20
\SRAM_ADDR[9]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[9]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[9]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(9),
	datac => \SRAM_ADDR[9]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[9]$latch~combout\);

-- Location: PIN_D19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(10),
	combout => \address~combout\(10));

-- Location: LCCOMB_X49_Y25_N14
\SRAM_ADDR[10]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[10]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[10]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(10),
	datac => \SRAM_ADDR[10]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[10]$latch~combout\);

-- Location: PIN_U21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(11),
	combout => \address~combout\(11));

-- Location: LCCOMB_X49_Y7_N4
\SRAM_ADDR[11]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[11]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[11]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(11),
	datac => \SRAM_ADDR[11]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[11]$latch~combout\);

-- Location: PIN_AA3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(12),
	combout => \address~combout\(12));

-- Location: LCCOMB_X1_Y1_N24
\SRAM_ADDR[12]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[12]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[12]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(12),
	datac => \SRAM_ADDR[12]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[12]$latch~combout\);

-- Location: PIN_G7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(13),
	combout => \address~combout\(13));

-- Location: LCCOMB_X5_Y25_N16
\SRAM_ADDR[13]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[13]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[13]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(13),
	datac => \SRAM_ADDR[13]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[13]$latch~combout\);

-- Location: PIN_K20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(14),
	combout => \address~combout\(14));

-- Location: LCCOMB_X49_Y17_N14
\SRAM_ADDR[14]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[14]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[14]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(14),
	datac => \SRAM_ADDR[14]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[14]$latch~combout\);

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\address[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_address(15),
	combout => \address~combout\(15));

-- Location: LCCOMB_X1_Y13_N8
\SRAM_ADDR[15]$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_ADDR[15]$latch~combout\ = (GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & ((\SRAM_ADDR[15]$latch~combout\))) # (!GLOBAL(\state.IDLE_ST~clkctrl_outclk\) & (\address~combout\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(15),
	datac => \SRAM_ADDR[15]$latch~combout\,
	datad => \state.IDLE_ST~clkctrl_outclk\,
	combout => \SRAM_ADDR[15]$latch~combout\);

-- Location: LCCOMB_X1_Y13_N24
\next_state.WR_ST~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \next_state.WR_ST~0_combout\ = (\WR~combout\ & !\state.IDLE_ST~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \WR~combout\,
	datad => \state.IDLE_ST~regout\,
	combout => \next_state.WR_ST~0_combout\);

-- Location: LCFF_X1_Y13_N25
\state.WR_ST\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~combout\,
	datain => \next_state.WR_ST~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \state.WR_ST~regout\);

-- Location: LCCOMB_X1_Y13_N6
\SRAM_UB_N~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_UB_N~2_combout\ = (\state.WR_ST~regout\) # (\state.RES_ST~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.WR_ST~regout\,
	datad => \state.RES_ST~regout\,
	combout => \SRAM_UB_N~2_combout\);

-- Location: CLKCTRL_G11
\SRAM_UB_N~2clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \SRAM_UB_N~2clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \SRAM_UB_N~2clkctrl_outclk\);

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\byte_m~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_byte_m,
	combout => \byte_m~combout\);

-- Location: LCCOMB_X1_Y13_N12
\Selector18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector18~0_combout\ = ((!\address~combout\(0) & \byte_m~combout\)) # (!\state.RD_ST~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(0),
	datac => \byte_m~combout\,
	datad => \state.RD_ST~regout\,
	combout => \Selector18~0_combout\);

-- Location: LCCOMB_X1_Y13_N26
\SRAM_UB_N$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_UB_N$latch~combout\ = (GLOBAL(\SRAM_UB_N~2clkctrl_outclk\) & (\SRAM_UB_N$latch~combout\)) # (!GLOBAL(\SRAM_UB_N~2clkctrl_outclk\) & ((\Selector18~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SRAM_UB_N$latch~combout\,
	datac => \SRAM_UB_N~2clkctrl_outclk\,
	datad => \Selector18~0_combout\,
	combout => \SRAM_UB_N$latch~combout\);

-- Location: LCCOMB_X1_Y13_N22
\Selector20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = ((\address~combout\(0) & \byte_m~combout\)) # (!\state.RD_ST~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address~combout\(0),
	datac => \byte_m~combout\,
	datad => \state.RD_ST~regout\,
	combout => \Selector20~0_combout\);

-- Location: LCCOMB_X1_Y13_N2
\SRAM_LB_N$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_LB_N$latch~combout\ = (GLOBAL(\SRAM_UB_N~2clkctrl_outclk\) & (\SRAM_LB_N$latch~combout\)) # (!GLOBAL(\SRAM_UB_N~2clkctrl_outclk\) & ((\Selector20~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SRAM_LB_N$latch~combout\,
	datac => \SRAM_UB_N~2clkctrl_outclk\,
	datad => \Selector20~0_combout\,
	combout => \SRAM_LB_N$latch~combout\);

-- Location: LCCOMB_X1_Y13_N14
\SRAM_CE_N$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \SRAM_CE_N$latch~combout\ = (GLOBAL(\SRAM_UB_N~2clkctrl_outclk\) & (\SRAM_CE_N$latch~combout\)) # (!GLOBAL(\SRAM_UB_N~2clkctrl_outclk\) & ((!\state.RD_ST~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SRAM_CE_N$latch~combout\,
	datac => \SRAM_UB_N~2clkctrl_outclk\,
	datad => \state.RD_ST~regout\,
	combout => \SRAM_CE_N$latch~combout\);

-- Location: LCCOMB_X30_Y26_N28
\data_ext~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~0_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & ((\SRAM_DQ[8]~8\))) # (!\address~combout\(0) & (\SRAM_DQ[0]~0\)))) # (!\byte_m~combout\ & (\SRAM_DQ[0]~0\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SRAM_DQ[0]~0\,
	datab => \SRAM_DQ[8]~8\,
	datac => \byte_m~combout\,
	datad => \address~combout\(0),
	combout => \data_ext~0_combout\);

-- Location: LCCOMB_X1_Y13_N16
\data_ext[15]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext[15]~1_combout\ = (!\WR~combout\ & \state.RES_ST~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \WR~combout\,
	datad => \state.RES_ST~regout\,
	combout => \data_ext[15]~1_combout\);

-- Location: CLKCTRL_G0
\data_ext[15]~1clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \data_ext[15]~1clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \data_ext[15]~1clkctrl_outclk\);

-- Location: LCCOMB_X27_Y26_N16
\data_ext[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(0) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~0_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_ext~0_combout\,
	datac => data_ext(0),
	datad => \data_ext[15]~1clkctrl_outclk\,
	combout => data_ext(0));

-- Location: LCCOMB_X30_Y26_N22
\data_ext~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~2_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & (\SRAM_DQ[9]~9\)) # (!\address~combout\(0) & ((\SRAM_DQ[1]~1\))))) # (!\byte_m~combout\ & (((\SRAM_DQ[1]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SRAM_DQ[9]~9\,
	datab => \SRAM_DQ[1]~1\,
	datac => \byte_m~combout\,
	datad => \address~combout\(0),
	combout => \data_ext~2_combout\);

-- Location: LCCOMB_X31_Y26_N28
\data_ext[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(1) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~2_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_ext~2_combout\,
	datac => \data_ext[15]~1clkctrl_outclk\,
	datad => data_ext(1),
	combout => data_ext(1));

-- Location: LCCOMB_X30_Y26_N0
\data_ext~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~3_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & ((\SRAM_DQ[10]~10\))) # (!\address~combout\(0) & (\SRAM_DQ[2]~2\)))) # (!\byte_m~combout\ & (\SRAM_DQ[2]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SRAM_DQ[2]~2\,
	datab => \SRAM_DQ[10]~10\,
	datac => \byte_m~combout\,
	datad => \address~combout\(0),
	combout => \data_ext~3_combout\);

-- Location: LCCOMB_X31_Y26_N18
\data_ext[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(2) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~3_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_ext~3_combout\,
	datac => \data_ext[15]~1clkctrl_outclk\,
	datad => data_ext(2),
	combout => data_ext(2));

-- Location: LCCOMB_X30_Y26_N18
\data_ext~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~4_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & ((\SRAM_DQ[11]~11\))) # (!\address~combout\(0) & (\SRAM_DQ[3]~3\)))) # (!\byte_m~combout\ & (\SRAM_DQ[3]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \byte_m~combout\,
	datab => \SRAM_DQ[3]~3\,
	datac => \SRAM_DQ[11]~11\,
	datad => \address~combout\(0),
	combout => \data_ext~4_combout\);

-- Location: LCCOMB_X31_Y26_N16
\data_ext[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(3) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~4_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_ext~4_combout\,
	datac => data_ext(3),
	datad => \data_ext[15]~1clkctrl_outclk\,
	combout => data_ext(3));

-- Location: LCCOMB_X30_Y26_N20
\data_ext~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~5_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & ((\SRAM_DQ[12]~12\))) # (!\address~combout\(0) & (\SRAM_DQ[4]~4\)))) # (!\byte_m~combout\ & (\SRAM_DQ[4]~4\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SRAM_DQ[4]~4\,
	datab => \SRAM_DQ[12]~12\,
	datac => \byte_m~combout\,
	datad => \address~combout\(0),
	combout => \data_ext~5_combout\);

-- Location: LCCOMB_X31_Y26_N14
\data_ext[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(4) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~5_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_ext~5_combout\,
	datac => data_ext(4),
	datad => \data_ext[15]~1clkctrl_outclk\,
	combout => data_ext(4));

-- Location: LCCOMB_X30_Y26_N10
\data_ext~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~6_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & ((\SRAM_DQ[13]~13\))) # (!\address~combout\(0) & (\SRAM_DQ[5]~5\)))) # (!\byte_m~combout\ & (\SRAM_DQ[5]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \byte_m~combout\,
	datab => \SRAM_DQ[5]~5\,
	datac => \SRAM_DQ[13]~13\,
	datad => \address~combout\(0),
	combout => \data_ext~6_combout\);

-- Location: LCCOMB_X27_Y26_N14
\data_ext[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(5) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~6_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_ext~6_combout\,
	datac => data_ext(5),
	datad => \data_ext[15]~1clkctrl_outclk\,
	combout => data_ext(5));

-- Location: LCCOMB_X30_Y26_N12
\data_ext~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~7_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & ((\SRAM_DQ[14]~14\))) # (!\address~combout\(0) & (\SRAM_DQ[6]~6\)))) # (!\byte_m~combout\ & (\SRAM_DQ[6]~6\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SRAM_DQ[6]~6\,
	datab => \SRAM_DQ[14]~14\,
	datac => \byte_m~combout\,
	datad => \address~combout\(0),
	combout => \data_ext~7_combout\);

-- Location: LCCOMB_X34_Y26_N24
\data_ext[6]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(6) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~7_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_ext~7_combout\,
	datac => data_ext(6),
	datad => \data_ext[15]~1clkctrl_outclk\,
	combout => data_ext(6));

-- Location: LCCOMB_X30_Y26_N2
\data_ext~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~8_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & ((\SRAM_DQ[15]~15\))) # (!\address~combout\(0) & (\SRAM_DQ[7]~7\)))) # (!\byte_m~combout\ & (\SRAM_DQ[7]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SRAM_DQ[7]~7\,
	datab => \SRAM_DQ[15]~15\,
	datac => \byte_m~combout\,
	datad => \address~combout\(0),
	combout => \data_ext~8_combout\);

-- Location: LCCOMB_X33_Y26_N24
\data_ext[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(7) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~8_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_ext~8_combout\,
	datac => data_ext(7),
	datad => \data_ext[15]~1clkctrl_outclk\,
	combout => data_ext(7));

-- Location: LCCOMB_X30_Y26_N8
\data_ext~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~9_combout\ = (\address~combout\(0) & ((\byte_m~combout\ & (\SRAM_DQ[15]~15\)) # (!\byte_m~combout\ & ((\SRAM_DQ[8]~8\))))) # (!\address~combout\(0) & (((\SRAM_DQ[8]~8\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address~combout\(0),
	datab => \SRAM_DQ[15]~15\,
	datac => \byte_m~combout\,
	datad => \SRAM_DQ[8]~8\,
	combout => \data_ext~9_combout\);

-- Location: LCCOMB_X29_Y26_N20
\data_ext[8]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(8) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~9_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_ext~9_combout\,
	datac => data_ext(8),
	datad => \data_ext[15]~1clkctrl_outclk\,
	combout => data_ext(8));

-- Location: LCCOMB_X30_Y26_N30
\data_ext~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~10_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & ((\SRAM_DQ[15]~15\))) # (!\address~combout\(0) & (\SRAM_DQ[9]~9\)))) # (!\byte_m~combout\ & (\SRAM_DQ[9]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SRAM_DQ[9]~9\,
	datab => \SRAM_DQ[15]~15\,
	datac => \byte_m~combout\,
	datad => \address~combout\(0),
	combout => \data_ext~10_combout\);

-- Location: LCCOMB_X31_Y26_N24
\data_ext[9]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(9) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~10_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_ext~10_combout\,
	datac => data_ext(9),
	datad => \data_ext[15]~1clkctrl_outclk\,
	combout => data_ext(9));

-- Location: LCCOMB_X30_Y26_N16
\data_ext~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~11_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & (\SRAM_DQ[15]~15\)) # (!\address~combout\(0) & ((\SRAM_DQ[10]~10\))))) # (!\byte_m~combout\ & (((\SRAM_DQ[10]~10\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \byte_m~combout\,
	datab => \SRAM_DQ[15]~15\,
	datac => \SRAM_DQ[10]~10\,
	datad => \address~combout\(0),
	combout => \data_ext~11_combout\);

-- Location: LCCOMB_X34_Y26_N14
\data_ext[10]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(10) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~11_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_ext~11_combout\,
	datac => data_ext(10),
	datad => \data_ext[15]~1clkctrl_outclk\,
	combout => data_ext(10));

-- Location: LCCOMB_X30_Y26_N6
\data_ext~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~12_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & (\SRAM_DQ[15]~15\)) # (!\address~combout\(0) & ((\SRAM_DQ[11]~11\))))) # (!\byte_m~combout\ & (((\SRAM_DQ[11]~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \byte_m~combout\,
	datab => \SRAM_DQ[15]~15\,
	datac => \SRAM_DQ[11]~11\,
	datad => \address~combout\(0),
	combout => \data_ext~12_combout\);

-- Location: LCCOMB_X31_Y26_N26
\data_ext[11]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(11) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~12_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_ext~12_combout\,
	datac => \data_ext[15]~1clkctrl_outclk\,
	datad => data_ext(11),
	combout => data_ext(11));

-- Location: LCCOMB_X30_Y26_N4
\data_ext~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~13_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & (\SRAM_DQ[15]~15\)) # (!\address~combout\(0) & ((\SRAM_DQ[12]~12\))))) # (!\byte_m~combout\ & (((\SRAM_DQ[12]~12\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \byte_m~combout\,
	datab => \SRAM_DQ[15]~15\,
	datac => \SRAM_DQ[12]~12\,
	datad => \address~combout\(0),
	combout => \data_ext~13_combout\);

-- Location: LCCOMB_X31_Y26_N20
\data_ext[12]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(12) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~13_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_ext~13_combout\,
	datac => data_ext(12),
	datad => \data_ext[15]~1clkctrl_outclk\,
	combout => data_ext(12));

-- Location: LCCOMB_X30_Y26_N26
\data_ext~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~14_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & (\SRAM_DQ[15]~15\)) # (!\address~combout\(0) & ((\SRAM_DQ[13]~13\))))) # (!\byte_m~combout\ & (((\SRAM_DQ[13]~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \byte_m~combout\,
	datab => \SRAM_DQ[15]~15\,
	datac => \SRAM_DQ[13]~13\,
	datad => \address~combout\(0),
	combout => \data_ext~14_combout\);

-- Location: LCCOMB_X30_Y26_N14
\data_ext[13]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(13) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~14_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_ext~14_combout\,
	datac => data_ext(13),
	datad => \data_ext[15]~1clkctrl_outclk\,
	combout => data_ext(13));

-- Location: LCCOMB_X30_Y26_N24
\data_ext~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_ext~15_combout\ = (\byte_m~combout\ & ((\address~combout\(0) & ((\SRAM_DQ[15]~15\))) # (!\address~combout\(0) & (\SRAM_DQ[14]~14\)))) # (!\byte_m~combout\ & (\SRAM_DQ[14]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SRAM_DQ[14]~14\,
	datab => \SRAM_DQ[15]~15\,
	datac => \byte_m~combout\,
	datad => \address~combout\(0),
	combout => \data_ext~15_combout\);

-- Location: LCCOMB_X33_Y26_N14
\data_ext[14]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(14) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\data_ext~15_combout\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_ext~15_combout\,
	datac => data_ext(14),
	datad => \data_ext[15]~1clkctrl_outclk\,
	combout => data_ext(14));

-- Location: LCCOMB_X42_Y26_N16
\data_ext[15]\ : cycloneii_lcell_comb
-- Equation(s):
-- data_ext(15) = (GLOBAL(\data_ext[15]~1clkctrl_outclk\) & (\SRAM_DQ[15]~15\)) # (!GLOBAL(\data_ext[15]~1clkctrl_outclk\) & ((data_ext(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SRAM_DQ[15]~15\,
	datac => data_ext(15),
	datad => \data_ext[15]~1clkctrl_outclk\,
	combout => data_ext(15));

-- Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[0]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(0));

-- Location: PIN_J19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[1]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(1));

-- Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[2]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(2));

-- Location: PIN_E18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[3]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(3));

-- Location: PIN_AA12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[4]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(4));

-- Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[5]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(5));

-- Location: PIN_W5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[6]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(6));

-- Location: PIN_AB5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[7]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(7));

-- Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[8]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(8));

-- Location: PIN_Y5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[9]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(9));

-- Location: PIN_E19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[10]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(10));

-- Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[11]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(11));

-- Location: PIN_V4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[12]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(12));

-- Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[13]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(13));

-- Location: PIN_J18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[14]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(14));

-- Location: PIN_N6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_ADDR[15]$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(15));

-- Location: PIN_U15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(16));

-- Location: PIN_AA8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_ADDR[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_ADDR(17));

-- Location: PIN_M6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_UB_N~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_UB_N$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_UB_N);

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_LB_N~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_LB_N$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_LB_N);

-- Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_CE_N~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_CE_N$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_CE_N);

-- Location: PIN_M5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_OE_N~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \SRAM_CE_N$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_OE_N);

-- Location: PIN_AB14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SRAM_WE_N~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SRAM_WE_N);

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(0));

-- Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(1));

-- Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(2));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(3));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(4));

-- Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(5));

-- Location: PIN_A16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(6));

-- Location: PIN_A15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(7));

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(8));

-- Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(9));

-- Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(10));

-- Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(11));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(12));

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(13));

-- Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(14));

-- Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dataReaded[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => data_ext(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dataReaded(15));
END structure;


