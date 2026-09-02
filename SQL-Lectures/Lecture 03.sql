-- Joins

-- Sales(order_id, emp_id,product_id, order_date, quantity), Employee(emp_id,emp_name,salary,dept_id) ,department(dept_id,department_name,projects)

-- inner join
-- left join
-- right join
-- full join
-- cross join


-- Primary key
-- Value of that column uniquely identify each row


-- Foreign key
-- Value of that column will have refrence in another table


use company;
create table orders(
	order_id int,
    product_id int,
    quantity int
    );
    
create table products(
	product_id int,
    name varchar(10),
    unit_price int
    );





insert into orders values
(1,101,3),
(2,102,2),
(3,101,1),
(4,103,3),
(5,102,2),
(6,104,4);


insert into products values
(101,"A",30),
(102,"B",20),
(103,"C",15),
(105,"D",25);


-- inner join
select 
	*
from orders o
inner join 
products p
on o.product_id = p.product_id;





-- left join
select 
	*
from orders o
left join 
products p
on o.product_id = p.product_id;


-- right join
select 
	*
from orders o
right join 
products p
on o.product_id = p.product_id;




-- full join
select 
	*
from orders o
left join 
products p
on o.product_id = p.product_id

union

select 
	*
from orders o
right join 
products p
on o.product_id = p.product_id;




select
	*
from orders
cross join products;




-- ============================
-- PK AND FK 
-- ============================

create table orders(
	order_id int PRIMARY KEY,
    product_id int,
    quantity int,
    foreign key (product_id) references products(product_id)
);
    

alter table orders
add constraint fk_products
foreign key(product_id)
references products(product_id);


create table products(
	product_id int primary key,
    name varchar(10),
    unit_price int
    );




insert into orders values
(1,101,3),
(2,102,2),
(3,101,1),
(4,103,3),
(5,102,2),
(6,105,4);


insert into products values
(101,"A",30),
(102,"B",20),
(103,"C",15),
(105,"D",25);


insert into products values(106,"E",12);



select 
	o.order_id,
    p.product_id,
    p.name,
    p.unit_price,
    o.quantity
from orders o
left join products p
on o.product_id = p.product_id;





select 
	p.product_id,
    p.unit_price * o.quantity sale
from orders o
left join products p
on o.product_id = p.product_id;

