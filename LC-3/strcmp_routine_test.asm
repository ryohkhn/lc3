    ;; Sous-routine pour comparer deux chaînes de caractères
    ;; @param R1 adresse de la première chaîne
    ;; @param R2 adresse de la seconde chaîne
    ;; @return R0 une valeur négative, positive ou zéro
    ;; si la chaîne R1 est plus petite, plus grande ou égale à la chaîne R2
    ;; L’adresse de retour est dans R7
    ;; R3, R4 perdu
        .ORIG x0000             ; Test
        LEA R1, s1              ; Test
        LEA R2, s2              ; Test
        JSR strcmp              ; Test
        HALT                    ; Test

strcmp: AND R0, R0, 0           ; Mise à 0 de la valeur de retour

loop:   LDR R3, R1, 0           ; Chargement dans R3 du caractère pointé par R1
        LDR R4, R2, 0           ; Chargement dans R4 du caractère pointé par R2
        BRz zero                ; Test de fin de chaîne
        NOT R4, R4
        ADD R4, R4, 1           ; Inversement de la valeur du caractère de R2
        ADD R0, R3, R4          ; Test d'égalité des caractères de R1 et R2
        BRnp end
        ADD R1, R1, 1           ; Incrémentation du pointeur : s1++
        ADD R2, R2, 1           ; Incrémentation du pointeur : s2++
        BR loop

zero:   AND R0, R0, 0           ; Mise à 0 de la valeur de retour
        NOT R4, R4
        ADD R4, R4, 1           ; Inversement de la valeur du caractère de R2
        ADD R0, R3, R4          ; Test d'égalité des caractères de R1 et R2

end:    RET                     ; Retour par JMP R7

s1:     .STRINGZ "apple"        ; Test
s2:     .STRINGZ "applepie"     ; Test
        .END
