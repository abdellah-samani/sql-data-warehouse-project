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

## 📂 Structure du dépôt
```
data-warehouse-project/
│
├── datasets/                           # Données brutes utilisées pour le projet (données ERP et CRM)
│
├── docs/                               # Documentation du projet et détails d'architecture
│   ├── data_catalog.md                 # Catalogue des jeux de données, comprenant les descriptions des champs et les métadonnées
│   ├── data_flow.jpg                   # fichier pour le diagramme de flux de données
│   ├── data_models.jpg                 # fichier pour les modèles de données (schéma en étoile)
│   ├── data_integration                # fichier pour l'intégration des données
│
├── scripts/                            # Scripts SQL pour l'ETL et les transformations
│   ├── bronze/                         # Scripts d'extraction et de chargement de données brutes
│   ├── silver/                         # Scripts pour le nettoyage et la transformation des données
│   ├── gold/                           # Scripts pour la création de modèles analytiques
│
├── tests/                              # Scripts de test et fichiers de qualité
│
├── README.md                           # Présentation et instructions du projet
└── LICENSE                             # Informations de licence pour le dépôt

## 🌟 À propos de moi

Étudiant en master Big Data & Data Science, je me forme activement au data engineering (Azure, Databricks, Spark, pipelines).
Ancien entrepreneur, je combine rigueur technique et mentalité orientée résultat.
Je suis à la recherche d’opportunités pour appliquer mes compétences et continuer à progresser.
