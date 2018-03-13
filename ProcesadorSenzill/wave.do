onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Procesador
add wave -noupdate -radix hexadecimal /test_sisa/proc0/boot
add wave -noupdate -radix hexadecimal /test_sisa/proc0/clk
add wave -noupdate -radix hexadecimal /test_sisa/proc0/addr_m
add wave -noupdate -radix hexadecimal /test_sisa/proc0/datard_m
add wave -noupdate -divider {Unidad de Control}
add wave -noupdate -radix hexadecimal /test_sisa/proc0/c0/boot
add wave -noupdate -radix hexadecimal /test_sisa/proc0/c0/clk
add wave -noupdate -radix hexadecimal /test_sisa/proc0/c0/pc
add wave -noupdate -divider {Logica de Control}
add wave -noupdate -radix hexadecimal /test_sisa/proc0/c0/ir
add wave -noupdate -radix hexadecimal /test_sisa/proc0/c0/op
add wave -noupdate -radix hexadecimal /test_sisa/proc0/c0/ldpc0
add wave -noupdate -radix hexadecimal /test_sisa/proc0/e0/wrd
add wave -noupdate -radix hexadecimal /test_sisa/proc0/c0/addr_a
add wave -noupdate -radix hexadecimal /test_sisa/proc0/c0/addr_d
add wave -noupdate -radix hexadecimal /test_sisa/proc0/c0/immed
add wave -noupdate -divider Alu
add wave -noupdate /test_sisa/proc0/e0/alu0/x
add wave -noupdate /test_sisa/proc0/e0/alu0/y
add wave -noupdate /test_sisa/proc0/e0/alu0/op
add wave -noupdate /test_sisa/proc0/e0/alu0/w
add wave -noupdate -divider {Banco de Registros}
add wave -noupdate /test_sisa/proc0/e0/reg0/clk
add wave -noupdate /test_sisa/proc0/e0/reg0/wrd
add wave -noupdate /test_sisa/proc0/e0/reg0/d
add wave -noupdate /test_sisa/proc0/e0/reg0/addr_a
add wave -noupdate /test_sisa/proc0/e0/reg0/addr_d
add wave -noupdate /test_sisa/proc0/e0/reg0/a
add wave -noupdate /test_sisa/proc0/e0/reg0/regs
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {223 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 212
configure wave -valuecolwidth 39
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
WaveRestoreZoom {0 ps} {42710 ps}
