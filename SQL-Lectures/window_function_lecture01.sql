/*
Windows Function
*/


-- A window function performs a calculation across a set of rows related to the current row.

use analysis;

select * from sale;
--
select
	segment,
    avg(net_amount) 
from sale
group by segment;


-- window function
select
	customer_name,
	segment,
    payment_method,
    category,
    net_amount,
    avg(net_amount) over(partition by segment) avg_sale
from sale;

-- records greater than avg sale of given segment




-- partition by and group by both are same
-- partition by , used with window function
-- if you see over() function with any aggregation function that's window function


select
	category,
    avg(net_amount) avg_net
from sale
group by category;



-- ---------




select
	customer_name,
	category,
    segment,
    net_amount,
    avg(net_amount) over()
from sale;




-- Types of window function

-- Aggregation function(sum,avg,min,max,count)
-- Rank function(rank,dense,row_number,ntile,percent_rank,cum_dist)
-- Value function(first_value,last_value,lag,lead)




-- Aggregation
select * from sale;

select
	order_date,
    segment,
    category,
	gross_amount,
    sum(gross_amount) over(partition by category) total_amount,
    avg(gross_amount) over(partition by segment) avg_amount,
    min(gross_amount) over(partition by category) min_amount,
    max(gross_amount) over(partition by category) max_amount,
    count(gross_amount) over(partition by category) orders_category
from sale;
    



-- rank function


select
	order_date,
    segment,
    category,
	gross_amount,
    ntile(2) over(order by gross_amount asc) ntl,
    dense_rank() over(order by order_date asc) dense_rnk,
    row_number() over(order by order_date asc) row_num,
    Rank() over(order by order_date asc) date_rank
from sale;



select
	order_date,
    segment,
    category,
	gross_amount,
    ntile(4) over(order by gross_amount asc) ntl
from sale;


select
	order_date,
    segment,
    category,
	gross_amount,
    percent_rank() over(order by order_date asc) pct_rnk,
    cume_dist() over(order by order_date asc) cm_rnk
from sale;



/*
Numerator : number of rows whose value is less than or equal to the current row's value
N: Total number of rows 
*/






-- Value function
select
	order_date,
    segment,
    category,
	gross_amount,
    first_value(gross_amount) over(order by order_date asc) fst_val,
    last_value(gross_amount) over(order by order_date asc rows 
    between unbounded preceding and unbounded following) lst_vale
from sale;


select
	order_date,
    segment,
    category,
	gross_amount,
    lag(gross_amount) over(order by order_date asc) lag_val,
    lead(gross_amount) over(order by order_date asc) ld_val
from sale;



-- framing



select
	order_date,
    segment,
    category,
	gross_amount,
    sum(gross_amount) over() ttl,
    sum(gross_amount) over(order by order_date asc rows between 2 preceding and 2 following) frm
from sale;


select
	order_date,
    segment,
    category,
	gross_amount,
    sum(gross_amount) over() ttl,
    sum(gross_amount) over(order by order_date asc rows between 2 preceding and current row) frm
from sale;


select
	order_date,
    segment,
    category,
	gross_amount,
    sum(gross_amount) over() ttl,
    sum(gross_amount) over(partition by category order by order_date asc rows between current row and 2 following) frm
from sale;