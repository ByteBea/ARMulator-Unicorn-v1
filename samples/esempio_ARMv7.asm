 SECTION INTVEC
B main
SECTION CODE
main
        MOV     R0, #1          
retry
        LDREX   R1, [R2]        
        ADD     R1, R1, R0     
        STREX   R3, R1, [R2]    
        CMP     R3, #0          
        BNE     retry 
end
B end
SECTION DATA