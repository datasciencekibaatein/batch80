use analysis;

select
	*
from sale;


-- CTE (common table expression)

-- CTE works top to bottom.
/*
temp table

-- 
main query
which will use the temp table

*/



/*
Find the customers whose total spending are greater than the average customer spending.
*/

/*
1. Find customer spending - Group sale by customer id.
2. Find avg of total spending from first step. 
3. Find the custoemr spending again 
4. Now compare the spending of customer with avg value, came from second step
*/


-- 3RD STEP
SELECT 
	CUSTOMER_ID,
	SUM(NET_AMOUNT) SPENDING
FROM SALE
GROUP BY CUSTOMER_ID
-- 4TH STEP
HAVING SPENDING > 
(-- SECOND STEP
SELECT
	AVG(SPENDING)
FROM
-- FIRST STEP
	(SELECT 
		CUSTOMER_ID,
		SUM(NET_AMOUNT) SPENDING
	FROM SALE
	GROUP BY CUSTOMER_ID)X);






select
	*
from (
	select
	customer_id,
    customer_name,
    sum(net_amount) as total_sales
    from sale
	group by customer_id,customer_name
    
) as customer_sales
where total_sales >
	(select
		avg(total_sale)
	from 
		(select
			customer_id,
			sum(net_amount) as total_sale
		from sale
		group by customer_id)x);
        
        
        
	
    
-- 

-- temp table
with customer_sales as 
(
	select
		customer_id,
		customer_name,
		sum(net_amount) as total_sales
	from sale
	group by customer_id,customer_name
)
-- main query
select
	*
from customer_sales -- temp table
where total_sales > 
	(select 
		avg(total_sales) 
	from customer_sales);
    
    
    
    
    
    
-- TOTAL SALES BY CUSTOMERS

WITH CUSTOMER_SALES AS
(
	SELECT
		CUSTOMER_ID,
        CUSTOMER_NAME,
        SUM(NET_AMOUNT) AS TOTAL_SALE
	FROM SALE
    GROUP BY 
    CUSTOMER_ID,CUSTOMER_NAME

)
SELECT
	*
FROM CUSTOMER_SALES 
WHERE TOTAL_SALE > 1500000;






WITH CUSTOMER_SALES AS
(
	SELECT
		CUSTOMER_ID,
        CUSTOMER_NAME,
        SUM(NET_AMOUNT) AS TOTAL_SALE
	FROM SALE
    GROUP BY 
    CUSTOMER_ID,CUSTOMER_NAME

)
SELECT
	*
FROM CUSTOMER_SALES 
ORDER BY TOTAL_SALE DESC;


SELECT * FROM SALE;


WITH SALES_CALCULATED AS
(
	SELECT
		ORDER_ID,
        CUSTOMER_NAME,
        UNIT_PRICE,
        DISCOUNT_PCT,
        QUANTITY * UNIT_PRICE AS GROSS_SALE,
        ROUND(QUANTITY * UNIT_PRICE * DISCOUNT_PCT / 100,3) AS DISCOUNT_AMOUNT,
        GROSS_SALE - DISCOUNT_AMOUNT AS NET_SALE
	FROM SALE
)
SELECT 
*,
GROSS_SALE - DISCOUNT_AMOUNT AS NET_SALE
FROM SALES_CALCULATED;



-- Records - Customer Spending, that should be greater than the avg spending of the customer.


-- MULTIPLE CTE,

-- CTE 01
WITH CUSTOMER_SALES AS
(
	SELECT
		CUSTOMER_ID,
        CUSTOMER_NAME,
        SUM(NET_AMOUNT) AS TOTAL_SALE
	FROM SALE
    GROUP BY 
    CUSTOMER_ID,CUSTOMER_NAME

),
-- CTE 02
AVG_SALE AS(
	SELECT
		ROUND(AVG(TOTAL_SALE),2) AS AVG_CUSTOMER_SALE
	FROM CUSTOMER_SALES -- 1 CTE
)
-- MAIN QUERY
SELECT
	CS.CUSTOMER_ID,
    CS.CUSTOMER_NAME,
    CS.TOTAL_SALE,
    A.AVG_CUSTOMER_SALE
FROM CUSTOMER_SALES CS
CROSS JOIN AVG_SALE A
WHERE CS.TOTAL_SALE > A.AVG_CUSTOMER_SALE;
	






