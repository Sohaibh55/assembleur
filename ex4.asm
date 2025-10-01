section .data
    A db 0
    B db 20
    C db 10
    fmt db "%d", 10, 0    

section .text
    global main
    extern printf

main:
    push rbx
    push rbp
    push r12
    push r13
    push r14
    push r15
    sub rsp, 8              
    mov al, [A]
    mov bl, [B]
    cmp al, bl
    jl next_cmp             ; if A < B, on doit aller comparer A avec C

    mov cl, [C]
    cmp cl, bl
    jl afficher_c            ; if C < B => C est  min

    movzx eax, byte [B]     ; else B est min
    lea rdi, [rel fmt]
    mov esi, eax
    xor eax, eax
    call printf
    jmp end 

next_cmp:
    mov cl, [C]
    cmp al, cl
    jg afficher_c            ; if C < A => C est min

    movzx eax, byte [A]     ; else A est min
    lea rdi, [rel fmt]
    mov esi, eax
    xor eax, eax
    call printf
    jmp end

afficher_c:
    movzx eax, byte [C]
    lea rdi, [rel fmt]
    mov esi, eax
    xor eax, eax
    call printf

end:
    add rsp, 8
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbp
    pop rbx

    xor rax, rax
    ret
