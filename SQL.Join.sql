/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */
 select products.Name as "Product Name", categories.Name as "Category Name"
 from products
 JOIN	categories on products.CategoryID = categories.CategoryID
 where categories.Name = 'computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select products.Name, products.Price, reviews.Rating
 from products
 inner join reviews 
 on products.ProductID = reviews.ProductID
 where reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select sales.EmployeeID, employees.FirstName, employees.LastName, sum(sales.Quantity) as "Total"
from sales
join employees on employees.EmployeeID = sales.EmployeeID
group by sales.EmployeeID
order by total desc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select categories.Name, departments.Name
from categories
inner join departments
on categories.DepartmentID = departments.DepartmentID
Where categories.Name = "Appliances" OR categories.Name = "Game";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name as "Product Name",
SUM(sales.Quantity) as "Total Units Sold",
SUM(sales.Quantity * sales.PricePerUnit) as "How much money made"
FROM products
INNER JOIN sales
ON products.ProductID = sales.ProductID
WHERE products.Name LIKE "%Hotel%California"
GROUP BY products.Name;


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
from products
inner join reviews
on products.ProductID = reviews.ProductID
where products.Name like "%Visio%" AND reviews.rating = (SELECT MIN(rating) from reviews); 

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

select employees.FirstName, employees.LastName, employees.EmployeeID, products.Name as "Product Name", sum(sales.Quantity) 
from employees
inner join sales
on	employees.EmployeeID = sales.EmployeeID
inner join products
on sales.ProductID = products.ProductID
group by employees.EmployeeID, products.ProductID
order by employees.EmployeeID;


