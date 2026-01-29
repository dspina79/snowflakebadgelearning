set mystery_bag = 'This bag is empty!!';
set var1 = 1;
set var2 = 2;
set var3 = 3;

--select $mystery_bag;
select $var1 + $var2 + $var3;



set alternating_caps_phrase = 'aLterNATING CapS!';
select initcap($alternating_caps_phrase);


create or replace function NEUTRALIZE_WHINING (var1 text)
returns text as 'select initcap(var1)';


select NEUTRALIZE_WHINING('aLterNATING CapS!');



select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
 SELECT 'DABW007' as step
 ,( select hash(neutralize_whining('bUt mOm i wAsHeD tHe dIsHes yEsTeRdAy'))) as actual
 , -4759027801154767056 as expected
 ,'WHINGE UDF Works' as description
);