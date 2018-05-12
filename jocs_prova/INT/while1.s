movi r0,  0x10 ; @ While1
movhi r0, 0xC0
movi r3,  0x16 ; @ RSG
movhi r3, 0xC0
wrs s5, r3 ; s5 <- @RSG
movi r1,  0x01
movi r2,  0x02
ei
add r1, r1, r2 ; C010
jmp r0
halt
movi r7, 4 ; C016
addi r7, r7, 12
reti
halt ; No deberia llegar nunca aqui