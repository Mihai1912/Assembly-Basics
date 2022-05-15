%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
    
    xor eax , eax
add_step:
    mov bl , byte [esi+eax] ;; se muta prima litera din plain text in ebx
    add ebx , edx ;; se adauga step ul
    cmp bl , 'Z' ;; se verifica daca a trecut de Z
    jle aux ;; daca nu se baga litera respectiva in enc_string
    sub bl , 26 ;; daca da se scade 26 pt a ramane in alfabetul englez
aux:        
    mov [edi+eax] , bl 
    inc eax
    cmp eax , ecx ;; cat timp contorul(eax) est mai mic decat lungimea textului se repa ciclul
    jl add_step

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
