create table ORDERS
(
    INGREDIENTS varchar(200)
);


insert into smoothies.public.orders(ingredients) values('Elderberries Cantaloupe Honeydew ');

select * from smoothies.public.orders;

truncate table smoothies.public.orders;

alter table ORDERS ADD ORDER_FILLED boolean DEFAULT FALSE;


update smoothies.public.orders
       set order_filled = true
       where name_on_order is null;



alter table SMOOTHIES.PUBLIC.ORDERS 
add column order_uid integer --adds the column
default smoothies.public.order_seq.nextval  --sets the value of the column to sequence
constraint order_uid unique enforced; --makes sure there is always a unique value in the column