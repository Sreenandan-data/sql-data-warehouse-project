/*
=========================================================
DDL Script: Create Bronze Tables
==========================================================
Script Purpose:
This script creates tables in the 'bronze' schema, dropping existing tables
if they already exist.
Run this script to re-define the DDL structure of 'bronze' Tables
============================================================
/*
IF 0BJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
 DROP TABLE bronze.crm_cust_info;

GO

CREATE TABLE bronze.crm_cust_info (
cust_id int
cust_key nvarchar(50)
cust_firstname nvarchar(50)
cust_lastname nvarchar(50)
cust_marital_status nvarchar(50)
cust_gender nvarchar(50)
cust_create_date date );

GO
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
DROP TABLE bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info (
prd_id int
prd_key NVARCHAR(50)
prd_name NVARCHAR(50)
prd_cost int
prd_line NVARCHAR(50)
prd_start_dt DATETIME,
prd_end_dt DATETIME );

GO
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
DROP TABLE bronze.crm_sales_details;

GO

CREATE TABLE bronze.crm_sales_details (
sales_ord_num NVARCHAR(50),
sales_prd_key NARCHAR(50),
sales_cust_id INT,
sales_order_dt INT,
sales_ship_dt INT,
sales_dué_dt INT,
sales_sales INT,
sales_quantity INT,
sales_price INT)

GO

IF OBECT_ID('bronze.erp_loc_al01', "U') IS NOT NULL
DROP TABLE bronze.enp_loc_a101;

GO

CREATE TABLE bronze.erp_loc_a101 (
cid NVARCHAR(50),
cntry NVARCHAR(50));

GO
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
DROP TABLE bronze.erp_cust_az12;

GO

CREATE TABLE bronze.erp_cust_212 (
cid NVARCHAR(50),
bdate DATE,
gen NVARCHAR(50)
);
GO

IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
DROP TABLE bronze.erp_px_cat_g1v2;

GO

CREATE TABLE bronze.erp_px_cat_g1v2 (
id NVARCHAR(50),
cat NVARCHAR(50),
subcat NVARCHAR(50),
maintenance NVARCHAR(50));

GO

