section .data
    fmt db "%d",10, 0        ; : "%d" : pour les int 
    msg db "Decollage !", 0  

section .text
    global main            
    extern printf, puts      

main:
    mov rbx, 10              ; Initialise le compteur à 10

.loop:
    lea rdi, [rel fmt]       ; Charge l'adresse de la chaîne de format dans RDI 
    mov rsi, rbx             ; Place la valeur du compteur dans RSI 
    xor eax, eax             ; Met EAX à 0 avant l'appel à printf 
    call printf             

    dec rbx                  ; Décrémente le compteur de 1
    cmp rbx, 0               ; Compare le compteur à 0
    jge .loop                ; Si le compteur est ≥ 0, saute au début de la boucle pour continuer

    lea rdi, [rel msg]       ;  charge l'adresse de la chaîne "Decollage !" dans RDI 
    call puts                ; Appelle puts pour afficher "Decollage !"

    mov eax, 0              
    ret                     
