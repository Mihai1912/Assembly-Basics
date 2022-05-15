%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    xor edx , edx

    mov edx , 1

start:
    xor esi , esi 
    xor edi , edi
    mov si , [eax + (edx-1)*point_size] ;; se stocheaza in esi si edi coordonata x 
    mov di , [eax + edx*point_size]     ;; a punctelor

    cmp si , di ;; se compara daca acestea sunt egale 
    je sub_y ;; daca da se trece la cazul in care lungime se calculeaza cu ajutorul
             ;; coordonatelor y

    cmp si , di ;; se verifica daca x2 este mai mare decat x1
    jl x2_x1 ;; daca da se sare la x2_x1
    jmp x1_x2 ;; daca da se sare la x1_x2

x2_x1:
    sub di , si ;; se scade din x2 , x1 
    mov dword [ebx + (edx-1)*4] , edi ;; se adauga in vectorul de rezultate
    inc edx
    cmp edx , ecx ;; se compara daca s-au parcurs toate punctele
    je finish
    jmp start ;; daca nu se repeta procedeul

x1_x2:
    sub  si , di ;; se scade din x1 , x2
    mov dword [ebx + (edx-1)*4] , esi ;; se adauga in vectorul de rezultate
    inc edx
    cmp edx , ecx ;; se compara daca s-au parcurs toate punctele
    je finish
    jmp start ;; daca nu se repeta procedeul

sub_y:
    xor esi , esi 
    xor edi , edi

    mov si , [eax + (edx-1)*point_size + point.y] ;; se stocheaza in esi si edi coordonata y 
    mov di , [eax + edx*point_size + point.y]     ;; a punctelor

    cmp si , di ;; se verifica daca y2 este mai mare decat y1
    jl y2_y1 ;; daca da se sare la y2_y1
    jmp y1_y2 ;; daca da se sare la y1_y2

y2_y1:
    sub di , si ;; se scade din y2 , y1 
    mov dword [ebx + (edx-1)*4] , edi ;; se adauga in vectorul de rezultate
    inc edx
    cmp edx , ecx ;; se compara daca s-au parcurs toate punctele
    je finish
    jmp start ;; daca nu se repeta procedeul

y1_y2: 
    sub  si , di ;; se scade din y1 , y2 
    mov dword [ebx + (edx-1)*4] , esi ;; se adauga in vectorul de rezultate
    inc edx
    cmp edx , ecx ;; se compara daca s-au parcurs toate punctele
    je finish
    jmp start ;; daca nu se repeta procedeul


finish:
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY