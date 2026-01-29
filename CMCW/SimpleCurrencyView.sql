CREATE VIEW intl_db.public.simple_currency
AS
SELECT COUNTRY_CHAR_CODE as CTY_CODE, CURRENCY_CHAR_CODE AS CUR_CODE
FROM intl_db.public.country_code_to_currency_code;