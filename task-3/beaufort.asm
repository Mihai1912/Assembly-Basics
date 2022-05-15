%include "../include/io.mac"

section .data
    index dw 0
    aux dw 0
    len_plain dd 0
    len_key dd 0

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
    xor edi , edi
    mov dword edi , 0

    mov dword [len_plain] , eax
    mov dword [len_key] , ecx

    xor eax , eax
    xor ecx , ecx

    mov dword eax , 0

    ;; edi index pt litera din plain text
    ;; esi index pt litera din cheie

    push esi 

    xor esi , esi 
    mov dword esi , 0

start:
    xor eax , eax
    xor ecx , ecx
    cmp edi , [len_plain]  ;; se verifica daca s-au parcurs toate litere din plain text
    je finish 
    cmp esi , [len_key] ;; se cicleaza cheia
    je reset_index_key
rev:
    mov al , [ebx + edi*1] ;; litera n din plain text
    mov cl , [edx + esi*1] ;; litera n din cheie
    sub ecx , eax
    cmp ecx , 0
    jge sub_poz
    jmp sub_neg


sub_poz:
    add ecx , 65 ;; se calculeaza liera
    mov dword [index] , esi
    xor esi , esi
    pop esi
    mov [esi + edi*1] , ecx ;; se baga cheia rotitat in textul criptat
    push esi 
    xor esi , esi 
    mov dword esi , [index]
    inc esi 
    inc edi
    jmp start

sub_neg:
    add ecx , 91 ;; se calculeaza liera
    mov dword [index] , esi
    xor esi , esi
    pop esi
    mov [esi + edi*1] , ecx ;; se baga cheia rotitat in textul criptat
    push esi
    xor esi , esi
    mov dword esi , [index]
    inc esi
    inc edi
    jmp start

reset_index_key: ;; se cicleaza cheia
    xor esi , esi
    mov dword esi , 0
    jmp rev

finish:
    pop esi ;; se eliberaza stiva
    
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
