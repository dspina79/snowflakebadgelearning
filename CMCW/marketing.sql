create view DETROIT_ZIPS 
AS
SELECT DISTINCT COUNTRY, POSTAL_CODE FROM weathersource.standard_tile.history_day
where (postal_code like '481%' OR postal_code LIKE '482%') AND Country = 'US';



select * from DETROIT_ZIPS;

SELECT COUNT(*) FROM weathersource.standard_tile.history_day h inner join detroit_zips d on h.postal_code = d.postal_code;