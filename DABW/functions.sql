create function sum_mystery_bag_vars (var1 number, var2 number, var3 number)
returns number as 'select var1+var2+var3';



select sum_mystery_bag_vars(25, 234, 2401.9);


