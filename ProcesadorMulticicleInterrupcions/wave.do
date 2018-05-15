onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Unidad de Control}
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/boot
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/clk
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/state
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/pc
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/pcup
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/tknbr_pc
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/bus_ir
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/op
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/func
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/aluout
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/interrupt_controller0/iid
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/in_d_l
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/tknbr_l
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/alu_op_l
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/rd_sys_gp_l
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/ldpc_l
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/wrd_gp_l
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/wrd_sys_l
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/wr_m_l
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/w_b
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/intr_l
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/intr_enabled
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/intr
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/ldpc
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/wrd_gp
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/wrd_sys
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/wr_m
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/ldir
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/ins_dad
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/word_byte
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/in_d
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/tknbr
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/alu_op
add wave -noupdate -group {multi
} -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/multi0/rd_sys_gp
add wave -noupdate -group {intr_control
} /test_sisa/SoC/proc0/unidad_control0/intr_l
add wave -noupdate -group {intr_control
} /test_sisa/SoC/proc0/unidad_control0/intr_d
add wave -noupdate -group {intr_control
} /test_sisa/SoC/proc0/unidad_control0/intr_enabled
add wave -noupdate -group {intr_control
} /test_sisa/SoC/proc0/unidad_control0/inta
add wave -noupdate -group {intr_control
} /test_sisa/SoC/proc0/unidad_control0/e_int
add wave -noupdate -group {intr_control
} /test_sisa/SoC/proc0/unidad_control0/d_int
add wave -noupdate -group {intr_control
} /test_sisa/SoC/proc0/unidad_control0/ret_int
add wave -noupdate -group {regfile_control
} /test_sisa/SoC/proc0/unidad_control0/wrd_gp
add wave -noupdate -group {regfile_control
} /test_sisa/SoC/proc0/unidad_control0/wrd_sys
add wave -noupdate -group {regfile_control
} /test_sisa/SoC/proc0/unidad_control0/rd_sys_gp
add wave -noupdate -group {regfile_control
} /test_sisa/SoC/proc0/unidad_control0/addr_a
add wave -noupdate -group {regfile_control
} /test_sisa/SoC/proc0/unidad_control0/addr_b
add wave -noupdate -group {regfile_control
} /test_sisa/SoC/proc0/unidad_control0/addr_d
add wave -noupdate -divider {Logica de control}
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/ir
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/eval
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/op
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/func
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/ldpc
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/wrd_gp
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/wrd_sys
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/rd_sys_gp
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/addr_a
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/addr_b
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/addr_d
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/immed
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/immed_reg
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/wr_m
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/in_d
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/tknbr
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/immed_x2
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/word_byte
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/wr_port
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/rd_port
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/e_int
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/d_int
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/ret_int
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/inta
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/op_code
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/f_code
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/spec_code
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/reg_d
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/reg_src1
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/reg_src2
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/branch_f
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/jmp_f
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/immed_ma
add wave -noupdate -radix hexadecimal /test_sisa/SoC/proc0/unidad_control0/control_l0/immed_alu
add wave -noupdate -divider Datapath
add wave -noupdate -divider ALU
add wave -noupdate -group {alu
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/alu0/x
add wave -noupdate -group {alu
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/alu0/y
add wave -noupdate -group {alu
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/alu0/op
add wave -noupdate -group {alu
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/alu0/func
add wave -noupdate -group {alu
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/alu0/w
add wave -noupdate -group {alu
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/alu0/z
add wave -noupdate -group {alu
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/alu0/w_dummy
add wave -noupdate -group {alu
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/alu0/mult_result
add wave -noupdate -divider Regfile
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/clk
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/wrd_gp
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/wrd_sys
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/RD_SYS_GP
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/intr
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/e_int
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/d_int
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/ret_int
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/d
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/addr_a
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/addr_b
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/addr_d
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/a
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/b
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/intr_enabled
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/bus_sys_a
add wave -noupdate -group {regfile_block
} /test_sisa/SoC/proc0/datapath0/regfile0/bus_gp_a
add wave -noupdate -divider {System regfile}
add wave -noupdate -expand -group {system
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/clk
add wave -noupdate -expand -group {system
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/wrd
add wave -noupdate -expand -group {system
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/intr
add wave -noupdate -expand -group {system
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/e_int
add wave -noupdate -expand -group {system
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/d_int
add wave -noupdate -expand -group {system
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/ret_int
add wave -noupdate -expand -group {system
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/d
add wave -noupdate -expand -group {system
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/addr_a
add wave -noupdate -expand -group {system
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/addr_d
add wave -noupdate -expand -group {system
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/a
add wave -noupdate -expand -group {system
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/intr_enabled
add wave -noupdate -expand -group {system
} -radix hexadecimal -childformat {{/test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(7) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(6) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(5) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(4) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(3) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(2) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(1) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(0) -radix hexadecimal}} -expand -subitemconfig {/test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(7) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(6) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(5) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(4) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(3) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(2) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(1) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys(0) {-height 15 -radix hexadecimal}} /test_sisa/SoC/proc0/datapath0/regfile0/system_regfile0/regs_sys
add wave -noupdate -divider {General purpose regfile}
add wave -noupdate -expand -group {gpurpose
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/clk
add wave -noupdate -expand -group {gpurpose
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/wrd
add wave -noupdate -expand -group {gpurpose
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/d
add wave -noupdate -expand -group {gpurpose
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/addr_a
add wave -noupdate -expand -group {gpurpose
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/addr_b
add wave -noupdate -expand -group {gpurpose
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/addr_d
add wave -noupdate -expand -group {gpurpose
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/a
add wave -noupdate -expand -group {gpurpose
} -radix hexadecimal /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/b
add wave -noupdate -expand -group {gpurpose
} -radix hexadecimal -childformat {{/test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(7) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(6) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(5) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(4) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(3) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(2) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(1) -radix hexadecimal} {/test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(0) -radix hexadecimal}} -expand -subitemconfig {/test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(7) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(6) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(5) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(4) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(3) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(2) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(1) {-height 15 -radix hexadecimal} /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp(0) {-height 15 -radix hexadecimal}} /test_sisa/SoC/proc0/datapath0/regfile0/generalp_regfile0/regs_gp
add wave -noupdate -divider controlador_intr
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/interrupt_controller0/boot
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/interrupt_controller0/clk
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/interrupt_controller0/inta
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/interrupt_controller0/key_intr
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/interrupt_controller0/ps2_intr
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/interrupt_controller0/switch_intr
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/timer0/cnt
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/interrupt_controller0/timer_intr
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/interrupt_controller0/intr
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/interrupt_controller0/key_inta
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/interrupt_controller0/ps2_inta
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/interrupt_controller0/switch_inta
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/interrupt_controller0/timer_inta
add wave -noupdate -divider ControladoresIO
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/boot
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/CLOCK_50
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/inta
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/intr
add wave -noupdate -expand -group {ctrl_IO_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_key_intr
add wave -noupdate -expand -group {ctrl_IO_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_ps2_intr
add wave -noupdate -expand -group {ctrl_IO_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_timer_intr
add wave -noupdate -expand -group {ctrl_IO_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_switch_intr
add wave -noupdate -expand -group {ctrl_IO_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_key_inta
add wave -noupdate -expand -group {ctrl_IO_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_ps2_inta
add wave -noupdate -expand -group {ctrl_IO_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_timer_inta
add wave -noupdate -expand -group {ctrl_IO_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_switch_inta
add wave -noupdate -expand -group {input_ctrl_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/pulsadores_inta
add wave -noupdate -expand -group {input_ctrl_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/switches_inta
add wave -noupdate -expand -group {input_ctrl_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/ps2_inta
add wave -noupdate -expand -group {input_ctrl_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/timer_inta
add wave -noupdate -expand -group {input_ctrl_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/pulsadores_intr
add wave -noupdate -expand -group {input_ctrl_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/switches_intr
add wave -noupdate -expand -group {input_ctrl_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/ps2_intr
add wave -noupdate -expand -group {input_ctrl_intr_inta
} -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/timer_intr
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/addr_io
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/wr_io
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/rd_io
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/wr_out
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/rd_in
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/ps2_clk
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/ps2_data
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/led_verdes
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/led_rojos
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/display
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/power_display
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/keys
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/switches
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/vga_cursor
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/vga_cursor_enable
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/ports
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_ms_to_count
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_ms_value
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_cycles_counted
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/ms_counter_we
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_wr_keys
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_wr_switches
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/clear_char_bus
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/read_char_bus
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/data_ready_bus
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/bus_iid
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/boot
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/clk
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/keys
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/switches
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/ps2_clk
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/ps2_data
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/clear_char
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/read_char
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/data_ready
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/rd_key
add wave -noupdate -radix hexadecimal /test_sisa/SoC/controladores_IO0/input_controllers0/rd_sw
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7499370000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 394
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
WaveRestoreZoom {19829414852 ps} {19829451850 ps}
