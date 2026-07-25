/*
===============================================================================
Stored Procedure: bronze.load_bronze
===============================================================================
Purpose:
    Loads raw CRM and ERP data into the Bronze layer by truncating existing
    tables and importing the latest source files using BULK INSERT.

Features:
    - Reloads all Bronze tables
    - Tracks load time for each table
    - Displays total Bronze layer load time
    - Handles errors using TRY...CATCH
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE
        @bronze_start_time DATETIME2,
        @bronze_end_time   DATETIME2,
        @start_time        DATETIME2,
        @end_time          DATETIME2;

    BEGIN TRY

        -- Start Bronze Layer Load Timer
        SET @bronze_start_time = GETDATE();

        PRINT '==========================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '==========================================================';

        -- Load CRM Tables

        PRINT '----------------------------------------------------------';
        PRINT 'Loading CRM Tables';
        PRINT '----------------------------------------------------------';

        -- Load CRM Customer Information

        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.crm_cust_info;

        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\tomar\OneDrive\Documents\SQL_baraa_resources\barra\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT 'crm_cust_info loaded successfully.';
        PRINT 'Load Time = '
            + CAST(CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) / 1000.0 AS DECIMAL(10,2)) AS NVARCHAR(20))
            + ' seconds';

        -- Load CRM Product Information

        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.crm_prd_info;

        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\tomar\OneDrive\Documents\SQL_baraa_resources\barra\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT 'crm_prd_info loaded successfully.';
        PRINT 'Load Time = '
            + CAST(CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) / 1000.0 AS DECIMAL(10,2)) AS NVARCHAR(20))
            + ' seconds';

        -- Load CRM Sales Details

        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.crm_sales_details;

        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\tomar\OneDrive\Documents\SQL_baraa_resources\barra\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT 'crm_sales_details loaded successfully.';
        PRINT 'Load Time = '
            + CAST(CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) / 1000.0 AS DECIMAL(10,2)) AS NVARCHAR(20))
            + ' seconds';

        -- Load ERP Tables

        PRINT '----------------------------------------------------------';
        PRINT 'Loading ERP Tables';
        PRINT '----------------------------------------------------------';

        -- Load ERP Customer Data

        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.erp_cust_az12;

        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\tomar\OneDrive\Documents\SQL_baraa_resources\barra\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT 'erp_cust_az12 loaded successfully.';
        PRINT 'Load Time = '
            + CAST(CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) / 1000.0 AS DECIMAL(10,2)) AS NVARCHAR(20))
            + ' seconds';

        -- Load ERP Location Data

        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.erp_loc_a101;

        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\tomar\OneDrive\Documents\SQL_baraa_resources\barra\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT 'erp_loc_a101 loaded successfully.';
        PRINT 'Load Time = '
            + CAST(CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) / 1000.0 AS DECIMAL(10,2)) AS NVARCHAR(20))
            + ' seconds';

        -- Load ERP Product Category Data

        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\tomar\OneDrive\Documents\SQL_baraa_resources\barra\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT 'erp_px_cat_g1v2 loaded successfully.';
        PRINT 'Load Time = '
            + CAST(CAST(DATEDIFF(MILLISECOND, @start_time, @end_time) / 1000.0 AS DECIMAL(10,2)) AS NVARCHAR(20))
            + ' seconds';

        -- Bronze Layer Completed

        SET @bronze_end_time = GETDATE();

        PRINT '==========================================================';
        PRINT 'Bronze Layer Loaded Successfully';
        PRINT '==========================================================';

        PRINT 'Total Bronze Layer Load Time = '
            + CAST(CAST(DATEDIFF(MILLISECOND, @bronze_start_time, @bronze_end_time) / 1000.0 AS DECIMAL(10,2)) AS NVARCHAR(20))
            + ' seconds';

    END TRY

    BEGIN CATCH

        PRINT '==========================================================';
        PRINT 'There is an Error in Loading the Bronze Layer';
        PRINT 'Error Number : ' + CAST(ERROR_NUMBER() AS NVARCHAR(10));
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT '==========================================================';

    END CATCH
END;
GO

EXEC bronze.load_bronze;
