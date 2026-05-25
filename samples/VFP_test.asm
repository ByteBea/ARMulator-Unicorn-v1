SECTION INTVEC

B main

SECTION CODE

main
    VMOV S0, R0      ; carica R0 in S0
    VADD.F32 S2, S0, S1  ; somma floating point
    VMOV R0, S2      ; salva risultato in R0
end
    B end

SECTION DATA