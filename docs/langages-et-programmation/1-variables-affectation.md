# Variables et affectation

## Variable

!!! abstract "Cours" 
    Un programme stocke et manipule des informations en utilisant des **variables**. Une variable associe un nom à la valeur.

On peut concevoir une variable un peu comme une “boite” qui est identifiée par un nom et contient les informations utilisées par un programme informatique. Le contenu de cette “boite” peut évolue pendant l’exécution du programme[^1].

En Python, comme dans la plupart des langages informatiques, le nom d’une variable :

- s'écrit en lettres minuscules (```a``` à ```z```) et majuscules (```A``` à ```Z```) et peut contenir des chiffres (```0``` à ```9```) et le caractère souligné (```_```) ;
- ne doit pas comporter d’espace, de signes d’opération ```+```, ```-```, ```*``` ou ```/```, ni de caractères spéciaux comme ```',"``` ou ```@``` ;
- ne doit pas débuter par un chiffre ;
- ne doit pas être un mot réservé de Python, par exemple ```for```, ```if```, ```print```, etc. ; et
- est sensible à la casse, ce qui signifie que les variables ```TesT```, ```test``` ou ```TEST``` sont différentes.

En pratique cela permet d’éviter les noms de variable réduits à une lettre et d’utiliser des noms qui ont un sens ! 

!!! tip "PEP-8" 
    La [PEP-8](https://peps.python.org/pep-0008/) [^2] donne un grand nombre de recommandations de style pour écrire du code Python agréable à lire, et recommande en particulier de nommer les variables par des mots en minuscule séparés par des blancs soulignés  « ```_``` » . Par exemple on utilise `somme_des_nombres` plutôt que `s` dans un programme qui additionne des nombres, ce style est appelé  « *snake case* »[^3].

[^1]:
    La notion de variable en informatique diffère des mathématiques. En mathématique une variable apparait dans l’expression symbolique d’une fonction $f(x)=2x+3$, ou dans une équation $2x+3=5x-3$ pour désigner une inconnue qu’il faut trouver, ou encore dans  une formule comme $(a+b)² =a²+2ab+b²$ pour indiquer que l’égalité est vraie pour toutes les valeurs de $a$ et $b$.

[^2]:
    [Une PEP (pour *Python Enhancement Proposal*)](https://www.python.org/dev/peps/#introduction) est un document fournissant des informations à la communauté Python, ou décrivant une nouvelle fonctionnalité. En particulier la [PEP 8](https://peps.python.org/pep-0008/) décrit les conventions de style de code agréable à lire.

[^3]: 
    En opposition au style appelé « *camel case* » qui consiste à écrire les mots attachés en commençant par des majuscules, par exemple ```SommeDesNombres```.

## Types de variables

!!! abstract "Cours" 
    Les variables peuvent être de **types** différents en fonction des informations qu’elles contiennent.

On trouve par exemple :

- des nombres entiers (type ```int```) ;
- des nombres décimaux, appelés « flottants » (type ```float```)  (:warning: le séparateur décimal est un point, PAS une virgule), noter qu'on peut par exemple écrire `5.`ou `.5` pour 5.0 ou 0.5 et `2e5` ou `2E5` pour $2 \times 10^5$ ;
- des booléens prenant seulement les valeurs `True` ou `False` (type ```bool```) ;
- des textes ou chaines des caractères (type ```str```) écrits entre une paire de guillemets (```"```) ou d’apostrophes (```'```) ;
- des p_uplet, tableaux, dictionnaires, etc. 

##	Affectation

!!! abstract "Cours" 
    L'**affectation** consiste à stocker une valeur dans une variable. En Python, comme dans la plupart des langages informatiques, l’**affectation d'une valeur à une variable** est représentée par le signe « `=` ».[^4]

[^4]: En algorithmique, l’affectation est symbolisée par une flèche allant de la valeur (à droite) vers la variable (à gauche), par exemple $a←3$ pour affecter  la valeur $3$ à la variable $a$.

Par exemple pour affecter les valeurs 3 (type `int`), 3.3 (type `float`) et "trois" (type `str`) à des variables nommées `a`, `b` et `c` dans la console Python:
``` python 
>>> a = 3
>>> b = 3.3
>>> c = "trois"
```

!!! tip inline end "PEP-8" 
    Mettre des espaces autour du signe « `=` ».

:warning: On ne peut pas écrire :
``` python 
>>> 3 = a
  File "<interactive input>", line 1
SyntaxError: can't assign to literal
```

On peut aussi affecter la valeur d’une variable à une autre variable, par exemple :
``` python 
>>> a = 5
>>> b = a
>>> b
5
```
et affecter les valeurs de plusieurs variables en une seule ligne :
``` python 
>>> a, b = 5, 6
>>> a
5
>>> b
6
```
!!! tip inline end "PEP-8" 
    Mettre un espace après les virgules (mais pas avant).

En Python, c’est l’affectation qui définit le type de la variable[^5].

[^5]: 
    On dit que Python est un langage de typage dynamique. Ce n'est pas le cas de nombreux langages comme le C  ou le C++ qui sont de typage statique. 
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
Les variables ```a```, ```b``` et ```c``` sont de types ```int```, ```float``` et ```str``` respectivement. 

:warning: On ne peut pas utiliser une variable avant de l’avoir définie.
``` python 
>>> d
Traceback (most recent call last):
  File "<interactive input>", line 1, in <module>
NameError: name 'd' is not defined
```
