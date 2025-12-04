# SQL Data Warehouse Project 📈

Ce projet présente une solution complète d'entreposage et d'analyse de données, de la création d'un entrepôt de données à la génération d'informations exploitables. Conçu comme un projet de portfolio, il met en lumière les meilleures pratiques du secteur en matière d'ingénierie et d'analyse des données.

## 🏗️ Data Architecture

L'architecture de données de ce projet suit le modèle Medallion Architecture, articulé autour des couches **Bronze**, **Silver** et **Gold** :


1. **Couche Bronze** : Stocke les données brutes issues des systèmes sources. Les données sont importées depuis des fichiers CSV dans une base de données SQL Server.

2. **Couche Silver** : Cette couche inclut les processus de nettoyage, de standardisation et de normalisation des données afin de les préparer à l'analyse.

3. **Couche Gold** : Contient les données exploitables par l'entreprise, modélisées selon un schéma en étoile, nécessaires à la création de rapports et à l'analyse.


## 📖 Aperçu du projet

1. **Architecture des données** : Conception d'un entrepôt de données moderne à l'aide de l'architecture Medallion (couches Bronze, Silver et Gold).

2. **Pipelines ETL** : Extraction, transformation et chargement des données des systèmes sources vers l'entrepôt.

3. **Modélisation des données** : Développement de tables de faits et de dimensions optimisées pour les requêtes analytiques.

4. **Analyse et reporting** : Création de rapports et de tableaux de bord SQL pour des informations exploitables.

