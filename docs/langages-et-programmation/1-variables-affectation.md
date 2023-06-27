# Variables et affectation

## Variables
Le mot "informatique" désigne le traitement automatique de l'information[^1.1]. Dans un programme informatique, ces informations sont représentées par des données.

[^1.1]: Le terme « informatique » résulte de l'association du terme « information » au suffixe « -ique » signifiant « qui est propre à ».

!!! abstract "Cours" 
    Les programmes informatiques manipulent des données en utilisant des **variables**. Une variable permet d'associer un nom à une valeur.


Une variable informatique peut se concevoir un peu comme une “boite” qui serait identifiée par un nom et qui contiendrait une donnée dans un programme. Le contenu de cette “boite” peut évoluer pendant l’exécution du programme[^1.2].

[^1.2]:
    La notion de variable en informatique diffère des mathématiques. En mathématique une variable apparait dans l’expression symbolique d’une fonction $f(x)=2x+3$, ou dans une équation $2x+3=5x-3$ pour désigner une inconnue qu’il faut trouver, ou encore dans  une formule comme $(a+b)² =a²+2ab+b²$ pour indiquer que l’égalité est vraie pour toutes les valeurs de $a$ et $b$.


En Python, comme dans la plupart des langages informatiques, le nom d’une variable :

- s'écrit en lettres minuscules (de ```a``` à ```z```) et majuscules (de ```A``` à ```Z```) et peut contenir des chiffres (```0``` à ```9```) et le caractère souligné (```_```) ;
- ne doit pas comporter d’espace, de signes d’opération ```+```, ```-```, ```*``` ou ```/```, ni de caractères spéciaux comme des signes de ponctuation `'`, `"`, `,`, `.` , `:`, etc. ou `@` ;
- ne doit pas débuter par un chiffre ;
- ne doit pas être un mot réservé de Python, par exemple ```for```, ```if```, ```print```, etc. ; et
- est sensible à la casse, ce qui signifie que les variables ```TesT```, ```test``` ou ```TEST``` sont différentes.

En pratique cela permet d’éviter les noms de variable réduits à une lettre et d’utiliser des noms qui ont un sens ! 

!!! tip "PEP 8" 
    La [PEP 8](https://peps.python.org/pep-0008/) [^1.3] donne un grand nombre de recommandations de style pour écrire du code Python agréable à lire et recommande en particulier de nommer les variables par des mots en minuscule séparés par des blancs soulignés  « ```_``` »[^1.4]), par exemple d'utiliser `somme_des_nombres` dans un programme qui additionne des nombres plutôt que juste `s` (.



[^1.3]:
    [Une PEP (pour *Python Enhancement Proposal*)](https://www.python.org/dev/peps/#introduction) est un document fournissant des informations à la communauté Python, ou décrivant une nouvelle fonctionnalité. En particulier la [PEP 8](https://peps.python.org/pep-0008/) décrit les conventions de style de code agréable à lire.

[^1.4]: 
    Le style qui consiste à nommer les variables par des mots en minuscule séparés par des blancs soulignés, par exemple `somme_des_nombres`, est appelé  « *snake case* » en opposition au style qui consiste à écrire les mots attachés en commençant par des majuscules, par exemple ```SommeDesNombres```, appelé « *camel case* ».

## Types de variable

!!! abstract "Cours" 
    Les variables peuvent être de **types** différents en fonction des données qu’elles contiennent.

Par exemple :

- des nombres entiers (type ```int```) ;
- des nombres décimaux, appelés « flottants » (type ```float```) écrits toujours avec un point, le séparateur décimal étant un point et :warning:**pas une virgule**, par exemple `5.0`. Noter que `>>> 2e5` ou `>>> 2E5` pour $2 \times 10^5$ permettent d'écrire rapidement le nombre flottant `200000.0` ;
- des booléens prenant seulement les valeurs `True` ou `False` (type ```bool```) ;
- des textes ou chaines des caractères (type ```str```) écrits entre une paire de guillemets (```"```) ou d’apostrophes (```'```) ;
- des types construits comme les p_uplet, tableaux, dictionnaires[^1.5], etc.

[^1.5]: Les p_uplet, tableaux, dictionnaires sont étudiés dans un autre chapitre du programme de 1ère.

##	Affectation

!!! abstract "Cours" 
    L'**affectation** consiste à stocker une valeur dans une variable. En Python, comme dans la plupart des langages informatiques, l’**affectation d'une valeur à une variable** est représentée par le signe « `=` ».[^1.6]

[^1.6]: En algorithmique, l’affectation est symbolisée par une flèche allant de la valeur (à droite) vers la variable (à gauche), par exemple $a←3$ pour affecter  la valeur $3$ à la variable $a$.

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

:warning:  C'est la valeur à droite du signe « `=` » qui est affectée au nom de la variable à gauche, et pas pas dans l'autre sens :
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
et d'affecter les valeurs de plusieurs variables en même temps en une seule ligne :
``` python 
>>> a, b = 5, 6
>>> a
5
>>> b
6
```
!!! tip inline end "PEP 8" 
    Mettre un espace après les virgules (mais pas avant).

En Python, c’est l’affectation qui définit le type de la variable[^1.7] :

[^1.7]: 
    Python est un langage de typage dynamique, ce n'est pas le cas de nombreux langages comme le C  ou le C++ qui forcent à définir le type des variables et à le conserver au cours de la vie de la variables, ils sont de typage statique. 
    Exemple d'affectation en C :  
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
	On affecte les valeurs 5 et 6 (de type `int`)  à deux variables nommées respectivement `a` et `b` :
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

    2. Une première solution consiste donc à utiliser une autre variable pour conserver la valeur intiale de `a` temporairement, appelons la `temp` :
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


