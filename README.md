simple.asm :

-se muta prima litera din plain text in ebx
-se adauga step ul
-se verifica daca a trecut de Z
-daca nu se baga litera respectiva in enc_string
-daca da se scade 26 pt a ramane in alfabetul englez
-cat timp contorul(eax) est mai mic decat lungimea textului se repa ciclul

points-distance.asm :

-se stocheaza in ecx si edx coordonata x a punctelor
-se compara daca acestea sunt egale 
-daca nu se calculeaza distanta si se calculeaza distanta
-daca da se trece la cazul in care lungime se calculeaza cu ajutorul coordonatelor y

raod.asm :

-se stocheaza in esi si edi coordonata x/y(dupa caz) a punctelor
-se compara daca acestea sunt egale (in cazul coordonatelor x)
-daca da se trece la cazul in care lungime se calculeaza cu ajutorul coordonatelor y
-daca nu se verifica daca x2 este mai mare decat x1
-se scad in functie de care este mai mare si se pun in vectorul de rezultate
-in mod similar se procedeaza si pentru coordonatele y

is_square.asm :

-se calculeaza patratele nr de la 1 pana cand se gaseste un patrat egal su mai mare decat nr 
cauta 
-calcularea patratelor se face prin adunare repetata a lui n de n ori
-daca nr este egal cu un patrat se seteaza 1 pe pozitia corespunzatoare in vectorul de rezultate
-daca nr este mai mic decat un patrat inseamna ca acesta nu este patrat perfect
si se seteaza 0 pe pozitia corespunzatoare in vectorul de rezultate

beaufort.asm :

-am observat regula ca daca atunci cand diferenta literei din cheie si a literei 
din plain text este pozitiva putem aduna 65 si se va obtine litera dorita , 
iar daca est enegativ sdunam 91 pentru a obtine litera dorita
-cu aceasta regula am lucrat lunand fiecare litera din plain text si fiecare litera din cheie
iar atunci cand cheia s-a terminat , iar textul nu de va lua cheia de la capat .
-dupa ce am obtinut litera rotita o pun in string(textul criptat)