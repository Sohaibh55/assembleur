section .data
    fmt_in db "%d" , 0
    fmt_out2 db "%x",10 , 0
    fmt_out1 db "%d",10 , 0
    msg db "Il y a eu un dépassement"
section .bss
    val1 resb 1
    val2 resb 1

section .text
    global main
    extern puts,printf,scanf
main:
    
    push rbx     ; -8
    push rbp     ; -8
    push r12     ; -8
    push r13     ; -8
    push r14     ; -8
    push r15     ; -8 = -48 % 16 = 0
   
    sub rsp, 8   


    lea rdi , [fmt_in]
    lea rsi , [val1]
    call scanf

    lea rdi , [fmt_in]
    lea rsi , [val2]
    call scanf

    movzx eax ,byte[val1] 
    movzx ebx ,byte[val2] 
    add eax , ebx

    cmp eax,255
    ja overflow

    lea rdi , [fmt_out1]
    mov esi , eax
    xor eax , eax 
    call printf
    jmp end
    
overflow:
    lea rdi , [msg]
    call puts    

end:
    add rsp, 8
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbp
    pop rbx

    xor rax, rax ; return 0
    ret