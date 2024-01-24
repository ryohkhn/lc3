        .ORIG x3000
        LD R0, ini
        JSR rigolo
fin:    TRAP x25
rigolo: AND R0, R0, R0
        BRz zero
        ADD R6, R6, -1
        STR R1, R6, 0
        LD R1, cst15
        AND R0, R0, R0
        BRn fini
loop:   ADD R1, R1, -1
        ADD R0, R0, R0
        BRp loop
fini:   ADD R0, R1, 0
        LDR R1, R6, 0
        ADD R6, R6, 1
        RET
zero:   LD R0, cst_1
        RET
ini:   .FILL 15
cst15: .FILL 15
cst_1: .FILL -1
       .END
