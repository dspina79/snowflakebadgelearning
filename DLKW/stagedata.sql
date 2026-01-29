list @product_metadata;


-- query from one of the stage names
select $1
from @product_metadata/product_coordination_suggestions.txt;

create file format zmd_file_format_1
RECORD_DELIMITER = '^';


-- query from one of the stage names with the file format
select $1
from @product_metadata/product_coordination_suggestions.txt
(file_format => zmd_file_format_1);

create file format zmd_file_format_2
FIELD_DELIMITER = '^';  

select $1, $2, $3
from @product_metadata/product_coordination_suggestions.txt
(file_format => zmd_file_format_2);


create or replace file format zmd_file_format_3
FIELD_DELIMITER = '='
RECORD_DELIMITER = '^'
TRIM_SPACE = TRUE; 

create view zenas_athleisure_db.products.SWEATBAND_COORDINATION as
select $1 as PRODUCT_CODE, $2 as HAS_MATCHING_SWEATSUIT
from @product_metadata/product_coordination_suggestions.txt
(file_format => zmd_file_format_3)
where PRODUCT_CODE <> '';


create or replace file format zmd_file_format_1
RECORD_DELIMITER = ';'
TRIM_SPACE = TRUE;

create view zenas_athleisure_db.products.sweatsuit_sizes as 
select REPLACE($1, chr(13)||char(10))  as sizes_available
from @product_metadata/sweatsuit_sizes.txt
(file_format => zmd_file_format_1 )
where sizes_available <> '';


select * from sweatsuit_sizes;



create or replace file format zmd_file_format_2
FIELD_DELIMITER = '|'
RECORD_DELIMITER = ';'
TRIM_SPACE = TRUE;  

create view zenas_athleisure_db.products.SWEATBAND_PRODUCT_LINE as
select REPLACE($1, chr(13)||char(10)) as PRODUCT_CODE, $2 AS HEADBAND_DESCRIPTION, $3 AS WRISTBAND_DESCRIPTION
from @product_metadata/swt_product_line.txt
(file_format => zmd_file_format_2 );

SELECT * FROM SWEATBAND_PRODUCT_LINE;

select * from SWEATSUIT_SIZES ;