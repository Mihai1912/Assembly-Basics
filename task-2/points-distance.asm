%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    xor ecx , ecx
    xor edx , edx    
    mov cx , [ebx + point]      ;; se stocheaza in ecx si edx coordonata x 
    mov dx , [ebx + point_size] ;; a punctelor

    cmp cx , dx ;; se compara daca acestea sunt egale 
    je aux ;; daca da se trece la cazul in care lungime se calculeaza cu ajutorul
           ;; coordonatelor y
    
    sub dx , cx ;; se calculeaza distanta
    mov [eax] , edx ;; se adauga in registrul destinatie

    jmp fin
aux:
    xor ecx , ecx
    xor edx , edx    
    mov cx , [ebx + point.y]              ;; se stocheaza in ecx si edx coordonata y 
    mov dx , [ebx + point_size + point.y] ;; a punctelor

    sub dx , cx ;; se calculeaza distanta
    mov [eax] , edx ;; se adauga in registrul destinatie

    jmp fin

fin:
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY