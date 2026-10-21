USE STORE;


SELECT
	*
FROM PRODUCTS;

SELECT 
*
FROM SALES;

-- SALE DONE BY AMIT.
-- FIND RECORDS WHERE THE QUANTITY IS GREATER THAN AVG QUANTITY.as



-- scalar subquery

-- outer query
SELECT
	*
FROM SALES
WHERE QUANTITY > 
	-- inner query
	(SELECT
		AVG(QUANTITY)
	FROM SALES);
    
-- subqueries evaluates bottom to top.


SELECT
	AVG(QUANTITY)
FROM SALES;

create view sale_Data as(
select
	s.sale_id,
    c.customer_id,
    p.product_id,
    s.quantity,
    s.order_date,
    s.payment_mode,
    s.sales_person,
    p.product_name,
    p.category,
    p.price,
    c.customer_name,
    c.state,
    c.membership,
    p.price * s.quantity as amount
from sales s
inner join customers c 
on c.customer_id = s.customer_id
inner join products p
on p.product_id = s.product_id
order by s.sale_id);


drop view sale_data;

select 
* 
from sale_data;


-- in 
-- Gujarat, Rajasthan

select 
	*
from sale_Data 
where state in ('Gujarat', 'Rajasthan');

select 
	*
from sale_Data 
where state not in ('Gujarat', 'Rajasthan');

select
	customer_name
from sale_data
where product_name in
(select
	product_name
from sale_data
where amount > 50000);

select
	*
from sales
where product_id
in
(select
	product_id
from products);

-- corelated subquery
select
	* 
from sale_Data;

-- Fetch the records where the amount of products 
-- is greater than its own average category amount
select
category,
avg(amount) category_avg
from sale_Data
group by category;

-- f = 17545
-- s = 280
-- e = 44180
select
product_name,
	category,
    amount
from sale_Data s1
where amount > 
(select
	avg(amount)
from sale_data s2
where s2.state = s1.state);


select * from sale_data;



-- exists
-- exist is used when we want to check , does at least on matching record exist.
-- find the category for which at least on sale exist



select
* from customers;

-- find the customers who have placed at least one order.alter

select 
	customer_name
from customers c
where not exists
(select 
	1
from sales s
where s.customer_id = c.customer_id);


select * from sales where customer_id = "C009";


select * from sale_data;


-- Any, all

-- ANY: 
-- find the products name where the amount 
-- should be greater than any value of laptop.

-- 50000 -- 200000 (10) 

select
	product_name,
    amount
from sale_Data
where amount > any(select amount from sale_data where product_name='Laptop');
    
   
   
select
* from sale_data;
select
	product_name,
    amount
from sale_Data
where amount > all(select amount from sale_data where product_name='Mouse');
    
