;; Sous-routine pour copier la une chaîne source dans une autre
;; @param R1 adresse de la chaîne destination
;; @param R2 adresse de la chaîne source
;; @return R0 adresse de la chaîne destination
;; R3 perdu
        .ORIG 3000
        LEA R1, dest
        LEA R2, src
        JSR strcpy
        HALT

strcpy: ADD R0, R1, 0   ;; res = dest
        LDR R3, R2, 0   ;; c = *src
        BRz end         ;; if (c != '\0') {
                     
loop:   STR R3, R1, 0   ;;   do { *dest = c
        ADD R1, R1, 1   ;;        dest += 1
        ADD R2, R2, 1   ;;        src += 1
        LDR R3, R2, 0   ;;        c = *src
        BRnp loop       ;;   } while (c != '\0')

end:    STR R3, R1, 0   ;; *R1 = c
        RET             ;; return res

src:    .STRINGZ "Hello, World!"
dest:   .STRINGZ "             "
        .END
