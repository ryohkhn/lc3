
;; Sous-routine pour concaténer la une chaîne source dans une autre
;; @param R1 adresse de la chaîne destination
;; @param R2 adresse de la chaîne source
;; @return R0 adresse de la chaîne destination
;; R3 perdu
        .ORIG 3000
        LEA R1, dest
        LEA R2, src1
        JSR strcat
        ADD R1, R0, 0
        LEA R2, src2
        JSR strcat
        HALT

strcat: ADD R0, R1, 0   ;; res = dest
        LDR R3, R1, 0   ;; c = *dest
        BRz copy        ;; if (c != '\0') {
loop1:  ADD R1, R1, 1   ;;   do { dest += 1
        LDR R3, R1, 0   ;;        c = *dest
        BRnp loop1      ;;   } while (c != '\0')
copy:                   ;; }
        LDR R3, R2, 0   ;; c = *src
        BRz end         ;; if (c != '\0') {
cpyloop:STR R3, R1, 0   ;;   do { *dest = c
        ADD R1, R1, 1   ;;        dest += 1
        ADD R2, R2, 1   ;;        src += 1
        LDR R3, R2, 0   ;;        c = *src
        BRnp cpyloop    ;;   } while (c != '\0')
end:                    ;; }
        STR R3, R1, 0   ;; *R1 = c ('\0')
        RET             ;; return res

src1:   .STRINGZ "Hello, "
src2:   .STRINGZ "World!"

        ;; En considerant que les 13 prochaines addresses sont vides
dest:   .FILL 0
        .END
