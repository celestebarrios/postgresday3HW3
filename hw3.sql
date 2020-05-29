--(1)List all customers who live in Texas(use JOINS)
SELECT first_name, last_name, address.district , address.address_id
FROM customer
JOIN address 
ON customer.address_id =address.address_id
WHERE address.district = 'Texas';
--AA (4)
SELECT country.country_id, city.city_id, address.city_id, customer.first_name, customer.last_name
FROM country
JOIN city ON city.country_id = country.country_id
JOIN address ON address.city_id = city.city_id
JOIN customer ON address.city_id = address.city_id
WHERE country = 'Nepal';
-- AA5. Which staff member had the most transactions?
SELECT COUNT(rental_id), first_name, last_name
FROM rental
JOIN staff ON staff.staff_id = rental.staff_id
GROUP BY rental.staff_id
ORDER BY COUNT(rental.staff_id) DESC LIMIT 1;
--J(5)
SELECT first_name, last_name, email,COUNT(payment.staff_id) AS Highest_Selling
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY COUNT(payment.staff_id) DESC
LIMIT 1;
--slack (4)
SELECT first_name, last_name, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';








--(2)Get all payments above 6.99 with the Customer's fullname
SELECT amount,customer.first_name, customer.last_name 
FROM payment 
JOIN customer ON payment.customer_id = customer.customer_id 
WHERE amount>6.99;

SELECT amount, first_name, last_name
FROM payment, customer
WHERE amount > 6.99;

--(3)Show all customers names who have made payments over 175
SELECT customer.first_name, customer.last_name
FROM customer
	WHERE customer.customer_id IN(
	SELECT payment.customer_id
	FROM payment
	GROUP BY payment.customer_id
	HAVING SUM(payment.amount) > 175
);

-- AA6. How many movies of each rating are there?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY count DESC;
-- 223 PG-13, 210 NC-17, 195 R, 194 PG and 178 G-rated movies.
-- A7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT customer.first_name, customer.last_name
FROM customer
WHERE customer.customer_id IN (
	SELECT payment.customer_id
	FROM payment
	GROUP BY payment.customer_id
	HAVING SUM(payment.amount) > 6.99
);
--8
SELECT COUNT(payment.amount)
FROM payment
WHERE payment.amount = 0;





--(4)List all customers that live in Nepal(use the city table)
SELECT 
FROM country
WHERE country.country_id IN (
	SELECT country_id
	FROM 
)







--(5)Which staff member had the most transactions?
SELECT COUNT(rental_id)
FROM rental
JOIN staff ON rental.staff_id = staff.staff_id
GROUP BY rental.staff_id;






--(6)How many movies of each rating are there?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating;

--(7)Show all customers who have made a single payment above 6.99
SELECT customer.customer_id
FROM customer
	WHERE customer.customer_id IN(
		SELECT customer.customer_id
		FROM payment
		GROUP BY  customer.customer_id
		HAVING SUM(payment.amount)>6.99
);
--(8)How many free rentals did our store give away?
SELECT COUNT(rental.rental_id)
FROM rental
JOIN payment ON payment.rental_id = rental.rental_id
WHERE payment.amount = 0;
