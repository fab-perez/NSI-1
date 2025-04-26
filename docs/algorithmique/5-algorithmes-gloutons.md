# Algorithmes gloutons

## Rendu de monnaie

Dans le système monétaire de la zone euro, les pièces et billets prennent pour valeurs 1, 2, 5, 10, 20, 50, 100, 200 et 500 euros. Dans la suite de l’activité on ne fait pas de différence entre billets et pièces.

Le système de monnaie peut être représenté par le tableau de pièces suivant :

``` py
pieces = [1, 2, 5, 10, 20, 50, 100, 200, 500]
```

Supposons maintenant qu’on doive rendre 49 euros de monnaie. Quelles pièces peuvent être rendues ? Il existe plusieurs réponses, par exemple deux pièces de 20, 1 pièce de 5 et deux pièces de 2 conviennent. Mais quarante-neuf pièces de 1 conviennent aussi.

Mais si on souhaite rendre 49 euros avec un minimum de pièces, il n’y a qu’une solution. C'est le problème du **rendu de monnaie**, un problème d’algorithmique qui consiste à **rendre un montant avec le nombre minimal de pièces** (et billets) choisies parmi une liste de valeurs donnée.

Analysons le problème en prennant quelques exemples :

- Le minimum de pièces pour rendre 9 est de 3 pièces : 5 + 2 + 2.

- Le minimum de pièces pour rendre 37 est de 4 pièces : 20 + 10 + 5 + 2.

- Le minimum de pièces pour rendre 743 est de 6 pièces : 500 + 200 + 20 + 20 + 2 + 1.

On observer qu'on trouve les pièces en ordre décroissant. En effet, l’algorithme suivi écrit en langage naturel est le suivant :

- liste_rendu = liste vide

- Tant que a_rendre > 0:
    - choisir la plus grande pièce inférieure à a_rendre
    - mettre cette pièce dans liste_rendu
    - diminuer a_rendre de la valeur de la pièce

A chaque étape de l’algorithme on prend **la meilleure décision possible**  (choisir la plus grande pièce inférieure à la somme à rendre), puis on continue avec un problème **de plus en plus petit** à résoudre (on diminue la somme à rendre). Dans ce type de résolution, il n'y a **pas de retour en arrière**. Lorsqu'un choix est fait, il n'est pas modifié par la suite. C’est le propre des algorithmes gloutons.

!!! abstract "Cours" 
    Un algorithme glouton est un algorithme dans lequel on procède étape par étape en faisant, à chaque étape, le **meilleur choix possible** en fonction de la situation actuelle, sans retour en arrière et sans se soucier de la forme du problème global, dans l'espoir de conduire vers une solution optimale du problème à résoudre.

Traduit en Python, on obtient le programme suivant :

``` py 

pieces = [1, 2, 5, 10, 20, 50, 100, 200, 500]


def plus_grande_piece(pieces, a_rendre):
    """ list, int -> int
    Renvoie la plus grande valeur de pieces inférieure à a_rendre
    """
    pieces = sorted(pieces) # tri pieces en ordre croissant
    for p in pieces: # parcours du tableau trié
        if p <= a_rendre: # si p est possible
            plus_grande = p # on le garde
    return plus_grande


def rendu_monnaie(pieces, a_rendre):
    """ list, int -> int
    Renvoie le tableau de pieces obtenu par l’algorithme glouton
    """
    liste_rendu = []
    while a_rendre > 0:
        piece = plus_grande_piece(pieces, a_rendre)
        liste_rendu.append(piece)
        a_rendre = a_rendre - piece
    return liste_rendu

assert rendre_monnaie(pieces, 9) == [5, 2, 2]
assert rendre_monnaie(pieces, 37) == [20, 10, 5, 2]
assert rendre_monnaie(pieces, 743) == [500, 200, 20, 20, 2, 1]
```

On utilise maintenant un système de pièces différents de celui de la zone euro :

``` py
pieces2 = [1, 3, 6, 12, 24, 30]
```
Essayons quelques montants à rendre :
``` py
>>> rendre_monnaie(pieces2, 48) 
[30, 12, 6]
>>> rendre_monnaie(pieces2, 49) 
[30, 12, 6, 1]
>>> rendre_monnaie(pieces2, 50) 
[30, 12, 6, 1, 1]
```
On observe rapidement que l'algorithme glouton ne renvoie pas le nombre minimal de pièces à rendre, on pouvait rendre 48 avec deux pièces de 24; 49 avec deux pièces de 24 et une pièce de 1, etc. 

!!! abstract "Cours" 
    Les algorithmes gloutons **ne donnent pas systématiquement la solution optimale** à un problème.

## Problème du sac à dos

On dispose d'un sac à dos avec une capacité maximum de poids à transporter de 15 kg. On a le choix d’emporter certains des objets dont on connaît le poids et la valeur :
![Exemples d'objets mis dans le sac à dos](assets/5-sac-a-dos.png){width=30%}


|Objet no| 0 | 1 | 2 | 3 | 4 | 
|:--      |:-:|:-:|:-:|:-:|:-:|
|Poids (kg)| 12 | 4 | 2 |1 | 1 | 
|Prix (€) |  40 | 100 | 20 | 20 | 10 | 

Quels objets faut-il choisir pour obtenir une valeur totale maximale tout en ne dépassant pas 15 kg ? C’est un problème d’optimisation par contrainte.

On voit tout de suite que l'objet 1 est intéressant car il n’est pas lourd mais a beaucoup de valeur. Par contre l’objet 0 est beaucoup moins intéressant car il est lourd et n’a pas beaucoup de valeur. Une règle de choix pertinente pour un algorithme glouton consiste donc à choisir en premier les objets qui ont la plus grande valeur par unité de poids. Ainsi l’objet 1 a une valeur de 25 €/kg (100/4 = 25) alors que l’objet de 0 a une valeur d’environ 3.3 €/kg (40/12 = 3.333…).

L’algorithme glouton est le suivant :

- poids_sac = 0
- valeur_sac = 0
- Parcourir les objets triés en ordre décroissant de valeur/poids :
    - Si le poids de l’objet plus le poids des objets déjà dans le sac ne dépasse pas le poids autorisé : ajouter le poids de l’objet à poids_sac et sa valeur à valeur_sac.
    - Sinon, ne pas mettre l’objet dans le sac.
- Renvoyer valeur_sac.

Traduit en Python, on obtient le programme suivant :

```py
objets = [{'poids': 12, 'valeur': 40},
           {'poids': 4, 'valeur': 100},
           {'poids': 2, 'valeur': 20},
           {'poids': 1, 'valeur': 20},
           {'poids': 1, 'valeur': 10}]


def sac_glouton(objets, poids_max):
    """ list(dict) int -> int
    Renvoie la valeur maximale d'une liste d'objets [{'poids', 'valeur'}]
    qui peuvent être mis dans le sac sans que leur poids dépasse poids_max
    """
    poids_sac = 0
    valeur_sac = 0
    # objets pris en ordre de valeur décroissante
    for objet in sorted(objets, key=lambda x: x['valeur'], reverse=True):
        # si le poids de objet ne fait pas dépasser la capacité du sac
        if objet['poids'] + poids_sac <= poids_max:
            # on le met dans le sac
            poids_sac += objet['poids']
            valeur_sac += objet['valeur']
    return valeur_sac

assert sac_glouton(objets, 15) == 150
```

## D’autres problèmes d’optimisation par contrainte

Les algorithmes gloutons constituent une famille d'algorithmes que l’on peut les utiliser pour trouver une solution à
de nombreux problèmes : lorsqu'on a une **sélection** à effectuer sur un ensemble d'objets en cherchant à **maximiser**
ou **minimiser** une certaine grandeur tout en respectant certaines **contraintes**.

### Choisir 5 valeurs dans un tableau

On cherche à **sélectionner** cinq valeurs parmi un tableau de nombres entiers positifs en cherchant à avoir la plus grande somme possible (**maximiser** une grandeur) et en s'interdisant de choisir deux nombres voisins (**contrainte**).

Par exemple on peut choisir dans le tableau suivant les nombres 20, 19, 18, 17 et 16 dont la somme fait 90 :
``` py
nombres = [15, 4, 20, 17, 11, 8, 11, 16, 7, 14, 19, 7, 5, 17, 2, 18, 4, 5, 13, 8]
```

!!! question "Exercice corrigé" 

    1. 
        Écrire une fonction `select_5(tab)` qui renvoie la somme de cinq nombres qui ne sont pas voisins choisis dans un tableau de nombres entiers `tab`.

        Aide : Les nombres du tableau étant tous positifs, on peut écraser la valeur des nombres sélectionnés et de ceux qui sont interdits par 0.

    2. Trouver un exemple pour lequel l’algorithme glouton n’est pas optimal.


    

??? Success "Réponse"
    1. Voyons d'abord la solution qui ne fonctionne pas :
    ``` py

    def plus_grand(tab):
        """ list -> int
        Renvoie l'indice de la plus grande valeur de tab
        """
        imax = 0
        for i in range(len(tab)):
            if tab[i] > tab[imax]:
                imax = i
        return imax


    def select_5(tab):
        """ list -> list
        Renvoie les 5 nombres de tab dont la somme est la plus grande
        sans choisir deux nombres voisins
        """
        somme = 0
        for _ in range(5):
            # on prend la plus grande valeur de tab et on la met à 0
            imax = plus_grand(tab)
            somme += tab[imax]
            tab[imax] = 0
            # les nombres voisins sont aussi mis à 0
            if imax > 0:         # si c'est n'est pas le premier ékément de tab
                tab[imax-1] = 0      # on met le nombre de gauche à 0
            if imax < len(tab)- 1:   # si ce n'est pas le dernier
                tab[imax+1] =0      # on met le nombre de droite à 0
        return somme


    >>> nombres = [15, 4, 20, 17, 11, 8, 11, 16, 7, 14, 19, 7, 5, 17, 2, 18, 4, 5, 13, 8]
    >>> select_5(nombres) 
    90
    ```

    2. 
    Avec les nombres `[15, 4, 20, 17, 11, 8, 11, 16, 7, 14, 2, 7, 5, 17, 19, 18, 4, 5, 13, 8]` on obtient 84 alors qu’on pouvait choisir 20 + 18 +17 + 16 + 15 = 86



### Charger les wagons

On doit charger des containers de marchandises sur les wagons d’un train. On peut charger autant de containers qu'on le souhaite sur chaque wagon tant que la masse des containers ne dépasse pas 60 tonnes.

Par exemple, on peut charger les 18 containers qui ont les masses (en tonnes) suivantes :
   
```
containers = [32, 1, 4, 11, 16, 38, 30, 15, 40, 20, 26, 5, 25, 14, 44, 17, 7, 6]
```

sur 7 wagons en les répartissant ainsi :

```
[32, 20, 4], [30, 26], [11, 44], [40, 15, 5], [38, 17], [14, 16, 25, 1], [6, 7]
```
On cherche la répartition des containers (**sélectionner**) qui permet d'utiliser le plus petit nombre de wagons **minimiser une grandeur**) sans dépasser la capacité des wagons de 60 tonnes (**contrainte**).

On propose d’utiliser l’algorithme glouton suivant :
-  train = tableau_vide
-  Tant qu’il reste des containers à charger :
    - wagon = tableau vide
    - Tant qu’il reste des containers à charger et qu’on ne dépasse pas 60 tonnes sur le wagon, choisir le container le moins lourd et essayer de le charger sur le wagon.
    - Ajouter le wagon au train

!!! question "Exercice corrigé" 
    1. Écrire une fonction `charger(containers, pmax)` qui prend en paramètre `containers`, le tableau des poids des containers en tonne et `pmax`, la capacité d’un wagon (un nombre entier) et renvoie la répartition des containers

    2. Trouver un exemple pour lequel l’algorithme glouton n’est pas optimal.

  

??? Success "Réponse"
    1. Voyons d'abord la solution qui ne fonctionne pas :
    ``` py

    def charger(containers, pmax):
        """ list, int -> list[list]
        Renvoie la répartition des containers en utilisant le plus petit nombre de
        wagons sans dépasser une capacité des wagons de pmax
        """
        train = []
        # tri des containers en ordre décroissant
        containers = sorted(containers, reverse = True)
        # tant qu'il reste des containers à charger
        while len(containers) != 0:
            # on crée un nouveau wagon
            wagon = []
            # tant qu'il reste des containers à charger
            # et qu'on ne dépasse pas pmax en le mettant dans le wagon
            while len(containers) != 0 and sum(wagon) + containers[-1] <= pmax:
                # on l'ajoute au wagon
                wagon.append(containers.pop())
            # on ajoute le wagon au train
            train.append(wagon)
        return train

    >>> containers = [32, 1, 4, 11, 16, 38, 30, 15, 40, 20, 26, 5, 25, 14, 44, 17, 7, 6]
    >>> charger(containers, 60)
    [[1, 4, 5, 6, 7, 11, 14], [15, 16, 17],  [20, 25],  [26, 30],  [32],  [38],  [40],  [44]]
    ```

    2. 
    Avec les nombres `[15, 4, 20, 17, 11, 8, 11, 16, 7, 14, 2, 7, 5, 17, 19, 18, 4, 5, 13, 8]` on obtient 84 alors qu’on pouvait choisir 20 + 18 +17 + 16 + 15 = 86