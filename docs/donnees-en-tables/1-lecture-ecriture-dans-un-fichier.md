# Lecture et écriture dans un fichier

##	Les chemins de fichiers
Pour décrire l'emplacement d'un fichier, on a deux possibilités : les chemins relatifs et absolus.

-	Chemin absolu : décrit l'intégralité des dossiers (ou répertoires[^1.1]) menant au fichier, peu importe l'endroit où on se trouve.  Sous Windows, on partira du nom de volume (C:\, D:\…). Sous les systèmes Unix, ce sera depuis /.

-	Chemin relatif : décrit la succession de répertoires à parcourir en prenant comme point de départ le répertoire dans lequel on se trouve.

[^1.1]: Depuis Windows 7, le terme « dossier » remplace « répertoire »

Exemple : 
Le chemin absolu du fichier explorer.exe est `C:\Windows\explorer.exe`[^1.2].
Son chemin relatif dépend du répertoire courant où l'on se trouve :

[^1.2]: Python reconnait indifféremment les chemins indiqués avec *backslash* (norme Windows) « `\` » qu'avec *slash* « `/` » (norme Unix).

``` mermaid
graph TD
A[C:] --> B;
A --> C[Program Files];
B[Windows] -->  D[explorer.exe];
B--> E[notepad.exe];
A --> F["Program Files(x86)"];
A --> G[Users];
```

|Rép. courant|Chemin relatif|
|:--|:-|
|Windows|`explorer.exe`|
|C:|`Windows\explorer.exe`|
|Program Files|	`..\Windows\explorer.exe`[^1.3] |

[^1.3]: « `..` » désigne le répertoire parent.

En Python, on peut déterminer le répertoire courant avec l'instruction `getcwd()` du module `os` (noter le  double `\\` dans la chaîne de caractère pour ‘échapper' le caractère `\`)

``` py
>>> import os
>>> os.getcwd()
'C:\\Program Files\\PyScripter'
```

Sur les systèmes UNIX le caractère de séparation est un *slash*  « `/` ». Exemple : `/usr/bin/mozilla-firefox`. Les protocoles internet, initialement développés sous UNIX, utilisent donc la même convention.

##	f = open() et f.close()

Pour lire ou écrire dans un fichier depuis un programme Python, il faut d'abord **ouvrir le fichier**. On utilise la fonction `open()` qui prend pour paramètre le chemin (absolu ou relatif) du fichier et le mode d'ouverture :

-	`'r'` pour ouvrir le fichier en mode lecture (*read-only*)  est l'option par défaut.
-	`'w'` en mode écrite (*write*),  le contenu éventuel déjà présent dans le fichier est écrasé.
-	`'a'` en mode ajout (*append*), ce que l'on écrit est ajouté à la fin du fichier.

On peut compléter le mode d'ouverture avec `b` pour un fichier binaire (image ou son par exemple), on obtient `rb'`, `'wb'`, `'ab'`.

:warning: On ne peut pas ouvrir en mode lecture un fichier qui n'existe pas.

``` py
>>> f = open("fichier.txt ", "r")
Traceback (most recent call last):
  File "<interactive input>", line 1, in <module>
FileNotFoundError: [Errno 2] No such file or directory: 'fichier.txt'
```

Par contre en mode écriture ou ajout, si le fichier n'existe pas quand il est ouvert alors il est créé :

``` py
f = open('fichier.txt', 'w')
```

Si `fichier.txt` ne se trouve pas dans le répertoire du programme Python, il faut donner son chemin pour y accéder avec `/` ou `\\`.

``` py
>>> f1 = open("C:/…/…/…/fichier1.txt ", "r")
>>> f2 = open("C:\\…\\…\\…\\fichier2.txt ", "r")
```

:warning: Attention, il faut **toujours fermer un fichier après l'avoir ouvert**[^1.4]. La méthode à utiliser est `close()` :

[^1.4]: On peut essayer de supprimer un fichier ouvert depuis Windows explorer pour s’en convaincre.

``` py
>>> f.close()
```

##	with open() as f:

Une autre façon de travailler sur un fichier est d'utiliser la structure suivante :

``` py
>>> with open("fichier.txt ", "w") as f:
         # bloc d'instructions
```
    
Dans ce cas-là, le fichier est automatiquement fermé à la fin du bloc d'instructions (attention à l'indentation), il n'y a pas besoin de le fermer (et cela limite les erreurs).

##	Écrire dans un fichier

Pour écrire dans un fichier, on utilise la méthode `write()` en lui passant en paramètre **une chaîne de caractères**[^1.5] à écrire. La fonction renvoie le nombre de caractères qui ont été écrits[^1.6].

[^1.5]: La méthode `write()` n'accepte en paramètre que des chaînes de caractères, pour écrire des nombres il faut les convertir en chaîne avant.

[^1.6]: On peut récupérer cette valeur par exemple pour vérifier que le fichier contient bien le texte qu'on y a écrit.


=== "f = open()"
    ``` py
    >>> f = open("fichier.txt", "w")
    >>> f.write('France Paris\n')
    13
    ```

=== "with open as f:"
    ``` py
    >>> f.close()	>>> with open("fichier.txt", "w") as f
            f.write('France Paris\n')
    13
    >>> 
    ```

Noter le caractère « `\n` » pour indiquer un retour à la ligne. On peut ouvrir fichier.txt avec le blocnote et vérifier que le texte est présent.

On peut écrire deux autres lignes à la suite en mode `a` :

``` py
>>> f = open("fichier.txt", "a")
>>> f.write('Allemagne Berlin\nItalie Rome\n')
29
```

Si on ouvre le fichier.txt dans le blocnote on constate que rien n'a été écrit ! En effet, il faut d'abord fermer le fichier :

```
>>> f.close()
```
Cette fois le fichier a bien été modifié.


##	Lire un fichier

Pour lire dans un fichier, on utilise la méthode `read()` qui renvoie l'intégralité du fichier dans une chaine de caractères :


=== "f = open()"
    ``` py
    >>> f = open("fichier.txt", "r")
    >>> f.read()
    'France Paris\nAllemagne Berlin\nItalie Rome\n'
    >>> f.close()
    ```

=== "with open as f:"
    ``` py
	>>> with open("fichier.txt", "r") as f
        f.read()
    'France Paris\nAllemagne Berlin\nItalie Rome\n'
    >>> 
    ```


Qu'on peut imprimer avec `print(f.read())` pour ne pas voir les retours à la ligne `\n`.

A noter, un fichier n'est lu qu'une fois avant d'être refermé.


=== "f = open()"
    ``` py
    >>> f = open("fichier.txt", "r")
    >>> print(f.read())
    France Paris
    Allemagne Berlin
    Italie Rome

    >>> print(f.read())

    >>> f.close()
    ```

=== "with open as f:"
    ``` py
	>>> with open("fichier.txt", "r") as f
        print(f.read())
        print(f.read())
    France Paris
    Allemagne Berlin
    Italie Rome
    >>> 
    ```

Après le premier `read()`, Python est arrivé au bout du fichier. Il ne recommence pas à le lire depuis le début et rien n'apparait après le second `read()`. Pour recommencer au début, il faut fermer le fichier.

Au lieu de `.read()` qui lit tout le fichier, on peut ne lire qu'une seule ligne à la fois avec la méthode `readline()` :


=== "f = open()"
    ``` py
    >>> f = open("fichier.txt", "r") 
    >>> f.readline()
    'France Paris\n'
    >>> f.readline()
    'Allemagne Berlin\n'
    >>> f.close()
    ```

=== "with open as f:"
    ``` py
	>>> with open("fichier.txt", "r") as f
        f.readline()
        f.readline()
    'France Paris\n'
    'Allemagne Berlin\n'
    >>> 
    ```


Ou itérer sur les toutes lignes avec `for… in …` :



=== "f = open()"
    ``` py
    >>> f = open("fichier.txt", "r") 
    >>> for li in f:
            print(li)
    France Paris

    Allemagne Berlin

    Italie Rome

    >>> f.close()
    ```

=== "with open as f:"
    ``` py
	>>> with open("fichier.txt", "r") as f
        for li in f:
             print(li)
    France Paris

    Allemagne Berlin

    Italie Rome
    ```


ici la variable `li` est une chaine de caractère qui va prendre la valeur de chaque ligne de fichier.txt.


On peut aussi mentionner la méthode `readlines()` qui permet lire l'intégralité d'un fichier dans une tableau (possible que si le fichier à lire n'est pas trop gros : puisqu'il est copié intégralement dans une variable, c'est-à-dire dans la mémoire vive de l'ordinateur, il faut que la taille de celle-ci soit suffisante).

``` py
>>> with open("fichier.txt", "r") as f:
         f.readlines()
['France Paris\n', 'Allemagne Berlin\n', 'Italie Rome\n']
```

:warning: Attention donc à ne pas confondre `readline()` qui renvoie une seule ligne dans une chaîne de caractères, avec `readlines()` qui renvoie un tableau de toutes les lignes.
