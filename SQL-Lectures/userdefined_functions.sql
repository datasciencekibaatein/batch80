use analysis ;

select * from employee;

select 
	*,
    salary * 12 as annual_salary
from employee;


DELIMITER //
CREATE FUNCTION ANNUAL_SALARY(p_monthly_salary int)
returns int
deterministic 
No SQL
begin	
	return p_monthly_salary * 12;
end //
delimiter ;

select annual_salary(30000) as annual_salary;


select 
	*,
    annual_salary(salary) as annual_salary,
    salary_category(salary) as cat
from employee;


-- function with if else logic 

DELIMITER //
CREATE FUNCTION salary_category(p_salary int)
returns varchar(20)
deterministic
no sql
begin
	declare category varchar(20);
    
    if 
		p_salary >= 50000 THEN
		SET category = "High Salary";
	elseif  
		p_salary >= 30000 THEN
		SET category = "Medium Salary";
	else
		SET category = "Low Salary";
	END IF;
    
    RETURN category;
END //
Delimiter ;





select salary_category(40000);



DELIMITER //
CREATE FUNCTION simple_interest(principal decimal(12,2),rate decimal(5,2),years int)
returns decimal(12,2)
DETERMINISTIC
NO SQL
BEGIN 
	RETURN (principal * rate * years) / 100;
END //
DELIMITER ;


select simple_interest(1000000, 8, 3) as interest;



show function status where Db = "analysis";


show create function simple_interest;



-- Case statment




