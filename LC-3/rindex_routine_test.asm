    ;; Sous-routine pour calculer l’adresse de la dernière apparition d’un caractère dans une chaîne
    ;; @param R1 adresse de la chaîne
    ;; @param R2 code du caractère
    ;; @return R0 l'adresse du caractère trouvé
    ;; L’adresse de retour est dans R7
    ;; R3, R4 perdu
        .ORIG x0000             ; Test
        LEA R1, string          ; Test
        LD  R2, char            ; Test
        JSR rindex              ; Test
        HALT                    ; Test

rindex: AND R0, R0, 0           ; Mise à 0 de la valeur de retour

loop:   LDR R3, R1, 0           ; Chargement dans R3 du caractère pointé par R1
        BRz end                 ; Test de fin de chaîne
        NOT R3, R3
        ADD R3, R3, 1           ; Inversement de la valeur du caractère courant
        ADD R4, R3, R2          ; Test d'égalité du caractère cherché
        BRz found
        ADD R1, R1, 1           ; Incrémentation du pointeur : p++
        BR loop

found:  AND R0, R0, 0           ; Mise à 0 de la valeur de retour
        ADD R0, R0, R1          ; Chargement dans R0 de l'adresse du caractère recherché
        ADD R1, R1, 1           ; Incrémentation du pointeur : p++
        BR loop

end:    RET                     ; Retour par JMP R7

string: .STRINGZ "Hello world"  ; Test
char:   .STRINGZ "l"            ; Test
        .END
