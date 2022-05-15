%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    xor edx , edx
    xor edi , edi
    xor esi , esi

    mov edx , 0 ; index din vectorul de distante
    mov edi , 1
    mov esi , 1

calc_edi:       ;; se aduna n cu el insusi de n ori 
    push edi    ;; petnru a calcula practic patratul acestuia
    push edx
    xor edx , edx
    mov edx , edi
    xor esi , esi
    mov dword esi , 1
    aux:
        cmp esi , edx
        jge fin_calc
        add edi , edx
        inc esi
        jmp aux
    fin_calc:
    xor edx , edx 
    pop edx

start:
    cmp dword [ebx + edx*4] , 0 ;; daca numarul care trebie varidicat este 0
    je set_sq_1                 ;; se va seta 1 pe pozitia din vectorul de rezultate
    cmp edi , [ebx + edx*4] ;; daca numarul care trebie varidicat este egal cu un patrat
    je set_sq_1             ;; calculat mai sus se va seta 1 pe pozitia din vectorul de rezultate
    cmp edi , [ebx + edx*4] ;; daca numarul care trebie varidicat este mai mic decat un patrat
    jg set_sq_0             ;;  se va seta 0 pe pozitia din vectorul de rezultate
    pop edi
    inc edi
    jmp calc_edi


set_sq_1: ;; se seteaza 1 pe pozitia numurului care a fost gasit ca fiin patrat perfect
    mov dword [ecx + edx*4] , 1
    inc edx
    pop edi
    cmp edx , eax 
    je finish
    xor edi , edi 
    mov dword edi , 1
    push edi
    jmp start

set_sq_0: ;; se seteaza 0 pe pozitia numurului care nu a fost gasit ca fiin patrat perfect
    mov dword [ecx + edx*4] , 0
    inc edx
    pop edi
    cmp edx , eax 
    je finish
    xor edi , edi 
    mov dword edi , 1
    push edi
    jmp start

finish:

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY