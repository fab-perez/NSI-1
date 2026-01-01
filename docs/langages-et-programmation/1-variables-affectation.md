# Variables et affectation

## Variables
L'informatique désigne le traitement automatique de l'information[^1.1]. Dans les programmes informatiques, l'information est représentée par des données.

[^1.1]: Le terme « informatique » résulte de l'association du terme « information » au suffixe « -ique » signifiant « qui est propre à », et en anglais on utilise souvent le terme IT pour *information technology*.

!!! abstract "Cours" 
    Les programmes informatiques manipulent des données en utilisant des **variables**. Une variable permet d'associer un nom à une valeur.


![Boite étiquetée "nom_variable" dans laquelle on met une valeur](assets/1-variables-boite-light-mode.png#only-light){width="20%" align=right}
![Boite étiquetée "nom_variable" dans laquelle on met une valeur](assets/1-variables-boite-dark-mode.png#only-dark){width="20%" align=right}

Une variable informatique peut se concevoir comme une sorte de “boite” étiquetée avec un nom, dans laquelle un programme enregistre une valeur pour la consulter ou la modifier pendant son exécution[^1.2].

[^1.2]:
    La notion de variable en informatique diffère des mathématiques. En mathématique une variable apparaît dans l'expression symbolique d'une fonction $f(x)=2x+3$, ou dans une équation $2x+3=5x-3$ pour désigner une inconnue qu'il faut trouver, ou encore dans  une formule comme $(a+b)² =a²+2ab+b²$ pour indiquer que l'égalité est vraie pour toutes les valeurs de $a$ et $b$.

En Python, comme dans la plupart des langages informatiques, le nom d'une variable :

- s'écrit en lettres minuscules (« `a` » à « `z` ») et majuscules (« `A` » à « `Z` ») et peut contenir des chiffres (« `0` » à « `9` ») et le caractère blanc souligné (« `_` ») ;
- ne doit pas comporter d'espace, de signes d'opération « `+` », « `-` », « `*` » ou « `/` », ni de caractères spéciaux comme des signes de ponctuation « `'` », « `"` », « `,` », « `.` », « `:` », « `@` », etc.  ;
- ne doit pas commencer par un chiffre ;
- ne doit pas être un mot réservé de Python, par exemple « `for` », « `if` », « `print` », etc. ; et
- est sensible à la casse, ce qui signifie que les variables « `TesT` », « `test` » ou « `TEST` » sont différentes.

En pratique cela permet d'éviter les noms de variable réduits à une lettre et d'utiliser des noms qui ont un sens ! 

!!! tip "PEP 8" 
    La [PEP 8](https://peps.python.org/pep-0008/) [^1.3] donne un grand nombre de recommandations de style pour écrire du code Python agréable à lire et recommande en particulier de nommer les variables par des mots en minuscule séparés par des blancs soulignés  (```_```) [^1.4], par exemple d'appeler une variable `somme_des_nombres` plutôt que `s` dans un programme qui additionne des nombres.



[^1.3]:
    Une [PEP (pour *Python Enhancement Proposal*)](https://www.python.org/dev/peps/#introduction) est un document fournissant des informations à la communauté Python, ou décrivant une nouvelle fonctionnalité. En particulier la [PEP 8](https://peps.python.org/pep-0008/) décrit les conventions de style de code agréable à lire.

[^1.4]: 
    Le style qui consiste à nommer les variables par des mots écrits en minuscule séparés par des blancs soulignés, par exemple `somme_des_nombres`, est appelé  « *snake case* » en opposition au style qui consiste à écrire les mots attachés en commençant par des majuscules, par exemple ```SommeDesNombres```, appelé « *camel case* ».

## Types de variable

!!! abstract "Cours" 
    Les variables peuvent être de **types** différents en fonction des données qu'elles représentent.

Les principaux types de variable sont :

-   les nombres entiers (type ```int```) ;
-   les nombres décimaux, appelés « flottants » (type ```float```) qui s'écrivent toujours avec un point (:warning: le séparateur décimal est un point, **pas une virgule**), par exemple `5.0`.

    Noter que `.5` et `5.` permettent d'écrire rapidement les flottants `0.5` et `5.0` et que `2e5` ou `2E5` (pour $2 \times 10^5$) permettent d'écrire le nombre flottant `200000.0` ;

-   les booléens prenant seulement les valeurs `True` ou `False` (type ```bool```) ;
-   les textes ou chaines des caractères (type ```str```) écrits entre une paire de guillemets (```"```) ou d'apostrophes (```'```) ;
-   d'autres types dits "construits" comme les p_uplets, tableaux, dictionnaires[^1.5], etc.

[^1.5]: Les p_uplet, tableaux, dictionnaires sont étudiés dans un autre chapitre du programme de 1ère.

##	Affectation

!!! abstract "Cours" 
    L'**affectation** consiste à donner une valeur à une variable. En Python, comme dans la plupart des langages informatiques, l'**affectation d'une valeur à une variable** est représentée par le signe « `=` ».[^1.6]

[^1.6]: En algorithmique, l'affectation est symbolisée par une flèche allant de la valeur (à droite) vers le nom de la variable (à gauche), par exemple $a←3$ pour affecter  la valeur $3$ à la variable $a$.

Par exemple, saisir les commandes suivantes dans la console Python permet d'affecter les valeurs 3 (type `int`), 3.0 (type `float`) et "3" (type `str`) à des variables nommées respectivement `a`, `b` et `c`  :

!!! notetip inline end "" 
    La console Python, ou interpréteur Python, est un moyen rapide d'exécuter des commandes. Il suffit de taper une instruction en réponse à l'invite `>>>` puis d'appuyer sur la touche « Entrée » pour lancer son exécution.

!!! tip inline end "PEP 8" 
    Mettre des espaces autour d'un égal (`=`).

``` py 
>>> a = 3
>>> b = 3.0
>>> c = "3"
```

En Python, c'est l'affectation qui définit le type d'une variable[^1.7].

[^1.7]: 
    Python est un langage de typage dynamique, ce n'est pas le cas de nombreux langages comme le C  ou le C++ qui forcent à définir le type d'une variable et à le conserver au cours de la vie de la variable, ils sont de typage statique. 
    Exemple d'affectation en C :  
    ```C
    int a;
    a = 3; 
    ```



:warning:  C'est bien la valeur qui se trouve à droite du signe « `=` » qui est affectée à la variable à gauche, et pas dans l'autre sens.
``` py 
>>> 3 = a
  File "<interactive input>", line 1
SyntaxError: can't assign to literal
```

!!! tip inline end "PEP 8" 
    Mettre un espace après une virgule (`,`) , mais pas avant.

Il est aussi possible d'affecter des valeurs à plusieurs variables en même temps :
``` py 
>>> a, b = 3, 4
>>> a
3
>>> b
4
```

et d'affecter la valeur d'une variable à une autre variable, par exemple :

!!! note inline end "" 
	Quand on tape le nom d'une variable dans la console, elle affiche sa valeur.

``` py 
>>> a = 3
>>> b = a
>>> b
3
```


:warning: Il n'est pas possible d'utiliser une variable avant de lui avoir affecté une valeur.
``` py 
>>> d
Traceback (most recent call last):
  File "<interactive input>", line 1, in <module>
NameError: name 'd' is not defined
```

!!! question "Exercice corrigé" 
	On affecte les valeurs 5 et 6 (de type `int`)  à deux variables nommées respectivement `a` et `b` :
    ``` py
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
    Cette solution ne fonctionne pas car la valeur initiale de `a`, c'est-à-dire 5, est perdue quand on écrit `a = b`, on dit qu'elle est "écrasée" par la valeur de `b`. Ensuite quand on écrit `b = a` on affecte la nouvelle valeur de `a`, c'est-à-dire 6 au lieu de 5, à `b`.

    2. Une première solution consiste donc à utiliser une autre variable pour conserver la valeur initiale de `a` temporairement, appelons la `temp` :
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
    >>> a, b = b, a
    >>> a
    6
    >>> b
    5
    ```

    4. Il existe aussi une troisième solution un peu plus compliquée, qui n'utilise ni variable temporaire, ni affectation de plusieurs variables en une seule ligne :
    ``` py
    >>> a = a + b
    >>> b = a - b
    >>> a = a - b
    >>> a
    6
    >>> b
    5
    ```

