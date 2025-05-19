/*
===============================================================================
Quality Checks: Silver Layer
===============================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy, 
    and standardization across the 'silver' layer. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading into the Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- =============================================================================
-- Checking 'silver.crm_cust_info'
-- =============================================================================

-- Check for NULLs or Duplicates in Primary Key (cst_id)
SELECT 
    cst_id,
    COUNT(*) AS duplicate_count
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Check for Unwanted Spaces in cst_key
SELECT 
    cst_key 
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);

-- Review Distinct Marital Status Values
SELECT DISTINCT 
    cst_marital_status 
FROM silver.crm_cust_info;

-- =============================================================================
-- Checking 'silver.crm_prd_info'
-- =============================================================================

-- Check for NULLs or Duplicates in Primary Key (prd_id)
SELECT 
    prd_id,
    COUNT(*) AS duplicate_count
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for Unwanted Spaces in prd_nm
SELECT 
    prd_nm 
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Check for NULL or Negative Product Costs
SELECT 
    prd_cost 
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Review Distinct Product Line Values
SELECT DISTINCT 
    prd_line 
FROM silver.crm_prd_info;

-- Check for Invalid Date Orders (prd_end_dt < prd_start_dt)
SELECT 
    * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- =============================================================================
-- Checking 'silver.crm_sales_details'
-- =============================================================================

-- Check for Invalid Date Format/Values in Bronze Layer
SELECT 
    NULLIF(sls_due_dt, 0) AS sls_due_dt 
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0 
    OR LEN(sls_due_dt) != 8 
    OR sls_due_dt > 20500101 
    OR sls_due_dt < 19000101;

-- Check for Order Dates after Ship or Due Dates
SELECT 
    * 
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;

-- Check Sales Amount Consistency: sales = quantity × price
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

-- =============================================================================
-- Checking 'silver.erp_cust_az12'
-- =============================================================================

-- Check for Out-of-Range Birthdates
SELECT DISTINCT 
    bdate 
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' 
   OR bdate > GETDATE();

-- Review Distinct Gender Values
SELECT DISTINCT 
    gen 
FROM silver.erp_cust_az12;

-- =============================================================================
-- Checking 'silver.erp_loc_a101'
-- =============================================================================

-- Review Distinct Country Values
SELECT DISTINCT 
    cntry 
FROM silver.erp_loc_a101
ORDER BY cntry;

-- =============================================================================
-- Checking 'silver.erp_px_cat_g1v2'
-- =============================================================================

-- Check for Unwanted Spaces in Category Fields
SELECT 
    * 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);

-- Review Distinct Maintenance Values
SELECT DISTINCT 
    maintenance 
FROM silver.erp_px_cat_g1v2;
