    ;; Sous-routine pour ajouter un certain nombre de caractères de la chaîne source à la suite de la chaîne destination
    ;; @param R1 adresse de la chaîne destination
    ;; @param R2 adresse de la chaîne source
    ;; @param R3 nombre maximal de caractères à copier de la chaîne source
    ;; L’adresse de retour est dans R7
    ;; R0 perdu
            .ORIG x0000         ; Test
            LEA R1, dest        ; Test
            LEA R2, src         ; Test
            LD R3, size         ; Test
            JSR strncat         ; Test
            HALT                ; Test

strncat:    AND R3, R3, R3      ; Vérification de n <= 0
            BRnz end

    ;; Décalage du pointeur de dst pour atteindre le caractère nul
loop_shift: LDR R0, R1, 0
            BRz loop
            ADD R1, R1, 1
            BR loop_shift

loop:       LDR R0, R2, 0       ; Chargement dans R1 du caractère pointé par src
            STR R0, R1, 0       ; Écriture dans dst du caractère courant de src
            BRz end             ; Test de fin de la chaîne src
            ADD R1, R1, 1       ; Incrémentation du pointeur : dst++
            ADD R2, R2, 1       ; Incrémentation du pointeur : src++
            ADD R3, R3, -1      ; Décrémentation de size
            BRnp loop
            AND R0, R0, 0       ; Ajout du caractère nul à dst si n < len(src)
            STR R0, R1, 0

end:        RET                     ; Retour par JMP R7

; src:        .STRINGZ " World"
; dest:       .STRINGZ "Hello"
; size:       .FILL 10
; src:        .STRINGZ "Banana"
; dest:       .STRINGZ "Apple"
; size:       .FILL 3
; src:        .STRINGZ "Science"
; dest:       .STRINGZ "Computer"
; size:       .FILL 0
src:        .STRINGZ ""
dest:       .STRINGZ "Initial"
size:       .FILL 10
            .END
