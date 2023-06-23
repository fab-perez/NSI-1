# Constructions élémentaires

!!! abstract "Cours" 
    En Python, l’**indentation**, ou décalage vers la droite du début de ligne, délimite les séquences d’instructions et facilite la lisibilité en permettant d’identifier des **blocs**. La ligne précédant une indentation se termine toujours par le signe deux-points.


En Python, on utilise 4 espaces (ou Tab) pour faire une indentation (on pourrait aussi utiliser un seul ou plusieurs espaces  mais il faut être consistant).

##	Instructions conditionnelles

!!! abstract "Cours" 
    Une instruction conditionnelle exécute, ou pas, une séquence d’instructions suivant la valeur d’une condition (une expression booléenne qui prend la valeur `True` ou `False`).

    ```py
    if condition:
        instructions
    ```
Par exemple, ce programme détermine le stade de la vie d’une personne selon son age.

!!! tip inline end "PEP-8" 
    Pas d’espace avant le caractère « `:` ».

```py linenums="1"
age = int(input("Quel age avez-vous ?"))
if age >= 18:
    stade = "adulte"
    print(f"Vous êtes un {stade}")
    print(f"Vous avez {age} ans")
```
> Ne pas oublier les deux-points « `:` » après la condition et l’indentation après.

L’indentation détermine la séquence à exécuter (ou pas), dans ce cas les instructions qui suivent aux lignes 3, 4 et 5. Quand la condition (l’expression booléenne) `age >= 18` n’est pas vérifiée, aucune des trois instructions n’est exécutée. 

On peut choisir de ne pas indenter l'instruction en ligne 5 `print(f"Vous avez {age} ans")`, elle ne fera plus partie de l’instruction conditionnelle et sera exécutée dans tous les cas. 

```py linenums="1"
age = int(input("Quel age avez-vous ?"))
if age >= 18:
    stade = "adulte"
    print(f"Vous êtes {stade}")
print(f"Vous avez {age} ans")
```

Par contre si on n’indentait pas l’instruction en ligne 4 `print(f"Vous êtes {stade}")`, la variable `stade` ne serait pas définie quand la condition n’est pas vérifiée et dans ce cas on aurait un message erreur.

La structure if-else permet de gérer le cas où la condition est fausse :

!!! abstract "Cours" 
    ```py
    if condition:
        instructions
    else :
        instructions_sinon
    ```

> L'instuction `else` n’a pas de condition, elle est toujours suivie des deux-points « `:` » .

```py linenums="1"
age = int(input("Quel age avez-vous ?"))
if age >= 18:
    stade = "adulte"
else:
    stade = "enfant"
print(f"Vous êtes {stade}")
print(f"Vous avez {age} ans")
```
Dans ce cas, la variable `stade` est toujours définie, on peut ne plus indenter l’instruction en ligne 6 `print(f"Vous êtes {stade}")`. 

La structure `if-elif-else` permet de remplacer des instructions conditionnelles imbriquées pour gérer plusieurs cas distincts :

!!! abstract "Cours" 
    ```py
    if condition_1:
        instructions_si_1
    elif condition_2:
        instructions_si_2
    elif condition_3:
        instructions_si_3
    …
    else :
        instructions_sinon
    ```

Ces deux programmes font exactement la même chose :

|programme 1|programme 2|
|---|---|
|`if age >= 18:`<br>&nbsp;&nbsp;&nbsp;&nbsp;`stade = "adulte"`<br>`else:`<br>&nbsp;&nbsp;&nbsp;&nbsp;`if age >= 12:`<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`stade = "ado"`<br>&nbsp;&nbsp;&nbsp;&nbsp;`else:`<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`if age >= 2:`<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`stade = "enfant"`<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`else :`<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`stade = "bébé"`<br>`print(f"Vous êtes {stade}, vous avez {age} ans")`|`if age >= 18:`<br>`    stade = "adulte"`<br><br>`elif age >= 12:`<br>&nbsp;&nbsp;&nbsp;&nbsp;`stade = "ado"`<br><br>`elif age >= 2:`<br>&nbsp;&nbsp;&nbsp;&nbsp;`stade = "enfant"`<br>`else :`<br>&nbsp;&nbsp;&nbsp;&nbsp;`stade = "bébé"`<br>`print(f"Vous êtes {stade}, vous avez {age} ans")`|


Dès qu’une condition est vérifiée, le programme ne teste pas les conditions `elif` suivantes ni `else` mais saute directement à la fin du bloc conditionnel, ici `print(f"Vous êtes {stade}, vous avez {age} ans")`. Par exemple, si on affecte la valeur `15` à la variable `age`, le programme exécute le bloc `elif age >= 12:…`mais pas les blocs suivants `elif age >=2 :…` ni `else:…`. 

!!! info "Rappel" 
    Eviter les conditions d’égalité avec les nombres de type float. Par exemple : 
    ``` py
    if 2.3 - 0.3  == 2:
        print('Python sait bien calculer avec les float')
    else:
        print('Python ne sait pas bien calculer avec les float')
    ```

!!! tip "PEP-8" 
    Eviter de comparer des variables booléennes à `True` ou `False` avec `==` ou avec `is`. 
    
    On écrit :
    ``` py
    cond = True
    if cond:
        print("la condition est vraie"
    ```
    mais pas  `if cond == True:`  ni  `if cond is True:`






!!! question "Exercice corrigé" 

	Écrire un programme qui demande une année et affiche si elle est bissextile ou pas :

    1. en utilisant des conditions imbriquées.
    2. en utilisant une structure `if-elif-else`. 

    « Depuis l'ajustement du calendrier grégorien, l'année sera bissextile (elle aura 366 jours) seulement si elle respecte l'un des deux critères suivants :

    1. C1 : l'année est divisible par 4 sans être divisible par 100 (cas des années qui ne sont pas des multiples de 100) ;
    2. C2 : l'année est divisible par 400 (cas des années multiples de 100).

    Si une année ne respecte ni le critère C1 ni le critère C2, l'année n'est pas bissextile ».
    
    Source: [https://fr.wikipedia.org/wiki/Année_bissextile](https://fr.wikipedia.org/wiki/Année_bissextile).
        


        
??? Success "Réponse 1.en utilisant des conditions imbriquées"

    Analysons la définition donnée par Wikipedia sous la forme d'un arbre :
    ``` mermaid
    graph LR
    A[annee%4 == 0] --> |True| B;
    A -->|False| C{pas bissextile};
    B[annee%100 != 0] --> |True| D{bissextile};
    B --> |True| E;
    E[annee%400 == 0] --> |True| F{bissextile};
    E --> |False| G{pas bissextile};
    ```
	
    Traduit en Python, on obtient le programme suivant.

    ```py linenums="1"
    annee = int(input('annee: ') )
    if annee % 4 == 0:                     # si annee est divisible par 4 ...
        if annee % 100 != 0:                   # ... mais pas par 100,
            print(annee, "est bissextile")         # alors elle est bissextile
        else:                                   # ... et par 100, alors 
            if annee % 400 == 0:                    # soit elle est divisible par 400 ...
                print(annee, "est bissextile")          # ...donc elle est bissextile
            else:                                   # soit elle n'est pas divisible par 400
                print(annee, "n'est pas bissextile")    # ...donc elle n'est pas bissextile
    else:                                   # sinon, elle n'est divisible par 4 ...
        print(annee, "n'est pas bissextile")   # ...donc elle n'est pas bissextile
        
    ```
    Le programme n’est pas facile à lire. On note ici l'importance de l'indentation !  

        
??? Success "Réponse 2.en utilisant une structure `if-elif-else`"

    Chaque condition `if`, `elif`, `else` vérifiée termine la structure conditionnelle. Il faut donc tester les divisibilités en partant du plus grand nombre, `400`, puis `100`, puis `4` (car une fois qu'on a testé la divisibilité par `4`, on ne peut plus tester la divisibilité par `100` ou `400`). 
    Modifions l'arbre précédent:
    ``` mermaid
    graph LR
    A[annee%400 == 0] --> |True| C{bissextile};
    A -->|False| B;
    B[annee%100 == 0] -->  |True| E;
    B -->|False| D{pas bissextile};
    E[annee%4 == 0] --> |True| F{bissextile};
    E --> |False| G{pas bissextile};
    ```
	
    Traduit en Python, on obtient le programme suivant.

    ```py linenums="1"
    annee = int(input('annee: ') )
    if annee % 400 == 0:        # si annee est divisible par 400
        print(annee, "est bissextile")
    elif annee % 400 == 0:        # sinon, si annee est divisible par 100 (et pas par 400 car déjà testé)
        print(annee, "n'est pas est bissextile")
    elif annee % 4 == 0:          # sinon, si annee est divisible par 4 (et pas par 100 et 400 car déjà testés)
            print(annee, "est bissextile")        
    else:                         # sinon (l'annee n'est pas divisible par 4, 100 et 400 car déjà testés)
        print(annee, "n'est pas est bissextile")
    ```
    
    Le programme est beaucoup plus lisible.

!!! info "Note" 
    On pourrait aussi utiliser l'expression trouvé dans l'[exercice corrigé](2-operations-comparaisons-expressions.md#expressions) précédent : 
    ``` py
    annee = int(input('annee: ') )
    if (annee % 4 == 0 and not annee % 100 == 0) or annee % 400 == 0:
        print(annee, 'est bissextile')
    else:
        print(annee, "n'est pas bissextile")
    ```
    mais ce n'est pas très lisible.


## Boucles non bornées

!!! abstract "Cours" 
    Une boucle non bornée (ou boucle conditionnelle) permet de répéter une instruction ou une séquence d’instructions, tant qu’une condition (une expression booléenne) est vraie.

    ```py
    while condition:
        instructions
    ```

La structure est similaire à l’instruction conditionnelle. La condition qui suit le mot `while` est une expression de type booléen qui prend la valeur `True` ou `False`. Le bloc d’instructions qui suit est exécuté tant que la condition est vraie. Ce bloc d’instruction doit impérativement modifier la valeur de l’expression à tester par la condition afin qu’elle finisse par ne plus être vérifiée, sinon la boucle est sans fin (non bornée).

Exemple :
!!! info "Rappel" 
    `i += 2` est une abréviation de `i = i + 2`

``` py
>>> i = 0
>>> while i <= 10:
...     print(i)
...     i += 2
...     
0
2
4
6
8
10
```
 
Il faut toujours impérativement **vérifier que la condition ne sera plus vérifiée** après un nombre fini de passage, sinon le programme ne s’arrête jamais, on parle de **programme qui boucle** ou de divergence. Ici, c’est bien le cas grâce à l’instruction `i += 2`.

Exemple de programme qui boucle (erreur d’indentation dans l’instruction `i += 1`):
``` py linenums="1"
i = 0
while i <= 10:
    print(i)
i += 2
```

Comme pour les instructions conditionnelles, attention de faire particulièrement attention aux boucles avec les nombres de type `float`.  Testons par exemple :

``` py
>>> while i < 2:
...     i += 0.1
...     print(i)
...     
1.1
1.2000000000000002
1.3000000000000003
1.4000000000000004
1.5000000000000004
1.6000000000000005
1.7000000000000006
1.8000000000000007
1.9000000000000008
2.000000000000001
``` 
On voit que `i` ne prend jamais la valeur `2`. La boucle suivante qui semble équivalente ne finira donc jamais !
``` py
i = 1
while i != 2:
    i += 0.1
```

## Boucles bornées


!!! abstract "Cours" 
    Une boucle bornée (ou boucle non conditionnelle) permet de répéter n fois, n étant un nombre entier connu,  une instruction ou une séquence d’instructions.

    ```py
    for i in range(n):
        instructions
    ```

`i` est appelé l’**indice de boucle ou compteur de boucle**, il prend les `n` valeurs entières comprises **entre 0 et n - 1**.
 
:warning: **`i` ne prend pas la valeur n**.

On peut aussi utiliser :

- `range(d, f)` qui énumère les `f-d` nombres entiers compris entre `d` et `f-1`. [^1]

[^1]: `range(d, f)` montre l’avantage d’exclure la borne supérieure, il y `f-d` nombres compris entre `d` (inclus) et `f` (exclus), comme l’a expliqué Edsger W. Dijkstra dans une [note de 1982](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD08xx/EWD831.html)

- `range(d, f, p)` qui énumère les nombres entiers compris entre `d` et `f-1` avec un pas de `p` : `d`, `d+p`, `d+2p`, etc. [^2]

[^2]:L'instruction `range()` fonctionne sur le modèle `range([début,] fin [, pas])`. Les arguments entre crochets sont optionnels.


La boucle bornée ci-dessus est très similaire à la boucle non bornée suivante :
```py
i = 0
    while i < n :
        instructions
        i += 1
```
:warning:mais attention, comparons ces deux programmes :

|programme 1|programme 2|
|---|---|
|<br>`for i in range(5):`<br>&nbsp;&nbsp;&nbsp;&nbsp;`print(i)`|`i = 0`<br>`while i < 5:`<br>&nbsp;&nbsp;&nbsp;&nbsp;`print(i)`<br>&nbsp;&nbsp;&nbsp;&nbsp;`i += 1`|
    
Ils semblent donner le même résultat : afficher les chiffres de 0 à 4. 

Pourtant ils sont différents. Ajoutons une instruction `print(i)` à la fin les deux programmes. Dans le premier cas, la valeur finale de `i` est `4`, dans le second cas c’est `5` afin que la condition ne soit plus valide.

Autre différence, on peut modifier l’indice de boucle, mais il reprend sa valeur à la répétition suivante. En pratique, on évite de le faire.

|programme 1|programme 2|
|---|---|
|<br>`for i in range(5):`<br>&nbsp;&nbsp;&nbsp;&nbsp;`print(i)`<br>&nbsp;&nbsp;&nbsp;&nbsp;`i = i + 2`<br>&nbsp;&nbsp;&nbsp;&nbsp;`print(i)`|`i = 0`<br>`while i < 5:`<br>&nbsp;&nbsp;&nbsp;&nbsp;`print(i)`<br>&nbsp;&nbsp;&nbsp;&nbsp;`i = i + 2`<br>&nbsp;&nbsp;&nbsp;&nbsp;`print(i)`|
|`0`<br>`2`<br>`1`<br>`3`<br>`2`<br>`4`<br>`3`<br>`5`<br>`4`<br>`6`|`0`<br>`2`<br>`2`<br>`4`<br>`4`<br>`6`|

La boucle `for` possède d’autres possibilités très utiles, par exemple elle permet d’énumérer chaque caractère d’une chaine de caractères. Le programme ci-dessous affiche chaque lettre d’une variable message.
```py
message = 'bonjour'
for c in message:
    print(c)
```

## Instructions break et continue

Il existe deux instructions qui permettent de modifier l'exécution des boucles, il s'agit de `break` et de `continue`.



!!! abstract "Cours" 
    ![Instuction break](../assets/instruction-break-light-mode.png#only-light){align=right}
    ![Instuction break](../assets/instruction-break-dark-mode.png#only-dark){align=right}
    L'instruction `break` permet de sortir de la boucle courante et de passer à l’instruction suivante.


Par exemple, voici un programme qui redemande un mot de passe jusqu'à obtenir le bon :
```py linenums="1"
while True:
    mdp = input('mot de passe')
    if mdp == '123456':
        break
print('trouvé')
```

!!! abstract "Cours" 
    ![Instuction continue](../assets/instruction-continue-light-mode.png#only-light){align=right}
    ![Instuction continue](../assets/instruction-continue-dark-mode.png#only-dark){align=right}

    L'instruction `continue` permet de sauter les instructions qui restent jusqu'à la fin de la boucle et de reprendre à la prochaine itération de boucle.


    
Imaginons par exemple que l'on veuille imprimer pour tous les entiers $n$ compris entre $1$ et $10$ la valeur de $1 / (n - ­7)$ . Il est évident que quand $n$ prend la valeur $7$ il y aura une erreur. Grâce à l'instruction `continue`, il est possible de traiter cette valeur à part puis de continuer la boucle.

```py linenums="1"
for n in range(10):
    if n == 7:
        continue
    print(1 / (7 - n))
```

##	Boucles imbriquées

!!! abstract "Cours" 
    ![Boucles imbriquées](../assets/instruction-boucles-imbriquees-light-mode.png#only-light){align=right}
    ![Boucles imbriquées](../assets/instruction-boucles-imbriquees-dark-mode.png#only-dark){align=right}
    Il est possible d’imbriquer des boucles. A chaque passage dans la première boucle (la boucle externe), la seconde boucle (la boucle interne) est effectuée entièrement. 



:warning: Attention à l’indentation pour déterminer à quelle boucle appartiennent les instructions.  

On peut par exemple afficher toutes les heures et minutes de la journée (de 0h0min à 23h59 min) :

```py linenums="1"
for heure in range(24):
    for minute in range(60):
        print(f"{heure}h{minute}min")
```


!!! question "Exercice corrigé"
    Exercice corrigé : Écrire un programme en Python qui affiche tous les nombres premiers inférieurs à 100.

    Rappel : un nombre est premier s’il n’a que deux diviseurs, 1 et lui-même.

??? Success "Réponse"
    On utilise deux boucles for imbriquées : 

    - La première boucle parcourt tous les nombres `n` allant de 2 (0 et 1 ne sont pas premiers) à 100 pour vérifier s'ils sont premiers ou pas. 

	!!! note inline end "" 
    	On peut se contenter de chercher un diviseur `div` seulement entre 2 et $\sqrt{n}$ avec une boucle `while div**2 <= n:`.

    - Pour chaque nombre `n`, la deuxième boucle vérifie s'il est divisible par un nombre `div` compris entre 2 et `n - 1`. Si `n` est divisible par `div`, alors il n'est pas premier et on affecte la valeur `False` à la variable `est_premier`. Dans ce cas, inutile de chercher d'autres diviseurs, on peut sortie de la boucle avec une instruction `break`.

    Ensuite, à la fin de la deuxième boucle, on vérifie si la variable `est_premier` est `True` et dans ce cas, cela signifie que le `n` est premier et il est affiché à l'écran.



    ```py linenums="1"
    for n in range(2, 101):
        est_premier = True   
        for div in range(2, n):   #on cherche un diviseur compris entre 2 et n - 1
            if n % div == 0:
                est_premier = False  # on a trouvé un diviseur de n, il n'est pas premier
                break  # on peut sortir de la boucle interne ici, inutile de continuer
        if est_premier:         # on préfère à : if premier == True
            print(n, end="-")  

    ```



