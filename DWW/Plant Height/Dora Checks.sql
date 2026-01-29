select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (  
      SELECT 'DWW12' as step 
      ,( select row_count 
        from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES 
        where table_name = 'VEGETABLE_DETAILS_PLANT_HEIGHT') as actual 
      , 41 as expected 
      , 'Veg Detail Plant Height Count' as description   
); 

select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (  
     SELECT 'DWW13' as step 
     ,( select row_count 
       from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES 
       where table_name = 'LU_SOIL_TYPE') as actual 
     , 8 as expected 
     ,'Soil Type Look Up Table' as description   
); 


select GRADER(step, (actual = expected), actual, expected, description) as graded_results from ( 
     SELECT 'DWW14' as step 
     ,( select count(*) 
       from GARDEN_PLANTS.INFORMATION_SCHEMA.FILE_FORMATS 
       where FILE_FORMAT_NAME='L9_CHALLENGE_FF' 
       and FIELD_DELIMITER = '\t') as actual 
     , 1 as expected 
     ,'Challenge File Format Created' as description  
); 



select GRADER(step, (actual = expected), actual, expected, description) as graded_results from ( SELECT 'DWW04' as step ,( select count(*) as SCHEMAS_FOUND from UTIL_DB.INFORMATION_SCHEMA.SCHEMATA) as actual , 2 as expected , 'UTIL_DB Schemas' as description );


select GRADER(step, (actual = expected), actual, expected, description) as graded_results from ( SELECT 'DWW09' as step ,( select iff(count(*)=0, 0, count(*)/count(*)) from snowflake.account_usage.query_history where query_text like 'execute streamlit "GARDEN_PLANTS"."FRUITS".%' ) as actual , 1 as expected ,'SiS App Works' as description );