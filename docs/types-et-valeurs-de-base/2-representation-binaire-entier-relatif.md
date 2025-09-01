# Représentation binaire d’un entier relatif


## Nombres de bits

On a vu qu'un nombre $n$ qui s'écrit dans le système binaire avec $p$ bits $b_{p−1}b_{p−2}...b_2b_1b_0$  (chaque $b_i$ est un bit valant 0 ou 1) a une valeur décimale égale à : 

$n = b_{p−1} \times 2^{p−1}  + b_{p−2} \times 2^{p−2} + ... +  b_2 \times 2^2 + b_1 \times 2^1  + b_0 \times 2^0$

ou encore avec la formule mathématique d'une somme de $0$ à $p-1$ :
$n = \sum_{i=0}^{p-1} b_i × 2^i$

!!! abstract "Cours" 

	On peut écrire les 2 nombres 0 et 1 avec 1 seul bit, 4 nombres allant de 0 à 3 avec 2 bits, 8 nombres allant de 0 à 7 avec 3 bits, ... $2^p$ nombres allant de 0 à $2^p-1$ avec $p$ bits.

!!! question "Exercice corrigé" 

	1. Quel est le plus grand nombre décimal représentable en binaire sur 16 bits (2 octets) ?

	2. Combien de bits doit-on utiliser au minimum pour représenter en base 2 le nombre entier 72 ?


??? Success "Réponse"
    
	1. $2^{16}-1 = 65535$

	2. 7 bits permettent de représenter les 128 nombres allant de 0 à 127.

### Nombre de bits nécessaires pour une somme

Si on additionne deux nombres entiers qui s'écrivent respectivement dans le système binaire avec $p$ et $q$ bits, la somme s'écrit avec le plus grand nombre de bits entre $p$ et $q$ plus 1 pour prendre en compte le cas d'une retenue sur le bit de poids le plus fort :

$bits(a + b) ≤ max(bits(a), bits(b)) + 1$

où $bits(n)$ est le nombre de bits nécessaires pour écrire $n$ en binaire.


De la même façon, si on multiplie deux nombres entiers qui s'écrivent respectivement dans le système binaire avec $p$ et $q$ bits, le produit s'écrit avec $p+q$ bits :

$bits(a×b) ≤ bits(a) + bits(b)$


!!! abstract "Cours" 

    Si a et b sont deux nombres entiers, le nombre de bits nécessaire pour écrire leur somme et leur produit est au maximum :

    - $bits(a + b) \leq max(bits(a), bits(b)) + 1$
    
    - $bits(a \times b) \leq bits(a) + bits(b)$

    où $bits(n)$ est le nombre de bits nécessaires pour écrire $n$ en binaire.




Exemple :

Si $a = 13$ (4 bits) et $b = 7$ (3 bits).

$a + b = 20$, et  $20 < 2^5$ ($2^5 = 32$), donc 5 bits suffisent.

$a \times b = 91$. Or $91 < 2^7$ ($2^7 = 128$), donc 7 bits suffisent.


!!! question "Exercice corrigé" 

    Si $a = 200$ et  $b = 58$, combien de bits au maximum sont nécessaires pour écrire  $a + b$ ? Pour  $a \times b$ ?

??? Success "Réponse"

    a s'écrit avec 8 bits car $200 < 2^8$ ($2^8 = 256$), b s'écrit avec 6 bits car $58 < 2^6$ ($2^6 = 64$),  donc   $a + b$ s'écrit avec au maximum 9 bits et $a \times b$ avec 14 bits.
    

## Complément à 2

En binaire, les ordinateurs savent représenter naturellement les entiers positifs. Mais pour les entiers relatifs (positifs et négatifs), il faut une convention. L’une des plus utilisées est le complément à 2, car elle simplifie les calculs (pas besoin de distinguer signe et valeur).

### Principe du complément à 2
a) Représentation sur n bits

- Un entier est codé sur n bits.

- Les entiers positifs (y compris 0) se codent comme d’habitude en binaire.

- Pour les entiers négatifs, on utilise la règle suivante : $ x<0⇒code(x)=2^n+x$. C’est-à-dire qu’on ajoute $2^n$ au nombre négatif.

Exemple sur 4 bits : Capacité : de −8 à +7.

|Décimal|Binaire (complément à 2)|
|:-:|:-:|
|-8|1000|
|-7|1001|
|-6|1010|
|-5|1011|
|-4|1100|
|-3|1101|
|-2|1110|
|-1|1111|
|0|	0000|
|1|	0001|
|2|	0010|
|3|	0011|
|4|	0100|
|5|	0101|
|6|	0110|
|7|	0111|

### Comment calculer le complément à 2 d’un nombre négatif ?

Pour trouver la représentation binaire en complément à 2 d’un entier négatif :

1. Écrire sa valeur absolue en binaire sur n bits.
2. Prendre le complément à 1 (inverser tous les bits).
3. Ajouter 1.

Exemple : coder  −5 sur 4 bits

1. 5 = 0101
2. Complément à 1 → 1010
3. +1 → 1011

Donc 
−5 = 1011 (comme dans le tableau).

### Avantage du complément à 2

Les opérations d’addition et de soustraction fonctionnent de la même façon que pour les entiers positifs.
Les opérations arithmétiques s’effectuent sans distinction, comme avec des entiers positifs.

On ne distingue plus les cas : la machine effectue les calculs en binaire et le résultat est correct tant qu’on reste dans la plage 
$[−2^{n-1}, 2^{n-1}-1]$.

Exemple sur 4 bits :
−3+2=−1

−3 = 1101 + 2 = 0010

Somme binaire : 1101 + 0010 = 1111


1111 = −1.

5. Plage de valeurs

Sur n bits, le complément à 2 permet de représenter : 
$[−2^{n-1}, 2^{n-1}-1]$

Exemple :

- Sur 4 bits : [−8,+7]
- Sur 8 bits : [−128,+127]
- Sur 32 bits :  $[−2^31, ,+2^31 −1]$






## Tailles courantes
Il s’agit de décrire les tailles courantes des entiers (8, 16, 32 ou 64 bits). Il est possible d’évoquer 
la représentation des entiers de taille arbitraire de Python.