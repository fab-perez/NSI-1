# Instructions

!!! abstract "Cours" 
	Une **instruction** (ne pas confondre avec une [expression](2-operations-comparaisons-expressions.md#expression)) est une commande qui doit être effectuée par la machine avant de passer à la suivante. 
	
	Une **séquence** est une suite d’**instructions exécutées** dans l’ordre où elles sont écrites.

Par exemple :
- `a = 2`	est une instruction qui affecte la valeur `2` à la variable `a`.
- `print('hello world')`	est une instruction qui affiche la chaine  `'hello world'` dans la console.

## type()
On peut écrire une instruction pour connaitre le type d’une variable avec la fonction `type()`[^3.1].

[^3.1]: Nous n’abordons pas ici la notion de classe ici.

!!! tip inline end "PEP-8" 
    Pas d’espace avant et à l’intérieur des parenthèses d’une fonction.

```py
>>> x = 2
>>> type(x)
<class 'int'>
>>> y = 2.0
>>> type(y)
<class 'float'>
>>> z = '2'
>>> type(z)
<class 'str'>
```

!!! info "Rappel" 
	En Python, la valeur `2` (type `int`) est égale à `2.0` (type `float`) et mais est différente de `'2'` (type `str`). 

## Conversion de type

On peut convertir une variable d’un type à un autre dans une instruction en utilisant:

|fonction|description|exemple|
|---|---|---|
|`int()`|Convertit une chaine de caractères ou un flottant en entier.|`>>> int(2.8)`<br>`2`<br>`>>> int('2')`<br>`2`|
|`float()`|Convertit une chaine de caractères ou un entier en flottant.|`>> float(5)`<br>`5.0`<br>`>>> float('5.5')`<br>`5.5`|
|`str()`|Convertit un entier ou un flottant en une chaine de caractères.|`>>> str(5.5)`<br>`'5.5'`|

	
> Observer dans la console comment un flottant qui prend une valeur entière (5) est affiché avec un point (5.0) :

``` py
>>> a = 5
>>> a
5
>>> float(a)
5.0
```

## Instructions d’entrée et sortie

!!! abstract "Cours" 
	Une instruction d’**entrée** permet à un programme de lire des valeurs saisies au clavier par l’utilisateur. Une instruction de **sortie** affiche des messages à l’écran.

En python, la fonction `input()` permet d’écrire une instruction d’entrée qui affecte la valeur saisie à une variable. 
``` py
>>> saisie = input('Saisir un message')
>>> saisie
'abc'
```
La valeur renvoyée par `input()` est toujours du type chaine de caractères (type `str`). Pour obtenir un entier ou un flottant, il faut la convertir.
```py
>>> nombre_entier = input('Entrez un nombre entier')
>>> nombre_entier
'25'
```
Ici la valeur affectée à `nombre_entier` est une chaine de caractères `'25'`. Pour obtenir un entier, il faut la convertir avec `int()`.
``` py
>>> nombre_entier = int(input('Entrez un nombre entier'))
>>> nombre_entier
25
```
> Si l’utilisateur ne saisit pas un nombre entier, cela génère un message d’erreur.

Une instruction de sortie s’écrit en utilisant `print()` pour afficher à l’écran des chaines de caractère et/ou des variables, séparés par des virgules. 

!!! tip inline end "PEP-8" 
    Un espace après le caractère « `,` » mais pas avant.


```py
>>> print('hello')
hello
>>> message='world'
>>> print('hello', message)
hello world
>>> nombre = 5
>>> print(nombre)
5
>>> print('le nombre est', nombre)
le nombre est 5
>>> a = 5
>>> b = 6
>>> print('la somme de', a, 'et de', b, 'est', a + b)
la somme de 5 et de 6 est 11
```

Par défaut, `print()` provoque un retour à la ligne après l’affichage. Pour éviter cela on utilise une autre chaine de caractères à accoler à la fin de l’affichage avec `end=`, par exemple un espace ou même rien. 

```py
>>> print('hello', end=' ')
Hello >>>
```

Python 3.6 a introduit les chaine de caractères f-strings (formatted string) qui s’écrivent avec `f` devant et permettent d’y insérer des variables, ou même des expressions. 
```py
>>> nom = 'Paul'
>>> age = 23
>>> print(f'Bonjour {nom}, vous avez {age} ans')
Votre nom est un Paul et vous avez 23 ans
```


!!! question "Exercice corrigé" 
	Pour passer d’un pixel couleur codé RGB (mélange des trois couleurs rouge, vert, bleu) à un pixel en nuance de gris, on utilise la formule suivante qui donne le niveau de gris :
	$G = 0,11 \times R + 0,83 \times V + 0,06 \times B$ où $R$, $V$ et $B$ sont les niveaux de rouge, vert et bleu.

	Ecrire le programme qui demande en entrée les 3 couleurs d’un pixel et affiche en sortie la nuance de gris.

??? Success "Réponse"
	Avant d'écrire le programme on peut se poser quelques questions :

	- Quelles sont les informations à saisir par l'utilisateur ? Les trois niveaux de couleurs $R$, $V$ et $B$.
	- Où stocker ces informations ? Dans trois variables de type `int` qu'on peut nommer par exemple `R`, `V` et `B` comme dans la formule.
	- Que doit calculer le programme ? Le niveau de gris en utilisant la formule. On peut mettre le résultat dans une variable `G` de type entier.
	- Que doit faire ensuite le programme ? Le programme doit afficher le niveau de gris.

	Traduit en Python, on obtient le programme suivant.  Noter la présence de commentaires dans le code, commençant par le signe `#`, ils sont ignorés par l'interpréteur Python.

	!!! note inline end "" 
    	Dans un premier temps on n’utilise pas `def main():` généré par défaut par certains IDE.
	!!! note inline end "" 
		Essayer le programme sans faire la conversion des variables R, V et B en int et constater l’erreur produite.
	
	```py
	# Demande les 3 couleurs R, V et B de type int
	R = int(input('Rouge:'))
	V = int(input('Vert:'))
	B = int(input('Bleu:'))
	# Calcule le niveau de gris G, de type int
	G = int(0.11 * R + 0.83 * V + 0.06 * B)
	# Affiche le niveau de gris
	print('Le niveau de Gris est', G)
	```
