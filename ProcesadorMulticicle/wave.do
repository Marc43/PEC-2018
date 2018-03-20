onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Procesador
add wave -noupdate -radix hexadecimal /test_sisa/proc0/clk
add wave -noupdate -radix hexadecimal /test_sisa/proc0/boot
add wave -noupdate -radix hexadecimal /test_sisa/proc0/unidad_control0/multi0/state
add wave -noupdate -radix hexadecimal /test_sisa/proc0/addr_m
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datard_m
add wave -noupdate -radix hexadecimal /test_sisa/proc0/data_wr
add wave -noupdate -radix hexadecimal /test_sisa/proc0/wr_m
add wave -noupdate -radix hexadecimal /test_sisa/proc0/word_byte
add wave -noupdate -divider {Unidad de Control}
add wave -noupdate -radix hexadecimal /test_sisa/proc0/unidad_control0/pc
add wave -noupdate -radix hexadecimal /test_sisa/proc0/unidad_control0/bus_ir
add wave -noupdate -radix hexadecimal /test_sisa/proc0/unidad_control0/multi0/state
add wave -noupdate -radix hexadecimal /test_sisa/proc0/unidad_control0/bus_ldpc
add wave -noupdate -radix hexadecimal /test_sisa/proc0/unidad_control0/new_pc
add wave -noupdate -radix hexadecimal /test_sisa/proc0/unidad_control0/in_d
add wave -noupdate -radix hexadecimal /test_sisa/proc0/unidad_control0/ins_dad
add wave -noupdate -radix hexadecimal /test_sisa/proc0/unidad_control0/immed_x2
add wave -noupdate -divider Datapath
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/datard_m
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/immed
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/in_d
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/immed_x2
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/ins_dad
add wave -noupdate -divider Alu
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/alu0/x
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/alu0/y
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/alu0/op
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/alu0/w
add wave -noupdate -divider {Banco de registros}
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/regfile0/addr_a
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/regfile0/a
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/regfile0/addr_b
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/regfile0/b
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/regfile0/addr_d
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/regfile0/d
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datapath0/regfile0/wrd
add wave -noupdate -radix hexadecimal -childformat {{/test_sisa/proc0/datapath0/regfile0/regs(7) -radix hexadecimal} {/test_sisa/proc0/datapath0/regfile0/regs(6) -radix hexadecimal} {/test_sisa/proc0/datapath0/regfile0/regs(5) -radix hexadecimal} {/test_sisa/proc0/datapath0/regfile0/regs(4) -radix hexadecimal} {/test_sisa/proc0/datapath0/regfile0/regs(3) -radix hexadecimal} {/test_sisa/proc0/datapath0/regfile0/regs(2) -radix hexadecimal} {/test_sisa/proc0/datapath0/regfile0/regs(1) -radix hexadecimal} {/test_sisa/proc0/datapath0/regfile0/regs(0) -radix hexadecimal}} -expand -subitemconfig {/test_sisa/proc0/datapath0/regfile0/regs(7) {-radix hexadecimal} /test_sisa/proc0/datapath0/regfile0/regs(6) {-radix hexadecimal} /test_sisa/proc0/datapath0/regfile0/regs(5) {-radix hexadecimal} /test_sisa/proc0/datapath0/regfile0/regs(4) {-radix hexadecimal} /test_sisa/proc0/datapath0/regfile0/regs(3) {-radix hexadecimal} /test_sisa/proc0/datapath0/regfile0/regs(2) {-radix hexadecimal} /test_sisa/proc0/datapath0/regfile0/regs(1) {-radix hexadecimal} /test_sisa/proc0/datapath0/regfile0/regs(0) {-radix hexadecimal}} /test_sisa/proc0/datapath0/regfile0/regs
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 3} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 373
configure wave -valuecolwidth 157
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
WaveRestoreZoom {307939 ps} {317539 ps}