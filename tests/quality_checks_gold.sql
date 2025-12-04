/*
===============================================================================
Contrôles de qualité
===============================================================================
Objectif du script :

Ce script effectue des contrôles qualité afin de valider l’intégrité, la cohérence

et l’exactitude de la couche de référence. Ces contrôles garantissent :

- L’unicité des clés de substitution dans les tables de dimensions.

- L’intégrité référentielle entre les tables de faits et de dimensions.

- La validation des relations dans le modèle de données à des fins d’analyse.

Remarques d’utilisation :

- Examiner et résoudre toute anomalie détectée lors des contrôles.
===============================================================================
*/

-- ====================================================================
-- Vérification 'gold.dim_customers'
-- ====================================================================
-- Vérifier l'unicité de la clé client dans gold.dim_customers
-- Attentes : Aucun résultat
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Vérification 'gold.product_key'
-- ====================================================================
-- Vérifiez l'unicité de la clé de produit in gold.dim_products
-- Attentes : Aucun résultat
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Vérification 'gold.fact_sales'
-- ====================================================================
-- Vérifier la connectivité du modèle de données entre les faits et les dimensions
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL  
