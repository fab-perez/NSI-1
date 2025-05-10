# Trier une table

## sorted() et .sort()

Pour trier en ordre croissant de façon simple et facile, il suffit d'appeler la fonction `sorted()`. Elle renvoie un nouveau tableau trié :

``` py
>>> sorted([5, 2, 3, 1, 4])
[1, 2, 3, 4, 5]
```

Ici on a trié un tableau de nombres entiers. On peut faire la même chose avec un tableau de nombres decimaux (`float`)  ou de chaines de caractères. :warning: Les chaines de caractères sont triées par ordre lexicographique[^4.1].

[^4.1]: On commence par comparer les  codes Unicode du premier caractère de chaque chaîne, puis en cas d'égalité le second caractère, et ainsi de suite comme dans un dictionnaire. Attention aux majuscules et aux nombres, '11' est plus petit que '2' !

``` py
>>> sorted(['pomme', 'banane', 'orange', 'fraise'])
['banane', 'fraise', 'orange', 'pomme']
```

On peut aussi trier un p-uplet ou **les clés** d'un dictionnaire, la fonction renvoie toujours un tableau :

``` py
>>> sorted((5, 2, 3, 1, 4))
[1, 2, 3, 4, 5]
>>> sorted({'un':1, 'deux':2, 'trois':3 })
['deux', 'trois', 'un']
```

On peut aussi utiliser la méthode `.sort()` qui elle modifie le tableau (et renvoie `None` pour éviter les confusions).

``` py
>>> a = [5, 2, 3, 1, 4]
>>> a.sort()
>>> a
[1, 2, 3, 4, 5]
```

Une autre différence est que la méthode `.sort()` est seulement utilisées pour les tableaux. Au contraire, la fonction `sorted()` accepte n'importe quel itérable, par exemple les clé d'un dictionnaire.

``` py
>>> sorted({1: 'D', 2: 'B', 3: 'B', 4: 'E', 5: 'A'})
[1, 2, 3, 4, 5]
>>> {1: 'D', 2: 'B', 3: 'B', 4: 'E', 5: 'A'}.sort()
Traceback (most recent call last):
  File "<interactive input>", line 1, in <module>
AttributeError: 'dict' object has no attribute 'sort'
```

On peut trier sur des types construits, dans ce cas le tri est fait par ordre des éléments. Par exemple, on peut trier une liste de tableaux contenant les pays.

``` py
>>> pays
[['France', 'Paris', '68'],
 ['Espagne', 'Madrid', '48'],
 ['Italie', 'Rome', '60']]
>>> sorted(pays)
['Espagne', 'Madrid', '48'], 'France', 'Paris', '68'], ['Italie', 'Rome', '60']]]
```

Dans ce cas, le tri est fait par `pays[0]` (type str) donc par ordre alphabétique :  `'Allemagne' < 'France'< 'Italie' `.

Par contre, on ne peut pas trier un tableau de dictionnaires :

``` py
>>> pays = [{'Capitale': 'Paris', 'Pays': 'France', 'Population (ml)': '68'}, 
    {'Capitale': 'Madrid', 'Pays': 'Espagne', 'Population (ml)': '48'}, 
    {'Capitale': 'Rome', 'Pays': 'Italie', 'Population (ml)': '60'}]
>>> sorted(pays)
Traceback (most recent call last):
  File "<interactive input>", line 1, in <module>
TypeError: '<' not supported between instances of 'dict' and 'dict' 
```


## Paramètre key

`.sort()` et `sorted()` acceptent un paramètre nommé `key` permettant de spécifier une fonction à appeler sur chaque élément du tableau afin d'effectuer des comparaisons. 
Par exemple, on peut modifier l'ordre de tri d'un tableau de nombres au format `str` :

``` py
>>> sorted(['5', '3', '1', '11', '21'])
['1', '11', '21', '3', '5']
```

en précisant que les données doivent être converties en entier par la fonction `int()` avant d'être triées : 

``` py
>>> sorted(['5', '3', '1', '11', '21'], key=int)
['1', '3', '5', '11', '21']
```

De la même façon, le paramètre `key` permet de trier une table en précisant les colonnes selon lesquelles on veut trier. Par exemple, si on veut trier le tableau de tableaux des pays selon leur population :

``` py
>>> pays
[['France', 'Paris', '68'],
 ['Espagne', 'Madrid', '48'],
 ['Italie', 'Rome', '60']]

```

On peut utiliser une fonction `popul` qui renvoie la population convertie en nombre entier :

``` py
def popul(x): 
    return int(x[2])
```

et qui sert de clé de `sorted()` :

``` py
>>> sorted(pays, key=popul)
[['Espagne', 'Madrid', '48'], ['Italie', 'Rome', '60'],  ['France', 'Paris', '68']]
 
```

Ou bien l'écrire directement dans une fonction lambda :

``` py
>>> sorted(pays, key=lambda x:int(x[2]))
[['Espagne', 'Madrid', '48'], ['Italie', 'Rome', '60'],  ['France', 'Paris', '68']]
```

De la même façon, une fonction lambda va permettre de trier le tableau de dictionnaires en ordre croissant de population :  

``` py
>>> pays = [{'Capitale': 'Paris', 'Pays': 'France', 'Population (ml)': '68'}, \
            {'Capitale': 'MAdrid', 'Pays': 'Espage', 'Population (ml)': '48'}, \
            {'Capitale': 'Rome', 'Pays': 'Italie', 'Population (ml)': '60'}]

>>> sorted(pays, key=lambda x:int(x['Population (ml)']))
[{'Capitale': 'Madrid', 'Pays': 'Espagne', 'Population (ml)': '48'}, {'Capitale': 'Rome', 'Pays': 'Italie', 'Population (ml)': '60'}, {'Capitale': 'Paris', 'Pays': 'France', 'Population (ml)': '68'}]
```

## Paramètre reverse

`.sort()` et `sorted()` acceptent aussi un paramètre nommé `reverse` avec une valeur booléenne. Par défaut, `reverse` est `False`, c'est-à-dire qu'on tri en ordre croissant, mais on peut le changer pour indiquer un ordre décroissant des tris. 
Par exemple, pour avoir les pays dans par population décroissante :

``` py
>>> sorted(pays, key=lambda x:int(x[2]), reverse=True)
[['France', 'Paris', '68'], ['Italie', 'Rome', '60'], ['Espagne', 'Madrid', '48']]
```


!!! question "Exercice corrigé" 
    On a importé un tableau de dictionnaires des codes postaux avec :
    ``` py
    with open('laposte_hexasmal.csv', 'r', encoding='utf-8-sig') as f:
        codes = list(csv.DictReader(f, delimiter=';'))
    ```

    1. Ecrire les fonctions `plus_petit_code` et `plus_grand_code` qui renvoient la commune qui a le plus petit code postal et celle qui a le plus grand code postal.

    2. Ecrire les fonctions `plus_grande_latitude` qui renvoie la commune qui a la plus grande latitude.


??? Success "Réponse"

    ``` py
    def plus_petit_code():
        return sorted(codes, key = lambda x:x['code_postal'])[0]

    def plus_grand_code():
        return sorted(codes, key = lambda x:x['code_postal'])[-1]

    def gps(gps_str):
        """ str -> float, float
        Renvoie la longitude et latitude d'une chaine de caractère de coordonnées gps
        """
        long, lat = gps_str.split(',')
        return float(long), float(lat)


    def plus_grande_latitude():
        # filtre les communes dont les coordonnées gps sont données
        codes_avec_gps = list(filter(lambda x:x['coordonnees_gps'] !='',codes))
        return sorted(codes_avec_gps, key = lambda x:gps(x['coordonnees_gps'])[1], reverse= True)[0]
    ```


!!! question "Exercice corrigé - Pour aller plus loin" 
    3. Ecrire les fonctions `plus_loin(longA, latA)` qui renvoie la commune la plus éloignée du point GPS de coordonnées (longA, latA).

    Exemple:
    ``` py
    >>> plus_loin(0,0)
    {'code_commune_insee': '98612',
    'code_postal': '98620',
    'coordonnees_gps': '-14.270411199, -178.155263035',
    'libelle_d_acheminement': 'SIGAVE',
    'ligne_5': '',
    'nom_de_la_commune': 'SIGAVE'}
    ```

    Note : La distance  en mètres entre les points de coordonnées ($Long_A$;$Lat_A$) et ($Long_B$; $Lat_B$ ) est donnée par la formule de Pythagore : 

    - $x =({Long_B - Long_A )} \times {cos⁡{ {Lat_A + Lat_B} \over 2}}$
    
    - $y = Lat_B-Lat_A$
    
    - $z = \sqrt {x^2+y^2}$

    - $d = 1852 \times 60 \times z$

    Source : [http://villemin.gerard.free.fr/aGeograp/Distance.htm](http://villemin.gerard.free.fr/aGeograp/Distance.htm)

??? Success "Réponse"

    ``` py
 
    from math import cos, sqrt
    def distance(longA, latA, longB, latB):
        x = (longB - longA) * cos((latA+latB)/2)
        y = latB - latA
        z = sqrt(x**2 + y**2)
        d = 1852 * 60 * z
        return d


    def plus_loin(longA, latA):
        # filtre les communes dont les coordonnées gps sont données
        codes_avec_gps = list(filter(lambda x:x['coordonnees_gps'] !='',codes))
        return sorted(codes_avec_gps, key = lambda x:distance(longA, latA, gps(x['coordonnees_gps'])[0], gps(x['coordonnees_gps'])[1]), reverse= True)[0]
    ```

