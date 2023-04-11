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



--1 How many actors are there with the last name 'Wahlberg'?
SELECT last_name
FROM actor
WHERE last_name LIKE 'Wahlberg';
--2. How many payments were made between $3.99 and $5.99?
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--3. What film does the store have the most of? (search in inventory)
SELECT film_id, Count(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

--4. How many customers have the last name ‘William’?
SELECT COUNT(last_name)
FROM Customer
WHERE last_name LIKE 'William';

--5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT (staff_id)
FROM rental
GROUP BY staff_id

--6. How many different district names are there?
SELECT district, Count (district ) 
FROM address
GROUP BY district
ORDER BY district
--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT COUNT( actor_id),film_id
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(last_name), last_name
FROM customer
WHERE last_name LIKE 'es%'
GROUP BY last_name
HAVING COUNT(last_name) > 1;

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
SELECT customer_id AS number_rentals
FROM  payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY payment_id  
HAVING Customer_id > 250;

--10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT rating , COUNT(rating)
FROM film
GROUP BY rating
ORDER BY rating


