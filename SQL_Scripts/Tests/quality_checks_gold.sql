/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs quality checks to validate the integrity, consistency, 
    and accuracy of the Gold Layer. These checks ensure:
    - Uniqueness of surrogate keys in dimension tables.
    - Referential integrity between fact and dimension tables.
    - Validation of relationships in the data model for analytical purposes.

Usage Notes:
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- =============================================================================
-- Check 1: Uniqueness of Customer Key in 'gold.dim_customers'
-- Expectation: No duplicate customer_key values
-- =============================================================================
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- =============================================================================
-- Check 2: Uniqueness of Product Key in 'gold.dim_products'
-- Expectation: No duplicate product_key values
-- =============================================================================
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- =============================================================================
-- Check 3: Referential Integrity in 'gold.fact_sales'
-- Expectation: All customer_key and product_key values in fact table 
--              must exist in respective dimension tables.
-- =============================================================================
SELECT 
    f.order_number,
    f.customer_key,
    f.product_key,
    CASE WHEN c.customer_key IS NULL THEN 'Missing Customer' ELSE NULL END AS customer_issue,
    CASE WHEN p.product_key IS NULL THEN 'Missing Product' ELSE NULL END AS product_issue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c ON f.customer_key = c.customer_key
LEFT JOIN gold.dim_products p  ON f.product_key  = p.product_key
WHERE c.customer_key IS NULL OR p.product_key IS NULL;
