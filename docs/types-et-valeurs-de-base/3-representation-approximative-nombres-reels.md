# Représentation approximative des nombres réels : notion de nombre flottant


On a vu dans un chapitre précédant comment représenter un nombre entier en binaire, par exemple $13_{10}$ s'écrit en binaire $1101_2$. Mais comment représenter les nombres réels, et à quoi correspondent des bits écrits après une virgule ?


Comme pour les nombres entiers, c'est la position qui indique le poids de chaque bit après la virgule, mais avec des puissances négatives de 2. Par exemple, les bits du nombre binaire $0,1011_2$ correspondent à :

|bits|1|0|1|1|
|:-:|:-:|:-:|:-:|:-:|
|i|-1|-2|-3|-4|
|$2^i$|$2^{-1} = {1 \over 2^1}  = 0,5$|$2^{-2} = {1 \over 2^2} = 0,25$|$2^{-3} = {1 \over 2^3} = 0.125$|$2^{-4} = {1 \over 2^4}=0.0625$|
|combinaison|$1 \times 2^{-1}=0,5$|$0 \times 2^{-2}=0$|$1 \times 2^{-3}=0,125$|$1 \times 2^{-4}=0.0625$|



$0,1011_2 = 1 × 2^{-1} + 0 × 2^{-2} + 1 × 2^{-3} + 1 × 2^{-4} = 0,6875_{10}$



!!! abstract "Cours" 

	De manière générale, un nombre $n <1 $ qui s'écrit dans le système binaire $0,b_{1}b_{2}b_{3}...$  (chaque $b_i$ est un bit valant 0 ou 1) a une valeur en base 10 égale à : 

    $n = b_{1} \times 2^{−1}  + b_{2} \times 2^{−2} + + b_{3} \times 2^{−3} + ...$  

ou encore, sans puissances négatives :
$n = b_1 \times {1 \over 2^1}  + b_2 \times {1 \over 2^2} + b_3 \times {1 \over 2^3} + ...$  


Bien sûr, on peut aussi compléter avec une partie entière comme vu précédemment : 

$1101,1011_2 = 13,6875_{10}$.


!!! question "Exercice corrigé" 
    Calculer la valeur en base 10 des nombres binaires suivants :

	- 0,0011
	- 1,10101
	- 101,1110011

	

??? Success "Réponse"
    
	$0,0011_2 = 1 \times 2^{-3} + 1 \times 2^{-4} = 0,125 +  0,0625 = 0,1875_{10}$
	
	$1,10101_2 = 1 \times 2^{0} + 1 \times 2^{-1} + 1 \times 2^{-3} + 1 \times 2^{-5} = 1 + 0,5 + 0,125 + 0,03125 = 1,65625_{10}$
	
	$101,1110011_2 = 1 \times 2^{2} +1 \times 2^{0} +1 \times 2^{-1} + 1 \times 2^{-2} + 1 \times 2^{-3} + 1 \times 2^{-6} + 1 \times 2^{-7} = 4+1+	0,5+0,25+0,125 + 0,015625 + 0,0078125=5,8671875_{10}$


Voyons maintenant comment passer de l'écriture décimale d'un nombre réel $n$ à son écriture binaire. Par exemple $13,6875_{10}$.


La partie entière, $13$, s'écrit en base 2 en effectuant une succession de division par 2 jusqu'à obtenir 0.  

![Divisions euclidiennes successives de 13 par 2](assets/1-13-divise-par-2-5-light-mode.png#only-light){width=25% align=right}
![Divisions euclidiennes successives de 13 par 2](assets/1-13-divise-par-2-5-dark-mode.png#only-dark){width=25% align=right}

-   Le reste de la division entière de 13 par 2 est 1 et le quotient 6.
-   Le reste de la division entière de 6 par 2 est 0 et le quotient 3.
-   Le reste de la division entière de 3 par 2 est 1 et le quotient 1.
-   Le reste de la division entière de 1 par 2 est 1 et le quotient 0.

On trouve l'écriture binaire de $13_{10}$  en lisant les restes des divisions de droite à gauche: $1101_2$.

Il faut maintenant écrire la partie factionnaire, $0,687$, en binaire.









De la même manière qu'on a utilisée précédemment pour trouver les bits d'un nombre entier par une succession de divisions entières par 2, on peut écrire une partie décimale $0,n$ sous sa forme binaire $0,b_{1}b_{2}b_{3}... en effectuant des **multiplications** par 2 :

- Le reste de la division entière de $n$ par $2$, `n % 2` en Python, renvoie $b_0$. Cela permet d'obtenir le dernier bit de l'écriture binaire de $n$.

- Le quotient de la division entière de $n$ par $2$, `n // 2` en Python, renvoie $b_{p−1}b_{p−2}...b_2b_1$. On remplace $n$ par ce nombre pour trouver les autres bits.


Il suffit alors de répéter l'opération jusqu'à ce que $n$ soit égal à 0, on aura bien obtenu tous les bits de l'écriture binaire de $n$. 

:warning: Attention, on obtient les bits de la gauche vers la droite.

Prenons l'exemple de $n_{10} = 13$,  le reste de la division entière par 2 est 1 et le quotient 6.

![Divisions euclidiennes successives de 13 par 2](assets/1-13-divise-par-2-1-light-mode.png#only-light){width=25% align=right}
![Divisions euclidiennes successives de 13 par 2](assets/1-13-divise-par-2-1-dark-mode.png#only-dark){width=25% align=right}

``` py
>>> 13 % 2
1
>>> 13 // 2
6
```

































Tout nombre réel comprend une partie entière et une partie décimale. Par exemple la partie entière du nombre $\pi$ est $3$ et sa partie décimale est $0,14159...$. On a étudié dans le chapitre précédant comment représenter la partie entière d'un nombre dans une base $b$. Ici on s'intéresse uniquement à la partie décimale, c'est-à-dire des nombres de la forme $0,...$.










Calculer sur quelques exemples la représentation de nombres réels : 0.1, 0.25 ou 1/3.

0.2 + 0.1 n’est pas égal à 0.3. Il faut éviter de tester l’égalité de deux flottants.
Aucune connaissance précise de la norme IEEE-754 n’est exigible.

