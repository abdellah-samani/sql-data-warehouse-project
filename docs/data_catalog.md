# Catalogue de données pour la couche Gold

## Aperçu
La couche Gold représente les données au niveau métier, structurée pour faciliter l'analyse et le reporting. Elle se compose de tables de dimensions et de tables de faits pour des indicateurs métier spécifiques.
---

### 1. **gold.dim_customers**
- **But:** Stocke les informations client enrichies de données démographiques et géographiques.
- **Colonnes:**

|Nom de la colonne |Type de données| Description                                                                                                |
|------------------|---------------|------------------------------------------------------------------------------------------------------------|
| customer_key     | INT           | Clé de substitution identifiant de manière unique chaque enregistrement client dans la table de dimension. |
| customer_id      | INT           | Un identifiant numérique unique est attribué à chaque client.                                              |
| customer_number  | NVARCHAR(50)  | Identifiant alphanumérique représentant le client, utilisé pour le suivi et le référencement.              |
| first_name       | NVARCHAR(50)  | Le prénom du client, tel qu'il est enregistré dans le système.                                             |
| last_name        | NVARCHAR(50)  | Le nom de famille du client.                                                                               |
| country          | NVARCHAR(50)  | Le pays de résidence du client (par exemple, « Australia »).                                               |
| marital_status   | NVARCHAR(50)  | L'état civil du client (par exemple, 'Married', 'Single').                                                 |
| gender           | NVARCHAR(50)  | Le sexe du client (par exemple, 'Male', 'Female', 'n/a').                                                  |
| birthdate        | DATE          | Date de naissance du client, au format YYYY-MM-DD (par exemple, 1971-10-06).                               |
| create_date      | DATE          | La date et l'heure de création de la fiche client dans le système                                          |

---

### 2. **gold.dim_products**
- **But:** Fournit des informations sur les produits et leurs attributs.
- **Colonnes:**

| Nom de la colonne   |Type de données| Description                                                                                   |
|---------------------|---------------|-----------------------------------------------------------------------------------------------|
| product_key         | INT           | Clé de substitution identifiant de manière unique chaque enregistrement de produit dans la table de dimension produit.        |
| product_id          | INT           | Un identifiant unique attribué au produit à des fins de suivi et de référencement internes.          |
| product_number      | NVARCHAR(50)  | Un code alphanumérique structuré représentant le produit, souvent utilisé pour la catégorisation ou l'inventaire. |
| product_name        | NVARCHAR(50)  | Nom descriptif du produit, incluant les détails clés tels que le type, la couleur et la taille.       |
| category_id         | NVARCHAR(50)  | Un identifiant unique pour la catégorie du produit, renvoyant à sa classification de haut niveau.     |
| category            | NVARCHAR(50)  | La classification plus large du produit (par exemple, Bikes, Components) pour regrouper les éléments associés. |
| subcategory         | NVARCHAR(50)  | Une classification plus détaillée du produit au sein de la catégorie, telle que le type de produit.    |
| maintenance_required| NVARCHAR(50)  | Indique si le produit nécessite un entretien (par exemple, 'Yes', 'No').                       |
| cost                | INT           | Le coût ou le prix de base du produit, exprimé en unités monétaires.                           |
| product_line        | NVARCHAR(50)  | La gamme ou série de produits spécifique à laquelle appartient le produit (par exemple, Road, Mountain).      |
| start_date          | DATE          | La date à laquelle le produit a été mis en vente ou en utilisation|

---

### 3. **gold.fact_sales**
- **But:** Stores transactional sales data for analytical purposes.
- **Colonnes:**

|Nom de la colonne|Type de données| Description                                                                                   |
|-----------------|---------------|-----------------------------------------------------------------------------------------------|
| order_number    | NVARCHAR(50)  | Un identifiant alphanumérique unique pour chaque commande client(par exemple, 'SO54496').                      |
| product_key     | INT           | Clé de substitution reliant la commande au tableau des dimensions du produit.                               |
| customer_key    | INT           | Clé de substitution reliant la commande à la table de dimensions client.                             |
| order_date      | DATE          | La date à laquelle la commande a été passée.                                                          |
| shipping_date   | DATE          | La date à laquelle la commande a été expédiée au client.                                         |
| due_date        | DATE          | La date à laquelle le paiement de la commande était dû.                                                    |
| sales_amount    | INT           | La valeur monétaire totale de la vente pour le poste, en unités monétaires entières (par exemple, 25).   |
| quantity        | INT           | Le nombre d'unités du produit commandées pour la ligne de commande (par exemple, 1).                       |
| price           | INT           | Le prix unitaire du produit pour le poste concerné, en unités monétaires entières (par exemple, 25).      |
