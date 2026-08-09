use store;

-- Frame

/*
A frame is subset of rows used by the window function for the current row.
*/

-- =======================================
--             **ROWS**
-- =======================================

select
	sale_id,
    order_date,
    payment_mode,
    quantity
from sales;



-- Rows between current row and current row

select
	sale_id,
    order_date,
    payment_mode,
    quantity,
    sum(quantity) over(order by order_date rows between current row and current row) current_row
from sales;

-- rows between 2 preceding and current row
select
	sale_id,
    order_date,
    payment_mode,
    quantity,
    sum(quantity) over(order by order_date rows between 2 preceding and current row) current_row
from sales;
-- rows between current row and 2 following
select
	sale_id,
    order_date,
    payment_mode,
    quantity,
    sum(quantity) over(order by order_date rows between current row and 3 following) current_row
from sales;
-- rows between unbounded preceding and current row
select
	sale_id,
    order_date,
    payment_mode,
    quantity,
    sum(quantity) over(order by order_date rows between unbounded preceding  and current row) current_row
from sales;
-- rows between current row and unbounded following
select
	sale_id,
    order_date,
    payment_mode,
    quantity,
    sum(quantity) over(order by order_date rows between current row and unbounded following) current_row
from sales;
-- rows between unbounded preceding and unbounded following
select
	sale_id,
    order_date,
    payment_mode,
    quantity,
    sum(quantity) over(order by order_date rows between unbounded preceding and unbounded following) current_row
from sales;

-- =======================================
--             **RANGE**
-- =======================================



-- range between current row and current row

select
	sale_id,
    order_date,
    payment_mode,
    quantity,
    sum(quantity) over(order by order_date range between current row and current row) current_row
from sales;

-- range between 2 preceding and current row
select
	sale_id,
    order_date,
    payment_mode,
    quantity,
    sum(quantity) over(order by quantity range between 2 preceding and current row) current_row
from sales;


-- range between current row and 2 following
select
	sale_id,
    order_date,
    payment_mode,
    quantity,
    sum(quantity) over(order by quantity range between current row and 3 following) current_row
from sales;
-- range between unbounded preceding and current row
select
	sale_id,
    order_date,
    payment_mode,
    quantity,
    sum(quantity) over(order by quantity range between unbounded preceding  and current row) current_row
from sales;
-- range between current row and unbounded following
select
	sale_id,
    order_date,
    payment_mode,
    quantity,
    sum(quantity) over(order by quantity range between current row and unbounded following) current_row
from sales;
-- range between unbounded preceding and unbounded following
select
	sale_id,
    order_date,
    payment_mode,
    quantity,
    sum(quantity) over(order by quantity range between unbounded preceding and unbounded following) current_row
from sales;






