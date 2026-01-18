#	Chaines de caractères (hors programme)

##	Opération (rappel)

Pour les chaînes de caractères, deux opérations sont possibles, l'addition et la multiplication :

``` py
>>> chaine = 'Python'
>>> "J'aime " + chaine
"J'aime Python"
>>> chaine * 3
'PythonPythonPython'
```

-	L'opérateur d'addition `+` concatène (assemble) deux chaînes de caractères.
-	L'opérateur de multiplication `*` entre un nombre entier et une chaîne de caractères duplique (répète) plusieurs fois une chaîne de caractères.

Pouvoir utiliser les apostrophes ou les guillemets offre un énorme avantage : les guillemets permettent d'écrire  une chaîne qui contient des apostrophes et vis-versa, par exemple `"J'aime Python"` ou `'Il dit "hello".'`.


##	Accès aux éléments (lettres)

Comme pour les p-uplets et tableaux, on peut accéder à un caractère d'une chaîne de caractères par sa position :

``` py
>>> chaine = "hello world!"
>>> len(animaux)
12
>>> chaine[1]
'e'
```

... ou à une partie de la chaîne seulement (tranches) :

``` py
>>> chaine[2:4]
'll'	
>>> chaine[6:]
'world!'
>>> chaine[:5]
'hello'
```

##	Modifier une chaîne

Le type `str` est immuable, on ne peut pas modifier un des éléments d'une chaîne de caractère : 

``` py
>>> chaine[0] = "H"
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'str' object does not support item assignment
```

Par conséquent, pour modifier une chaîne de caractères, il faut écraser l'ancienne.   


##	Caractères spéciaux

Il existe certains caractères spéciaux très pratiques, par exemple :

-	`\n` pour le retour à la ligne, 
- 	`\t` produit une tabulation.

``` py
>>> print("Un retour à la ligne\npuis une tabulation\t puis un guillemet")
Un retour à la ligne
puis une tabulation     puis un guillemet
```

##	Méthodes associées aux chaînes de caractères

Voici quelques méthodes spécifiques aux objets de type `str` :

-   `chaine.upper()` convertit la chaîne en majuscule.
    ``` py
    >>> s = "J'aime Python"
    >>> "J'aime Python".upper()
    "J'AIME PYTHON"
    ```
-   `chaine.lower()` convertit la chaîne en minuscule.
    ``` py
    >>> s.lower()
    "j'aime python"
    ```

-   `chaine.find(sub)` renvoie la position d'une sous-chaîne dans une chaine de caractères ou -1 si elle n'est pas trouvée.	
    ``` py
    >>> s.find("i")
    3
    ```

Ces méthodes n'altèrent pas la chaîne de caractères de départ mais renvoient une nouvelle chaîne de caractère.

Enfin, `dir(dict)` et `help(dict)` permet d'obtenir la liste des méthodes disponibles.


##	Conversion de type (cast)

La méthode `.join()` permet de convertir un tableau de chaînes de caractères en une chaîne de caractères.

``` py
>>> ' '.join(['hello', 'world', '!'])
'hello world !'
```

!!! tip inline end "PEP 8"  
    Préférer l'utilisation de  `.join()` plutôt que `+` pour concaténer des chaines . 


Et réciproquement, `chaine.split(sep)` découpe une chaîne de caractères en utilisant le séparateur sep (ou blanc si il n'est pas précisé).	

``` py
'hello world !'.split(' ')
['hello', 'world', '!']    
```
