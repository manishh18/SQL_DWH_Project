# Gold Layer Data Warehouse Views & Quality Checks

---

## Overview

This project contains SQL scripts to build and maintain the **Gold layer** in a data warehouse, representing the final star-schema views for analytics and reporting.

The scripts include:

- Creation of **Dimension** and **Fact** views in the Gold layer.
- **Quality checks** to validate data integrity, uniqueness, and consistency.
- Additional quality checks on the **Silver layer** for data standardization and correctness.

---

## Contents

### 1. Gold Layer Views

- `gold.dim_customers`: Customer dimension view combining CRM and ERP data with a surrogate key.
- `gold.dim_products`: Product dimension view enriched with category details.
- `gold.fact_sales`: Sales fact view linking customers and products with sales transactions.

These views provide business-ready datasets by transforming and joining Silver layer tables.

---

### 2. Gold Layer Quality Checks

This script performs critical validations:

- Uniqueness of surrogate keys in dimension tables (`customer_key`, `product_key`).
- Referential integrity between the fact and dimension views.
- Ensures no orphaned records exist in sales facts.

---

### 3. Silver Layer Quality Checks

Scripts to validate source Silver layer data quality, including:

- Null or duplicate primary keys.
- Unwanted spaces in string fields.
- Standardization of categorical values.
- Validation of date ranges and date logic.
- Data consistency checks such as sales amount calculation validation.

---

## Additional Files

### `.gitignore`

- Excludes files like temporary logs, caches, environment files, IDE settings, and OS-generated files.
- Helps keep the Git repository clean and secure by avoiding unnecessary or sensitive files.

### `LICENSE` (MIT License)

- Open source license allowing free use, modification, and distribution with attribution.
- Provides liability and warranty disclaimers for contributors.

---

## Usage

1. **Create Views:**

   Run the Gold layer DDL script to create/update the dimension and fact views.

2. **Perform Quality Checks:**

   Execute the quality check scripts after loading data into the Silver and Gold layers to ensure data consistency and integrity.

3. **Investigate Issues:**

   Review any errors or anomalies reported by quality checks and resolve them in source data or transformation logic.

---

## Notes

- The scripts assume existence of source Silver layer tables with the specified schemas.
- Adjust table names and schemas as per your environment if necessary.
- Maintain the `.gitignore` file to prevent sensitive or irrelevant files from being committed.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contact

For questions or support, please reach out to the project maintainer.

---

