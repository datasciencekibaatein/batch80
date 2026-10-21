create database analysis;
use analysis;

create table sale(
	order_id int,
    order_date date,
    customer_id varchar(10),
    customer_name varchar(30),
    city varchar(20),
    segment varchar(20),
    product_name varchar(30),
    category varchar(20),
    quantity int,
    unit_price decimal(10,2),
    discount_pct decimal(10,2),
    gross_amount decimal(10,2),
    discount_amount decimal(10,2),
    net_amount decimal(10,2),
    payment_method varchar(20),
    order_status varchar(20)
);
    
    
    
select * from sale;

desc sale;


-- How many orders are there ?
select
	count(order_id) total_orders
from sale;
    
-- Total Sales by month

select 
	month(order_date) as month,
    sum(net_amount) as total_sales
from sale
group by month(order_date);

select 
	date_format(order_date,"%Y-%m") as month,
    sum(net_amount) as total_sales
from sale
group by date_format(order_date,"%Y-%m");


select
	payment_method,
    month(order_date),
	sum(net_amount)
from sale
group by payment_method,month(order_date);


select 
	date_format(order_date,"%Y-%m") as month,
    sum(net_amount) as total_sales
from sale
where order_status = "Completed"
group by date_format(order_date,"%Y-%m");



-- average order value by month

select
	date_format(order_date,"%Y-%m") as month,
	round(sum(net_amount) / count(*),3) as avg_order_value
from sale
where order_status = "completed"
group by date_format(order_date,"%Y-%m");


select
	date_format(order_date,"%Y-%m") as month,
	round(avg(net_amount),3) as avg_order_value
from sale
where order_status = "completed"
group by date_format(order_date,"%Y-%m");


-- total completed, cancelled and returned orders each month

select
	date_format(order_date,"%Y-%m") as month,
    sum(order_status = "completed") as completed_order,
    sum(order_status = "returned") as returned_order,
    sum(order_status = "cancelled") as cancelled_order
from sale
group by date_format(order_date,"%Y-%m");


-- month over month analysis

-- CTE, Temperory table

with 
	monthly_sale as(
		select 
			date_format(order_date,"%Y-%m") as month,
			sum(net_amount) as current_sales,
            round(lag(sum(net_amount)) over (order by date_format(order_date,"%Y-%m")),2) as previous_sale
		from sale
		where order_status = "Completed"
		group by date_format(order_date,"%Y-%m")
)
select
	month,
     current_sales,
     previous_sale,
     current_sales - previous_sale as sale_diff,
    (current_sales - previous_sale) / previous_sale * 100 as mom_sale
from monthly_sale
order by month;




with 
	monthly_sale as(
		select 
			date_format(order_date,"%Y-%m") as month,
			sum(net_amount) as current_sales
		from sale
		where order_status = "Completed"
		group by date_format(order_date,"%Y-%m")
)
select
	month,
     current_sales,
     round(lag(current_sales) over (order by month),2) as previous_sale,
     current_sales - round(lag(current_sales) over (order by month),2) as sale_diff,
     (current_sales - round(lag(current_sales) over (order by month),2)) / round(lag(current_sales) over (order by month),2) *100 as mom_growth
from monthly_sale
order by month;








