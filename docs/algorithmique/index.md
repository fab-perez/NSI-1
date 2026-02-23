
# Algorithmique

Un algorithme est une suite finie et non ambiguë d'instructions et d’opérations permettant de résoudre une classe de problèmes.

Le domaine qui étudie les algorithmes est appelé l'algorithmique. On retrouve aujourd'hui des algorithmes dans de nombreuses applications informatiques, dont dans les systèmes permettant le fonctionnement des ordinateurs, la cryptographie, le routage d'informations, la planification et l'utilisation optimale des ressources, le traitement d'images, le traitement de textes, la bio-informatique, l'intelligence artificielle, l'automatique, etc.

Les ordinateurs sur lesquels s'exécutent ces algorithmes ne sont pas infiniment rapides, car le temps de machine reste une ressource limitée, malgré une augmentation constante des performances des ordinateurs. L’analyse de la **complexité**, ou **coût** d'algorithmique permet de prédire l'évolution en temps calcul nécessaire pour amener un algorithme à son terme, en fonction de la quantité de données à traiter.


!!! abstract "Cours" 

    La **complexité d'un algorithme** mesure le nombre d'opérations élémentaires (comparaisons, affectations) qu'il effectue en fonction de la taille n des données.  


On utilise la notation O (grand O) pour exprimer un ordre de grandeur asymptotique.

-	*O(1)* : complexité constante, le temps d'exécution ne dépend pas de n.
-	*O(log₂(n))* : complexité logarithmique, par exemple la recherche dichotomique.
-	*O(n)* : complexité linéaire, par exemple les parcours d'une liste.
-	*O(n²)* : complexité quadratique, par exemple les tris par sélection ou par insertion.
-	*O(2ⁿ)* : complexité exponentielle, par exemple le calcul de la suite de Fibonacci en récursif.
-	*O(n!)* : complexité factorielle, par exemple le problème du voyageur de commerce.


On vérifie :

- la **terminaison** d'un algorithme pour prouver qu'il se termine en utilisant un variant de boucle : une expression entière, positive, et qui décroît strictement à chaque itération.

- la **correction** d'un algorithle pour prouver qu'il est correct en on utilisant un invariant de boucle : une propriété vraie avant la boucle, conservée à chaque itération, et qui implique la postcondition à la sortie de la boucle.



