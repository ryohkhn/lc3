    ;; Sous-routine pour calculer la longueur d’une chaîne terminée par ’\0’
    ;; @param R1 adresse de la chaîne
    ;; @return R0 longueur de la chaîne
    ;; L’adresse de retour est dans R7
    ;; R1, R2 perdu
strlen: AND R0, R0, 0           ; Mise à 0 du compteur : c = 0

loop:   LDR R2, R1, 0           ; Chargement dans R2 du caractère pointé par R1
        BRz end                 ; Test de fin de chaîne
        ADD R0, R0, 1           ; Incrémentation du compteur : c++
        ADD R1, R1, 1           ; Incrémentation du pointeur : p++
        BR loop

end:    RET                     ; Retour par JMP R7
