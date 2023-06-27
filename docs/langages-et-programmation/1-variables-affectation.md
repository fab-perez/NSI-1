# Variables et affectation

## Variables

!!! abstract "Cours" 
    Les programmes manipulent des informations en utilisant des **variables**. Une variable associe un nom à la valeur.

On peut concevoir une variable un peu comme une “boite” qui est identifiée par un nom et contient les informations utilisées par un programme informatique. Le contenu de cette “boite” peut évolue pendant l’exécution du programme[^1.1].

En Python, comme dans la plupart des langages informatiques, le nom d’une variable :

- s'écrit en lettres minuscules (```a``` à ```z```) et majuscules (```A``` à ```Z```) et peut contenir des chiffres (```0``` à ```9```) et le caractère souligné (```_```) ;
- ne doit pas comporter d’espace, de signes d’opération ```+```, ```-```, ```*``` ou ```/```, ni de caractères spéciaux comme ```',"``` ou ```@``` ;
- ne doit pas débuter par un chiffre ;
- ne doit pas être un mot réservé de Python, par exemple ```for```, ```if```, ```print```, etc. ; et
- est sensible à la casse, ce qui signifie que les variables ```TesT```, ```test``` ou ```TEST``` sont différentes.

En pratique cela permet d’éviter les noms de variable réduits à une lettre et d’utiliser des noms qui ont un sens ! 

!!! tip "PEP 8" 
    La [PEP 8](https://peps.python.org/pep-0008/) [^1.2] donne un grand nombre de recommandations de style pour écrire du code Python agréable à lire, et recommande en particulier de nommer les variables par des mots en minuscule séparés par des blancs soulignés  « ```_``` », par exemple d'utiliser `somme_des_nombres` plutôt que `s` dans un programme qui additionne des nombres (style appelé  « *snake case* »[^1.3]).

[^1.1]:
    La notion de variable en informatique diffère des mathématiques. En mathématique une variable apparait dans l’expression symbolique d’une fonction $f(x)=2x+3$, ou dans une équation $2x+3=5x-3$ pour désigner une inconnue qu’il faut trouver, ou encore dans  une formule comme $(a+b)² =a²+2ab+b²$ pour indiquer que l’égalité est vraie pour toutes les valeurs de $a$ et $b$.

[^1.2]:
    [Une PEP (pour *Python Enhancement Proposal*)](https://www.python.org/dev/peps/#introduction) est un document fournissant des informations à la communauté Python, ou décrivant une nouvelle fonctionnalité. En particulier la [PEP 8](https://peps.python.org/pep-0008/) décrit les conventions de style de code agréable à lire.

[^1.3]: 
    En opposition au style appelé « *camel case* » qui consiste à écrire les mots attachés en commençant par des majuscules, par exemple ```SommeDesNombres```.

## Types de variable

!!! abstract "Cours" 
    Les variables peuvent être de **types** différents en fonction des informations qu’elles contiennent.

Par exemple :

- des nombres entiers (type ```int```) ;
- des nombres décimaux, appelés « flottants » (type ```float```)  (:warning: le séparateur décimal est un point, PAS une virgule), noter qu'ils contiennent toujours un point, par exemple `5.0`, et que `>>> 2e5` ou `>>> 2E5` permettent d'écrire le nombre $2 \times 10^5$ ;
- des booléens prenant seulement les valeurs `True` ou `False` (type ```bool```) ;
- des textes ou chaines des caractères (type ```str```) écrits entre une paire de guillemets (```"```) ou d’apostrophes (```'```) ;
- des types construits comme les p_uplet, tableaux, dictionnaires, [^1.4] etc. 

[^1.4]: Les p_uplet, tableaux, dictionnaires sont étudiés dans un autre chapitre du programme de 1ère.

##	Affectation

!!! abstract "Cours" 
    L'**affectation** consiste à stocker une valeur dans une variable. En Python, comme dans la plupart des langages informatiques, l’**affectation d'une valeur à une variable** est représentée par le signe « `=` ».[^1.5]

[^1.5]: En algorithmique, l’affectation est symbolisée par une flèche allant de la valeur (à droite) vers la variable (à gauche), par exemple $a←3$ pour affecter  la valeur $3$ à la variable $a$.

Par exemple, saisir les commandes suivantes dans la console Python permet d'affecter les valeurs 3 (type `int`), 3.3 (type `float`) et "trois" (type `str`) à des variables nommées respectivement `a`, `b` et `c`  :

!!! notetip inline end "" 
    La console Python, ou interpréteur Python, est un moyen rapide d’exécuter des commandes. Il suffit de taper une instruction en réponse à l’invite `>>>` puis d’appuyer sur la touche « Entrée » pour lancer son exécution.


``` python 
>>> a = 3
>>> b = 3.3
>>> c = "trois"
```

!!! tip inline end "PEP 8" 
    Mettre des espaces autour du signe « `=` ».

:warning:  C'est uniquement la valeur à droite du signe « `=` » qui est affectée au nom de variable à gauche, et pas pas dans l'autre sens :
``` python 
>>> 3 = a
  File "<interactive input>", line 1
SyntaxError: can't assign to literal
```

Il est aussi possible d'affecter la valeur d’une variable à une autre variable, par exemple :
``` python 
>>> a = 5
>>> b = a
>>> b
5
```
et d'affecter les valeurs de plusieurs variables sur une seule ligne :
``` python 
>>> a, b = 5, 6
>>> a
5
>>> b
6
```
!!! tip inline end "PEP 8" 
    Mettre un espace après les virgules (mais pas avant).

En Python, c’est l’affectation qui définit le type de la variable[^1.6] :

[^1.6]: 
    Python est un langage de typage dynamique, ce n'est pas le cas de nombreux langages comme le C  ou le C++ qui forcent à définir le type des variables et à le conserver au cours de la vie de la variables, ils sont de typage statique. 
    Exemple de programme en C :  
    ```C
    int a;
    a = 3; 
    ```


``` python 
>>> a = 3
>>> b = 3.0
>>> c = '3.0'
```
Ici, les variables ```a```, ```b``` et ```c``` sont de types ```int```, ```float``` et ```str``` respectivement. 

:warning: Il n'est pas possible d'utiliser une variable avant de l’avoir définie :
``` python 
>>> d
Traceback (most recent call last):
  File "<interactive input>", line 1, in <module>
NameError: name 'd' is not defined
```

!!! question "Exercice corrigé" 
	On affecte les valeurs 5 et 6 (de type `int`) respectivement à deux variables `a` et `b` :
    ```py
    >>> a = 5
    >>> b = 6
    ```
    Compléter ces instructions pour échanger les valeurs de `a` et de `b` (sans utiliser les chiffres 5, 6 ou tout autre chiffre).
    

??? Success "Réponse"
    1. Voyons d'abord la solution qui ne fonctionne pas :
    ``` py
    >>> a = b
    >>> b = a
    >>> a 
    6
    >>> b
    6
    ```
    Cette solution ne fonctionne pas car la valeur intiale de `a`, c'est-à-dire 5, est perdue quand on écrit `a = b`, on dit qu'elle est "écrasée" par la valeur de `b`. Ensuite quand on écrit `b = a` on affecte la nouvelle valeur de `a`, c'est-à-dire 6 au lieu de 5, à `b`.

    2. Une première solution consiste donc à utiliser une autre variable pour conserver la valeur de `a` (5) temporairement, appelons la `temp` :
    ``` py
    >>> temp = a
    ```
    Et ensuite de faire l'échange : 
    ``` py
    >>> a = b
    >>> b = temp
    >>> a
    6
    >>> b
    5
    ```
    Notons que la dernière instruction affecte la valeur de `temp`, c'est-à-dire 5, à `b`, et pas la valeur de `a` puisqu'elle vaut 6 à ce moment là.

    3. Une deuxième solution plus élégante consiste à utiliser l'affectation de plusieurs variables sur une seule ligne :
    ``` py
    >>> a, b = b, c
    >>> a
    6
    >>> b
    5
    ```


