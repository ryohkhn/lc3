;; Sous-routine pour concaténer la une chaîne source dans une autre
;; @param R1 adresse de la chaîne destination
;; @param R2 adresse de la chaîne source
;; @param R3 taille de R1
;; R4, R5 perdu
        .ORIG 3000
        AND R3, R3, 0
        ADD R3, R3, 13
        LEA R1, dest
        LEA R2, src1
        JSR strlcat

        AND R3, R3, 0
        ADD R3, R3, 13
        LEA R1, dest
        LEA R2, src2
        JSR strlcat
        HALT

strlcat: 
        LDR R4, R1, 0   ;; c = *dest
        BRz copy        ;; if (c != '\0'
        ADD R5, R3, -1
        BRnz copy       ;; && size > 1) {
loop1:  ADD R1, R1, 1   ;;   do { dest += 1
        ADD R3, R3, -1  ;;        size -= 1
        LDR R4, R1, 0   ;;        c = *dest
        BRz copy        ;;   } while (c != '\0'
        ADD R5, R3, -1
        BRp loop1       ;;   && size > 1)
copy:                   ;; }
        LDR R4, R2, 0   ;; c = *src
        BRz end         ;; if (c != '\0'
        ADD R5, R3, -1
        BRnz end        ;; && size > 1) {
cpyloop:STR R4, R1, 0   ;;   do { *dest = c
        ADD R1, R1, 1   ;;        dest += 1
        ADD R2, R2, 1   ;;        src += 1
        ADD R3, R3, -1  ;;        size -= 1
        LDR R4, R2, 0   ;;        c = *src 
        BRz end         ;;   } while (c != '\0'
        ADD R5, R3, -1
        BRp cpyloop     ;;   && size > 1)
end:                    ;; }
        AND R4, R4, 0
        STR R4, R1, 0   ;; *dest = '\0'
        RET             ;; return res

src1:   .STRINGZ "Hello, "
src2:   .STRINGZ "World!"

        ;; En considerant que les 12 prochaines addresses sont vides
dest:   .FILL 0
        .END
