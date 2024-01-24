    ;; Sous-routine pour copier n éléments de la chaîne source dans la chaîne destination
    ;; @param R0 nombre de caractères à copier
    ;; @param R1 adresse de la chaîne source
    ;; @param R2 adresse de la chaîne destination
    ;; L’adresse de retour est dans R7
    ;; R3, R4 perdu
strncpy:    AND R0, R0, R0
            BRnz end            ; Vérification de n <= 0

loop:       LDR R3, R1, 0       ; Chargement dans R3 du caractère pointé par src
            STR R3, R2, 0       ; Écriture dans dst du caractère courant de src
            BRz pad_dst         ; Test de fin de la chaîne src
            ADD R1, R1, 1       ; Incrémentation du pointeur : src++
            ADD R2, R2, 1       ; Incrémentation du pointeur : dst++
            ADD R0, R0, -1      ; Décrémentation de n
            BRnp loop

end:        RET                 ; Retour par JMP R7

pad_dst:    AND R4, R4, 0       ; Mise à 0 du registre à écrire

pad_loop:   ADD R2, R2, 1       ; Incrémentation du pointeur : dst++
            ADD R0, R0, -1      ; Décrémentation de n
            BRz end
            STR R4, R2, 0       ; Remplissage du caractère null dans dst
            BR pad_loop
