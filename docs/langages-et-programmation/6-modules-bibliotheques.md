##	Modules et bibliothèques

On a créé une fonction `est_premier` qui peut être appelée par d’autres programmes ou fonctions qui se trouvent dans le même fichier. Ecrivons un nouveau programme Python qui appelle est_premier:

```py 
def main():
    n = int(input('Entrez un nombre'))
    print(est_premier(n)) 
```

ce programme génère une erreur : `NameError: name 'est_premier' is not defined`

Comment faire pour appeler `est_premier` depuis ce nouveau programme sans tout réécrire ? Il faut créer un module.

Enregistrons la fonction `est_premier` dans un fichier qu’on appelle « mesfonctions.py ». :warning: le fichier « mesfonctions.py » doit être **enregistré dans le même répertoire** que le nouveau programme.

Testons à nouveau le programme principal. Toujours la même erreur. Le fichier « mesfonctions.py » doit d’abord être importé pour utiliser les fonctions qu’il contient.

!!! abstract "Cours"
    Un **module** est un ensemble de fonctions (et de variables) ayant un rapport entre elles que l'on a enfermé dans un fichier. On doit **importer** ce module dans un programme et utiliser ses fonctions.
    Une **bibliothèque** (ou *package* en anglais) est un ensemble de fonctions, variables, et de **modules** dans un même fichier.

## `import`

Pour importer un module dans un programme, on utilise l'instruction `import`. On écrit en début de programme :

```py
import mesfonctions
```

A la différence des fonctions que l'on utilise habituellement dans un programme, comme `print()` ou `range()`, pour appeler une fonction du module il faut taper le nom du module suivi d'un point « . » puis du nom de la fonction.  Par exemple on écrit `mesfonctions.est_premier()`

```py linenums="1"
import mesfonctions
def main():
    n = int(input('Entrez un nombre'))
    print(mesfonctions.est_premier(n)) 
```

:warning: Prendre soin d’enregistrer ce programme dans le même répertoire que le fichier « mesfonctions.py ».

On peut aussi donner un alias à un module :

```py linenums="1"
import  mesfonctions  as mf
```
et utiliser ensuite `mf.est_premier()`.

!!! abstract "Cours"
    === "Sans alias"
        On importe un module nom_module en début de programme avec l’instruction :

        `import nom_module`	
        
        puis on utilise une fonction de ce module nom_fonction() en écrivant :

        `nom_module.nom_fonction()`

    === "Avec alias"
        On importe un module nom_module en début de programme en lui donnant un alias avec l’instruction :

        `import nom_module as nom_alias`	

        puis on utilise une fonction de ce module nom_fonction() en écrivant :

        `nom_alias.nom_fonction()`

La fonction `help` permet de savoir ce que contient un module :

```py
>>> help(mesfonctions)
Help on module mesfonctions:
…
```

##	`from … import …`

Il existe une autre méthode d'importation qui ne fonctionne pas tout à fait de la même façon. Admettons que le module `mesfonctions` contienne des dizaines de fonctions, mais que nous ayons uniquement besoin dans notre programme de la fonction `est_premier`, dans ce cas on préfèrera n'importer que cette fonction au lieu d'importer tout le module.

```py
from  mesfonctions   import est_premier

def main():
    n = int(input('Entrez un nombre'))
    print(est_premier(n))
```

Ici on ne met pas le préfixe « `mesfonctions.` »  devant le nom de la fonction. 

On peut aussi donner un alias à une fonction :
`from  mesfonctions   import est_premier as estprems`
et utiliser ensuite la fonction `estprems()`.

!!! abstract "Cours"
   
    === "Sans alias"

        On importe une fonction `nom_fonction()` depuis le module `nom_module` en début de programme avec l’instruction :
        
        `from nom_module import nom_fonction`		
        
        puis on utilise cette fonction en écrivant :
        
        `nom_fonction()`

    === "Avec alias"

        On importe une fonction `nom_fonction()` en lui donnant un alias depuis le module `nom_module` en début de programme avec l’instruction :
        
        `from nom_module import nom_fonction as nom_alias`		
        
        puis on utilise cette fonction en écrivant :
        
        `nom_alias()`



On peut aussi appeler plusieurs fonctions d’un même module séparée par des virgules :

```py
from  mesfonctions   import est_premier, une_autre_fonction
```
voire même toutes les fonctions d'un module en tapant « `*` » à la place du nom de la fonction à importer.

```py
from  mesfonctions  import *
```

mais cette utilisation est vivement déconseillée[^1] hormis dans des cas très particuliers par exemple des programmes très courts. 

[^1]: Pour s’en convaincre on peut ecrire un programme avec la fonction `pow(1, 2, 3)` puis ajouter `from math import *` et réessayer.

Python offre des centaines de modules avec des milliers de fonctions déjà programmées. Il y a différents types de modules :

- ceux que l’on peut faire soi-même (comme `mesfonctions`).
- ceux qui sont inclus dans la bibliothèque standard de Python comme `random` ou `math`,
- ceux que l’on peut rajouter en les installant séparemment comme `numpy` ou `matplotlib`.

##	la fonction main()

On a vu auparavant la définition de la fonction `main()` contenant le programme principal, suivi du bout de code suivant :

```py
if __name__ == '__main__':
    main()
```

Cette instruction conditionnelle vérifie si une variable appelée `__name__` est égale à `'__main__'` et dans ce cas exécute la fonction `main()`. 

L’interpréteur Python définit la variable `__name__` selon la manière dont le code est exécuté :
- directement en tant que script, dans ce cas Python affecte `'__main__'` à  `__name__`, l'instruction conditionnelle est vérifiée et la fonction `main()` est appelée ; ou alors 
- en important le code dans un autre script et dans ce cas la fonction `main()` n’est pas appelée.

En bref, la variable `__name__` détermine si le fichier est exécuté directement ou s'il a été importé.[^2] 

[^2]: On peut facilement se convaincre de l’utilité de la fonction `main()` en écrivant un programme sans cette fonction et observer qu’il est automatiquement exécuté quand on l’importe dans un autre programme.

##	Le module math

Le [module `math`](https://docs.python.org/3/library/math.html) permet d’avoir accès aux fonctions mathématiques comme le cosinus (`cos`), le sinus (`sin`), la racine carrée (`sqrt`), le nombre π (`pi`), la partie entière (`floor`)[^3] , et bien d’autres...

[^3]:
    On a déjà vu la fonction `int()` qui semble similaire à `math.floor()`, mais attention aux différences entre les deux.

    === "Avec un `float` positif"
    ```py
    >>> math.floor(12.5)
    12.0
    >>> int(12.5)
    12
    ```

    === "Avec un `float` négatif"
    ```py
    >>> math.floor(-12.5)
    -13.0
    >>> int(-12.5)
    -12
    ```


```py
>>> import math
>>> math.cos(math.pi)             # cosinus d'un angle en radian
-1.0
>>> math.sqrt(25)            # racine carrée
5.0
```



##	Le module random

Le [module `random`](https://docs.python.org/3/library/random.html) permet d’utiliser des fonctions générant des nombres aléatoires. Les deux plus utiles courantes sont :  `random()` qui renvoie un nombre aléatoire entre 0 et 1 et `randint(a, b)` qui renvoie au hasard un nombre entier compris entre `a` et **`b` inclus**.

``` py
>>> from random import random, randint
>>> random()
0.34461947461259612
>>> randint(1, 2)
2
```

##	Le module pyplot

La [bibliothèque `mathplotlib`](https://matplotlib.org/) contient le module `pyplot` (utilisé pour tracer des courbes). Pour importer ce module, l’utilisation d’un alias est particulièrement utile dans ce cas. 

```py
import matplolib.pyplot as plt
```

pyplot permet d'afficher des données sous de [multiples formes](https://matplotlib.org/stable/gallery/index.html). Par exemple pour afficher un point de coordonnées (2, 4 ) sous forme d'une croix verte dans un repère on utilise :

```py
x, y = 2, 4
plt.plot(x, y,'g+')
plt.show()  
```

##	D’autres modules 

Il y en a beaucoup d’autres, tant dans la nature (https://github.com/search?q=python+module) que dans la bibliothèque standard (http://docs.python.org/3/py-modindex.html),

|module|Description|
|---|---|
|`numpy`|Permet de faire du calcul scientifique.|
|`time`|Fonctions permettant de travailler avec le temps.|
|`turtle`|Fonctions de dessin.|
|`doctest`|Execute des tests ecrits dans la docstring d’une fonction.|

La fonction `dir` permet d’explorer le contenu d’un module :

```py
>>> import math
>>> dir(math)
['__doc__',
 '__loader__',
 '__name__',
 '__package__',
 '__spec__',
 'acos',
 'acosh',
 'asin',
…
```

En plus de la documentation en ligne, on a déjà vu la fonction help qui donne les spécifications d’une fonction.

```py
>>> help(math.cos)
Help on built-in function cos in module math:

cos(...)
    cos(x)
    
    Return the cosine of x (measured in radians).
```



!!! question "Exercice corrigé" 
	Réaliser le dessins suivant (dix carrés rouges de 50 pixels de coté), à l'aide du module turtle.
    [![10-carre-rouge](../assets/turtle-10-carres-rouges.png "Dix carrés rouges de 50 pixels de cotés dans une fenêtre turtle")]

??? Success "Réponse"

    ```py 
    import turtle

    def carre(taille, couleur):
        turtle.pendown()
        turtle.color(couleur)
        for _ in range(4):
            turtle.forward(taille)
            turtle.right(90)
        turtle.penup()

    turtle.penup()
    turtle.goto(-300,0)
    for c in range(10):
        carre(50,'red')
        turtle.forward(60)
    ```
    