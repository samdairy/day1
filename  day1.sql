-- Basic select all query to pull all records from the actor table
SELECT *
FROM actor;

-- SELECT * 
-- FROM address;

-- Query for First Name and last name from the actor table
SELECT last_name, first_name
FROM actor;

--Query for a first_name that equals Nick using the WHERE clause
SELECT first_name, last_name
FROM actor
WHERE first_name in ('Nick', 'nick');

--Query for first_name that is equal to Nick using the LIKE and WHERE clauses
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'John%';

-- % wildcard <-- holds the place of anythign that could populate that spot
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- __ <-- holds the place of possible letters 
SELECT *
FROM actor
WHERE first_name LIKE 'K__';

--Query for all first_name data that starts with a K and ends with th
-- using the LIKE and WHERE clauses -- using Both wildcard and underscore

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%___';

--Comparing Operators
-- Greater Than > Less Than <
-- Great Than or equal to >=
-- Less than or equal to <=
-- Not equal <>

--Query to view all data in payment table
SELECT *
FROM payment;

-- Query for data that shows customers who paid
-- an amount greater than $2.00 for a rental
SELECT customer_id, amount
FROM payment
WHERE amount > 2.00;

--Query for customers who paid
-- under 7.99 
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

-- Amounts less than or equal to 5.99
SELECT customer_id, amount
FROM payment
WHERE amount <= 5.99;

-- Amounts greater than 7.99
SELECT amount, customer_id
FROM payment
WHERE amount >= 7.99;

--Query for data that shows customers who paid
-- an amount GREATER than or EQUAL to 2.99
-- in ascending order
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.99
ORDER BY amount ASC; 
-- ORDBER BY defaults to ascending order
--ASC ascending
--DESC descending

--Query for all amounts between
-- 7.99 and 9.99
-- using WHERE and BETWEEN
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 7.99 AND 9.99;


--Query for data that shows customers who paid
--an amount NOT EQUAL to 5.99
-- in descending order
SELECT customer_id, amount
FROM payment
WHERE amount <> 5.99
ORDER BY amount DESC;

-- SQL AGGREGATIONS --> SUM(), AVG(), COUNT(), MAX(), MIN()
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

--Query to display the average amounts that are great than 5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

--Query to display the count of amounts paid greater than 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- DISTINCT returns unique instances
--using DISTINC(column name)
-- Find the number of unique payment amounts over 5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

--Query to display the min amount greater than 7.99
SELECT MIN(amount) AS Min_Num_Payments
FROM payment
WHERE amount > 7.99;

--Query to display the max amount greater than 7.99
SELECT MAX(amount) AS max_num_payments
FROM payment
WHERE amount > 7.99;

--Query to display all amounts equal to 7.99
SELECT amount
FROM payment
WHERE amount = 7.99;

--GROUP BY
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

-- How much each customer id has paid for rentals
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC;


SELECT *
FROM customer;

SELECT COUNT(first_name), first_name
FROM customer
WHERE first_name LIKE 'J%'
GROUP BY first_name
HAVING COUNT(first_name) > 1;



