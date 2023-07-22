# Tableaux

!!! abstract "Cours" 
    Un tableau est une suite ordonnée d’éléments qui peuvent être modifiés (muables[^2.1]).

    En Python les tableaux sont du type `list`[^2.2].

[^2.1]: ou *mutable* en anglais.

[^2.2]: Par abus de langage on francise parfois le terme en « liste » pour désigner un tableau.


##	Création

Un tableau est déclaré par une série de valeurs séparées par des virgules, et le tout **encadré par des crochets** “`[ ]`”. Il contient des éléments tous du même type (selon le programme de 1ere[^2.3])  .

[^2.3] Le type `list` de Python offre plus de possibilité qu'un tableau et notemment peut contenir des éléments de types différents (y compris d’autres tableaux).

``` py
>>> t = [1, 2, 3, 4]
>>> t
[1, 2, 3, 4]
>>> type(t)
<class 'list'>
```

:warning: Comme pour les p-uplets, ne pas confondre la virgule de séparateur d’éléments avec le point de séparateur décimal.


Il est possible decréer un tableau vide :

``` py
tableauvide = []      # Creation d'un tableau vide
```

ou un tableau contenant un seul élément :

``` py
singleton = [5] # Creation d'un tableau avec un seul element
```

## Fonction `len()`
La fonction `len()` permet de connaître la longueur d'un tableau, c'est-à-dire le nombre d'éléments qu’il contient.

``` py
>>> animaux = ['girafe', 'tigre', 'singe', 'souris']
>>> len(animaux)
4
>>> len([1, 2, 3, 4, 5, 6, 7, 8])
8
```

## Accès aux éléments

Comme pour les chaines de caractères et les p-uplets, les éléments d’un tableau `t` sont indexés à partir de `0` jusqu'à `len(t)` **exclus**, c'est-à-dire le dernier élément est en position `len(t) - 1`. Il est possible d'accèder aux éléments par leur index entre crochets. 


``` py
>>> t = ['a', 'b', 'c', 'd', 'e', 'f']
>>> t[1]
'b'
```

:warning: Le premier élément est à l’index 0.


Comme pour les p-uplets, on peut utiliser des indices négatifs, le dernier élément à l’indice `-1`, l'avant-dernier `-2`, etc.

``` py
>>> t = ['a', 'b', 'c', 'd', 'e', 'f']
>>> t[-1]
'f'
>>> t[-3]
'd'
```

L'accès à une partie d'un tableau (une « tranche ») se fait sur le modèle `t[début:fin]` [^2.4] pour récupérer tous les éléments, entre les positions `debut` (inclus) et `fin` (**exclu**). 

[^2.4]: Il est aussi possible de préciser un `pas` sur le modèle `t[début:fin:pas]`. 


``` py
>>> t = ['a', 'b', 'c', 'd', 'e', 'f']
>>> t[0:2]
```

Lorsqu'aucun indice n'est indiqué à gauche ou à droite du symbole deux-points, Python prend par défaut tous les éléments depuis le début ou tous les éléments jusqu'à la fin respectivement.

``` py
>>> t = ['a', 'b', 'c', 'd', 'e', 'f']
>>> t[0:]
['a', 'b', 'c', 'd', 'e', 'f']
>>> t[:]
['a', 'b', 'c', 'd', 'e', 'f']
>>> t[1:]
['b', 'c', 'd', 'e', 'f']
>>> t[:2]
['a', 'b']
>>> t[1:-2]
['b', 'c', 'd']
```

Il est aussi possible de « deballer » ou disperser un tableau en affectant tous ses éléments dans plusieurs variables :

``` py
>>> a, b, c, d = [1, 2, 3, 4]
>>> a
1
```
Le mot clé `in` permet de vérifier si un élément `elem` est présent dans un tableau `t`,  `elem in t` renvoie un booléen :

``` py
>>> t = [1, 3 ,8]
>>> 3 in t
True
>>> 4 in t
False
```

De facçon très similaire aux p-uplets, le mot clé `in` permet aussi d’écrire une boucle pour parcourir (ou «itérer») toutes les valeurs d'un tableau. Comparons à nouveau différentes méthodes pour parcourir un tableau `t` :


=== "Avec une boucle non bornée `while`"
    Il faut gérer l'indice de boucle `i` pour qu'il parcourt toutes les positions des valeurs de `t`, c'est-à-dire l'intialiser à `0` puis l'incrémenter à chaque passage dans la boucle (`i = i + 1`) jusqu'à ce qu'il dépasse `len(t) - 1`.  `t[i]` permet d'accéder à la valeur du tableau qui se trouve à la position `i`.

    ``` py
    >>> t = [1, 3, 8]
    >>> i = 0
    >>> while i < len(t):
    ...     print(t[i])
    ...     i = i + 1
    ...     
    1
    3
    8
    ```

=== "Avec une boucle bornée `for`"

    Avec `for i in range(len(t)):`, l'indice de boucle `i` prend automatiquement les valeurs allant de  `0` à `len(t) - 1`. `t[i]` permet d'accéder à la valeur du p-uplet qui se trouve à la position `i`.

    ``` py
    >>> t = [1, 3, 8]
    >>> for i in range(len(t)):
    ...     print(t[i])
    ...     
    1
    3
    8
    ```


=== "Avec une boucle bornée `for` et le mot clé `in`"

    `for elem in t` permet d'accéder directement à toutes les du tableau les unes après les autres, sans connaître leurs positions.

    ``` py
    >>> t = [1, 3, 8]
    >>> for elem in t:
    ...     print(elem)
    ...     
    1
    3
    8
    ```


La boucle `for elem in t` est plus simple pour parcourir les valeurs d'un tableau, par exemple pour rechercher la plus petite ou la plus grande valeur dans ce tableau, mais elle ne permet pas d'accéder à sa position. Pour accéder à la position d'une valeur que l'on recherche, il faut utiliser les deux autres méthodes.



## Modifier un tableau

### Modifier un élément

A la différence des p-uplets, on peut modifier la valeur d’un élément dans un tableau :

``` py
>>> animaux = ['girafe', 'tigre', 'singe', 'souris']
>>> animaux[2]= "lion"
>>> animaux
['girafe', 'tigre', 'lion', 'souris']
``` 

###	Opérations sur tableaux

Avec les tableaux, on peut utiliser l'opérateur + de concaténation, ainsi que l'opérateur * pour la duplication  :
>>> ani1 = ['girafe', 'tigre']
>>> ani2 = ['singe', 'souris']
>>> ani1 + ani2
['girafe', 'tigre', 'singe', 'souris']
>>> ani1 * 3
['girafe', 'tigre', 'girafe', 'tigre', 'girafe', 'tigre']
2.4.3	Ajouter de nouveaux éléments
Il existe plusieurs méthodes pour ajouter des éléments à un tableau
tableau.append(x) 
	Ajouter un élément à la fin d’un tableau.
	>>> tableau = [1, 2, 3]
>>> tableau.append(4)
>>> tableau
[1, 2, 3, 4]
tableau.insert(i, x) 
	Insérer un élément x à la position donnée par l’indice i. i est la position de l'élément courant avant lequel l'insertion doit s'effectuer.  	>>> tableau = ['a', 'b', 'd']
>>> tableau.insert(2, 'c')
>>> tableau
['a', 'b', 'c', 'd']
tableau.extend(autretableau)	Étend un tableau en y ajoutant tous les éléments de l’autretableau 
	>>> tableau_1 = [1, 2, 3]
>>> tableau_2 = [4, 5, 6]
>>> tableau_1.extend(tableau_2)
>>> tableau_1
[1, 2, 3, 4, 5, 6]
Attention à ne pas confondre append (ajouter un élément) et extend (étendre un tableau). Si on utilise append avec un tableau on obtient un tableau de tableaux !
>>> tableau_1.append(tableau_2)
>>> tableau_1
[1, 2, 3, [4, 5, 6]]
2.4.4	Supprimer des éléments
A l’aide de méthodes 
tableau.remove(x) 
	Supprime le premier élément dont la valeur est égale à x. Si le tableau  contient plusieurs fois la valeur x, seule la première occurrence trouvée est supprimée.	>>> tableau = [12, 13, 14, 15]
>>> tableau.remove(13)
>>> tableau
[12, 14, 15]
tableau.pop(i)
tableau.pop()
	Enlève l'élément situé à la position i et le renvoie en valeur de retour. Si aucune position n'est spécifiée, enlève et renvoie le dernier élément du tableau	>>> t=[1,2,3]
>>> t.pop()
3
>>> t
[1, 2]
tableau.clear()
	Supprime tous les éléments du tableau. 	>>> t.clear()
>>> t
[]
A l’aide du mot clé “del”  on peut aussi supprimer un élément du tableau :
>>> tableau
[1, 2, 3, 4, 5]
>>> tableau = [1 ,2, 3 ,4]
>>> del tableau[3]
>>> tableau
[1, 2, 3]	Ou tous les éléments
>>> tableau = [1,2,3]
>>> del tableau [:]
>>> tableau
[]
Ou encore le tableau entier avec l’instruction del tableau, alors la variable tableau n’existe plus.
>>> del tableau
>>> tableau
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name ' tableau ' is not defined
2.5	D’autres méthodes bien utiles
Deux méthodes pour trier un tableau :
tableau.sort()
	Ordonne les éléments dans le tableau  	>>> l=[5, 8, 2, 1]
>>> l.sort()
>>> l
[1, 2, 5, 8]
tableau.reverse()
	Inverse l'ordre des éléments du tableau.	>>> l.reverse()
>>> l
[8, 5, 2, 1]
Pour trouver un élément dans un tableau :
tableau.index(x)
	Renvoie la position du premier élément du tableau dont la valeur égale x 	>>> l = [5 ,0 ,3 ,2 ,8 ,6]
>>> l.index(2)
3
>>> ['a', 'c', 'd', 'e'].index('c')
1
tableau.count(x)	Renvoie le nombre d'éléments ayant la valeur x dans le tableau.	>>> [1, 1 , 2, 2, 2 ,3 , 4, 4 ,3].count(3)
2
Enfin, pour obtenir une liste exhaustive des méthodes disponibles pour les tableaux, on utilise dir(list).
Remarque :  les méthodes telles que insert(), remove() ou sort(), qui ne font que modifier le tableau, ne renvoient pas de valeur (ou plutôt elles renvoient None).
2.6	Conversion de type (cast)
La fonction list(sequence) fonctionne exactement comme la fonction tuple(), c'est-à-dire qu'elle prend en argument un objet séquentiel et renvoie le tableau correspondant:
>>> list('abc')
['a', 'b', 'c']
>>> list('hello world')
['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd']
On peut créer un tableau vide avec la fonction list() sans argument.
tableauvide = list()  
Nous avons déjà vu l'utilisation de la fonction range() . Lorsqu'elle est utilisée en combinaison avec la fonction list(), on obtient une tableau d'entiers. Par exemple :
>>> list(range(10))
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
La méthode split() permet de découper une chaîne en tableau avec un séparateur  : chaine.split(separateur).
>>> chaine = 'Bonjour tout le monde !'
>>> chaine.split(' ')
['Bonjour', 'tout', 'le', 'monde', '!']
Réciproquement la méthode join() permet de convertir un tableau en chaîne de caractères en insérant le paramètre entre les éléments du tableau: elementSeparateur.join(montableau).
>>> t = ['Bonjour', 'tout', 'le', 'monde', '!']
>>> ' '.join(t)
'Bonjour tout le monde !'
2.7	Création par compréhension
On peut aussi créer un tableau par compréhension en utilisant :
 Nouveau_tableau = [expression(i) for i in ancien_tableau if condition]
Exemple :
>>> carres = []
>>> for x in range(10):
...     carres.append(x**2)
>>> carres
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81	Est equivalent à 
>>> carres = [x**2 for x in range(10)]
>>> carres
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
A partir d’un autre tableau ancien_tableau
>>> mult_3 = [3 * i for i in [1, 2, 3]]
>>> mult_3
[3, 6, 9]
Et avec  if conditions
>>> nombres = [2, 5, 11, 17]
>>> carre_mult_3 = [x**2 for x in nombres if x != 11]
Ou même avec une fonction
>>> def f(x):
...     return 2*x + 3
>>> absisses = [1, 2, 3, 5, 10]
>>> ordonnees = [f(x) for x in absisses]
>>> ordonnees
[5, 7, 9, 13, 23]
Avec plusieurs arguments
>>> [x + y for x in [10, 30, 50] for y in [20, 40, 60]]
[30, 50, 70, 50, 70, 90, 70, 90, 110]
 
2.8	Tableaux de tableaux 
Pour finir, il est tout à fait possible de construire des tableaux de p-uplets ou des tableaux de tableaux. Cette fonctionnalité peut parfois être très pratique.
2.8.1	Création d’un tableau de tableaux
>>> enclos1 = ['girafe', 4]
>>> enclos2 = ['tigre', 2]
>>> enclos3 = ['singe', 5]
>>> zoo = [enclos1, enclos2, enclos3]
>>> zoo
[['girafe', 4], ['tigre', 2], ['singe', 5]]
Dans cet exemple, chaque sous-tableau contient une catégorie d'animal et le nombre d'animaux pour chaque catégorie. 
On aurait pu écrire directement :
>>> zoo=[['girafe',4], ['tigre',2], ['singe',5]]
>>> zoo
[['girafe', 4], ['tigre', 2], ['singe', 5]]
On peut aussi créer un tableau de tableaux avec une fonction :
matrice = []
for n in range(4) :
    ligne = [4*n + 1 for i in range(1, 5)]
    matrice.append(ligne)
Ou par compréhension par exemple, cette compréhension de tableaux combine les éléments de deux tableaux  s'ils ne sont pas égaux :
>>> table = [[x, y] for x in [1, 2, 3] for y in [3, 1, 4] if x != y]
>>> table
[[1, 3], [1, 4], [2, 3], [2, 1], [2, 4], [3, 1], [3, 4]]
2.8.2	Accès aux éléments
Pour accéder à un élément du tableau de tableaux, on utilise l'indiçage habituel :
>>> zoo[1]
['tigre', 2]
Pour accéder à un élément d’un sous-tableau, on utilise un double indiçage :
>>> zoo[1][0]
'tigre'
>>> zoo[2][1]
5
Dans le cas d’un tableau de tableaux avec des sous-tableaux de même taille, on parle parfois de matrice  . 
girafe	4
tigre	2
singe
5

On dit que cette matrice a 2 dimensions et est de taille 3 x 5. Les éléments sont donc identifiés par zoo[no de ligne][no de colonne]
 
En pratique : Ecrire une fonction qui vérifie qu’un carré est magique (ou pas) 
«  En mathématiques, un carré magique d'ordre n est composé de n2 entiers strictement positifs, écrits sous la forme d'un tableau carré. Ces nombres sont disposés de sorte que leurs sommes sur chaque rangée, sur chaque colonne et sur chaque diagonale principale soient égales. » source : https://fr.wikipedia.org/wiki/Carr%C3%A9_magique_(math%C3%A9matiques) 

def est_magique(m):
    '''[[int]] -> bool
    Renvoie Trus si m est un carré magique, False sinon
    '''

    taille=len(m)

    # calcule la somme sur la diagonale
    diag = 0
    for line in range(taille):
        diag = diag + m[line][line]

    # vérifie les lignes
    for line in range(taille):
        somme = 0
        for col in range(taille):
            somme = somme + m[line][col]
        if somme != diag:
            return False

    #vérifie les colonnes
    for col in range(taille):
        somme = 0
        for line in range(taille):
            somme = somme + m[line][col]
        if somme !=diag:
            return False

    # si on arrive ici, c'est que m est un carre est magique
    return True


c1 = [[7, 12, 1, 14], [2, 13, 8, 11], [16, 3, 10, 5], [9, 6, 15, 4]]
assert est_magique(c1)

c2 = [[2, 7, 6], [9, 5, 1], [4, 3, 8]]
assert est_magique(c2)

c3 = [[2, 7, 6], [9, 5, 1], [4, 3, 7]]
assert not est_magique(c3)

Pour aller plus loin : Ecrire une fonction lucas(a, b, c) prenant en paramètres 3 entiers relatifs a, b et c , vérifie par asserts que  0 < a < b < c – a et b ≠ 2a puis construit le carré magique 3x3 en utilisant la méthode d’Edouard Lucas 
c + a	c – a – b	c + b
c – a + b	c	c + a – b
c – b	c + a + b	c – a
 
2.9	Tableaux muables
On a vu que les tableaux sont muables c’est-à-dire qu’on peut modifier chaque élément d’un tableau individuellement, supprimer ou ajouter des éléments. Mais on peut aussi modifier les variables de type int, float, tuple, str ou bool pourtant dit «  immuables », alors qu’elle est la différence ? 
Observons la différence en utilisant la fonction id() qui renvoie l'identifiant d’une variable en mémoire.
>>> a = 1
>>> id(a)
2366593132848
>>> a = a + 1
>>> id(a)
2366593132880
Une nouvelle variable a été créée en mémoire.	>>> t = [1]
>>> id(t)
2366637916800
>>> t.append(2)
>>> id(t)
2366637916800
C’est la même variable t qui est en mémoire.
2.9.1	Copie de tableau
Comparons ce qu’il se passe quand on copie une variable immuable, par exemple de type int, et une variable de type list muable.
>>> a = 1
>>> b = a
Modifions b
>>> b = 2
>>> b
2
Qu’est-il arrivé à a
>>> a
1
a n’a pas changé	>>> t = [1, 2, 3]
>>> u = t
Modifions u
>>> u[2] = 4
>>> u
[1, 2, 4]
Qu’est-il arrivé à t
>>> t
[1, 2, 4]
t a aussi été modifié quand on a modifié u !
Les deux variables t et u ne sont pas deux objets différents mais deux noms qui font référence vers le même objet.  Pour s’en convaincre on peut vérifier les adresses des variables
>>> id(a)
2366593132848
>>> id(b)
2366593132880
a et b sont bien deux variables différentes.	>>> id(t)
2366638078720
>>> id(u)
2366638078720
t et u  sont deux noms pour la même variables .
Pour copier un tableau , il faut créer une copie explicite du tableau initial.  Cela se fait de plusieurs manières : 
•	avec t[:] qui créé une copie des données du tableau t (en opposition à une copie du tableau t) :
>>> t = [1, 2, 3]
>>> u = t[:]
•	Avec  la fonction list(itérable) qui renvoie un tableau formé des éléments de la variable itérable:
>>> u = list(t)
•	Ou encore utiliser la méthode .copy()
>>> u = t.copy()
 
2.9.2	Tableau passé en paramètre de fonction
Passer des arguments à une fonction d’un type muable comme list   génère des effets de bord   . 
On a vu précédemment qu’une fonction ne modifie pas la valeur d’une variable passée en paramètre en dehors de son exécution. On dit que les paramètres sont passés par valeur. C’est en effet le cas avec des variables de type immuable mais ce n’est pas le cas pour les variables de type muable comme le type list. Dans ce cas, la fonction reçoit l'adresse en mémoire de la variable passée en argument et peut donc en modifier le contenu.
Illustrons cela des fonctions f(x) et g(x) qui modifient simplement la valeur d’un paramètre x 
def f(x):
    x = 2	def g(x):
    x.append(2)
Appelons ces fonctions en passant des variables a et t en paramètre  : 
>>> a = 1
>>> f(a)
>>> a
1 
a n’a pas été modifié par la fonction f().	>>> t = [1]
>>> g(t)
>>> t
[1 ,2]
t a été modifié par la fonction g() !
2.9.3	Autres effets 
On peut initialiser un tableau avec une valeur par défaut pour tous les éléments, par exemple des zéros, avec 
>>> t = [0] * 3
>>> t
[0, 0, 0]
Mais attention à ne pas utiliser cette méthode pour des tableaux de tableaux :
>>> t = [[0] * 3] * 3
>>> t
[[0, 0, 0], [0, 0, 0], [0, 0, 0]]
>>> t[0][0] = 1
>>> t
[[1, 0, 0], [1, 0, 0], [1, 0, 0]]
On préfèrera donc :  t = [0 for i in range(3)]  et    t = [[0 for i in range(3)] for i in range(3)]
De la même façon, on ne doit pas définir un paramètre de fonction par mot clé avec un tableau de type list , par exemple dans la fonction suivante :  
def ajouter(a, L = []):
    L.append(a)
    return L
La valeur par défaut n'est évaluée qu'une seule fois puis la fonction accumule les arguments au fil des appels :
>>> M = ajouter(1)
>>> M
[1]
>>> N = ajouter(2)
>>> N
[1, 2]
Pour finir, il revient au même de faire par exemple n += 1 et n = n + 1 pour des entiers mais par pour des tableaux :
def f(L, n) :
    for k in range(n) :
        L += [k]  # equivalent à L.append()	def g(L, n) :
    for k in range(n) :
        L = L + [k]
