-- DO NOT EDIT ANYTHING BELOW THIS LINE. THE CODE MUST BE RUN EXACTLY AS IT IS WRITTEN
select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
 SELECT 'DWW09' as step
 ,( select iff(count(*)=0, 0, count(*)/count(*)) 
    from snowflake.account_usage.query_history
    where query_text like 'execute streamlit "GARDEN_PLANTS"."FRUITS".%'
   ) as actual
 , 1 as expected
 ,'SiS App Works' as description
); 


select GRADER(step, (actual = expected), actual, expected, description) as graded_results from ( SELECT 'DWW09' as step ,( select iff(count(*)=0, 0, count(*)/count(*)) from snowflake.account_usage.query_history where query_text like 'execute streamlit "GARDEN_PLANTS"."FRUITS".%' ) as actual , 1 as expected ,'SiS App Works' as description );


select GRADER(step,(actual = expected), actual, expected, description) as graded_results from (
SELECT 'DORA_IS_WORKING' as step
 ,(select 223 ) as actual
 ,223 as expected
 ,'Dora is working!' as description
); 