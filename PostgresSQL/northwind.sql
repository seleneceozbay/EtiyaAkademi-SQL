-- select [kolonlar] from [tablo_adi]
--noktalı virgül koyarsan hep en sondaki sorgu çalışır.

select * from categories; 
select category_name, description from categories;

-- ID'si 5'ten büyük olan kategorileri getir
select * from categories where category_id >5;
select * from categories where category_name ='Beverages';
-- tırnağın içi case-sensitive (büyük harf duyarlı) 

select * from categories where category_name like '%Con%';
select * from categories where category_id between 3 and 6;
select * from categories where category_id in (1,2,3,4,5);
select * from categories where category_id=1 or category_id=2;

--Built-in functions
--toplam (summary)
select SUM(unit_price) from products where product_id in (1,2,3);

-- AVG (average) => verilerin aritmetik ortalaması 
select AVG(unit_price) from products where product_id in (1,2,3);

--MAX => veriler arasında en büyük olanı 
select MAX(unit_price) from products where product_id in (1,2,3);

--MIN => veriler arasında en küçük olanı 
select MIN(unit_price) from products where product_id in (1,2,3);

-- En pahalı ürün:
select MAX(unit_price) from products;

--Count
select COUNT(*) from products where unit_price> 50;

-- Distinct
-- kaç farklı şehirden çalışanım var?
select Distinct(City) from employees;

select Count(distinct(City)) from employees




