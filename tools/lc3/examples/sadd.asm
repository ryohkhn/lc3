        .ORIG x3000
        LEA R0, op1
        LEA R1, op2
        LEA R2, res1
        LEA R3, res2
loop:   LDR R4, R0, 0
        BRz stop
        LDR R5, R1, 0
        ADD R6, R4, R5
        STR R6, R2, 0
        SADD R6, R4, R5
        STR R6, R3, 0
        ADD R0, R0, 1
        ADD R1, R1, 1
        ADD R2, R2, 1
        ADD R3, R3, 1
        BR loop
stop:   HALT
op1:    .FILL 1
        .FILL xEFFE
        .FILL xEFFF
        .FILL xFFFF
        .FILL x8000
        .FILL 0
op2:    .FILL 2
        .FILL 1
        .FILL 1
        .FILL 1
        .FILL xFFFF
        .FILL 0
res1:   .FILL 0
        .FILL 0
        .FILL 0
        .FILL 0
        .FILL 0
        .FILL 0
res2:   .FILL 0
        .FILL 0
        .FILL 0
        .FILL 0
        .FILL 0
        .FILL 0
        .END
