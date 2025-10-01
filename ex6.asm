section .data 
    fmt db "%d" , 0
    positif db "Positif" , 0
    negatif db "Negatif" , 0
section .bss
    val resd 1
section .text
    global main
    extern scanf , puts

main:
    push rbx
    push rbp
    push r12
    push r13
    push r14
    push r15
    sub rsp, 8              
    
    lea rdi, [fmt]          
    lea rsi, [val]             
    xor eax, eax
    call scanf

    mov eax, [val]              


; MÉTHODE 1 : TEST

    mov eax, [val]
    test eax, eax                   ; met à jour SF selon le signe
    js .neg1                        ; si SF=1 => négatif
    lea rdi, [positif]
    call puts
    jmp .end1
.neg1:
    lea rdi, [negatif]
    call puts
.end1:


; MÉTHODE 2 : CMP

    mov eax, [val]
    cmp eax, 0
    jl .neg2                        ; val < 0 => négatif
    lea rdi, [positif]
    call puts
    jmp .end2
.neg2:
    lea rdi, [negatif]
    call puts
.end2:

; MÉTHODE 3 : BT 

    mov eax, [val]
    bt eax, 31                      ; tester le bit de signe
    jc .neg3                        ; si CF=1 => négatif
    lea rdi, [positif]
    call puts
    jmp .end3
.neg3:
    lea rdi, [negatif]
    call puts
.end3:


; MÉTHODE 4 : SHR 

    mov eax, [val]
    shr eax, 31                     ; place le bit de signe dans bit0
    cmp eax, 0
    jne .neg4
    lea rdi, [positif]
    call puts
    jmp .end4
.neg4:
    lea rdi, [negatif]
    call puts
.end4:


; MÉTHODE 5 : SAR 

    mov eax, [val]
    sar eax, 31                    
    cmp eax, 0
    jne .neg5
    lea rdi, [positif]
    call puts
    jmp .end5
.neg5:
    lea rdi, [negatif]
    call puts
    
.end5:
    add rsp, 8
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbp
    pop rbx

    xor rax, rax
    ret
