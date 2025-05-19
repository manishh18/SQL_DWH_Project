/*
=============================================================
  Script: Create Database and Schemas for Data Warehouse
=============================================================

Purpose:
    This script sets up a clean 'DataWarehouse' environment in SQL Server.
    It checks if a database named 'DataWarehouse' exists, and if so, drops it safely
    before creating a new one. The script also defines three schemas within the database:
      - bronze  : for raw data
      - silver  : for cleansed and transformed data
      - gold    : for aggregated or business-ready data

Warning:
    Running this script will drop the existing 'DataWarehouse' database and delete all data.
    Make sure to back up any important information before executing this script.

Steps:
    1. Switch to the 'master' database.
    2. Drop the 'DataWarehouse' database if it exists (with rollback to handle active connections).
    3. Create a new 'DataWarehouse' database.
    4. Create the 'bronze', 'silver', and 'gold' schemas.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
