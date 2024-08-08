---
title: 'An Overview of Apache Arrow'
date: 2024-08-06T13:15:14+02:00
summary: 'Flying Through Data with the Speed and Grace of a Mallard'
tags:
- architecture
- data
categories: 
- Blog
image: 'shared/abstract-white-1.jpg'
authors: 
- Dominique De Vito 
---

Ce document est un petit tour d’horizon de l’utilisation du projet Apache Arrow dans divers projets open source, dont certains sont des plus connus : Pandas, Polars, DuckDB, etc. D’une certaine manière, cette librairie Arrow, conjointement avec l’utilisation de machines multi-cœurs, change le panorama des outils de traitement analytique, et aussi, des outils big data.

## Qu’est-ce que Apache Arrow ?

Le projet Arrow (de la fondation Apache), créé en 2016, définit un framework pour créer des applications analytiques basées sur un format de données en colonnes, pour des données en mémoire. Ce projet Arrow inclut la définition de son propre format de données en colonnes, un format indépendant de tout langage, pour les données plates et hiérarchiques, organisé pour des traitements analytiques efficaces sur du matériel moderne comme les CPU et les GPU.

En résumé, les buts du projets Arrow sont double :

[*The first goal is to be an efficient, language-independent open standard for columnar data interchange.
The second goal is to be a portable, high-performance computing foundation for doing analytics on that columnar data*](https://wesmckinney.com/blog/from-ursa-to-voltrondata/)

Les librairies Arrow implémentent le format associé, et sont disponibles pour divers langages de programmation: C, C++, C#, Go, Java, JavaScript, Julia, MATLAB, Python, R, Ruby, et Rust. Le format des données étant le même pour tous ces langages, toutes les données écrites en utilisant un langage peuvent naturellement être lues avec un autre langage.

Les formats Parquet et ORC sont des exemples populaires de formats de données en colonnes, mais pour des données sur disque, alors que Arrow est un format défini pour des données stockées en mémoire. La définition d’Arrow correspond à des compromis différents de ceux à l’origine de la définition de Parquet et ORC. La plupart des outils relatifs à l’un de ces formats incluent des fonctionnalités de conversion de format, pour passer de l’un à l’autre.

La librairie Arrow est de plus en plus utilisée par des projets en vue, notamment des projets open source. La suite de ce document présente quelques-uns de ces projets.

## Utilisation de Apache Arrow par DuckDB 

### DuckDb

[DuckDB](https://duckdb.org) est une base de données relationnelle open source, orientée colonne, originellement développée par Mark Raasveldt et Hannes Mühleisen aux Pays-Bas. Duckdb est présenté dans un billet récent [Quack Up Your Data Projects with DuckDB](/blogs/duckdb).

La toute première release de DuckDB date de 2019. La version 1.0.0 a été produite en juin 2024. DuckDB n’est pas une base transactionnelle (à la Postgresql), mais une base de données analytique.

DuckDB est codée en C++ 11, et ne fait pas appel à des dépendances externes. DuckDB se démarque du modèle client/serveur habituel, car elle tourne au sein du processus hôte ; il est, par exemple, possible d’appeler DuckDB au sein d’un programme Python (via les bindings Python correspondants). DuckDB exploite, donc, la scalabilité verticale, plutôt que la scalabilité horizontale. DuckDB peut tourner sur un PC portable, comme sur un serveur.

DuckDB s’exécute sur une seule machine. Il n’existe pas de version de DuckDB tirant profit de plusieurs machines à la fois. DuckDB est [capable d’exploiter les différents cœurs d’une CPU](https://duckdb.org/docs/guides/performance/how_to_tune_workloads.html), via son exécution multithreadée.

Enfin, DuckDB a une limitation importante à prendre en compte : il n’est pas possible d’exécuter plusieurs requêtes SQL en même temps sur une même instance DuckDB. En termes de comparaison, il est à noter qu’un cluster Spark, par exemple, est instancié pour exécuter un et un seul traitement particulier, composé d’une suite de requêtes SQL si Spark SQL est utilisé. De ce fait, cette limitation de DuckDB n’est pas de nature à

### Relation entre DuckDB et Arrow

Si la relation entre DuckDB et Arrow demande encore quelques éclaircissements, il est clair que, dès 2021, Arrow (en tant que format) est nativement supporté par DuckDB, et que DuckDB minimise le coût de traitement des données Arrow ; ou dit autrement, Arrow est traité comme un « first-class citizen » par DuckDB. Cela est précisé dans l’article suivant :
[DuckDB Quacks Arrow: A Zero-copy Data Integration between Apache Arrow and DuckDB](https://duckdb.org/2021/12/03/duck-arrow.html)

Voici quelques informations sur l’intégration DuckDB / Arrow :

*The zero-copy integration between DuckDB and Apache Arrow allows for rapid analysis of larger than memory datasets in Python and R using either SQL or relational APIs.
This integration allows users to query Arrow data using DuckDB's SQL Interface and API, while taking advantage of DuckDB's parallel vectorized execution engine, without requiring any extra data copying. Additionally, this integration takes full advantage of Arrow's predicate and filter pushdown while scanning datasets.
This integration is unique because it uses zero-copy streaming of data between DuckDB and Arrow and vice versa so that you can compose a query using both together. This results in three main benefits:*

* *Larger Than Memory Analysis: Since both libraries support streaming query results, we are capable of executing on data without fully loading it from disk.*
* *Complex Data Types: DuckDB can efficiently process complex data types that can be stored in Arrow vectors, including arbitrarily nested structs, lists, and maps.*
* *Advanced Optimizer: DuckDB's state-of-the-art optimizer can push down filters and projections directly into Arrow scans. This significantly accelerates query execution.*

S’il reste à préciser si DuckDB a été bâtie autour d’Arrow, ou si, plus simplement, DuckDB a adopté (vraiment) très tôt Arrow, DuckDB a une relation particulière avec Arrow. Et c’est pourquoi cette base de données est inclus au sein de document. Du reste, c’est une base de données en concurrence avec les autres outils de traitement mentionnés dans ce document.

### Positionnement de DuckDB

La raison d’être de DuckDB repose sur le fait qu’il existe moins de traitements, voire beaucoup moins de traitements big data, que certains ne le pensent. Il existe donc une place pour une base de données telle que DuckDB. 
2.3.2 Un remplaçant valide d’outils analytiques big data
L’analyse du panorama du monde big data fait donc apparaitre, cf. plus haut, que même la plupart des traitements big data, n’implique pas des volumes de données big data. De ce fait, certains voient

## Utilisation de Apache Arrow par Pandas 2

La librairie Pandas est une librairie Python open source (licence BSD) créée en 2008, sous licence BSD, permettant la manipulation et l'analyse de données. Elle propose en particulier des structures de données et des opérations de manipulation de tableaux numériques et de séries temporelles.
La librairie Pandas est bâtie autour des structures de données Serie et DataFrame. La première correspond aux tableaux à 1 dimension (vecteurs), tandis que la seconde correspond aux tableaux à 2 dimensions (composés de colonnes et de lignes). Son implémentation utilise aussi, de manière sous- jacente, la librairie NumPy (pour « Numerical Python ») créée en 2006.

![Frise temporelle](arrow-frise.png)

En 2017, Wes McKinney, le créateur de Pandas a écrit un article recensant un certain nombre de
points de friction liés à l’utilisation de la librairie Pandas :
Apache Arrow and the [10 Things I Hate About pandas](https://wesmckinney.com/blog/apache-arrow-pandas-internals/)
Face à ces problèmes, Arrow (auquel Wes McKinney, créateur de Pandas, a contribué) est apparu comme un projet pour apporter un certain nombre de solution au projet Pandas :

*I [Wes McKinney] strongly feel that Arrow is a key technology for the next generation of data science tools. I laid out my vision for this recently in my JupyterCon keynote.*

A date (2017), Arrow n’apporte pas une solution complète aux problèmes rencontrés avec Pandas, mais permet de faire un grand pas dans la direction d’une meilleure librairie Pandas.


### Panda 2.0

Depuis lors, Pandas 2.0 a été livrée en avril 2023. L’apparition de l’API « pyarrow » permet de définir les données manipulées par Pandas 2 à base de structures de données Arrow (via l’utilisation sous- jacente de l’implémentation C++ de Arrow). Cela permet de diminuer l’empreinte-mémoire du stockage des données, et d’effectuer des traitements de manière plus performante.
Par défaut, pour des raisons de rétrocompatibilité, Pandas 2 continue à instancier des structures de données en mémoire via NumPy, comme dans l'exemple ci-dessous:
pandas.Series([1, 2, 3, 4])
L'utilisation de Arrow, via « pyarrow », pour représenter les données au format Arrow, nécessite d’un nouveau paramètre: **pandas.Series([1, 2, 3, 4], dtype='int64[pyarrow]')**

Pandas 2.0 correspond au début de l’intégration d’Arrow. Il apparait qu’avec cette version de Pandas 2, les performances ne sont pas toujours meilleures que Pandas 1.3, cf. [Pandas 2.0 vs Pandas 1.3 — Performance Comparison](https://medium.com/@santiagobasulto/pandas-2-0-performance-comparison-3f56b4719f58) ; les améliorations de performance concernent essentiellement les traitements correspondant au stockage et au traitement des chaines de caractères.

L’utilisation de PyArrow (via l’attribut “dtype”, cf. un exemple plus haut) permet, à Pandas, de définir des DataFrames et des Series selon le format de stockage Arrow.
Ce format de stockage Arrow offre plus de types de données que NumPy, et offre aussi le support des données manquantes (NA) pour tous les types de données.
En outre, les performances s’en trouvent aussi améliorées.*

Pandas 2.0 a introduit aussi le mode d’évaluation « Copy-on-Write » (*CoW*) qui, en simplifiant la sémantique de certaines opérations, permet d’améliorer l’évaluation paresseuse (note : ce mode d’évaluation doit être activé explicitement pour être opérationnel, et deviendra le comportement par défaut pour Pandas 3.0).
Via des opérations impliquant les index, certaines opérations Pandas retournent une vue du DataFrame initial, et d'autres opérations retournent une copie (partielle ou non) du même DataFrame initial. Suivant l'opération utilisée, modifier le DataFrame résultant peut impacter, ou non, le DataFrame initial ou source. Cela rend l'utilisation des opérations impliquant les index difficiles à comprendre.

La mise en œuvre de « Copy-on-Write » (CoW) élimine les effets de bord qu’il n’est pas toujours aisé d’identifier ; en d’autres termes, toute opération de mise à jour ne concernera qu’un seul DataFrame. Par conséquent, le fonctionnement de « copy-on-write » (CoW) garantit que tout DataFrame (ou Series), dérivé d’un autre, a la même sémantique qu’une copie. En programmant avec Pandas, il n’est plus utile de faire des copies de données défensives, pour éviter des effets de bord, car CoW les élimine. Pour cela, CoW utilise un nouveau mécanisme de copie paresseuse qui diffère la copie jusqu'à ce que l'objet en question soit modifié et seulement si cet objet partage des données avec un autre objet.

### Panda 2.1

Pandas 2.1 a été livré en aout 2023, et apporte des améliorations de performance (avec *pyarrow*). Il offre aussi une option « pd.options.future.infer_string », qui, si définie, fait en sorte que, par défaut, toute colonne de type String est représentée via Arrow, avec des améliorations de performance associées.

[D'après la documentation]("https://pandas.pydata.org/pandas-docs/version/2.1/whatsnew/v2.1.0.html");
par défaut, toutes les chaines de caractères sont stockées sous forme d’objets NumPy.
L’objet « pd.options.future.infer_string = True » permet de systématiser l’utilisation du format de stockage Arrow pour les chaines de caractères, sans devoir recourir à l’usage de l’attribut « dtype ».

Pandas 2.1 améliore aussi le mode d’évaluation « copy-on-write » (soit une copie paresseuse), par des corrections de bogues, et un accroissement de la performance associée. A partir de Pandas 2.1, l’équipe Pandas recommande d’utiliser ce mode en production.

### Panda 2.2

Pandas 2.2, livré en janvier 2024, continue sur la voie de l’intégration avec Arrow.

## Utilisation de Apache Arrow par Polars

Alors que Pandas, librairie historique de l’écosystème Python, migre vers Arrow, i.e. s’intègre avec Arrow, de version de version, et améliore les performances associées itérativement, Polars, concurrent de Pandas, Polars est basée (depuis son origine) sur Arrow.
[Polars](https://pola.rs) est une autre librairie Python open source (licence MIT) orientée traitement analytique, créée en 2020, et développé en Rust.

Comme la plupart des autres bibliothèques de traitement de données, la structure de données de base utilisée dans Polars est le DataFrame. Un DataFrame est une structure de données à 2 dimensions, composée de lignes et de colonnes. Les colonnes d'un DataFrame sont constituées de séries, qui sont des tableaux étiquetés unidimensionnels.

[Ritchie Vink](https://www.ritchievink.com/) a démarré le développement de Polars en 2020. [Dans une vidéo](https://www.youtube.com/watch?v=QfLzEp-yt_U) de fin 2023, il explique avoir démarré ce Polars en prenant en l'expérience disponible concernant les bases de données et les moteurs de requêtage. ; expérience qui, selon Ritchie Vink, n’a pas été prise en compte par les précédentes implémentations de traitement des DataFrame (en pointant du doigt, sans le citer, Pandas, très certainement).

Polars, ajoute-t-il, peut être utilisé pour traiter jusqu'à 200 GB sur une seule machine (pour traiter des données plus volumineuses, par exemple, au-delà d'un 1 TB, il recommande d’utiliser PySpark).
Le but est de pouvoir traiter des données qui ne tiennent pas forcément en mémoire, et d'unifier le traitement des données, big data ou non.

Une des caractéristiques de Polars est qu’elle exploite les capacités de Rust pour offrir un moteur d’exécution multi-threadé, ce qui permet d’exploiter tous les cœurs CPU d’une machine. Polars exploite aussi le parallélisme apporté par les instructions SIMD (Single Instruction Multiple Data) des CPU modernes (qui se marient bien avec le format orienté colonne).

Dès son origine, Polars était capable de mieux traiter que Pandas certains types de données, comme les colonnes contenant des chaines de caractères, via Arrow. Cet avantage a diminué avec l’arrivé de Pandas 2.
Un autre avantage initial de Polars réside dans la manière dont elle évalue les traitements à effectuer. Pandas, par défaut, utilise une exécution immédiate (« eager evaluation »), effectuant les opérations dans l'ordre dans lequel elles ont été écrites ; et Pandas n’a introduit un mode d’exécution paresseux qu’à partir de la version 2.0. En revanche, Polars a, depuis sa conception, la capacité d'effectuer une exécution immédiate, ou paresseuse (« lazy evaluation ») pour laquelle un optimiseur de requêtes évaluera toutes les opérations requises et déterminera la manière la plus efficace d'exécuter le code. 

Cela peut inclure, entre autres, la réécriture de l’ordre d’exécution des opérations ou l’abandon des calculs redondants. A titre d’exemple, la méthode « read_csv() » de Polars permet de lire un fichier CSV de manière immédiate, tandis qu’il existe une méthode-sœur « scan_csv() » qui réalise la même opération, mais de manière paresseuse.

Polars dispose d’un écosystème plus limité que Pandas. En particulier, courant août 2023, il était noté que Polars n’était pas encore compatible avec la plupart des librairies de visualisation de données Python ni avec les bibliothèques d'apprentissage automatique (ML/IA) telles que scikit-learn et PyTorch ; la seule exception était Plotly, qui permet de créer des graphiques directement à partir des DataFrames de Polars.

## Comparaison entre les moteurs de traitement de données

### Evolutions comparées de Pandas et de Polars

En 2017, Wes McKinney, le créateur de Pandas, a un état des lieux des limitations de Pandas, et dans le même article, il a pointé vers Arrow comme solution, pour faire évoluer Pandas : [Apache Arrow and the 10 Things I Hate About pandas](https://wesmckinney.com/blog/apache-arrow-pandas-internals/). Le même Wes McKinney a contribué au projet Arrow.
Comme il est plus difficile de faire évoluer un logiciel (ici, Pandas) de manière rétro-compatible, sans heurter la communauté de ses utilisateurs, que de repartir d’une feuille blanche, Pandas s’est (d’une certaine manière) fait doubler par Polars, dont la communauté a été plus rapide à tirer profit d’Arrow.

La multiplicité des configurations Pandas (avec ou sans utilisation d’Arrow, et en utilisant ou non le mode « Copy-on-Write ») ne rend pas service aux tests de performance envers Polars dont les résultats sont disponibles sur le Web : il n’est pas aisé de trouver des tests complets, ou honnêtes, mettant en œuvre toutes les possibilités de paramétrage de Pandas. Quoiqu’il en soit, il est fréquent, pour ces tests, que Polars, en avance sur Pandas dans l’utilisation de Arrow, soit meilleur en termes de performance que Pandas.
Il est probable que l’on y verra plus clair avec la sortie de Pandas 3 (en chantier, à date du 1er juillet 2024), car certains options (impactant sur la performance), introduites dans Pandas 2, deviendront des défauts, i.e. seront activées par défaut, pour Pandas 3.

### Autres moteurs de traitement basés sur Arrow

#### Vaex

Pandas 2 (et bientôt, Pandas 3) et Polars ne sont pas les seules librairies open source de traitement à utiliser Arrow. C’est le cas aussi pour [Vaex](https://github.com/vaexio/vaex) (licence MIT) qui se veut être une alternative plus performante à Pandas. [D'après un article de 2019](https://towardsdatascience.com/vaex-a-dataframe-with-super-strings-789b92e8d861):

*Vaex uses Apache Arrow data structures and C++ to speed up string operations by a factor of about ~30–100x on a quad core laptop, and up to 1000x on a 32 core machine. Nearly all of Pandas’ string operations are supported, and memory usage is practically zero because the lazy computations are done in chunks.*

#### DataFusion

Un autre projet, de la fondation Apache, utilise Arrow : il s’agit du projet [DataFusion](https://datafusion.apache.org). La description de ce projet, qu’en donne sa propre communauté, n’est pas sans rappeler celle du projet Polars même :

*Apache Arrow is a library which provides a standardized memory representation for columnar data. It also provides “kernels” for performing common operations on this data.*

*DataFusion is a library for executing queries in-process using the Apache Arrow memory model and computational kernels. It is designed to run within a single process, using threads for parallel query execution.*

*DataFusion is a very fast, extensible query engine for building high-quality data-centric systems in Rust, using the Apache Arrow in-memory format.*

*DataFusion offers SQL and Dataframe APIs, excellent performance, built-in support for CSV, Parquet, JSON, and Avro, extensive customization, and a great community.*


#### Databend

Un projet analogue à DataFusion est [Databend](https://github.com/datafuselabs/databend). DataBend est une base de données complète. Comme DataFusion, il est aussi écrit en Rust, et utilise Apache Arrow comme base de son stockage mémoire, mais contrairement à DataFusion, DataBend cible les utilisateurs finaux, plutôt que les développeurs de base de données.

#### cuDF Pandas

Le souci avec les librairies comme Polars, Vaex... est que leur utilisation nécessite de réécrire le code tirant partie de Pandas, si l’on souhaite avoir de meilleures performances. Mais il existe une autre alternative : [cuDF Pandas](https://rapids.ai/cudf-pandas/).

cuDF.pandas est construit sur cuDF, une bibliothèque Python de traitement de DataFrame à base GPU (basée sur le format de mémoire en colonnes Apache Arrow) pour charger, joindre, agréger, filtrer et manipuler des données.
L’utilisation de cuDF Pandas se fait soit via un flag, soit via une extension (cela dépend du contexte). Dès lors, s’il est possible d’exécuter les traitements par une GPU, le code Pandas s'exécutera sur le GPU. Dans les cas où cela n'est pas possible, cuDF bascule automatiquement vers l'exécution sur la CPU. Il n’est pas besoin d’écrire 2 versions du code, ni de gérer manuellement la bascule entre le GPU et le CPU.

Toutes les GPU ne sont pas forcément supportées. A minima, il semble que cuDF Pandas supporte à minima les GPU NVIDIA.
De fait, cuDF fait partie de RAPIDS, une suite open source de bibliothèques logicielles et d'API créées et maintenues par NVIDIA. RAPIDS est conçu pour permettre aux experts en données (« data scientists ») et aux ingénieurs d'exploiter la capacité de traitement parallèle des GPU pour les pipelines d'exploration et d'analyse de données.

L’usage d’une GPU, plutôt que d’un CPU, peut permettre des améliorations significatives des performances par rapport à un traitement sur CPU. Usuellement, ces améliorations se matérialisent quand le coût de transfert des données à la GPU est largement contrebalancé par l’accélération fournie par la GPU ; plus concrètement, cela est vrai à partir d’une certaine taille du jeu de données, et pour une certaine complexité du traitement effectué.

A titre d’exemple, un test réalisé en avril 2024, pour un jeu de données d’environ 9 GB, est présenté dans l’article [Need for Speed: cuDF Pandas vs. Pandas](https://towardsdatascience.com/need-for-speed-cudf-pandas-vs-pandas-16b87009aefa).
En résumé, le temps total nécessaire pour tous les tests pour Pandas était de 82,3 secondes et le temps total d'utilisation de cuDF Pandas était de 30,36 secondes, ce qui représente une amélioration de 60 %. Ce n’est pas trop mal, même si la majorité du temps gagné a été consacré au chargement des données d’entrée.

L'un des points les plus importants concernant l'utilisation de cuDF Pandas est que vous n'avez pas du tout besoin de modifier votre code Pandas. Un simple chargement d'extension Notebook ou un indicateur supplémentaire dans un appel Python avant d'exécuter votre programme est tout ce dont vous avez besoin. La configuration initiale de votre système peut être un peu compliquée, mais il s’agit d’une opération ponctuelle et je pense que les avantages potentiels en termes de temps d’exécution compenseront cela.

D’autres tests existent sans doute, mais ils n’ont pas fait l’objet d’une recherche approfondie pour l’écriture de ce document.

#### FireDucks

La librairie de traitement [FireDucks](https://fireducks-dev.github.io) (licence 3-Clause BSD, soit une licence BSD modifiée) a été développé par une équipe R&D de NEC qui semble un peu obsédée par l'accélération du code Pandas.

* La librairie FireDucks est multithreadée, et peut donc fonctionner sur plusieurs cœurs CPU
* Elle comporte et utilise un compilateur JIT (« just in time »), pour produire du code natif à l’exécution.
* Elle est entièrement compatible avec l'API Pandas. La seule différence réside dans
l'instruction d'importation. Aucun apprentissage supplémentaire ni modification de code
n'est requis pour démarrer avec FireDucks.
* Elle dispose d'un mode d'exécution paresseux (comme Polars par exemple)

Au moment de la rédaction [2 juin 2024], FireDucks est toujours en version bêta (FireDucks est en version 0.12.4 au 9 juillet 2024).

Pour FireDucks, l'API utilisateur et son exécution sont totalement indépendantes l'une de l'autre via un langage intermédiaire. FireDucks permet de modifier le backend relatif au moteur d’exécution, par exemple, un backend optimisé pour une exécution multicœur, ou un backend utilisant des accélérateurs tels que des GPU... le backend peut être modifié par des variables d'environnement, permettant à l'utilisateur de changer de backend sans changer du tout le programme utilisateur.

FireDucks en version bêta comprend un backend multithreadé pour les CPU. Ce backend utilise Apache Arrow comme structure de données et ajoute sa propre parallélisation en plus des opérations de trame de données fournies par Apache Arrow.
En d’autres termes, FireDucks, plus jeune que Polars, en est très proche, de par, en premier lieu, son utilisation de la librairie Arrow, et le fait de fournir un backend multithreadé, et une évaluation paresseuse.
La différence notable entre FireDucks et Polars est que l’API de FireDucks est identique à celle de Pandas, de sorte que, modulo le changement des instructions d’importation, le code reste identique en passant de Pandas à FireDucks, ce qui n’est pas le cas si l’on passe de Pandas à Polars.

## Comparaison de performance entre plusieurs de ces différentes librairies

Un article de février 2024, [Benchmarking High-Performance pandas Alternatives](https://www.datacamp.com/tutorial/benchmarking-high-performance-pandas-alternatives) compare les performances de ces différentes librairies.

In fine, les implémentations de ces différentes librairies tendent à se rapprocher... car elles partagent un socle commun, soit des patterns d’implémentation similaires, soit une librairie commune (Arrow) qui implémente un tel socle commun. Au fil des versions, on devrait voir les performances convergées, s’il est avéré (!) que les communautés de ces différents projets aient le désir de supporter les mêmes cas d’usage.


## Utilisation de Apache Arrow pour Spark

### Comet, plugin Apache, accélérateur basé sur Arrow

Le projet Spark est écrit en Java. Mais il existe d’autres implémentations, utilisant les mêmes API, développées dans le but d’être plus rapide – c’est le cas, par exemple, du projet Photon (de Databricks) qui est codé en C++ https://www.databricks.com/product/photon.

Le projet Comet (qui fait partie du projet DataFusion) vise à remplacer une partie de l’implémentation actuelle de Spark pour utiliser la librairie Arrow. Le 6 mars 2024, le projet Arrow a annoncé la donation du projet Comet au projet DataFusion. Le code initial du projet Comet [provient de la société Apple](https://thenewstack.io/apple-comet-brings-fast-vector-processing-to-apache-spark/) ; lors de la donation, Apple précisait que « the project is not yet feature-complete, but parts of it are already used in production [chez Apple, donc] »

Comet est un plugin Apache qui est un accélérateur natif, basé sur Arrow, de Spark SQL ; en d'autres termes, Comet utilise Arrow pour accélérer les traitements Spark. Comet a pour but d'être utilisé comme remplaçant du moteur d'exécution SQL de Spark basé sur la JVM, et d'apporter, potentiellement, de meilleures performances. Utiliser Comet ne va pas impacter les utilisateurs de Spark : seule l’implémentation, sous le capot, sera changée.

La 1ère release du projet Comet a eu lieu le 20 juillet

### Ballista, une alternative à Spark basée sur Arrow

Le sous-projet Ballista du projet DataFusion a pour but de proposer un moteur d’exécution distribué, bâti sur DataFusion, et donc, sur Arrow. A ce titre, Ballista peut être vu comme un remplacement complet de Spark SQL, mais pas forcément avec les mêmes API (« The [Ballista] DataFrame API is inspired by Apache Spark and is currently better suited for ETL/SQL work than for data science » https://datafusion.apache.org/ballista/contributors-guide/architecture.html). Ballista s’inspire de Spark, avec un certain nombre de différences :
The choice of Rust as the main execution language means that memory usage is deterministic and avoids the overhead of GC pauses.

* *Ballista is designed from the ground up to use columnar data, enabling a number of efficiencies such as vectorized processing (SIMD and GPU) and efficient compression. Although Spark does have some columnar support, it is still largely row-based today.*
* *The combination of Rust and Arrow provides excellent memory efficiency and memory usage can be 5x - 10x lower than Apache Spark in some cases, which means that more processing can fit on a single node, reducing the overhead of distributed compute.*
* *The use of Apache Arrow as the memory model and network protocol means that data can be exchanged between executors in any programming language with minimal serialization overhead.*

Un environnement d’exécution de Ballista inclut, comme pour Spark, des nœuds ordonnanceurs (« scheduler ») et des nœuds d’exécution, cf. plus bas.

Selon la [documentation de 2024](https://datafusion.apache.org/blog/2024/07/20/datafusion-comet-0.1.0/), 

* *Comet is an accelerator for Apache Spark that translates Spark physical plans to DataFusion physical plans for improved performance and efficiency without requiring any code changes.*
* *Comet [...] aims to provide 100% compatibility with Apache Spark. Any operators or expressions that are not fully compatible will fall back to Spark unless explicitly enabled by the user.*
* *This first release supports 15 data types, 13 operators, and 106 expressions. Comet is compatible with Apache Spark versions 3.3, 3.4, and 3.5. There is also experimental support for preview versions of Spark 4.0.*

A ce jour, il existe donc au moins 5 implémentations différentes de Spark, respectant les mêmes interfaces – ou, tout du moins, à minima, la partie correspondant à Spark SQL :

* [Le projet Spark open source de la fondation Apache](https://spark.apache.org)
* La version de Spark optimisée par AWS (AWS ayant inclut, par exemple, au sein de sa version
de Spark, des optimisations de requête, et une interaction optimisée avec AWS S3)
    * *Amazon EMR provides multiple performance optimization features for Spark. [This
topic explains each optimization feature in detail](https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-spark- performance.html).
    * [Amazon EMR offers features to help optimize performance when using Spark to query, read and write data saved in Amazon S3](https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-spark-s3-performance.html)
* La ré-implémentation de Spark par Databricks (société qui regroupe les créateurs de Spark open source, et les principaux contributeurs à ce projet) appelée [Photon](https://www.databricks.com/product/photon)
* Le projet Spark open source, utilisé avec Comet, plugin Apache, accélérateur basé sur Arrow.
* Et aussi le projet Spark open source, utilisé conjointement avec le plugin RAPIDS qui permet
[d’exécuter le code Spark sur une GPU NVIDIA, sans changement de code](https://github.com/NVIDIA/spark-rapids)

## Conclusions

Comme l'a indiqué West McKinney (créateur de Pandas, et co-créateur de Arrow), on assiste à une défragmentation de l'écosystème big data. Et le projet Arrow n'est pas pour peu dans cette évolution, et dans les collaborations entre projets open source.

Du reste, le présent document ne prétend pas avoir fait une liste exhaustive de tous les projets utilisant, directement ou indirectement, Arrow. Au côté des outils du monde pré-big date, et ceux du monde big data, apparaissent de nouveaux outils, comme DuckDB, Pandas 2, Polars, DataFusion... qui peuvent être utilisés pour traiter des volumes de données du monde pré-big data et aussi, de l’entre-deux, du monde « presque big
data ». Ces outils ont notamment pour atout leur meilleure utilisation des ressources matérielles, via Arrow ; de ce fait, ils ont la capacité de tirer profit de la scalabilité verticale, qui est d’autant plus disponible au sein d’un environnement cloud.

Pour ceux utilisant Pandas v1, il est temps de passer à Pandas v2, voire d’utiliser un outil concurrent, basé sur Arrow aussi, et plus performant, dans certains cas.

Les utilisateurs de Spark sont dans un cas favorable, en ce sens que, si des améliorations, via des nouvelles implémentations arrivent, elles respecteront les API Spark, et de ce fait, les programmes Spark existants seront peu impactés. Néanmoins, l’accélérateur Comet n’a pas encore prêt pour la production, pour la plupart du monde.
Quant à DuckDB, elle est déjà utilisée en production chez nombre d’entreprises. C’est un « couteau suisse » (via ses extensions), performant, dont les cas d’usage surfent sur la vague d’une forme de reflux du big data, et du retour du SQL (face au NoSQL) qui n’est jamais vraiment parti. Son utilisation est appelée à croitre.

Dans un [blog séparé](/blogs/arrow-use-cases), nous explorons quelques cas d'usage intéressant d'arrow et des technologies associées.

## Contact

- dominique.devito@thalesgroup.com
