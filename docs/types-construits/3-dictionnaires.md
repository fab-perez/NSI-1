# Dictionnaires (type `dict`)

!!! abstract "Cours" 
    Un **dictionnaire** est un ensemble **non-ordonné** d'éléments sous la forme **clé-valeur**, qui peuvent être **modifiés** (muables[^3.1]).

    En Python les dictionnaires sont du type `dict`.

[^3.1]: ou *mutable* en anglais.


##	Création

Un dictionnaire est déclaré par une série d'éléments sous la forme de couples **clé:  valeur** séparés par des virgules, et le tout **encadré par des accolades** “{ }”.

Créons un dictionnaire de noms de pays et des capitales associées :

!!! note inline end "" 
    Un dictionnaire est affiché sans ordre particulier.

``` py
>>> d = {"France": "Paris", "Italie": "Rome", "Espagne": "Madrid"}
>>> d
{'Espagne': 'Madrid', 'France': 'Paris', 'Italie': 'Rome'}
>>> type(d)
<class 'dict'>
``` 



Ici les clés de `d` sont `'Espagne'`, `'France'` et `'Italie'` et  les valeurs associées sont `'Madrid'`, `'Paris'` et `'Rome'`.

Il est aussi possible de créer un dictionnaire vide avec les accolades `{}` :
``` py
>>> d = {}
```

Les valeurs peuvent être de type `int`, `float`, `str`, `tuple`,  `list`, etc. :
``` py
>>> nombres = { 1: ['un', 'one', 'eins'] , 2: ['deux', 'two', 'zwei'] }
```

Les clés peuvent être de type `int`, `float`, `str`, `tuple` :
``` py
grille = {(0, 0): 'X', (0, 1): 'O', (1, 0): 'O', (1, 1): 'X'}
```
… mais pas de type `list` ou d'un autre type muable :

``` py
>>> grille = {[0, 0]: 'X', [0, 1]: 'O', [1, 0]: 'O', [1, 1]: 'X'}
 Traceback (most recent call last):
   File "<interactive input>", line 1, in <module>
 TypeError: unhashable type: 'list'
```


## Fonction `len()`

La fonction `len()` renvoie la longueur d'un dictionnaire, c'est-à-dire le nombre de couple clé :valeur qu'il contient.

``` py
>>> d = {"France": "Paris", "Italie": "Rome", "Espagne": "Madrid"}
>>> len(d)
3
```



##	Accès aux éléments

Les éléments d'un dictionnaire n'ont **pas d'ordre particulier**, il n'est donc pas possible d'accéder aux éléments par un indice de leur position (comme avec les p-uplets, tableaux et chaines de caractères). 

``` py
>>> d[1]
Traceback (most recent call last):
  File "<interactive input>", line 1, in <module>
KeyError: 1
```

Pour accéder une valeur, on utilise sa clé :

``` py
>>> d['Italie]
'Rome'
```

Si la clé n'existe pas, on obtient un message d'erreur :

``` py
>>> d['Allemagne']
Traceback (most recent call last):
  File "<interactive input>", line 1, in <module>
KeyError: 'Allemagne'
```

La méthode `.get()` retourne la valeur associée à une clé, sans lever d'erreur si la clé n'existe pas (renvoie `None` ou une valeur par défaut) :

``` py
>>> d.get('Italie')
'Rome'
>>> d.get('Allemagne')
>>> d.get('Allemagne', "Inconnue")
'Inconnue'
```


Le mot clé `in` permet de vérifier si une clé est présente dans un dictionnaire, il renvoie un booléen :


``` py
>>> "France" in d
True
>>> "Allemagne" in d
False
```

:warning: `in` ne s'applique qu'aux clés d'un dictionnaire, pas à ses valeurs :

``` py
>>> "Paris" in d
False
```

Le mot clé `in` permet aussi d'écrire une boucle pour parcourir (ou «itérer») toutes les clés d'un dictionnaire :

``` py
>>> for cle in d:
...     print("La capitale de", cle, "est", d[cle])
La capitale de France est Paris
La capitale de Italie est Rome
La capitale de Espagne est Madrid
```

Bien sûr, on ne peut pas parcourir le dictionnaire par indice, les éléments du dictionnaire n'ont pas d'ordre.



##	Modifier un dictionnaire

###	Modifier ou ajouter un élément

Comme pour les tableaux, on peut modifier une valeur dans un dictionnaire (mais à la différence des tableaux on la désigne par sa clé, pas par un indice) :

``` py
d["Italie"] = "Roma"
>>> d
{'Espagne': 'Madrid', 'France': 'Paris', 'Italie': 'Roma'}
```

Dans un tableau, on ne peut pas modifier la valeur d'un indice qui n'existe pas :

``` py
>>> pays = ['Madrid', 'Paris', 'Roma']
>>> pays[3] = 'Berlin'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: list assignment index out of range
```

Mais dans un dictionnaire, si on essaie de modifier la valeur d'une clé qui n'existe pas, alors un nouveau couple clé:valeur est créé :

``` py
>>> d["Allemagne"] = 'Berlin'
>>> d
{'Allemagne': 'Berlin', 'Espagne': 'Madrid',  'France': 'Paris',  'Italie': 'Roma'}
```



###	Supprimer des éléments

Comme pour les tableaux, il est possible d'utiliser les méthodes `pop()` et `clear()` (mais pas `remove()`) pour supprimer des couples de clé:valeur :


- `d.pop(cle)`[^3.3] supprime du dictionnaire la clé `cle` et renvoie la valeur associée :	
    ``` py
    >>> d.pop('France')
    'Paris'
    ```

[^3.3]: La clé dans `d.pop(cle)` est obligatoire, alors que pour les tableaux elle est facultative (par défaut le dernier élément est supprimé)

- `d.clear()` supprime tous les éléments du dictionnaire :

Comme pour les tableaux, le mot clé `del` permet aussi de supprimer un élément d'un dictionnaire :

``` py
>>> del d['France']
>>> d
{'Espagne': 'Madrid', 'Italie': 'Roma'} 
```

Ou encore le dictionnaire entier avec l'instruction `del d`, alors la variable `d` n'existe plus.



##	Création par compréhension

Comme pour les tableaux, on peut aussi créer un dictionnaire par compréhension :

``` py
>>> d = {i: i**2 for i in range(10)}
>>> d
{0: 0, 1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64, 9: 81} 
```

``
On peut lire ça comme « le dictionnaire des i: i² pour i allant de 0 à 9 ».

De façon générale, un tableau par compréhension s'écrit sous la forme : `[cle(x): expression(x)  for x in  itérable ]`.

Exemples :
``` py
{i**2: i for i in range(5)}   #  {0: 0, 1: 1, 4: 2, 9: 3, 16: 4}
{i: str(i) for i in range(5)}  #  {0: '0', 1: '1', 2: '2', 3: '3', '4': 4}
{m: len(m) for m in ["chat", "chien", "ane"]}   #  {'ane': 3, 'chat': 4, 'chien': 5}
{c: 0 for c in "nsi"}   # {'i': 0, 'n': 0, 's' : 0}
```


On peut ne garder que certains éléments en les filtrant avec une condition `if` placée à la fin, par exemple :

``` py
# Les nombres: carrés pour les nombres de 0 à 4
{n: n**2 for n in range(5) if n % 2 == 0}        # {0: 0, 2: 4, 4: 16}
```


Le `if` _placé à la fin_ supprime des éléments. On peut aussi utiliser un `if … else` _placé dans l’expression_ pour transformer chaque élément sans en supprimer. :warning: Attention l'ordre est différent. 

``` py
{n: "pair" if n % 2 == 0 else "impair" for n in range(5)}  # {0: 'pair', 1: 'impair', 2: 'pair', 3: 'impair', 4: 'pair'}
```


##	Méthodes `.keys()`, `.values()` et `.items()`

Les méthodes `.keys()` et `.values()` renvoient les clés et les valeurs d'un dictionnaire :

``` py
>>> d.keys()
dict_keys(['France', 'Italie', 'Espagne'])
>>> d.values()
dict_values(['Paris', 'Rome', 'Madrid'])
```

La méthode `.items()` renvoie tous les couples clé-valeur d'un dictionnaire :

``` py
>>> d.items()
dict_items([('France', 'Paris'), ('Italie', 'Rome'), ('Espagne', 'Madrid')])
```

Les mentions `dict_keys`, `dict_values`, `dict_items` indiquent que nous avons affaire à des objets un peu particuliers. Pour les utiliser il faut par exemple les transformer en tableaux avec la fonction `list()` :

``` py
>>> list(d.values())
['France', 'Italie', 'Espagne']
>>> list(d.items())
[('France', 'Paris'), ('Italie', 'Rome'), ('Espagne', 'Madrid')]
```

Ces méthodes `.keys()`, `.values()` et `.items()` permettent d'autres façons de parcourir un dictionnaire :

=== "Avec une boucle `for` et `.keys()`"
    ``` py
    for cle in d.keys():
        print(cle) 
        print(d[cle])
    ```
    Parcours les clés du dictionnaire, c'est la même chose que d'écrire  `for cle in d:`. Les valeurs sont obtenues avec `d[cle])`.

=== "Avec une boucle `for` et `.values()`"
    ``` py
    for val in d.values():
        print(val) 
    ```
    Parcours les valeurs du dictionnaire, sans connaître leurs clés.

=== "Avec une boucle `for` et `.items()`"
    ``` py
    for cle, val in d.items():
        print(cle) 
        print(val) 
    ```
    Parcours les clés et valeurs du dictionnaire en « déballant » les p-uplets de `d.items()` dans deux variables `cle`, `val`.


##	Dictionnaires muables

Les dictionnaires, comme les tableaux, sont de type muables, donc les mêmes limites s'appliquent.

###	Copie de dictionnaire

``` py
>>> d1 = {'one':1, 'two':2, 'three':3}
>>> d2 = d1
>>> d2['three'] = 4
>>> d1 
{'one':1, 'two':2, 'three':4}
```
Comme avec les tableaux, `d1` a aussi été modifiée quand on a modifié `d2` ! Les deux variables `d1` et `d2` sont en fait deux noms qui font référence vers le même objet[^3.4]. 

[^3.4]: Pour s'en convaincre on peut vérifier les adresses des variables avec id() :
    ``` 
    >>> id(d1)						>>> id(d2)
    2156942732160						2156942732160
    ```


Pour copier un dictionnaire , il faut créer une copie explicite du dictionnaire initial[^3.5] :


[^3.5]: :warning:Aucune de ces approches ne fonctionne si le dictionnaire contient lui-même des valeurs de type muable (`list` ou `dict`), il faut à nouveau utiliser la méthode `.deepcopy()` du module `copy`. 

- 	Avec  la fonction `dict(itérable)` qui renvoie un dictionnaire formé des éléments de la variable itérable :
    ``` py
    >>> d2 = dict(d)
    ```

-   Ou encore utiliser la méthode `.copy()` :
    ``` py
    >>> d2 = d1.copy()
    ```


###	Dictionnaire passé en paramètre de fonction

Les mêmes effets qu'avec les tableaux peuvent être observés quand on passe un dictionnaire en paramètre d'une fonction : **la fonction peut en modifier le contenu**.

Illustrons cela par deux fonctions `f(x)` et `g(x)` qui modifient simplement la valeur d'un paramètre `x` et appelons ces fonctions en passant des variables `a` (type `int`) et `d` (type `dict`) en paramètre : 


=== "avec une variable de type "immuable""
    ``` py
    def f(x):
        x = 2	
    ```

=== "avec une variable de type "muable""
    ``` py
    def g(x):
        x['four']=4
    ```

Appelons ces fonctions en passant des variables `a` et `d` en paramètre [^3.5]: 
[^3.5]: Les variables `a` et `d` pourraient s'appeler aussi `x` ce qui donnerait le même résultat.

=== "avec une variable de type "immuable""
    ``` py
    >>> a = 1
    >>> f(a)
    >>> a
    1 
    ```
    La valeur de `a` n'a pas été modifiée par la fonction `f`.
    
=== "avec une variable de type "muable""
    ``` py
    >>> d = {'one':1, 'two':2, 'three':3}
    >>> h(d)
    >>> d
    {'four': 4, 'one': 1, 'three': 3, 'two': 2}
    ```

    La valeur de `d` a été modifiée par la fonction `g` !


##	Conversion de type (cast)

La fonction `dict(tableau de p-uplets)` transforme un tableau de tuples (comme obtenu par `items()`) en dictionnaire :

``` py
>>> dict([("one" , 1), ("two" , 2), ("three" , 3)])
{'one': 1, 'three': 3, 'two': 2}
```

##	Un exemple d'utilisation de dictionnaire : les p-uplets nommés

Un **p-uplet nommé** est un p-uplet, dont les éléments sont appelés via un descripteur au lieu d'un indice. L'intérêt est d'améliorer la lisibilité du code pour réduire les risques d'erreurs. Le type des p-uplets nommés n'existe pas nativement dans Python[^3.6]: , on peut alors utiliser des dictionnaires. Voici un exemple pour montrer la syntaxe :

[^3.6]: Il existe un module Python `collection.namedtuple` mais le programme invite à utiliser des dictionnaires dans ce cas.

``` py
>>> monsieurX = {"nom": "X", "́prenom": "Monsieur", "age": 47}
>>> monsieurX["age"]
47
```

##	Dictionnaire de tableaux, dictionnaires de dictionnaires

De même qu'on peut utiliser des tableaux de tableaux, on peut utiliser des dictionnaires de tuples ou de tableaux :

``` py
>>> traduction = {"un": ["one", "eins"], "deux": ["two", "zwei"], "trois": ["three", "drei"]}
>>> traduction["un"]
['one', 'eins']
>>> traduction["un"][0]
'one'
```

ou même des dictionnaires de dictionnaires :
``` py
>>> traduction = {"un": {"Ang":"one", "All":"eins"}, "deux": {"Ang": "two", "All":"zwei"}, "trois": {"Ang":"three", "All":"drei"}}
>>> traduction["un"]
{'Ang': 'one', 'All': 'eins'}
>>> traduction["un"]["Ang"]
'one'
```
