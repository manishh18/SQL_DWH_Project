# Retail Sales Data Warehouse and Analytics Project

This project demonstrates the process of building a basic retail sales data warehouse and conducting insightful analytics using structured SQL and visualization tools.

---

## Part 1: Data Warehouse

### Objective
To create a structured, multi-layered data architecture that organizes and processes raw retail data for easy access and reporting.

### Structure

The data warehouse is organized into the following layers:

- **Bronze Layer**: Contains raw imported datasets with minimal transformation.
- **Silver Layer**: Applies cleaning, standardization, and filtering on Bronze data. This is the refined intermediate data layer.
- **Gold Layer**: The final reporting layer containing aggregated and business-ready data (KPIs, summary tables, etc.)

### Key Processes

- Data ingestion and storage using SQL scripts in the `SQL_Scripts/` folder.
- Data cleaning and transformations for:
  - Customer and product data
  - Sales transactions
  - Regional mappings
- Joins and aggregations to prepare datasets for analysis and dashboarding.

### Output

The output of this pipeline is a set of clean, structured tables containing key performance metrics such as:

- Total sales by product and region
- Monthly trends
- Customer segmentation
- Revenue tracking

---

## Part 2: Data Analytics

### Objective
To derive actionable insights and create visual dashboards using the curated data from the Gold Layer.

### Contents

- The `SQL_Data_Analytics/` folder includes scripts and queries used to perform business analysis.
- Visualizations and dashboards show:
  - Time-series sales performance
  - Best-selling products and categories
  - Region-wise sales comparison
  - Customer behavior patterns

### Tools Used

- SQL (microsoft sql server management studio) 
