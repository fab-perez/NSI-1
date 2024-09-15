# Opérations, comparaisons, expression


## Opérateurs arithmétiques sur les nombres
Les opérations arithmétiques usuelles sont effectuées sur des nombres de types ```int``` ou ```float``` :

|opérateur|notation|
|---|:-:|
|addition|```a + b```|
|soustraction|```a - b```|
|multiplication|```a * b```|
|puissance|```a**b```|
|divisions décimale|```a / b```|


``` py 
>>> a = 5
>>> b = 2
```

!!! tip inline end "PEP 8" 
    Entourer les opérateurs mathématiques (```+```,  ```-```, ```/```, ```*```) d'un espace avant et d'un espace après.

``` py 
>>> a + b
7
>>> a / b
2.5
>>> a**b
25
```

À noter : 

> Si ```a``` et ```b``` sont deux variables toutes les deux de type ```int``` alors le résultat d'une opération entre les deux est de type ```int```, sauf pour la division qui est toujours de type ```float``` même si le résultat est un entier : 
    ``` py
    >>> 10 / 5
    2.0
    ```
    et si l'un de `a` ou de `b` est de type `float` alors le résultat est toujours de type `float`.



> La racine carrée d’un nombre peut s'obtenir avec :  ```a**0.5``` [^2.1].

> L’ordre des priorités mathématiques est respecté.
    

[^2.1]: En mathématique $\sqrt {a} = a ^ {1 \over 2}$.

Il est possible d'affecter une valeur à une variable qui dépend de son ancienne valeur, par exemple l’augmenter d’une quantité donnée (on dit **incrémenter**)[^2.2].
``` py
>>> a = 3				
>>> a = a + 1				
>>> a					
4
```

!!! tip inline end "PEP 8" 
    Dans ce cas particuliers, on peut omettre les espaces autour de la multiplication (`*`) pour montrer la priorité sur l'addition et améliorer la lisibilité de la formule.

``` py
>>> a = 2*a + 1		
>>> a
9
```
[^2.2]

[^2.2]: 
     Noter dans cet exemple la différence entre variable informatique et mathématique, et la signification du signe « = ». En mathématique $a = 2*a + 1$ est une équation dont l’inconnue est $a$ (elle peut être facilement résolue pour trouver la solution $a = -1$). En informatique, c’est l'affection du résultat de `2*a + 1` à la variable  `a` qui prend une nouvelle valeur (même si $a \neq -1$).

Des raccourcis d’écriture existent pour aller plus vite (mais attention aux erreurs en les utilisant !).

- ```a += 1``` signifie ```a = a + 1```;
- ```a += b``` signifie ```a = a + b``` ; et
-  ```a *= 2``` signifie ```a = a * 2```.




### Division entière (ou division euclidienne) 
L'opérateur de division entière ```//``` et l’opération modulo ```%``` utilisés avec des entiers (de type ```int```) donnent respectivement le quotient et le reste d'une division euclidienne : si `a` et `b` sont des entiers tels que $a = b \times q + r$,  alors ```a // b``` donne $q$ et ```a % b``` donne $r$[^2.3].

[^2.3]: 
      Vrai pour des entiers positifs. Attention aux surprises avec des nombres relatifs ! Les résultats sont différents entre langages/systèmes informatiques. En Python on peut tester `7 // -5` et `-17 // 5` qui donnent tous les deux `-4` mais `17 % -5` donne `-3` alors que `-17 % 5`  donne `3`.


|opérateur|notation|
|---|:-:|
|quotient|```a // b```|
|reste|```a % b```|

![Division entière de 17 par 5 posée](assets/2-div-euclidienne-17-par-5-light-mode.png#only-light){align=right}
![Division entière de 17 par 5 posée](assets/2-div-euclidienne-17-par-5-dark-mode.png#only-dark){align=right}

Par exemple, le quotient et le reste de la division entière de $17$ par $5$ sont $3$ et $2$ respectivement (car $17 = 3  \times 5 + 2$) :

``` py
>>> a = 17
>>> b = 5
>>> a // b				
3
>>> a % b
2
```

L'opérateur modulo, `%`, qui donne le reste d'une division entière, est très utile pour déterminer si un nombre est divisible par un autre nombre, dans ce cas le reste est égal à zéro :
``` py
>>> 10 % 5
0
>>> 10 % 3				
1
```
$10$ est divisible par $5$ mais pas par $3$. 




## Opérateurs sur les chaines de caractères 

Les textes ou chaines des caractères, de type ```str``` (abréviation de *string*), sont définis  entre une paire de guillemets (```"```) ou d’apostrophes (```'```)[^2.4]. 

[^2.4]:
    Pouvoir utiliser les apostrophes ou les guillemets offre un énorme avantage : les guillemets permettent d'écrire  une chaîne qui contient des apostrophes et vis-versa, par exemple `"J'aime Python"` ou `'Il dit "hello".'`.

``` py
>>> chaine1 = 'Hello '
>>> chaine2 = "world"
```
Pour les chaînes de caractères, deux opérations sont possibles, l'addition et la multiplication[^2.5] :

[^2.5]:
  Attention : les opérateurs `+` et `*` se comportent différemment s'il s'agit d'entiers ou de chaînes de caractères : `2 + 2` est une addition alors que `'2' + '2'` est une concaténation, `2 * 3` est une multiplication alors que  `'2' * 3` est une duplication.

- L'opérateur d'addition « `+` » **concatène** (assemble) deux chaînes de caractères.
``` py
>>> chaine1 + chaine2
'Hello world'
```
[^2.6]

[^2.6]: « Hello world » (traduit littéralement en français par « Bonjour le monde ») sont les mots traditionnellement écrits par un programme informatique simple dont le but est de faire la démonstration rapide de son exécution sans erreur. Source : [https://fr.wikipedia.org/wiki/Hello_world](https://fr.wikipedia.org/wiki/Hello_world)

- L'opérateur de multiplication « ` * `» entre un nombre entier et une chaîne de caractères **duplique** (répète) plusieurs fois une chaîne de caractères. 
``` py
>>> chaine1 * 3
'Hello Hello Hello '
```

La fonction `len()` donne le nombre de caractère d’une chaine (y compris les espaces et les signes de ponctuation).

``` py
>>> ch = 'Hello world'
>>> len(ch)
11
```

Chaque caractère d’une chaine de caractères `ch` a une position qui va de `0` à `len(ch) - 1`. 

- `ch[0]` permet d'accéder au premier caractère en position `0` de la chaine `ch`, 
- `ch[1]` au second caractère en position `1`,
- ... 
- `ch[i]` au caractère en `i`^ième^ position,
- ... 
- `ch[len(ch) - 1]` au dernier caractère. 

:warning: Les positions sont comptées en commençant à la position `0`, le premier caractère est `ch[0]` et non pas `ch[1]` !


``` py
>>> ch[6]	
'w'
```

- De même, en partant de la fin, `ch[-1]` permet d'accéder au dernier caractère, `ch[-2]` à l’avant dernier, etc. 
``` py
>>> ch[-1]
'd'
```
!!! tip inline end "PEP 8" 
    Pas d'espace autour d'un deux-points (`:`).

- Enfin `ch[i:j]` permet d'obtenir la sous-chaîne de tous les caractères entre les positions `i` (**inclus**) et `j` (**exclus**), appelée une tranche.
``` py
>>> ch[2:5]
'llo'
```

Les mots-clés `in` et `not in` permettent de vérifier l’appartenance, ou pas, d’une sous-chaine dans une chaine :
``` py
>>> "py" in "python"
True
>>> "Py" not in "python"
True
```
Il existe de nombreuses méthodes[^2.7] pour traiter les chaines de caractères, quelques exemples :

[^2.7]: Une méthode est un type de fonction particulier propre aux langages orientés objet. Remarquer la construction `nom_variable.nom_methode()` dans ces cas différente de `nom_fonction(nom_variable)` par exemple `len('abc')`.


|fonction|description|exemple|
|---|---|---|
|`.index('c')`| trouve l'index du premier caractère `"c"` dans une chaîne.|`>>> chaine = 'aaabbbccc'`<br>`>>> chaine.index('b')`<br>`3`|
|`.find('sc')`| cherche la position d'une sous-chaîne `sc` dans la chaîne.|`>>> chaine.find('bc')`<br>`5`|
|`.count('sc')`| compte le nombre de sous-chaînes `sc` dans la chaîne.|`>>> chaine.count('bc')`<br>`1`|
|`.lower('sc')`| onvertit une chaîne en minuscules.|`>>> 'ABCdef'.lower()`<br>`'abcdef'`|
|`.upper('sc')`| onvertit une chaîne en majuscules.|`>>> 'ABCdef'.upper()`<br>`'ABCDEF'`|
|`.replace('old', 'new')`| remplace tous les caractères `old` par `new`  dans la chaîne.|`>>> 'aaabbbccc'.replace('c', 'e')`<br>`'aaabbbeee'`|


## Opérateurs de comparaison
Les opérations de comparaison usuelless permettent de comparer des valeurs de même type entre elles. Le résultat est toujours un booléen (de type `bool`) égal à `True` ou `False`[^2.8] .

[^2.8]: `True` et `False` (et `None`) sont les rares mots en Python qui s’écrivent avec une majuscule. `TRUE` ou `true` ne sont pas acceptés.

!!! tip inline end "PEP 8" 
    Entourer les opérateurs de comparaison (`==`, `!=`, `>=`, etc.) d'un espace avant et d'un espace après.

|opérateur|notation|
|---|:-:|
|=|```a == b```|  
|≠|```a != b```|  
|<|```a < b```|  
|≤|```a <= b```|  
|>|```a > b```|  
|≥|```a >= b```|  

[^2.9]

[^2.9]: Préférer `is` et `is not` à `==` et `!=` pour comparer à `None`, par exemple `a is not None` plutôt que `a != None`.

:warning: Une erreur courante consiste à confondre l'opérateur de comparaison `==` pour vérifier si deux valeurs sont égales avec l'affectation qui utilise le signe `=` !

``` py
>>> a, b, c = 5, 5, 6
>>> a == b
True
>>> a == c
False
```

Il est possible de combiner les comparaisons, par exemple pour vérifier si `a` est compris entre 2 et 6 : 

``` py
>>> 2 <= a < 6
True
```

entre 7 et 8 :
``` py
>>> 7 < a < 8
False
```

mais ce n'est pas recommandé car c'est en fait une combinaison de plusieurs comparaisons, ce qui peut donner des hérésies mathématiques : 

``` py
>>> 4 < a > 2
True
```


Les chaines de caractères, quant à elles, sont comparées en ordre lexicographique, c’est-à-dire caractère par caractère comme l'ordre des mots dans un dictionnaire :  on commence par comparer le premier caractère de chaque chaîne, puis en cas d’égalité le deuxième de chaque, et ainsi de suite jusqu'à trouver un caractère qui est différent de l'autre[^2.10]. 

[^2.10]: Les comparaisons entre chaînes de caractère se font en comparant le point de code Unicode de chaque caractère. Il est donné par la fonction `ord()` (la fonction `chr()` fait ‘inverse ). Par exemple, `ord('A')` vaut `65` et `ord('a')` vaut `97` donc `'A' < 'a'` est vrai.


``` py
>>> 'aa'>'ab'
False
>>> "python" == "python"	
True
>>> "python" != "PYTHON"
True
```

:warning: Attention aux majuscules (elles sont "avant" toutes les minuscules) :
``` py
>>> "java" < "python"	
True
>>> "java" > "Python"
True
```

et aux nombres écrits dans des chaînes de caractères :
``` py
>>> "10" < "2"
True
```

Les nombres de type `int` ou `float` peuvent être comparés entre eux même s'ils sont de  types différents :
``` py
>>> 7 == 7.0
True
>>> 0.0 < 1
True
```

Mais pas les nombres avec les chaines de caractères :   
``` py
>>> 7 == "7"
False
>>> 7 < '8'
Traceback (most recent call last):
  File "<interactive input>", line 1, in <module>
TypeError: '<' not supported between instances of 'int' and 'str'
```

:warning: Attention aux égalités entre nombres de type `float` qui ne sont pas toujours encodés de façon exacte[^2.11] :

``` py
>>> 0.1 + 0.1 + 0.1 == 0.3
False
```

[^2.11]: Les nombres de type `float` sont encodés par des fractions binaires qui "approchent" leur valeur le plus précisément possible sans être toujours parfaitement exactes. Par exemple le nombre $0,1$ est représenté par la valeur `0.1000000000000000055511151231257827021181583404541015625` en Python (`format(0.1,'.55f')` permet d'afficher toutes les décimales).  Une particularité de Python est de ne pas limiter l’encodage des `int`, par exemple comparer `>>> 2*1000` avec `>>> 2.**1000` dans la console.


##	Opérateurs logiques (ou booléens)

Les opérations logiques peuvent être effectuées sur des booléens (type `bool`). Le résultat est un booléen égal à `True` ou `False`.


|opérateur|notation|description|priorité|
|---|:-:|:-:|:-:|
|Négation de `a`|`not a`|`True` si `a` est `False`, `False` sinon|1|
|`a` et `b` (conjonction)|`a and b`|`True` si `a` et `b` sont `True` tous les deux, `False` sinon|2|
|`a` ou `b` (disjonction)|`a or b`|`True` si `a` ou `b` (ou les deux) est `True`, `False` sinon|3|

(`a` et `b` sont des booléens).

Comme pour les opérations mathématiques, les opérations logiques suivent des règles de priorité : 

1. Négation (`not`), 
2. Conjonction (`and`), 
3. Disjonction (`or`).

`a or not b and c` est équivalent à `a or ((not b) and c)` mais en pratique les parenthèses sont plus lisibles.

## Expressions

!!! abstract "Cours" 
    Une **expression** est un calcul d’opérations et de comparaisons dont l'évaluation donne une valeur.

:warning: Attention à ne pas confondre une expression avec une [instruction](3-instructions.md) dont l'exécution fait quelque chose.  

Exemples :

- `2*a + 5`	est une expression, elle a une valeur (qui dépend de la valeur de `a`).  
- `a == 5`	est une expression booléene, elle vaut `True`ou `False`.
- `a = 5`	n’est **pas** une expression, c’est une instruction qui affecte de la valeur 5 à la variable `a`.


![différence dans la console entre >>> a = 5 qui n'affiche rien et >>> a == 5 qui affiche True](assets/2-expression-vs-instruction.png){align=right}

À noter: 
> Quand une affectation est saisie dans la console Python, par exemple `>>> a = 5`, rien n’est affiché par l'interpréteur car ce n'est pas une expression.

> Quand une expression est saisie dans la console Python, par exemple `>>> a == 5`, elle est évaluée par l’interpréteur et le résultat est affiché en dessous. 


Puisqu'elle a une valeur, une expression peut être affectée à une variable : 
`b = a**2` est une affectation de la valeur de l’expression `a**2` (le carré de `a`) à la variable `b`.



!!! question "Exercice corrigé" 
	La valeur d'une variable `annee` de type `int` est donnée, par exemple `>>> annee = 2023`.

    Ecrire dans l'interpréteur une expression booléenne, qui vaut `True` si `annee` est une année bissextile ou `False` sinon.

    « Depuis l'ajustement du calendrier grégorien, l'année sera bissextile (elle aura 366 jours) seulement si elle respecte l'un des deux critères suivants :

    1. C1 : l'année est divisible par 4 sans être divisible par 100 (cas des années qui ne sont pas des multiples de 100) ;
    2. C2 : l'année est divisible par 400 (cas des années multiples de 100).

    Si une année ne respecte ni le critère C1 ni le critère C2, l'année n'est pas bissextile ». Source: [https://fr.wikipedia.org/wiki/Année_bissextile](https://fr.wikipedia.org/wiki/Année_bissextile).

        

??? Success "Réponse"
	Avant d'écrire cette expression on peut se poser quelques questions :

	- Comment savoir si un nombre est divisible par un autre ? Il suffit de vérifier si le reste de la division entière est égal à zéro ou pas. Par exemple 2023 n'est pas divisible par 4 car le reste de la division entière de 2023 par 4 est 3 : 
    ``` py
    >>> annee = 2023
    >>> annee % 4
    3
    ```
    Par contre 2024 est divisible par 4 car le reste de la division entière de 2024 par 4 est bien 0 : 
    ``` py
    >>> annee = 2024
    >>> annee % 4
    0
    ```
    - On peut traduire directement en Python chaque condition C1 et C2 :

        C1 : l'année est divisible par 4 sans être divisible par 100 (cas des années qui ne sont pas des multiples de 100) ;

        `>>> annee % 4 == 0 and annee % 100 != 0`

        C2 : l'année est divisible par 400 (cas des années multiples de 100).

        `>>> annee % 400 == 0 `

    - :warning: la dernière clause indique qu'une année **n'est pas** bissextile si les conditions C1 **et** C2 sont toutes les deux **fausses**. Il faut donc comprendre qu'une année **est** bissextile si l'une des conditions C1 **ou** C2 est **vraie** (ou les deux en même temps).
    
	
	Traduit en Python, on obtient l'expression suivante que l'on peut tester dans la console.

    !!! note inline end "" 
    	On pourrait se passer des parenthèses et utiliser les règles de priorités des opérateurs booléens :
        `annee % 4 == 0 and annee % 100 != 0 or annee % 400 == 0`, mais en pratique ce n'est pas recommandé.

	``` py
	>>> annee = 2023
    >>> (annee % 4 == 0 and annee % 100 != 0) or annee % 400 == 0
    False
    ```