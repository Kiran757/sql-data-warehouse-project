
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates the tables required for the Bronze layer of the data
    warehouse in MySQL. The Bronze layer stores raw data ingested from source
    systems with minimal or no transformations.

    Existing tables are dropped before being recreated to ensure a clean and
    consistent table structure.

    Run this script when:
    - Setting up the Bronze layer for the first time.
    - Rebuilding the database schema.
    - Resetting the environment for testing or development.

Tables Created:
    - crm_cust_info      : Customer information from CRM system.
    - crm_prd_info       : Product information from CRM system.
    - crm_sales_details  : Sales transaction details from CRM system.
    - erp_loc_a101       : Customer location information from ERP system.
    - erp_cust_az12      : Customer demographic information from ERP system.
    - erp_px_cat_g1v2    : Product category information from ERP system.
===============================================================================
*/
-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS bronze;

-- Select the database
USE bronze;

-- Customer Information
DROP TABLE IF EXISTS crm_cust_info;

CREATE TABLE crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr VARCHAR(50),
    cst_create_date DATE
);

-- Product Information
DROP TABLE IF EXISTS crm_prd_info;

CREATE TABLE crm_prd_info (
    prd_id INT,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost INT,
    prd_line VARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);

-- Sales Details
DROP TABLE IF EXISTS crm_sales_details;

CREATE TABLE crm_sales_details (
    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);

-- Location Data
DROP TABLE IF EXISTS erp_loc_a101;

CREATE TABLE erp_loc_a101 (
    cid VARCHAR(50),
    cntry VARCHAR(50)
);

-- Customer ERP Data
DROP TABLE IF EXISTS erp_cust_az12;

CREATE TABLE erp_cust_az12 (
    cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(50)
);

-- Product Category Data
DROP TABLE IF EXISTS erp_px_cat_g1v2;

CREATE TABLE erp_px_cat_g1v2 (
    id VARCHAR(50),
    cat VARCHAR(50),
    subcat VARCHAR(50),
    maintenance VARCHAR(50)
);
