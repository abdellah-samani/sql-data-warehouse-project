/*
=============================================================
Création de la base de données et des schémas
=============================================================
Objectif du script :

Ce script crée une nouvelle base de données nommée « DataWarehouse » après avoir vérifié si elle existe déjà.

Si la base de données existe déjà, elle est supprimée puis recréée. De plus, le script configure trois schémas :

« bronze », « silver » et « gold ».
*/

USE master;
GO

-- Supprimez et recréez la base de données « DataWarehouse ».
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Créer la base de données « DataWarehouse »
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Créer les schémas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
