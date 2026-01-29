list @sweatsuits;

select $1
from @sweatsuits/purple_sweatsuit.png; 

select metadata$filename, metadata$file_row_number
from @sweatsuits/purple_sweatsuit.png;

select metadata$filename, count(*)
from @sweatsuits
group by metadata$filename;

-- directory table
select * 
from directory(@sweatsuits);

select REPLACE(relative_path, '_', ' ') as no_underscores_filename
, REPLACE(no_underscores_filename, '.png') as just_words_filename
, INITCAP(just_words_filename) as product_name
from directory(@sweatsuits);


select initcap(replace(replace(relative_path, '_', ' '), '.png')) as product_name
from directory(@sweatsuits);
