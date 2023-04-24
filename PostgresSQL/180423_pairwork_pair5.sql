
--13. Region alanı NULL olan kaç tedarikçim var? 
select count(supplier_id) from  suppliers where region is  Null

--14. a.Null olmayanlar?
select count(supplier_id) from  suppliers where region is not Null

--15. Ürün adlarının hepsinin soluna TR koy ve büyültüp olarak ekrana yazdır.
select UPPER('TR '||product_name) from products

-- 16. a.Fiyatı 20den küçük ürünlerin adının başına TR ekle
select lower('TR '||product_name), unit_price from products where unit_price < 20
	
--17. En pahalı ürün listesini (ProductName , UnitPrice) almak için bir sorgu yazın.
Select * from products where unit_price=(Select Max(unit_price) from products)

--18. En pahalı on ürünün Ürün listesini (ProductName , UnitPrice) almak için bir sorgu yazın.
Select * from products order by unit_price  desc limit 10

--19. Ürünlerin ortalama fiyatının üzerindeki Ürün listesini (ProductName , UnitPrice) almak için bir sorgu yazın.
select product_name, unit_price from products where unit_price> 
        (select avg(unit_price) from products)

--20. Stokta olan ürünler satıldığında elde edilen miktar ne kadardır.
select SUM(units_in_stock*unit_price) as profit from products
	
--21. Mevcut ve Durdurulan ürünlerin sayılarını almak için bir sorgu yazın.
select count(*) as durdurulan from products where discontinued =1;

select count(*) as mevcut from products where discontinued =0

--22. Ürünleri kategori isimleriyle birlikte almak için bir sorgu yazın.
select product_name, category_name from products p 
inner join categories c 
on p.category_id=c.category_id

--23. Ürünlerin kategorilerine göre fiyat ortalamasını almak için bir sorgu yazın.
select product_name, category_name, AVG(unit_price) from products p
inner join categories c
on p.category_id=c.category_id
group by product_name, category_name

--24. En pahalı ürünümün adı, fiyatı ve kategorisin adı nedir?
select product_name,max(unit_price), category_name from products p 
inner join categories c
on p.category_id=c.category_id
group by product_name,category_name

--25. En çok satılan ürününün adı, kategorisinin adı ve tedarikçisinin adı 
select product_name, category_name, company_name, sum(quantity)
from (((order_details o
inner join products p on o.product_id = p.product_id)
inner join categories c on p.category_id = c.category_id)
inner join suppliers s on p.supplier_id = s.supplier_id)
group by product_name, category_name, company_name
order by sum(o.quantity) desc;

--26. Stokta bulunmayan ürünlerin ürün listesiyle birlikte tedarikçilerin ismi ve iletişim numarasını
--(ProductID, ProductName, CompanyName, Phone) almak için bir sorgu yazın.
select product_id, product_name, units_in_stock, company_name, phone from products p
INNER JOIN suppliers s 
ON p.supplier_id = s.supplier_id
where units_in_stock = 0
group by product_id, product_name,units_in_stock, company_name, phone

--27. 1998 yılı mart ayındaki siparişlerimin adresi, siparişi alan çalışanın adı, çalışanın soyadı
select order_date, ship_address, first_name, last_name from employees e
inner join orders o
on e.employee_id= o.employee_id
where order_date between '1998-03-01' and '1998-03-31'
group by order_date, ship_address, first_name, last_name order by order_date

--28. 1997 yılı şubat ayında kaç siparişim var?
select count(*) from orders 
where order_date between '1997-02-01' and '1997-02-28'

--29. London şehrinden 1998 yılında kaç siparişim var?
select count(*) from orders 
where ship_city= 'London' and order_date between '1998-01-01' and '1998-12-31'

--30. 1997 yılında sipariş veren müşterilerimin contactname ve telefon numarası
select order_date, contact_name, phone from orders o
inner join customers c
on c.customer_id= o.customer_id
where order_date between '1997-01-01' and '1997-12-31'
group by order_date,contact_name, phone
order by order_date

--31. Taşıma ücreti 40 üzeri olan siparişlerim 
select order_id, freight from orders 
where freight > 40 order by freight

-- 32. Taşıma ücreti 40 ve üzeri olan siparişlerimin şehri, müşterisinin adı
select order_id, freight, ship_city, contact_name from orders o
inner join customers c 
on c.customer_id= o.customer_id
where freight >= 40 
group by order_id,  freight, ship_city, contact_name
order by freight

--33. 1997 yılında verilen siparişlerin 
--tarihi, şehri, çalışan adı -soyadı ( ad soyad birleşik olacak ve büyük harf)
select order_date, upper(first_name || ' ' || last_name) as employee_name, ship_city from orders o
inner join employees e
on e.employee_id= o.employee_id
where order_date between '1997-01-01' and '1997-12-31'
group by order_date, employee_name, ship_city
order by order_date

--34. 1997 yılında sipariş veren müşterilerin 
--contactname i, ve telefon numaraları ( telefon formatı 2223322 gibi olmalı )
select order_date, contact_name, regexp_replace(phone, '[\s()-.]+', '', 'g') from orders o
inner join customers c
on c.customer_id= o.customer_id
where order_date between '1997-01-01' and '1997-12-31'
group by order_date,contact_name, phone
order by order_date

--35. Sipariş tarihi, müşteri contact name, çalışan ad, çalışan soyad 
select order_date, contact_name, first_name, last_name from customers c
inner join orders o on c.customer_id= o.customer_id
inner join employees e on o.employee_id= e.employee_id
group by order_date, contact_name, first_name, last_name

--36. Geciken siparişlerim?
select order_id,required_date, shipped_date from orders where required_date< shipped_date

--37. Geciken siparişlerimin tarihi, müşterisinin adı
select order_id, order_date, required_date, shipped_date, contact_name from orders o
inner join customers c
on c.customer_id=o.customer_id
where required_date< shipped_date
group by order_id, order_date, required_date, shipped_date, contact_name

--38. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi 
select o.order_id, product_name, category_name, quantity from categories c
inner join products p on c.category_id= p.category_id
inner join order_details od on p.product_id= od.product_id
inner join orders o on od.order_id= o.order_id
where o.order_id= 10248
group by o.order_id, product_name, category_name, quantity

-- 39. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı 
select o.order_id, product_name, company_name from suppliers s
inner join products p on s.supplier_id= p.supplier_id
inner join order_details od on p.product_id= od.product_id
inner join orders o on od.order_id= o.order_id
where o.order_id= 10248
group by o.order_id, product_name, company_name

--40. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
select employee_id, o.order_date, p.product_name, od.quantity from orders o
inner join order_details od on o.order_id = od.order_id
inner join products p on od.product_id = p.product_id
where o.employee_id = 3 and o.order_date between '1997-01-01' and '1997-12-31'
group by employee_id, o.order_date, p.product_name, od.quantity

