/*
============================================
Create Database & Schemas
============================================

This script creates the Data Warehouse
database and the three schemas used
throughout the project.

Bronze -> Raw data
Silver -> Cleaned data
Gold   -> Business-ready data

============================================
*/

USE master;
GO

-- Create the database
CREATE DATABASE DataWarehouse;
GO

-- Switch to the new database
USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA Bronze;
GO

CREATE SCHEMA Silver;
GO

CREATE SCHEMA Gold;
GO

-- Verify that the schemas were created
SELECT name
FROM sys.schemas
WHERE name IN ('Bronze', 'Silver', 'Gold');
