/*
===============================================================================
Contrôles de qualité
===============================================================================
Objectif du script :

Ce script effectue divers contrôles de qualité pour garantir la cohérence, l’exactitude et la standardisation des données dans la couche « Silver ». Il vérifie notamment :

- Les clés primaires nulles ou dupliquées.

- Les espaces indésirables dans les champs de type chaîne de caractères.

- La standardisation et la cohérence des données.

- Les plages de dates et les ordres invalides.

- La cohérence des données entre les champs liés.

Remarques d’utilisation :

- Exécutez ces contrôles après le chargement des données dans la couche « Silver ».

- Analysez et corrigez toute anomalie détectée lors des contrôles.
===============================================================================
*/

-- ====================================================================
-- Vérification 'silver.crm_cust_info'
-- ====================================================================
-- Vérifiez la présence de valeurs NULL ou de doublons dans la clé primaire.
-- Attentes : Aucun résultat
SELECT 
    cst_id,
    COUNT(*) 
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Vérifier les espaces indésirables
-- Attentes : Aucun résultat
SELECT 
    cst_key 
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);

-- Normalisation et cohérence des données
SELECT DISTINCT 
    cst_marital_status 
FROM silver.crm_cust_info;

-- ====================================================================
-- Vérification 'silver.crm_prd_info'
-- ====================================================================
-- Vérifiez la présence de valeurs NULL ou de doublons dans la clé primaire.
-- Attentes : Aucun résultat
SELECT 
    prd_id,
    COUNT(*) 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Vérifier les espaces indésirables
-- Attentes : Aucun résultat
SELECT 
    prd_nm 
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Vérifiez la présence de valeurs nulles ou négatives dans le coût
-- Attentes : Aucun résultat
SELECT 
    prd_cost 
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Normalisation et cohérence des données
SELECT DISTINCT 
    prd_line 
FROM silver.crm_prd_info;

-- Vérifier les commandes dont la date est invalide (Start Date > End Date)
-- Attentes : Aucun résultat
SELECT 
    * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- ====================================================================
-- Vérification 'silver.crm_sales_details'
-- ====================================================================
-- Vérifier les dates invalides
-- Attente : Aucune date invalide
SELECT 
    NULLIF(sls_due_dt, 0) AS sls_due_dt 
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0 
    OR LEN(sls_due_dt) != 8 
    OR sls_due_dt > 20500101 
    OR sls_due_dt < 19000101;

-- Vérifier les commandes dont la date est invalide (Date de la commande > Dates d'expédition/de livraison)
-- Attentes : Aucun résultat
SELECT 
    * 
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;

-- Vérification de la cohérence des données : Ventes = Quantité * Prix
-- Attentes : Aucun résultat
SELECT DISTINCT 
    sls_sales,
    sls_quantity,
    sls_price 
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL 
   OR sls_quantity IS NULL 
   OR sls_price IS NULL
   OR sls_sales <= 0 
   OR sls_quantity <= 0 
   OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;

-- ====================================================================
-- Vérification 'silver.erp_cust_az12'
-- ====================================================================
-- Identifier les dates hors plage
-- Attentes : Dates de naissance comprises entre 1924-01-01 et aujourd’hui
SELECT DISTINCT 
    bdate 
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' 
   OR bdate > GETDATE();

-- Normalisation et cohérence des données
SELECT DISTINCT 
    gen 
FROM silver.erp_cust_az12;

-- ====================================================================
-- Vérification 'silver.erp_loc_a101'
-- ====================================================================
-- Normalisation et cohérence des données
SELECT DISTINCT 
    cntry 
FROM silver.erp_loc_a101
ORDER BY cntry;

-- ====================================================================
-- Vérification 'silver.erp_px_cat_g1v2'
-- ====================================================================
-- Vérifier les espaces indésirables
-- Attentes : Aucun résultat
SELECT 
    * 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);

-- Normalisation et cohérence des données
SELECT DISTINCT 
    maintenance 
FROM silver.erp_px_cat_g1v2;
