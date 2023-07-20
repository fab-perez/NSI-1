# p-uplet (ou `tuple`)

!!! abstract "Cours" 
    Un p-uplet (ou n-uplet) est une suite ordonnée d’éléments qui ne peuvent pas être modifiés (immuables[^1.1] ).

    En Python les p-uplets sont du type `tuple`.

Un p-uplet à deux élement est appelé un couple, à trois élements un triplet, quadruplet, quintuplet, etc.


[^1.1]: ou *immutable* en anglais.

## Création

Un p-uplet est déclaré par une série de valeurs  séparées par des virgules, et le tout encadré par des parenthèses “`( )`”. Il peut contenir des éléments de types différents.

``` py
>>> p = (1, 2 , 'Hello', True)
```

Il est aussi possible de créer un p-uplet sans parenthèse :
``` py
>>> p = 1, 2, 'hello', True
>>> p
(1, 2, 'hello', True)
>>> type(p)
tuple
```

:warning: Ne pas confondre la virgule de séparateur d’éléments avec le point de séparateur décimal.

``` py
>>> p_1_elem = (1.2) # Creation d'un tuple avec 1 élément : 1.2 de type float
>>> p_2_elem = (1, 2) # Creation d'un tuple avec deux éléments :1 et 2 de type int
```

Un p-uplet peut contenir d’autres p-uplets.

!!! note inline end "" 
    Le second p-uplet `(3, 4, 'bye', False)` doit obligatoirement être écrit entre parenthèse dans ce cas.

``` py
>>> p_de_p = p, (3, 4, 'bye', False)
>>> p_de_p
((1, 2, 'hello', True), (3, 4, 'bye', False))
```


D'autres exemples de p-uplets :

- 
    p-uplet vide, les parenthèses sont obligatoires ici :  
    ```py
    >>> p_vide = ()  
    ```
- 
    p-uplet avec un seul élément, l'entier `1`, écrit avec une virgule à la fin :
    ``` py
    p_simple = 1,
    ``` 
    ou  écrit avec des parenthèses : 
    ``` py
    p_simple = (1)
    ``` 

##	Fonction `len()`

La fonction `len()` renvoie la longueur d'un p-uplet, c'est-à-dire le nombre d'éléments qu’il contient.

``` py 
>>> p = (1, 2, 'hello', True)
>>> len(p)
4
```

##	Accès aux éléments

Comme pour les chaines de caractères, les éléments d’un tuple sont indexés à partir de zéro jusqu'à `len(tuple)` **exclus**, c'est-à-dire le dernier élément est en position `len(tuple) - 1`. Il est possible d'accèder aux éléments par leur index entre crochets. 

``` 
>>> p = (1, 2, 'hello', True)
>>> p[0]
1
``` 

:warning: Le premier élément a l’index 0.

Le p-uplet peut également être indexé avec des nombres négatifs selon le modèle suivant :

|`>>> p = `    | `(` | `1,` | `2,` | `'hello,'` | `True` | `)`|
|---           |-:   |:-:   |:-:   |:-:         |:-:     |:- |
|indice positif|     |0     |1     |2           |3       |    |
|indice négatif|     |-4    |-3    |-2          |-1      | |


Les indices négatifs reviennent à compter à partir de la fin, `-1` est du sucre syntaxique[^1.2] pour `len(p) - 1`. Leur principal avantage est d’accéder au dernier élément d'un tuple à l'aide de l'indice `-1` sans pour autant connaître la longueur du tuple. L'avant-dernier élément a lui l'indice `-2`, l'avant-avant dernier l'indice `-3`, etc.

[^1.2]: Sucre syntaxique désigne un raccourci de la syntaxe d’un programme facilitant sa lecture.

``` py
>>> p[-1]
True
>>> p[-2]
'hello'
```

!!! note inline end "" 
    Dans ce cas, il est préférable d'utiliser `montuple[0]`.

Pour accéder au premier élément du tuple avec un indice négatif, il faut par contre connaître le bon indice :
``` py
>>> p[-4]
1
```


L'accès à une partie d'un tuple (tranche) se fait sur le modèle `nom_tuple[début:fin]` [^1.3] pour récupérer tous les éléments, entre les positions `debut` (inclus) et `fin` (**exclu**). 

[^1.3]: Il est aussi possible de préciser un `pas` sur le modèle `nom_tuple[début:fin:pas]`. 

``` py
>>> p[1:2]
(2,)
>>> p[1:3]
(2, 'hello') 
>>> p[1:-1]
(2, 'hello') 
```

Lorsqu'aucun indice n'est indiqué à gauche ou à droite du symbole deux-points, Python prend par défaut tous les éléments depuis le début ou tous les éléments jusqu'à la fin respectivement.

``` py
>>> p[2:]
('hello', True)
>>> p[:2]
(1, 2)
>>> p[:]
(1, 2, 'hello', True)
```

Il est aussi possible de « deballer » ou disperser un p-uplet en affectant tous ses éléments dans plusieurs variables :

```
>>> a, b, c = (1, 2, 3)
>>> a
1
```

Ce qui pouvait aussi s’écrire sans parenthèse  : 
``` py 
>>> a, b, c = 1, 2, 3 
```

Le mot clé `in` permet de vérifier si un élément est présent dans un p-uplet :  `elem in nom_tuple` renvoie un booléen :

``` py
>>> t = (1, 3 ,8)
>>> 3 in t
True
>>> 4 in t
False
```

Le mot clé `in` permet aussi d’écrire une boucle pour parcourir (ou «itérer») toutes les valeurs d'un p-uplet .

=== Avec une boucle non bornée `while`
    ``` py
    >>> i = 0
    >>> while i < len(t):
    ...     print(t[i])
    ...     i = i + 1
    ...     
    1
    3
    ```


=== Avec une boucle non bornée `for`
    ``` py
    >>> for elem in t:
    ...     print(elem)
    ...     
    1
    3
    8
    ```


:warning: Il est possible d'accéder aux éléments d’un tuple mais **pas de les modifier**.

``` py
>>> montuple[1] = 3
Traceback (innermost last):
File "<stdin>", line 1, in ?
TypeError: object doesn't support item assignment
```


##	Opérations sur p-uplets

Deux opérations sont possibles, l'addition et la multiplication :

- L'opérateur d'addition « `+` » **concatène** (assemble) deux p-uplets.

- L'opérateur de multiplication « ` * `» entre un nombre entier et une p-uplet **duplique** (répète) plusieurs fois les éléments. 


``` py
>>> (1, 2) + (3, 4)
(1, 2, 3, 4)
>>> 3 * (1, 2)
(1, 2, 1, 2, 1, 2)
```

##	Fonctions renvoyant un p-uplet

Les tuples sont très utiles pour écrire des fonctions renvoyant plusieurs valeurs en même temps :
``` py linenums="1"
def circleInfo(r):
    """ Return (circumference, area) of a circle of radius r """
    c = 2 * 3.14159 * r
    a = 3.14159 * r * r
    return (c, a)

def main():
    perimeter, area = circleInfo(10)
```

## Conversion de type (cast)

La fonction `tuple()`, prend en argument un objet séquentiel (une chaine de caractère par exemple) et renvoie le tuple correspondant :

``` py
>>> tuple("ATGCCGCGAT")
('A', 'T', 'G', 'C', 'C', 'G', 'C', 'G', 'A', 'T')
```
