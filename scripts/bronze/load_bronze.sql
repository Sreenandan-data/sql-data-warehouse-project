/*

Stored Procedure: Load Bronze Layer (Source -> Bronze)

Script Purpose:
This stored procedure loads data into the 'bronze' schema from external CSV files.
It performs the following actions:
- Truncates the bronze tables before loading data.
- Uses the 'BULK INSERT' command to load data from csv Files to bronze tables.

Parameters:
None.
This stored procedure does not accept any parameters or return any values.

Usage Example:
EXEC bronze.load_bronze;

*/
create or alter procedure bronze.load_bronze as
begin
     declare @start_time datetime ,@end_time datetime,@start_batch_time datetime,@end_batch_time datetime
     begin try
			 print '============================================='
			 print 'loading begins'
			 print '============================================='

			 print '============================================='
			 print 'loading tables'
			 print '============================================='
			 set @start_batch_time =getdate()

			 set @start_time =getdate()
			 print'<<truncating table bronze.crm_cust_info <<'
			truncate table bronze.crm_cust_info
			 print'<<inserting data into table<<'
			bulk insert bronze.crm_cust_info 
			from 'C:\Users\sreen\Downloads\DAAN\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
			with(firstrow=2,fieldterminator =',',tablock);
			set @end_time=getdate()
			print'>>load duration :'+ cast(datediff(second,@start_time,@end_time) as nvarchar) +'seconds'
			print'--------------------------------------'

              set @start_time =getdate()
			  print'<<truncating table bronze.crm_prd_info <<'
			truncate table bronze.crm_prd_info
			  print'<<inserting data into table<<'
			bulk insert bronze.crm_prd_info 
			from 'C:\Users\sreen\Downloads\DAAN\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
			with(firstrow=2,fieldterminator =',',tablock);
			set @end_time=getdate()
			print'>>load duration :'+ cast(datediff(second,@start_time,@end_time) as nvarchar)+ 'seconds'
				print'--------------------------------------'

			  set @start_time =getdate()
			  print'<<truncating table bronze.crm_sales_info <<'
			truncate table bronze.crm_sales_info
			 print'<<inserting data into table<<'
			bulk insert bronze.crm_sales_info
			from 'C:\Users\sreen\Downloads\DAAN\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
			with(firstrow=2,fieldterminator =',',tablock);
			set @end_time=getdate()
			print'>>load duration :'+ cast(datediff(second,@start_time,@end_time) as nvarchar)+ 'seconds'
				print'--------------------------------------'

			 set @start_time =getdate()
			 print'<<truncating table bronze.erp_cust_info <<'
			truncate table bronze.erp_cust_info
			 print'<<inserting data into table<<'
			bulk insert bronze.erp_cust_info
			from 'C:\Users\sreen\Downloads\DAAN\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
			with(firstrow=2,fieldterminator =',',tablock);
			set @end_time=getdate()
			print'>>load duration :'+ cast(datediff(second,@start_time,@end_time) as nvarchar)+ 'seconds'
				print'--------------------------------------'

			set @start_time =getdate()
			 print'<<truncating table bronze.erp_cust_country <<'
			truncate table bronze.erp_cust_country
			 print'<<inserting data into table<<'
			bulk insert bronze.erp_cust_country
			from 'C:\Users\sreen\Downloads\DAAN\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
			with(firstrow=2,fieldterminator =',',tablock)
			set @end_time=getdate()
			print'>>load duration :'+ cast(datediff(second,@start_time,@end_time) as nvarchar) +'seconds'
				print'--------------------------------------'

			set @start_time =getdate()
			 print'<<truncating table bronze.erp_cust_cat <<'
			truncate table bronze.erp_cust_cat
			 print'<<inserting data into table<<'
			bulk insert bronze.erp_cust_cat
			from 'C:\Users\sreen\Downloads\DAAN\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
			with(firstrow=2,fieldterminator =',',tablock)
			set @end_time=getdate()
			print'>>load duration :'+ cast(datediff(second,@start_time,@end_time) as nvarchar)+ 'seconds'
				print'--------------------------------------'

			print'========================================'
			print'loading completed'
			print'========================================'
			set @end_batch_time=getdate()
			print'total loading time:'+cast(datediff(second,@start_batch_time,@end_batch_time) as nvarchar)+'seconds'
   end try
   begin catch
   print'================================='
   PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
   PRINT 'Error Message' + ERROR_MESSAGE();
   PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
   PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
   end catch
end
