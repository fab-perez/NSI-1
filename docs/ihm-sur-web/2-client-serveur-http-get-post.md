# Interaction client-serveur, requête HTTP, méthodes GET et POST

Corrigés de l'activité faite en classe :  [IHM Web (2)](assets/[NSI] IHM Web (2) - Client-serveur, HTTP, GET et POST(correction).pdf).


## HTTP et le modèle client-serveur

!!! abstract "Cours" 
    Le Web fonctionne selon le modèle client/serveur : la machine client demande à la machine serveur une
    ressource identifiée par son adresse URL.

    - Les fichiers d’une page web (fichiers HTML et CSS, les images, vidéos et autres ressources) sont
    stockés sur un ordinateur distant : le **serveur web**.
    - L’utilisateur consulte cette page web sur sa machine (ordinateur, tablette, smartphone) via un
    **navigateur** (Mozilla Firefox, Google Chrome, Safari, etc.) : le **client**.
    - Le client fait des requêtes au serveur, et le serveur lui répond en renvoyant les fichiers de la page
    web. Ces échanges se font par **internet** en utilisant le **protocole HTTP** (ou **HTTPS** en version
    sécurisée).

## URL

!!! abstract "Cours" 
    Une URL, pour *Uniform Resource Locator*, couramment appelée **adresse web**, permet de **localiser une ressource** (un document, une image, une vidéo, etc.) **sur le Web** avec le protocole utilisé.

Une URL se compose de différentes parties dont certaines sont obligatoires et d'autres optionnelles. 
   
Exemples : 
    
- `https://fr.wikipedia.org/wiki/World_Wide_Web/` est formé de : 

    - `https` : Le **protocole** utilisé, c'est souvent HTTP ou HTTPS sa version sécurisée.
    - `fr.wikipedia.org` : Le **nom de domaine**  du serveur web.
    - `wiki/World_Wide_Web` : Le **chemin** sur le serveur web vers la ressource.

- `https://www.google.fr/search?q=nsi&source=hp` où `?q=nsi&source=hp` donne des paramètres supplémentaires sous forme de paires de clé = valeur séparées par « & ». 


- `https://fr.wikipedia.org/wiki/Informatique#Algorithmique` où `#Algorithmique` est une ancre qui désigne un endroit donné de la ressource.


## Serveur web

Le rôle du **serveur web** est de répondre à des **requêtes de postes clients** (généralement des navigateurs web tels que Edge, Firefox, Chrome, etc .) à travers un réseau public (Internet) ou privé (intranet), en utilisant le protocole HTTP (la plupart du temps). Le terme serveur web désigne à la fois : 

- Un **serveur informatique** mis à disposition par un **hébergeur web**. Les hébergeurs sont des entreprises commerciales (IONOS, Hostinger, LWS, etc.) avec des offres gratuites ou payantes par exemple pour avoir son propre nom de domaine ou plus de fonctionnalités (site WordPress, etc.).  

- Un **logiciel** sur le serveur qui prend en charge les **requêtes HTTP** de postes clients et permet d'exécuter des programmes, souvent en **PHP**, pour générer **des pages web dynamiques**. Les plus courants sont **Apache** et **Nginx**. 

## PHP

Un fichier PHP est aussi capable d’exécuter des programmes, c’est un fichier HTML « amélioré ». 

 
!!! abstract "Cours" 
    **PHP** (pour "*PHP: Hypertext Preprocessor*") est un langage de programmation utilisé pour générer des pages web dynamiques. Contrairement à JavaScript, un programme PHP **s’exécute sur le serveur pour produire du code HTML** qui est ensuite envoyé au client.

## Formulaires dans une page web

Le programme JavaScript s’exécute sur la machine de l’utilisateur, ce qui n’est pas possible dans de nombreuses situations : saisie d’identifiant de connexion, consultation de compte bancaires, achats en ligne, forum, réseaux sociaux, etc. Les **données doivent être traitées sur le serveur : c’est le rôle de PHP**.

Lorsqu’un navigateur fait une requête **avec la méthode GET**, il **peut transmettre au serveur web des paramètres en ajoutant à la fin de l’URL des couples clé = valeur séparés par « & »** :  `?param1=val1&param2=val2...`.

## Méthodes GET et POST

!!! abstract "Cours" 
    Le protocole **HTTP** (ou **HTTPS** en version sécurisée) permet d’obtenir un fichier ou une ressource depuis un  serveur. Plusieurs *méthodes* peuvent être utilisées, les plus courantes sont :
    
    - **GET** : les **paramètres passés au serveur sont visibles dans l’URL** sous la forme cle=valeur (et donc éventuellement dans l’historique de navigation et le cache).  La méthode **GET n’est pas recommandée pour un formulaire contenant un mot de passe**.
    
    - **POST** :  les **paramètres sont passés dans le corps de la requête**, ils **n’apparaissent pas dans l’URL**. 

Il existe d’autres différences sur le traitement des paramètres avec les méthodes GET et POST :

||	GET|	POST|
|:-|:-|:-|
|Visibilité des paramètres|	Visible pour l’utilisateur dans l’URL|	Invisible pour l’utilisateur|
|Marque-page et historique de navigation|Les paramètres sont stockés en même temps que l’URL|L’URL est enregistrée sans paramètres|
|Actualisation du navigateur / Bouton « précédent »|	Les paramètres de l’URL ne sont pas envoyés à nouveau|Le navigateur avertit que les données du formulaire doivent être renvoyées|
|Type de données|	Caractères ASCII uniquement|	Caractères ASCII et binaires (image, son, vidéo, etc.)|
|Longueur des données|	Limitée - longueur maximale de l’URL à 2 048 caractères|	Illimitée |

## HTTP et HTTPS

!!! abstract "Cours" 
    Si l’utilisation de la méthode POST permet de ne pas afficher les paramètres dans la barre de tâche, cela ne suffit pas à sécuriser les données échangées entre le client et le serveur, il faut en plus **chiffrer les échanges en utilisant le protocole HTTPS**.

Quand un navigateur (un client) communique avec un serveur web, ils s’échangent des données sur internet à travers un grand nombre de routeurs (c’est le routage). 

- Avec HTTP, les échanges ne sont pas chiffrés, ils peuvent être interceptés et lus par un pirate informatique .

- Avec** HTTPS, les échanges sont chiffrés**, le « S » à la fin signifie qu’ils sont sécurisés grâce au protocole TLS (*Transport Layer Security*), le successeur de SSL (*Secure Sockets Layer*). Un pirate informatique ne peut donc pas les lire et récupérer des informations sensibles.

- Pour utiliser HTTPS, un serveur web doit pouvoir être **authentifié par un certificat SSL obtenu auprès d’une autorité de confiance**, reconnue de tous. 