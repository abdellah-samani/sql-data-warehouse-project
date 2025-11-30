/*
===============================================================================
Procédure stockée : Chargement de la couche Bronze (Source -> Bronze)
===============================================================================
Objectif du script :
Cette procédure stockée charge les données dans le schéma bronze à partir de fichiers CSV externes.
Elle effectue les actions suivantes :

Tronque les tables bronze avant de charger les données.

Utilise la commande BULK INSERT pour charger les données des fichiers CSV vers les tables bronze.

Paramètres :
Aucun.
Cette procédure stockée n’accepte aucun paramètre et ne retourne aucune valeur.
===============================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '================================================';
		PRINT 'Chargement Couche Bronze';
		PRINT '================================================';

		PRINT '------------------------------------------------';
		PRINT 'Chargement Tables CRM';
		PRINT '------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Troncature de la table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '>> Insertion de données dans: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\RPC\Desktop\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Durée de charge: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' secondes';
		PRINT '>> -------------';

        SET @start_time = GETDATE();
		PRINT '>> Troncature de la table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Insertion de données dans: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\RPC\Desktop\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Durée de charge: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' secondes';
		PRINT '>> -------------';

        SET @start_time = GETDATE();
		PRINT '>> Troncature de la table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '>> Insertion de données dans: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\RPC\Desktop\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Durée de charge: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' secondes';
		PRINT '>> -------------';

		PRINT '------------------------------------------------';
		PRINT 'Chargement Tables ERP';
		PRINT '------------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>> Troncature de la table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT '>> Insertion de données dans: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\RPC\Desktop\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Durée de charge: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' secondes';
		PRINT '>> -------------';

		SET @start_time = GETDATE();
		PRINT '>> Troncature de la table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT '>> Insertion de données dans: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\RPC\Desktop\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Durée de charge: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' secondes';
		PRINT '>> -------------';

		SET @start_time = GETDATE();
		PRINT '>> Troncature de la table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT '>> Insertion de données dans: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\RPC\Desktop\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Durée de charge: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' secondes';
		PRINT '>> -------------';

		SET @batch_end_time = GETDATE();
		PRINT '=========================================='
		PRINT 'Le chargement de la couche de bronze est terminé.';
        PRINT '   - Durée totale de la charge: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' secondes';
		PRINT '=========================================='
	END TRY
	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'UNE ERREUR EST PRODUITE LORS DU CHARGEMENT DE LA COUCHE DE BRONZE'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END
