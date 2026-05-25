SECTION INTVEC

B main

SECTION CODE
main
    MOV R0, #0x40000000    ; R0 = 2.0 in IEEE 754
    MOV R1, #0x40400000    ; R1 = 3.0 in IEEE 754
    VMOV S0, R0
    VMOV S1, R1
    VADD.F32 S2, S0, S1    ; S2 = 2.0 + 3.0 = 5.0
    VMOV R0, S2            ; R0 dovrebbe essere 0x40A00000 = 5.0
end
B end

SECTION DATA