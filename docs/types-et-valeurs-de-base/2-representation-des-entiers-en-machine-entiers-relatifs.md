# Représentation des entiers en machine, entiers relatifs

## Représentation en machine et dépassement

En Python, le type `int` permet de représenter des nombre entiers de taille arbitraire (*Big Integers*) sans limite de taille. Lorsqu'on stocke un entier dans une variable, Python alloue dynamiquement de la mémoire pour contenir tous les bits nécessaires à la représentation du nombre. Cela permet d'effectuer des calculs avec des nombres extrêmement grands, limités uniquement par la mémoire disponible sur votre machine.

``` py
>>> 2**100
1267650600228229401496703205376
>>> 2**100 * 3**50 
910043815000214977332758527534256632492715260325658624
```


Mais ce n'est pas le cas de tous les langages informatiques. Dans la plupart des langages (C, Java, etc.), **les entiers sont généralement stockés dans un nombre de bits fixe prédéfini**. Les tailles standard sont des puissances de 2 en bits, correspondant souvent à la taille des registres du processeur, souvent 32 ou 64 bits. 

L'utilisation d'une taille fixe pose le problème du **dépassement** (*overflow*). Lorsqu'une opération arithmétique (comme l'addition ou la multiplication) produit un résultat qui sort de la plage de valeurs permise par le nombre de bits alloué, il y a dépassement. 

Prenons l'exemple d'une addition de deux entiers naturels stockés sur 8 bits : $150+150=300$. L'ordinateur effectue le calcul suivant en binaire : $​1001\ 0110 ​ +1001\ 0110 ​= 1\ 0010\ 1100_2$. ​Le premier bit (dit de  « poids fort ») du résultat calculé est $1$, mais il dépasse la capacité de stockage de 8 bits, il est donc ignoré. L'ordinateur ne garde que les 8 derniers bits, $00101100$, c'est-à-dire $44_{10}$ ce qui est faux. 


Si des types *Big Integer* équivalents à `int` en Python existent dans d'autres langages informatiques, il ne doivent pas toujours être utilisés. En effet, ils offrent l'avantage d'éliminer les erreurs de dépassement, mais les opérations sont plus lentes que les opérations natives d'un processeur sur des tailles fixes, car elles nécessitent plus d'instructions logicielles et de gestion de mémoire. Il est donc important de comprendre le nombre de bits utilisés pour choisir un type d'entier adapté à la taille des nombres manipulés.

## Nombres de bits

On a vu précédemment qu'un nombre qui s'écrit dans le système binaire avec $n$ bits $b_{n−1}b_{n−2}...b_2b_1b_0$  (chaque $b_i$ est un bit valant 0 ou 1) a une valeur décimale égale à : 

$b_{n−1} \times 2^{n−1}  + b_{n−2} \times 2^{n−2} + ... +  b_2 \times 2^2 + b_1 \times 2^1  + b_0 \times 2^0$

ou encore avec la formule mathématique d'une somme de $0$ à $n-1$ :
$\sum_{i=0}^{n-1} b_i × 2^i$

On peut écrire les 2 nombres 0 et 1 avec 1 seul bit, 4 nombres allant de 0 à 3 avec 2 bits, 8 nombres allant de 0 à 7 avec 3 bits, ... $2^n$ nombres allant de 0 à $2^n-1$ avec $n$ bits.

!!! abstract "Cours" 

	Avec $n$ bits, on peut écrire $2^n$ nombres entiers naturels (**positifs**), allant de $0$ à $2^n-1$.

!!! question "Exercice corrigé" 

	1. En C, le type `unsigned short int` permet de stocker les entiers positifs sur 2 octets (16 bits). Quel est le plus grand nombre entier accepté ?

	2. On donne les puissances de 2 suivantes : $2^0 = 1, 2^1 = 2, 2^2 = 4, 2^3 = 8, 2^4 = 16, 2^5 = 32, 2^6 = 64, 2^7 = 128,  2^8 = 256$.     Combien de bits doit-on utiliser au minimum pour représenter le nombre entier 72 ?


??? Success "Réponse"
    
	1. $2^{16}-1 = 65535$

	2. 7 bits permettent de représenter les 128 nombres allant de 0 à 127.

### Nombre de bits nécessaires pour une somme et un produit

![Nombre de bits d'une somme](assets/2-nombre-de-bits-somme-light-mode.png#only-light){width=15% align=right}
![Nombre de bits d'une somme](assets/2-nombre-de-bits-somme-dark-mode.png#only-dark){width=15% align=right}



Si on additionne deux nombres entiers qui s'écrivent respectivement dans le système binaire avec $p$ et $q$ bits, la somme s'écrit avec le plus grand nombre de bits entre $p$ et $q$ plus 1 pour prendre en compte le cas d'une retenue sur le bit de poids le plus fort :

$bits(a + b) ≤ max(bits(a), bits(b)) + 1$

où $bits(n)$ est le nombre de bits nécessaires pour écrire $n$ en binaire.


Prenons par exemple $a = 13$ et $b = 7$. On sait que les nombre $13$ s'écrit sur 4 bits car il est inférieur ou égal à $2^4 - 1  = 15$ et le nombre $7$ s'écrit sur 3 bits car il est inférieur ou égal à $2^3 -1 = 7$. La somme de $a$ et $b$ s'écrit donc sur $max(4, 3) + 1 = 5$ bits ou moins. En effet $a + b = 20$ et $20$ est inférieur ou égal à $2^5 - 1 = 31$.


$a = 13$ (4 bits) et $b = 7$ (3 bits).

$a + b = 20$, et  $20 < 2^5$ ($2^5 = 32$), donc 5 bits suffisent.

![Nombre de bits d'un produit](assets/2-nombre-de-bits-produit-light-mode.png#only-light){width=25% align=right}
![Nombre de bits d'un produit](assets/2-nombre-de-bits-produit-dark-mode.png#only-dark){width=25% align=right}


De la même façon, si on multiplie deux nombres entiers qui s'écrivent respectivement dans le système binaire avec $p$ et $q$ bits, on obtient le produit en ajoutant jusqu'à $q-1$ bits aux $p$ bits du premier nombre auxquels il faut encore ajouter 1 1 pour prendre en compte le cas d'une retenue sur le bit de poids le plus fort. Le produit s'écrit donc avec au maximum $p+q$ bits :

$bits(a×b) ≤ bits(a) + bits(b)$


!!! abstract "Cours" 

    Si a et b sont deux nombres entiers, le nombre de bits nécessaire pour écrire leur somme et leur produit est au maximum :

    - $bits(a + b) \leq max(bits(a), bits(b)) + 1$
    
    - $bits(a \times b) \leq bits(a) + bits(b)$

    où $bits(n)$ est le nombre de bits nécessaires pour écrire $n$ en binaire.




Exemple :

Si $a = 13$ (4 bits) et $b = 7$ (3 bits).

$a + b = 20$ et  $20 <= 2^5 - 1$ ($2^5 = 32$), donc 5 bits suffisent.

$a \times b = 91$ et $91 <= 2^7 - 1$ ($2^7 = 128$), donc 7 bits suffisent.


!!! question "Exercice corrigé" 

    Si $a = 200$ et  $b = 58$, combien de bits au maximum sont nécessaires pour écrire  $a + b$ ? Pour  $a \times b$ ?

??? Success "Réponse"

    a s'écrit avec 8 bits car $200 < 2^8$ ($2^8 = 256$), b s'écrit avec 6 bits car $58 < 2^6$ ($2^6 = 64$),  donc   $a + b$ s'écrit avec au maximum 9 bits et $a \times b$ avec 14 bits.
    



## Représentation binaire des entiers relatifs

On a vu comment les ordinateurs peuvent représenter naturellement les entiers positifs en binaire. Mais comment faire pour les entiers relatifs qui peuvent être positifs ou négatifs ? En informatique on dit que ces entiers sont **signés**, car ils ont un signe  « + » ou  « - ». Dans ce cas, il faut une convention et la plus utilisée est celle du complément à 2, car elle permet de simplifier les calculs en ne distinguant pas le signe et de la valeur. 

### Principe du complément à 2

On a vu qu'avec $n$ bits on peut représenter les $2^n$ entiers positifs entre $0$ et $2^n - 1$. Par exemple sur 4 bits, on peut représenter les 16 (=$2^4$) entiers positifs compris entre 0 et 15 :

|0000|0001|0010|0011|0100|0101|0110|0111|1000|1001|1010|1011|1100|1101|1110|1111|
|:-: |:-: |:-: |:-: |:-: |:-: |:-: |:-: |:-: |:-: |:-: |:-: |:-: |:-: |:-: |:-: |
|0   |1   |2   |3   |4   |5   |6   |7   |8   |9   |10  |11  |12  |13  |14  |15  |

L'idée du complément à 2 et de partager la plage de nombres binaires disponibles sur n bits en deux parties : 

-   La première moitié contenant les $2^{n-1}$ premiers nombres binaires pour représenter les entiers positifs entre 0 et $2^{n-1} - 1$. Par exemple sur 4 bits :

    |0000|0001|0010|0011|0100|0101|0110|0111|
    |:-: |:-: |:-: |:-: |:-: |:-: |:-: |:-: |
    |0   |1   |2   |3   |4   |5   |6   |7   |


-   La seconde moitié contenant les $2^{n-1}$ nombres binaires suivants pour représenter les entiers positifs entre $-2^{n-1}$ et $-1$. Par exemple sur 4 bits :

    |1000|1001|1010|1011|1100|1101|1110|1111|
    |:-: |:-: |:-: |:-: |:-: |:-: |:-: |:-: |
    |-8  |-7  |-6  |-5  |-4  |-3  |-2  |-1  |

Autrement dit, on ajoute $2^n$ aux nombres négatifs pour obtenir leur représentation binaire. Par exemple sur 4 bits :

- $-1$ est représenté par $-1 + 16 = 15$ en binaire : 1111.
- $-2$ est représenté par $-2 + 16 = 14$ en binaire : 1110.
- ...
- $-8$ est représenté par $-8 + 16 = 8$ en binaire : 1000.

Noter que le complément à 2 permet d'identifier immédiatement le signe d'un nombre en observant son premier bit :  $0$ pour less nombres négatifs, $1$ pour les positifs. C'est le « **bit de signe** ».



### Plage de valeurs

On peut toujours représenter $2^n$ nombres entiers relatifs sur n bits, mais à la différence des nombres positifs, les entiers représentés par le complement à deux vont de $−2^{n-1}$ à $2^{n-1}-1$.

!!! abstract "Cours" 
    Avec $n$ bits, on peut écrire $2^n$ nombres entiers **relatifs**, allant de  $−2^{n-1}$ à $2^{n-1}-1$.


Noter qu'il y a un entier de plus en négatif qu'en positif car $0$ est représenté avec les positifs.

Exemple :

|n bits|Plage d'entiers naturels (non signés)|Plage d'entiers relatifs (complément à 2)|
|:-:|:-:|:-:|
|4 bits|$[0, 2^4 - 1] = [0, 15]$|$[-2^3, 2^3 - 1] = [-8, 7]$|
|8 bits|$[0, 2^8 - 1] = [0, 255]$|$[-2^7, 2^7 - 1] = [-128, 127]$|
|16 bits|$[0, 2^{16} - 1] = [0, 65\ 535]$|$[-2^{15}, 2^{15} - 1] = [-32\ 768, 32\ 767]$|
|32 bits|$[0, \approx 4,29 \times 10^9]$|$[\approx -2,14 \times 10^9, \approx 2,14 \times 10^9]$|
|64 bits|$[0, \approx 1,84 \times 10^{19}]$|$[\approx -9,22 \times 10^{18}, \approx 9,22 \times 10^{18}]$|



### Avantage du complément à 2


L'avantage du complément à 2 est d'encoder les entiers relatifs de telle façon que la somme des bits d'un nombre et de son opposé donne bien un ensemble de bits à 0.

Par exemple $5_{10}$ = $0101_{2}$ et $−5_{10}$ = $1011_{2}$ donne $−5_{10} + 5_{10}$ = $1011_{2} + 0101_{2}$ = $0000_{2}$ (noter que la dernière retenue disparait sur 4 bits). Cela permet d'effectuer toutes les opérations d’addition et de soustraction sur des entiers relatifs de la même façon que pour les entiers positifs, sans distinction du signe des nombres (tant qu’on reste dans la plage $[−2^{n-1}, 2^{n-1}-1]$).

Par exemple, calculons −5 + 2 comme le ferait un ordinateur sur 4 bits :

- −5 sur 4 bits : 1011

- 2 sur 4 bits : 0010

- Somme binaire : 1011 + 0010 = 1101. On obtient le résultat attendu, −3 !


### Écrire d'un nombre décimal en binaire sur n bits

!!! abstract "Cours"

    Les entiers **positifs** (y compris 0) s'écrivent comme d’habitude en binaire. On a juste un bit en moins pour stocker la valeur du nombre. Sur un octet (8 bits), on a donc 1 bit de signe et 7 bits de valeur.

    Les entiers **négatifs** s'écrivent en complément à 2 avec la règle suivante :

    1. Écrire en binaire le nombre positif correspondant.

    2. Faire un « **complément à 1** »  qui consiste à inverser tous les bits :
        -   0  devient  1 
        -   1  devient  0 

    3.  Rajouter 1 (en ignorant le dépassement éventuel).

Par exemple, pour coder -5 sur 4 bits : 

1. 5 en binaire → 0101
2. Complément à 1 → 1010
3. +1 → 1011

Donc -5 s'écrit 1011 sur 4 bits.

Noter que sur 8 bits (1 octet) on obtient  :

1. 5 en binaire → 0000 0101
2. Complément à 1 → 1111 1010
3. +1 → 1111 1011


!!! question "Exercice corrigé" 

	Écrire -26 en binaire sur 1 octet  ?



??? Success "Réponse"
    1. 26 en binaire  → 0001 1010
    2. Complément à 1 → 1110 0101
    3. +1 → 1110 0110

    Donc -26 s'écrit 1110 0110 sur 1 octet.
	


### Écrire d'un nombre binaire en décimal sur n bits

Pour retrouver la valeur décimale d'un nombre binaire, on commence par regarder le premier bit, le bit de signe :

- si le premier bit est 0, c'est un nombre positif, on décode comme s'il s'agissait d'un entier naturel.

- si le premier bit est 1, c'est donc un nombre négatif, on applique la règle suivante :

    1.  Faire un « **complément à 1** »  qui consiste à inverser tous les bits :
        -   0  devient  1 
        -   1  devient  0 

    2.  Rajouter 1 (en ignorant le dépassement éventuel).

    3.  Décoder le nombre binaire et prendre son opposé.

Exemple : Trouver la valeur décimale du nombre binaire 1110 0111

Le premier bit est 1, c'est donc un nombre négatif

1. Complément à 1 → 0001 1000
2. +1 → 0001 1001
3. 0001 1001 → $2^4 + 2^3 + 2^0 = 16 + 8 + 1 = 25$

1110 0111 est donc -25.


https://www.infoforall.fr/act/donnees/encodage-des-entiers-relatifs/


