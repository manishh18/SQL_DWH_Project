# Retail Sales Data Warehouse and Analytics Project

This repository contains a complete end-to-end project involving the design and development of a **Retail Sales Data Warehouse** along with **Data Analytics and Visualization**. The project demonstrates how raw transactional data is transformed, modeled, and used for analytical reporting through a multi-layered data architecture and dashboarding.

---

## 🏗️ Project Structure

This project is divided into two main parts:

1. **Data Warehouse (DW)**
2. **Data Analytics (DA)**

---

## 📦 Part 1: Data Warehouse (SQL-Based)

### Objective

To create a robust data warehouse architecture that transforms raw sales data into meaningful, structured data across **Bronze**, **Silver**, and **Gold** layers for efficient analytics.

### Data Source

Simulated retail transactional data including:
- Customers
- Products
- Stores
- Orders
- Payments
- Shipments

### Architecture Overview

- **Bronze Layer**: Raw data loaded into staging tables as-is.
- **Silver Layer**: Cleaned and transformed data using joins and business logic.
- **Gold Layer**: Analytical tables including KPIs and aggregated metrics for reporting.

### SQL Implementation Highlights

- Created relational schemas with primary and foreign key constraints.
- Handled missing values and duplicates during Silver layer transformation.
- Built calculated fields like `Total_Sales`, `Profit_Margin`, `Customer_Lifetime_Value`.
- Used views to modularize complex transformations.

### ER Diagram

*(Include a screenshot or link to your ERD if available)*

---

## 📊 Part 2: Data Analytics and Dashboard

### Objective

To perform analytical queries on the Gold Layer and create visualizations that deliver insights for business decision-making.

### Key Metrics and Insights

- Monthly Sales Trends
- Top Performing Products and Categories
- Revenue by Region and Store
- Customer Segmentation by Purchase Behavior
- Order Fulfillment and Shipment Delays
- Payment Method Distribution

### Tools Used

- **SQL**: For querying data from the Gold Layer.
- **Power BI / Tableau / Excel**: For dashboard creation and interactive reporting.
- *(Update based on what tool you used)*

### Sample Dashboard

*(Add screenshots of the dashboard or a link to your BI file/report)*

---

## 💡 Key Learnings

- Structured approach to building a data warehouse from scratch.
- Data transformation best practices using SQL.
- Designing analytical views for real-world business needs.
- Creating impactful dashboards from model-driven datasets.

---

## 📁 Folder Structure

