        .ORIG x3000

main:   AND R0, R0, 0

        ADD R1, R0, 15          ; F = 1111
        SCAN R1, R1, -1         ; A = 1010

        ADD R1, R0, 8           ; 8 = 1000
        SCAN R1, R1, -1         ; F = 1111

        ADD R1, R0, 5           ; 5 = 0101
        SCAN R1, R1, -1         ; 6 = 0110

        ADD R1, R0, -1          ; -1 = FFFF = 1111_1111_1111_1111
        SCAN R1, R1, -1         ;      AAAA = 1010_1010_1010_1010

        TRAP x25

        .END
