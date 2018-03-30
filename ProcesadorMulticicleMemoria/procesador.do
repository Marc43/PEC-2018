onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Procesador
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/clk
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/boot
add wave -noupdate -divider {Memoria (RD - WR)}
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/bus_ins_dad
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/bus_pc
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/addr_m
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datard_m
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/data_wr
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/wr_m
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/word_byte
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/bus_wrd
add wave -noupdate -divider Regfile
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/bus_addr_a
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/bus_addr_b
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/bus_addr_d
add wave -noupdate -divider {Mem control}
add wave -noupdate -radix hexadecimal /test_sisa/SoC/mem_ctrl0/CLOCK_50
add wave -noupdate -radix hexadecimal /test_sisa/SoC/mem_ctrl0/we
add wave -noupdate -radix hexadecimal /test_sisa/SoC/mem_ctrl0/byte_m
add wave -noupdate -radix hexadecimal /test_sisa/SoC/mem_ctrl0/addr
add wave -noupdate -radix hexadecimal /test_sisa/SoC/mem_ctrl0/wr_data
add wave -noupdate -radix hexadecimal /test_sisa/SoC/mem_ctrl0/rd_data
add wave -noupdate /test_sisa/SoC/mem_ctrl0/controller0/state
add wave -noupdate -divider {SeÃ±ales de la mem fisica}
add wave -noupdate -radix hexadecimal /test_sisa/SoC/mem_ctrl0/SRAM_ADDR
add wave -noupdate -radix hexadecimal /test_sisa/SoC/mem_ctrl0/SRAM_DQ
add wave -noupdate -radix hexadecimal /test_sisa/SoC/mem_ctrl0/SRAM_UB_N
add wave -noupdate -radix hexadecimal /test_sisa/SoC/mem_ctrl0/SRAM_LB_N
add wave -noupdate -radix hexadecimal /test_sisa/SoC/mem_ctrl0/SRAM_CE_N
add wave -noupdate -radix hexadecimal /test_sisa/SoC/mem_ctrl0/SRAM_OE_N
add wave -noupdate -radix hexadecimal /test_sisa/SoC/mem_ctrl0/SRAM_WE_N
add wave -noupdate -divider {Grafo de estados}
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/clk
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/boot
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/ldpc_l
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/wrd_l
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/wr_m_l
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/w_b
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/ldpc
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/wrd
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/wr_m
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/ldir
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/ins_dad
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/word_byte
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/state
add wave -noupdate -divider {Unidad de Control}
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/boot
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/clk
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/datard_m
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/op
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/wrd
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/addr_a
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/addr_b
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/addr_d
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/immed
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/pc
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/ins_dad
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/in_d
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/immed_x2
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/wr_m
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/word_byte
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/bus_ir
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/bus_word_byte
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/bus_ldpc
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/bus_wr_m
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/bus_wrd
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi_ldpc
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi_ldir
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/instrPC_mux_instrIR
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/instr_mux_and
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/pcmas2_mux_oldpc
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/pc_mux_startaddr
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/new_pc
add wave -noupdate -divider {Camino de datos}
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/clk
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/op
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/wrd
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/addr_a
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/addr_b
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/addr_d
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/immed
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/immed_x2
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/datard_m
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/ins_dad
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/pc
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/in_d
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/addr_m
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/data_wr
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/reg_a
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/reg_b
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/mux_immed
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/mux_dreg
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/mux_addr
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/datapath0/alu_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {250993 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 322
configure wave -valuecolwidth 38
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {110107 ps} {569539 ps}
