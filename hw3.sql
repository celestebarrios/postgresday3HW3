--(1)List all customers who live in Texas(use JOINS)
SELECT customer.customer_id, first_name, last_name, city.city_id
FROM city
FULL JOIN customer
ON city.city_id = customer.customer_id
WHERE city.city LIKE 'Texas';
--(2)Get all payments above 6.99 with tthe Customer's fullname
SELECT amount, last_name, first_name
FROM payment, customer
WHERE amount > 6.99;
--(3)Show all customers names who have made payments over 175
SELECT SUM(amount), last_name, first_name, customer_id
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY BY SUM(amount) DESC;

--(4)List all customers that live in Nepal(use the city table)
SELECT *
FROM city
WHERE country_id IN (
	SELECT country_id
	FROM 
)
--(5)Which staff member had the most transactions?
--(6)How many movies of each rating are there?
--(7)SHow all customers who have made a single payment above 6.99
--(8)How many free rentals did our store give away?
SELECT *
FROM rentals(
	GROUP BY
	HAVING
)