section .data 
    A db -10 ; Déclare un entier signé 8 bits A
    msg1 db "A est strictement positif" , 0
    msg2 db "A est strictement negatif" , 0
    msg3 db "A est null" , 0

section .text
global main
    extern puts
main:

    mov al,[rel A]
    cmp al,0           ; Compare AL à 0
    jg grande          ; Si A > 0, saute à l'étiquette 'grande' 
    jl petite           ; A < 0  saute à l'étiquette 'petite'
 
    lea rdi , [rel msg3]     ;Sinon A == 0 : charge l'adresse du message msg3 dans RDI
    call puts                ;  Appelle puts pour afficher 
    jmp end                  ; Saute à la fin du programme
grande:
    lea rdi , [rel msg1]     
    call puts
    jmp end
petite:
    lea rdi , [rel msg2]
    call puts

end: 
    mov eax,0
    ret

