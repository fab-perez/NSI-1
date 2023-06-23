# Appel de fonctions

Nous avons déjà utilisé des fonctions depuis le début de cette leçon, par exemple `print()` ou `len()` sont des fonctions prédéfinies par Python. Quand on écrit un programme on utilise beaucoup de fonctions existantes, mais très souvent on veut aussi créer nos propres fonctions.

!!! note inline end "" 
    Noter ici la différene avec une fonction mathématique.

Une fonction permet d’isoler une séquence d’instructions pour pouvoir l’utiliser à n’importe quel moment et autant de fois que souhaité sans la réécrire. L’utilisation de fonctions facilite aussi la lisibilité de longs programmes .

!!! abstract "Cours" 
    Une fonction est définie (ou « déclarée ») par :

    - le mot réservé `def` (pour *define*),
    - son nom,
    - zéro, un ou plusieurs paramètres écrits entre parenthèses (les parenthèses sont obligatoires même quand il n’y a pas de paramètres) et séparés par des virgules,
    - deux points,
    - une séquence d’instructions indentées (le « corps » de la fonction).
    
    ```py
    def nom_dela_fonction(param1, param2, ...):
        instructions
    ```

De la même façon que pour les constructions élémentaires vues précédemment (`if-else`, `while`, `for`), c’est l’indentation qui suit les deux points qui détermine le bloc d’instructions qui forment la fonction.


Quand on définit une fonction, elle ne s’exécute pas. Et ceci même si la fonction contient une erreur, l’interpréteur Python ne s’en aperçoit pas. Les deux programmes suivants ne font strictement rien :

=== "Programme 1"

    ``` py linenums="1"
    def bonjour():
        print('hello')
    ```
    La fonction `bonjour` n'est pas appelée, ce programme ne fait rien.
    
=== "Programme 2" 

    ``` py linenums="1"
    def bonjour():
        prit('hello')
    ```
     La fonction `bonjour` n'est pas appelée, ce programme ne fait rien, même s'il y une erreur (:bug:  `prit` au lieu de `print` ).

Pour exécuter la fonction, il faut l’**appeler** dans un programme ou dans l’interpréteur Python en écrivant son nom suivi des parenthèse. 

!!! note inline end "" 
    :warning: Quand la fonction n’a pas de paramètres il faut quand même mettre les parenthèses quand on l'appelle.

``` py linenums="1"
def bonjour():
    print('hello')

>>> bonjour()
hello
```

Il faut définir une fonction **avant** de l’appeler. Ces deux programmes renvoient un message d’erreur :

=== "Programme 1"

    ``` py linenums="1"
    bonjour()

    def bonjour():
        print('hello')
    ```
    La fonction `bonjour` est appelée avant d'être définie.
    
=== "Programme 2"

    ``` py linenums="1"
    def main():
        bonjour()
    
    if __name__ == '__main__':
        main()
    
    def bonjour():
        print('hello')
    ```
    La fonction `bonjour` est appelée avant d'être définie.


## La fonction main()
On a déjà vu une fonction appelée `main` générée automatiquement par certains éditeurs suivie par le code suivant :

```py
if __name__ == '__main__':
    main()
```

En Python, comme dans la plupart des langages de programmation, il y a une fonction principale, appelée souvent `main()` qui sert de point de départ pour l'exécution d'un programme. 

L'interpréteur Python exécute tout programme linéairement à partir du haut donc il n'est pas indispensable de définir cette fonction `main()` dans chaque programme, mais il est recommandé de le faire pour indiquer le point de départ pour l’exécution afin de mieux comprendre le fonctionnement du programme.


##	Paramètres et arguments 

!!! abstract "Cours"
    Même si dans la pratique on confond souvent les deux termes par abus de langage : 

    - Les **paramètres** (ou paramètres formels) d'une fonction sont des noms de variables écrits entre parenthèses après le nom de la fonction qui sont utilisées par la fonction.
    - Les **arguments** (ou paramètres réels) sont les valeurs qui sont données aux paramètres lorsque la fonction est appelée. 


    On appelle une fonction en écrivant son nom suivi des arguments entre parenthèses.

```py linenums="1"  
def bonjour(prenom1, prenom2):
    print('hello', prenom1, 'and', prenom2)

bonjour('Tom', 'Lisa')
```

Ici on appelle la fonction `bonjour` à la ligne 4 en lui passant les **arguments** `'Tom'` et `'Lisa'`. Ce sont les valeurs que prennent les deux **paramètres** `prenom1` et `prenom2` pendant l'exécution de la fonction.

:bug: Il faut appeler une fonction avec le même nombre d'arguments qu'elle a de paramètres sinon on obtient un message d'erreur :

```py 
>>> bonjour('Tom')
Traceback (most recent call last):
  File "<interactive input>", line 1, in <module>
TypeError: bonjour() missing 1 required positional argument: 'prenom2'
```

Lorsqu'on définit la fonction avec «  `def bonjour(prenom1, prenom2):` »,  `prenom1` prend la valeur du premier argument quand on appelle la fonction et `prenom2` la valeur du deuxième. `prenom1`et `prenom2` sont appelés des **arguments positionnels** (en anglais *positional arguments*). Il est  **obligatoire** de leur donner une valeur quand on appelle une fonction et **dans le bon ordre**. Dans l'exemple ci-dessus, `prenom1` prend la valeur `'Tom'`  et `prenom2` la valeur `'Lisa'`, comme indiqué par leur position.

Pour avoir des paramètres facultatifs, il faut leur affecter une valeur par défaut.

!!! tip inline end "PEP-8"  
    Pas d’espace autour du signe = pour les arguments par mot-clé. 

```py linenums="1"
def bonjour(prenom1, prenom2='Tim'):                                                    
    print('hello', prenom1, 'and', prenom2)

--- Exemple d‘appel dans l‘interpreteur-----------------
>>> bonjour('Tom')
hello Tom and Tim
```

Ici, lorsqu'on définit la fonction avec «  `def bonjour(prenom1, prenom2='Tim'):` », la valeur de `prenom2` est `'Tim'` par défaut, c’est la valeur qui est utilisée par la fonction si on ne la précise pas quand on l'appelle.  `prenom2`** est appelé un **argument par mot-clé** (en anglais *keyword argument*). Le passage d'un tel argument lors de l'appel de la fonction est **facultatif**. On peut donner la valeur des paramètres par leur mot clé dans n’importe quel ordre.

```py
def bonjour(prenom1='Tom', prenom2='Tim'):
    print('hello', prenom1, 'and', prenom2)
```

=== "Exemple d'appel 1"
    ```py
    >>> bonjour("Paul", "Pierre")
    hello Paul and Pierre
    ```
    La fonction est appelée avec deux arguments sans mot-clé, ils sont pris dans l'ordre.

=== "Exemple d'appel 2"
    ```py
    >>> bonjour(prenom2="Jack")
    hello Tom and Jack
    ```
    La fonction est appelée avec la valeur de `prenom2` qui est donnée, `prenom1` prend sa valeur par défaut.

=== "Exemple d'appel 3"
    ```py
    >>> bonjour(prenom2="Jack", prenom1="Joe")
    hello Joe and Jack
    ```
    La fonction est appelée avec deux arguments donnés par leur mot-clé, l'ordre n'a pas d'importance.



Si une fonction a un mélange d'arguments positionnels et par mot-clé, les arguments positionnels doivent toujours être placés avant les arguments par mot-clé : Ecrire «`def bonjour (prenom1='Tim', prenom2):`» :bug: est incorrect.



##	L’instruction Return

!!! abstract "Cours"
    !!! note inline end "" 
        On dit préfère le verbe "renvoyer" à "retourner" qui est un anglicisme pour *return*.

    Une fonction peut **renvoyer** une ou plusieurs valeurs (nombres, textes, booléens, etc..) avec l’instruction return.
    
    S’il n’a pas d’instruction `return` dans une fonction, elle renvoie `None`[^1] (on parle alors de procédure)  . 

    La fonction se termine immédiatement dès qu’une instruction `return` est exécutée. Les instructions suivantes sont ignorées.

[^1]: Donc une fonction renvoie toujours quelque chose.


Voici par exemple une fonction qui vérifie si un nombre est premier ou pas. On teste tous les diviseurs potentiels les uns après les autres en vérifiant si le reste de la division entière est égal à zéro. Dès qu'on trouve un diviseur, inutile de continer, le nombre n'est pas premier et dans ce cas l'instruction `return False` termine la fonction. Si on ne trouve aucun diviseur après les avoir tous testés, la fonction se termine à la dernière ligne avec l'instruction `return True`.

=== "Avec une boucle for jusqu'à nombre - 1"
    ```py linenums="1"
    def est_premier(nombre):
        # Cherche un diviseur entre 2 et nombre-1
        for div in range(2, nombre):
            if nombre % div == 0:
                return False    # on a trouvé un diviseur, nombre n'est pas premier, la fonction se termine et renvoie False
        return True   # si aucun diviseur n'a été trouvé alors le nombre est premier, la fonction renvoie True

    ```

=== "Avec une boucle while jusqy'à la racine carrée du nombre"
    ```py linenums="1"
    def est_premier(nombre):
        div = 2
        # Cherche un diviseur entre 2 et la racine carré de nombre
        while div**2 <= nombre:
            if nombre % div == 0:
                return False    # on a trouvé un diviseur, nombre n'est pas premier, la fonction se termine et renvoie False
            div = div + 1     # on essaye le diviseur d'après
        return True   # si aucun diviseur n'a été trouvé alors le nombre est premier, la fonction renvoie True

    ```

Appelons la fonction avec les nombres 10 et 13


=== "Avec le nombre 10"
    ```py 
    >>> estpremier(10)
    False
    ```
    L’instruction conditionnelle est vérifiée dès le premier passage dans la boucle, donc l’instruction `return False` est immédiatement exécutée et la fonction se termine là, la dernière instruction `return True` n’est jamais exécutée.

=== "Avec le nombre 13"
    ```py 
    >>> estpremier(13)
    True
    ```
    La fonction est appelée avec deux arguments sans mot-clé, ils sont pris dans l'ordre.



:warning: Attention à ne pas confondre `print()` et `return`. Comparons ces deux fonctions :

=== "Fonction 1"
    ```py 
    def ajoute_1(nombre):
        print(nombre + 1)
    ```

=== "Fonction 2"
    ```py 
    def ajoute_1(nombre):
        return nombre + 1
    ```


Quand on appelle l’un ou l’autre programme dans la console, on obtient le même résultat :
```py 
>>> ajoute_1(5)
6
```

Alors quelle est la différence ? 

- Avec `print()`, la première fonction `ajoute_1()` affiche le résultat calculé dans la console mais ce résultat n’est plus utilisable dans la suite du programme, il est perdu ;
- par contre avec la seconde fonction le résultat calculé et renvoyé par la fonction peut être utilisé, par exemple pour l’affecter à une variable ou comme argument d’autres fonctions, voire même pour être affiché avec `print()` si on le souhaite. 

Dans le doute, de façon générale, on évite d’afficher un résultat avec `print()` dans une fonction autre que la fonction `main()` et on préfère utiliser `return`.

Une fonction peut aussi renvoyer plusieurs valeurs en même temps, séparées par des virgules, par exemple: 
```py 
def carre_cube(x):
   return x**2, x**3
``` 



!!! question "Exercice corrigé" 
	Écrire un programme qui affiche la décomposition d’un nombre en facteurs premiers en utilisant la fonction `est_premier()` donnée.

    ```py 
    def est_premier(nombre):
        for div in range(2, nombre):
            if nombre % div == 0:
                return False
        return True
    ```

??? Success "Réponse"
    Pour décomposer un nombre en facteurs premiers on commence par cherche son plus petit diviseur qui est un nombre premier (un "facteur premier") et on divise ce nombre par ce diviseur, puis on fait la même chose pour le quotient obtenu, puis sur le deuxième quotient, etc. tant que le quotient est plus grand que 1. 

	```py 
    def main():
        nombre = int(input('entrez un nombre'))
        premier = 2 # on commence par le plus petit nombre premier : 2
        while nombre > 1:
            if nombre % premier == 0:      # si premier divise nombre
                print(premier)                 # alors on l'affiche
                nombre = nombre // premier     # et on recommence après avoir divisé nombre par premier
            else:                          # sinon, premier n'est pas un diviseur
                premier += 1                 # on cherche le nombre premier suivant
                while not(est_premier(premier)):
                    premier += 1
    ```
                

        
##	Fonction lambda

!!! abstract "Cours"
    En Python, les fonctions lambda sont des fonctions extrêmement courtes, limitées à une seule expression, sans utiliser le mot-clé `def`.  
    ```py 
    nom_de_fonction = lambda param1, param2,…: expression
    ```

Prenons un exemple :
```py
>>> ma_somme = lambda x, y: x + y
>>> ma_somme(3, 5)
8
```

Comme avec une variable, on utilise le signe `=` pour affecter à la fonction (`ma_somme`) sa définition, avec d’abord le mot réservé `lambda` suivi de la liste des paramètres (zéro, un ou plusieurs), séparés par des virgules (ici deux paramètres `x` et `y`), ensuite figure un nouveau signe deux points « `:` » et l’expression de la fonction lambda.

Les fonctions lambda n’ont qu’une seule expression et c'est le résultat de cette expression qui est renvoyé par la fonction. 

Dans notre exemple, `ma_somme` renvoie la valeur de l’expression `x + y`.


!!! question "Exercice corrigé" 
	Écrire la fonction cube qui renvoie le cube d’un nombre sous formes classique et lambda.

??? Success "Réponse"
    ```py 
    def cube(y): 
       return y**3
    ```
    et 

    ```py 
    cube = lambda y: y**3 
    ```


On peut utiliser une instruction conditionnelle par exemple : 
```py
>>> entre_10_et_20 = lambda x: True if (x > 10 and x < 20) else False                     
>>> entre_10_et_20(5)
False
```
 
##	Portée de variables

!!! abstract "Cours"
    La **portée** d'une variable désigne les endroits du programme où cette variable **existe et peut être utilisée**. En Python, la portée d'une variable commence dès sa première affectation.

Exemple : Les programmes suivants lèvent une erreur

=== "Programme 1"
    ```py 
    print(a)
    a = 1
    ```
    Ce programme essaie d'afficher la variable `a` avant qu'elle ne soit définie.

=== "Programme 2"
    ```py 
    a = a + 1
    print(a)
    ```
    Ce programme essaie d'affecter à la variable `a` une valeur calculée en utilisant `a` avant qu'elle ne soit définie.


###	Variables locales

!!! abstract "Cours"
    Une variable définie à l’intérieur d’une fonction est appelée **variable locale**. Elle ne peut être utilisée que localement c’est-à-dire qu’à l’intérieur de la fonction qui l’a définie. 

Tenter d’appeler une variable locale depuis l’extérieur de la fonction qui l’a définie provoquera une erreur. 

Exemple : Le programme suivant lève une erreur. La variable a n’existe pas dans la fonction main(), elle est locale à affiche_a ().

```py
def affiche_a():
    a = 1
    print(f'valeur de a dans affiche_a {a}')

def main():
    affiche_a()
    print(f'valeur de a dans main {a}')
```

###	Paramètres passés par valeur

Dans les exemples précédents, les arguments utilisés en appelant les fonctions étaient à chaque fois des valeurs (est_premier(10), est_premier(13). Cela n'est nullement obligatoire. Les arguments utilisés dans l'appel d'une fonction peuvent aussi être des variables ou même des expressions.

```py 
>>> est_premier(23)			>>> a = 23				>>> nombre = 22
True					>>> est_premier(a)			>>> est_premier(nombre + 1)
 					True					True

```

Quand une variable est passée en argument à la fonction, par exemple dans le cas de est_premier(a), sa valeur est copiée dans une variable locale à la fonction. C'est cette variable locale qui est utilisée pour faire les calculs dans la fonction appelée.  Les modifications de cette variable locale à l’intérieur de la fonction ne modifient pas la variable qui a été passée en paramètre. Et c’est le cas même quand le nom de la variable passée en paramètre est identique au nom du paramètre de la fonction, c’est seulement sa valeur qui est passée à la fonction.

!!! abstract "Cours"
    Une fonction ne peut pas modifier la valeur d’une variable passée en paramètre en dehors de son exécution. On dit que **les paramètres sont passés par valeur**.

Exemple :
```py 
def ajoute_1(a):
    a = a + 1
    print(f'valeur de a dans ajoute_1 : {a}')

def main():
    a = 1
    ajoute_1 (a)
    print(f'valeur de a dans main :{a}')
>>> 
valeur de a dans ajoute_1 : 2
valeur de a dans main : 1
```

`ajoute_1 (a)` change la valeur de `a` en `2` pendant son exécution, mais la valeur de `a` n’a pas changée dans `main()`.
 
###	Variables globales

Sauf exception on préfère utiliser uniquement des variables locales pour faciliter la compréhension des programmes et réduire l’utilisation de mémoire inutile, mais dans certains cas leur portée n’est plus suffisante.

!!! abstract "Cours"
    Une variable définie en dehors de toute fonction est appelée **variable globale**. Elle est utilisable à travers l’ensemble du programme. 

Elle peut être affichée par une fonction :

```py 
a = 1
def fonction():
    print(a)
fonction()
```

Mais ne peut pas être modifiée. Le programme suivant lève une erreur :

```py 
a = 1
def fonction():
    a += 1
    print(a)
fonction()
```

On peut néanmoins essayer de lui assigner une nouvelle valeur :

```py 
a = 1
def fonction():
    a = 2
    print(a)
fonction()
```

Mais dans ce cas, Python part du principe que `a` est locale à la fonction, et non plus une variable globale :

```py 
a = 1
def fonction():
    a = 2
    print(a)
fonction()
print(a)
```

L’instruction `a = 2` a créé un nouvelle variable locale à la fonction, la variable globale n’a pas changé. 

Dans certaines situations, il serait utile de pouvoir modifier la valeur d’une variable globale depuis une fonction, notamment dans le cas où une fonction se sert d’une variable globale et la manipule. Pour faire cela, il faut utiliser le mot clef `global` devant le nom d’une variable globale utilisée localement afin d’indiquer à Python qu’on souhaite bien modifier son contenu de la variable globale et non pas créer une variable locale de même nom :

```py 
a = 1
def fonction():
    global a
    a = 2
    print(a)
fonction()
print(a)
```

!!! abstract "Cours"
    Une variable globale est accessible uniquement en lecture à l’intérieur des fonctions du programme. Pour la modifier il faut utiliser le mot-clé `global`.

 
##	Fonction récursive

Une fonction peut être appelée n’importe où dans un programme (après sa définition), y compris par elle-même.

!!! abstract "Cours"
    Une fonction récursive est une fonction qui peut s'appeler elle-même au cours de son exécution.

Exemple : Programmer la fonction factorielle  $n!  =  1  \times 2  \times 3  \times 4  \times ...  \times (n-1)  \times n$

Programme standard. On multiplie tous les entiers de 1 à n
```py 
def factorielle(n):
    fact = 1
    for i in range(1, n+1):
        fact = fact*i
    return fact
```

Programme récursif :. n ! = (n-1)! * n et 1 !=1
```py 
def factorielle_recursive(n):
    if n == 1:
        return 1
    else:
        return n * factorielle_recursive(n-1)          # le else est facultatif
```

:warning: Il est impératif de prévoir une condition d'arrêt à la récursivité, sinon le programme ne s'arrête jamais ! On doit toujours tester en premier la condition d'arrêt, et ensuite, si la condition n'est pas vérifiée, lancer un appel récursif.


 
!!! question "Exercice corrigé" 
	Écrire une fonction récursive `compte_a_rebours(n)` qui compte à rebours de `n` à `0`.

??? Success "Réponse"
    ```py 
    def compte_a_rebours(n):
        if n < 0:
            pass
        else:
            print(n)
            compte_a_rebours(n-1)
    ```
    ou plus simplement :  

    ```py 
    def compte_a_rebours(n):
        print(n)
        if n > 0:
            compte_a_rebours(n-1)
    ```
