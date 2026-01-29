create table FRUIT_OPTIONS 
(
    FRUIT_ID number,
    FRUIT_NAME varchar(25)
);


create file format smoothies.public.two_headerrow_pct_delim
   type = CSV,
   skip_header = 2,   
   field_delimiter = '%',
   trim_space = TRUE
;


COPY INTO smoothies.public.fruit_options
from (select $2 as FRUIT_ID, $1 as FRUIT_NAME from @smoothies.public.my_uploaded_files/fruits_available_for_smoothies.txt)
file_format = (format_name = smoothies.public.two_headerrow_pct_delim)
on_error = abort_statement
purge = true;

alter table ORDERS add column name_on_order varchar(100);

select * from orders;