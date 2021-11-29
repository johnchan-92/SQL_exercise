/* SQL Exercise
====================================================================
We will be working with database northwind.db we have set up and connected to in the activity Connect to Remote PostgreSQL Database earlier.


-- MAKE YOURSELF FAIMLIAR WITH THE DATABASE AND TABLES HERE





--==================================================================
/* TASK I
-- Q1. Write a query to get Product name and quantity/unit.
*/
SELECT productname, quantityperunit FROM products

/* TASK II
Q2. Write a query to get the most expensive and the least expensive Product (name and unit price) (2 separate queries)
*/
SELECT productname, unitprice FROM products order by unitprice LIMIT 1
SELECT productname, unitprice FROM products order by unitprice desc LIMIT 1

/* TASK III
Q3. Write a query to count current and discontinued products.
*/
SELECT count(discontinued) FROM products 

/* TASK IV
Q4. Select all product names and their category names (77 rows)
*/
SELECT a.ProductName, b.categoryname 
FROM products a
left JOIN categories b
on a.categoryid = b.categoryid

/* TASK V
Q5. Select all product names, unit price and the supplier region that don't have suppliers from the country USA. (65 rows)
*/
SELECT a.ProductName, a.unitprice, b.region
from products a
left join suppliers b
on a.supplierid = b.supplierid
where country != 'USA'

/* TASK VI
Q6. Get the total quantity of orders sold.( 51317)
*/
SELECT sum(quantity)
from order_details

/* TASK VII
Q7. Get the total quantity of orders sold for each order.(830 rows)
*/
SELECT orderID, sum(quantity)
from order_details
group by orderid

/* TASK VIII
Q8. Get the number of employees who have been working more than 5 year in the company. (9 rows)
*/
SELECT count(lastname)
from employees
where CURRENT_DATE - hiredate > 5