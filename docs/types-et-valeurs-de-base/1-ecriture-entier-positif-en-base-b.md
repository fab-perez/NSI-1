# Écriture d’un entier positif dans une base b >= 2

## Système décimal ou base 10

Dans le système décimal, on écrit les nombres à l'aide de nos 10 chiffres bien connus : 0, 1, 2, 3, 4, 5, 6, 7, 8 et 9. 

C'est la position du chiffre dans l'écriture d'un nombre qui indique sa valeur. Par exemple, le nombre qui s'écrit 2083 est égal à 2 milliers plus 8 dizaines plus 3 unités. 
Il n'a pas la même valeur que 8320, même s'il s'écrit avec les mêmes chiffres 0, 2, 8 et 3.

Tout nombre entier naturel peut s’écrire comme combinaison linéaire de puissance de 10. Par exemple :

|i|3|2|1|0|
|:-:|:-:|:-:|:-:|:-:|
|$10^i$|$10^3$|$10^2$|$10^1$|$10^0$|
|combinaison|$2 \times 10^3$|$0 \times 10^2$|$8 \times 10^1$|$3 \times 10^0$|

$2083 = 2 \times 10^3 + 0 \times 10^2 + 8 \times 10^1 + 3 \times 10^0$

De manière générale, le nombre $n$ qui s'écrit dans le système décimal avec $p$ chiffres $d_{p−1}d_{p−2}...d_2d_1d_0$  (chaque $d_i$ est un chiffre valant entre 0 et 9) est égal à : 

$n = d_{p−1} \times 10^{p−1}  + d_{p−2} \times 10^{p−2} + ... +  d_2 \times 10^2 + d_1 \times 10^1 + d_0 \times 10^0$

ou encore avec la formule mathématique d'une somme de $0$ à $p-1$ :
$n = \sum_{i=0}^{p-1} d_i × 10^i$


Réciproquement, on peut écrire chacun des chiffres d'un nombre décimal $n$ qui s'écrit dans le système décimal avec $p$ chiffres $d_{p−1}d_{p−2}...d_2b_1d_0$ par un algorithme simple qui consiste à effectuer une succession de divisions entières par 10  :

!!! notetip inline end "" 
	L'opérateur de division entière ```//``` et l’opération modulo ```%``` utilisés avec des entiers (de type ```int```) donnent respectivement le quotient et le reste d'une division euclidienne : si `a` et `b` sont des entiers tels que $a = b \times q + r$,  alors ```a // b``` renvoie $q$ et ```a % b``` renvoie $r$.


- Le reste de la division entière de $n$ par $10$, `n%10` en Python, renvoie $d_0$.

- Le quotient de la division entière de $n$ par $10$, `n//10` en Python, renvoie $d_{p−1}d_{p−2}...d_2d_1$.

On répète l'algorithme jusqu'à ce que $n$ soit égal à $0$ pour obtenir tous les chiffres.

Par exemple, pour retrouver tous les chiffres du nombre 2083, le reste de la division entière par 10 est 2 et le quotient 208.

![Divisions euclidiennes successives de 2083 par 10](assets/1-2083-divise-par-10-1-light-mode.png#only-light){width=25% align=right}
![Divisions euclidiennes successives de 2083 par 10](assets/1-2083-divise-par-10-1-dark-mode.png#only-dark){width=25% align=right}

``` py
>>> 2083%10
3
>>> 2083//10
208
```

On a déjà trouvé le dernier chiffre 3. Continuons avec 208. Le reste de la division entière de 208 par 10 est 8 et le quotient 20.

![Divisions euclidiennes successives de 2083 par 10](assets/1-2083-divise-par-10-2-light-mode.png#only-light){width=25% align=right}

![Divisions euclidiennes successives de 2083 par 10](assets/1-2083-divise-par-10-2-dark-mode.png#only-dark){width=25% align=right}

``` py
>>> 208%10
8
>>> 208//10
20
```

On obtient le 8. Continuons avec 20. Le reste de la division entière de 20 par 10 est 0 et le quotient 2.

![Divisions euclidiennes successives de 2083 par 10](assets/1-2083-divise-par-10-3-light-mode.png#only-light){width=25% align=right}
![Divisions euclidiennes successives de 2083 par 10](assets/1-2083-divise-par-10-3-dark-mode.png#only-dark){width=25% align=right}

``` py
>>> 20%10
0
>>> 20//10
2
```

On obtient le 0. Continuons avec 2. Le reste de la division entière de 2 par 10 est 2 et le quotient 0.

![Divisions euclidiennes successives de 2083 par 10](assets/1-2083-divise-par-10-4-light-mode.png#only-light){width=25% align=right}
![Divisions euclidiennes successives de 2083 par 10](assets/1-2083-divise-par-10-4-dark-mode.png#only-dark){width=25% align=right}


``` py
>>> 2%10
2
>>> 2//10
0
```
On a obtenu le dernier chiffre 2.  Le quotient est 0, inutile de continuer les division, tous les chiffres sont là.


![Divisions euclidiennes successives de 2083 par 10](assets/1-2083-divise-par-10-5-light-mode.png#only-light){width=25% align=right}
![Divisions euclidiennes successives de 2083 par 10](assets/1-2083-divise-par-10-5-dark-mode.png#only-dark){width=25% align=right}

Noter qu'on a obtenu les chiffres de 2083 en partant des unités à droite, il faut donc les lire de droite à gauche pour retrouver 2083.

On peut traduire cet algorithme en Python, par exemple pour écrire une fonction `etoile` qui renvoie une chaîne de caractère composées de tous les chiffres d'un nombre entier `n` suivis d'une étoile.

``` py
def etoile(n):
	n_etoile = ''
	while n > 0:
		n_etoile =  str(n%10) + '*' + n_etoile
		n = n//10
	return n_etoile

>>> etoile(2083)
'2*0*8*3*'
```
On note que le cas ou `n` est égal à `0`, la fonction n'entre pas dans la boucle `while` et renvoie une chaîne vide. On peut traiter le cas séparément en ajoutant les lignes:

``` py
def etoile(n):
	if n == 0:
		return '0*'
	n_etoile = ''
	while n > 0:
		...
```



!!! question "Exercice corrigé" 
    Un nombre harshad, ou nombre de Niven, est un entier naturel qui est divisible par la somme de ses chiffres dans une base donnée [...]. En base dix, les vingt premiers nombres harshad strictement supérieurs à 10 sont (suite A005349 de l'OEIS) :
	12, 18, 20, 21, 24, 27, 30, 36, 40, 42, 45, 48, 50, 54, 60, 63, 70, 72, 80 et 81.
    Source : [https://fr.wikipedia.org/wiki/Nombre_harshad](https://fr.wikipedia.org/wiki/Nombre_harshad).
	
	
	Écrire un programme demande un nombre entier et affiche s'il est un nombre de harshad ou pas.

	


??? Success "Réponse"

    ``` py
	n = int(input())
	somme = 0
	while n > 0:
		somme = somme + n%10
		n = n//10
	if n%somme == 0:
		print(n, "est un nombre de harshad")
	else:
		print(n, "n'est pas un nombre de harshad")

	```
   

## Système binaire ou base 2

En binaire, ou base 2, les seuls chiffres utilisés pour écrire des nombres sont 0 et 1, aussi appelés « bits » pour *binary digits*, autrement dit « chiffres binaires » en français. 

Par exemple on peut écrire $1101$, que l'on note aussi $1101_2$ pour indiquer qu'il est écrit en binaire.
Il convient également de ne pas lire ces nombres comme on lirait des nombres décimaux. Ainsi, $1101_2$ ne se dit pas « mille cent un » mais plutôt « un un zéro un ».

Comme dans le système décimal, c'est la position qui indique la valeur de chaque chiffre. Mais en binaire, c'est une combinaison linéaire de puissances de 2.

Par exemple :

$1101_2 = 1 × 2^3 + 1 × 2^2 + 0 × 2^1 + 1 × 2^0 = 13_{10}$

Noter le $..._{10}$ pour indiquer que $13$ est ici en base 10.


De manière générale, le nombre $n$ qui s'écrit dans le système binaire avec $p$ bits $b_{p−1}b_{p−2}...b_2b_1b_0$  (chaque $b_i$ est un bit valant 0 ou 1) est égal en décimal à : 

$n = b_{p−1} \times 2^{p−1}  + b_{p−2} \times 2^{p−2} + ... +  b_2 \times 2^2 + b_1 \times 2^1  + b_0 \times 2^0$

ou encore avec la formule mathématique d'une somme de $0$ à $p-1$ :
$n = \sum_{i=0}^{p-1} b_i × 2^i$



### Convertir un nombre binaire en décimal

La formule précédente permet de convertir facilement un nombre binaire en décimal. Il suffit de multiplier chaque bit par la puissance de 2 correspondante et de faire la somme des valeurs obtenues. 
Pour plus de simplicité, on peut parcourir le nombre binaire de gauche à droite.


``` py
def bin_dec(n):
    """ str -> int
	Renvoie la valeur en décimal de la chaine de caractère n représentant un nombre binaire
	"""
    dec = 0
    for i in range(len(n)):
	    dec = dec + int(n[-i-1]) * 2**i
	return dec
```


En Python, les nombres binaires s'écrivent avec le préfixe ```0b``` et la conversion en décimal est automatique dans la console :

``` py
>>> 0b1101
13
```


### Convertir un nombre décimal en binaire

De la même manière qu'on a précédemment écrit tous les chiffres en base 10 d'un nombre par une succession de divisions entières par 10, on peut écrire un nombre décimal $n$ sous sa forme binaire $b_{p−1}b_{p−2}...b_2b_1b_0$ en effectuant des divisions entières par 2 :

- le reste de la division entière de $n$ par $2$, `n%2` en Python, renvoie $b_0$.

- Le quotient de la division entière de $n$ par $2$, `n//2` en Python, renvoie $b_{p−1}b_{p−2}...b_2b_1$.


Il suffit alors de répéter l'opération jusqu'à ce que $n$ soit égal à 0, on aura bien obtenu tous les bits de l'écriture binaire de $n$. 

:warning: Attention, on obtient les bits de la gauche vers la droite.

Prenons l'exemple de $n_{10} = 13$.

1. On commence à droite, le quotient de la division euclidienne de 13 par 2 est 6 et le reste est 1 (car 13 = 6 × 2 + 1), on a trouvé le bit de droite, c'est $1$.

2. On continue, le quotient de la division euclidienne de 6 par 2 est 3 et le reste est 0 (car 6 = 3 × 2 + 0), on complète l'écriture binaire à gauche avec ce nouveau bit, on obtient $01$.

3. On continue, le quotient de la division euclidienne de 3 par 2 est 1 et le reste est 1 (car 3 = 1 × 2 + 1), on complète l'écriture binaire à gauche avec ce nouveau bit, on obtient $101$.

4. On continue, le quotient de la division euclidienne de 1 par 2 est 0 et le reste est encore 1 (car 1 = 0 × 2 + 1), on complète l'écriture binaire à gauche avec ce nouveau bit, on obtient $1101$.

5. Le dernier quotient trouvé est 0, il n'y a pas de bit à rajouter, l'écriture binaire de $13$ est $1101$


En Python, on pouvait écrire l'algorithme précédent : 

``` py
>>> 13 % 2 = 1
>>> 13 // 2 = 6
>>> 6 % 2 = 0
>>> 6 // 2 = 3
>>> 3 % 2 = 1
>>> 3 // 2 = 1
>>> 1 % 2 = 1
>>> 1 // 2 = 0
```


Écrivons cet algorithme sous forme d'une fonction pour n'importe quel nombre entier n :

``` py
def dec_bin(n):
    """ int -> str
	Renvoie une chaine de caractère représentant un nombre n en binaire
	"""
    bin = ''
	while n > 0:
		bin = str(n % 2) + bin    # Attention d'ajouter le nouveau bit à droite de bin
		n = n // 2
	return bin
  
```

Dans le cas où `n` est égal à 0, la fonction renvoie `''`,  ce n'est pas correct. On peut traiter ce cas séparément : 

``` py
def dec_bin(n):
    """ int -> str
	Renvoie une chaine de caractère représentant un nombre n en binaire
	"""
	if n == 0:
	    return '0'
    bin = ''
	while n > 0:
		bin = str(n % 2) + bin    # Attention d'jouter le nouveau bit à droite de bin
		n = n // 2
	return bin
  
```


En Python, la fonction `bin` permet d'écrire un nombre décimal en binaire :

``` py
>>> bin(13)
'0b1101'
```


## Hexadécimal ou base 16

## Autres bases



