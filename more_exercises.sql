-- MORE EXERCISES

-- SELECT statements

SHOW databases;

USE sakila;

-- a.
SELECT * 
FROM actor;

-- b.
SELECT last_name
FROM actor;

-- C.
SELECT film_id, title, release_year
FROM film;

-- DISTINCT operator
-- a.
SELECT DISTINCT last_name
FROM actor;

-- b.
SELECT DISTINCT postal_code
FROM address;

-- c.
SELECT DISTINCT rating
FROM film;

-- WHERE clause
-- a.
SELECT title, description, rating, length
FROM film
WHERE length >= 180;

-- b.
SELECT payment_id, amount, payment_date, last_update
FROM payment
WHERE payment_date BETWEEN '2005-05-27' AND NOW();

-- c.
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date LIKE '2005-05-27%';

-- d.
SELECT *
FROM customer 
WHERE last_name LIKE 'S%' AND first_name LIKE '%N';

-- e.
SELECT * 
FROM customer
WHERE LEFT(last_name, 1) = 'M' AND active = '0';

-- f.
SELECT *
FROM category c
WHERE c.category_id > 4 AND LEFT(c.name ,1) IN ('C', 'S', 'T');

-- g.
describe staff;

SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update
FROM staff
WHERE password IS NOT NULL;

-- h.
SELECT staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_name
FROM staff
WHERE password IS NULL;


-- IN operator
-- a.
SELECT phone, district
FROM address
WHERE district IN ('California', 'England', 'Taipei', 'West Java');

-- b. 
SELECT payment_id, amount, payment_date
FROM payment
WHERE date(payment_date) IN ('2005-05-25', '2005-05-27', '2005-05-29');

-- c.
SELECT *
FROM film
WHERE rating IN ('G', 'PG-13', 'NC-17');

-- BETWEEN operator
-- a.
SELECT *
from payment
WHERE payment_date BETWEEN '2005-05-25 11:59:59' AND '2005-05-26 11:59:59';

-- b.
SELECT film_id, title, description
FROM film
WHERE length BETWEEN 100 AND 120;

-- LIKE operator
-- a.
SELECT *
FROM film
WHERE description LIKE 'A Thoughtful%';

-- b.
SELECT *
FROM film
WHERE RIGHT(description, 4) IN ('Boat');

-- c.
SELECT *
FROM film
WHERE description LIKE '%Database%' AND length > 180;

-- LIMIT Operator
-- a.
SELECT *
FROM payment
LIMIT 20;

-- b.
SELECT payment_date, amount
FROM payment
WHERE amount > '5.00'
LIMIT 2000 OFFSET 999;

-- c.
SELECT *
FROM customer
LIMIT 200 OFFSET 100;

-- ORDER BY statements
-- a.
SELECT * 
FROM film
ORDER BY length;

-- b.
SELECT DISTINCT rating 
FROM film
ORDER BY rating DESC;

-- c.
SELECT payment_date, amount
FROM payment
ORDER BY amount DESC
limit 20;

-- d. 
SELECT title, description, special_features, length, rental_duration
FROM film
WHERE special_features LIKE '%behind%' AND length < 120 AND rental_duration BETWEEN 5 AND 7
ORDER BY length DESC
LIMIT 10;

-- JOIN statements
-- a 
SELECT a.first_name AS actor_first_name , a.last_name AS actor_last_name, c.first_name AS customer_first_name, c.last_name AS customer_last_name
FROM customer c
LEFT JOIN actor a
ON c.last_name= a.last_name;

-- b
SELECT c.first_name, c.last_name, a.first_name, a.last_name
FROM customer c
RIGHT JOIN actor a
ON c.last_name = a.last_name;

select * from actor;
select * from customer;

-- c
SELECT c.first_name, c.last_name, a.first_name, a.last_name
FROM customer c
JOIN actor a
ON c.last_name = a.last_name;

-- d 
SELECT c.city_id, c.country_id, co.country_id
FROM country co
LEFT JOIN city c
ON co.country_id = c.country_id;

-- e 
SELECT f.title, f.description, f.release_year, f.language_id, l.language_id, l.name AS language_name
FROM film f
LEFT JOIN language l 
ON l.language_id = f.language_id;

-- f
SELECT s.first_name, s.last_name, a.address, a.address2, c.city, a.district 
FROM staff s
LEFT JOIN address a
ON a.address_id = s.address_id
LEFT JOIN city c
USING(city_id);

-- MORE_EXERCISES cont

-- 1.
USE SAKILA;

SELECT LOWER(first_name), LOWER(last_name)
FROM actor;


-- 2
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Joe';

-- 3
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%gen%';

-- 4 
SELECT last_name, first_name
FROM actor
WHERE last_name LIKE '%li%'
ORDER BY last_name, first_name;

-- 5
SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- 6
SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name;

-- 7 HAVING STATEMENT USED TO PUT CONDITIONS ON A GROUP BY CLAUSE
SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;

-- 8
DESCRIBE address;

-- 9
SELECT first_name, last_name, address
FROM staff s
JOIN address a
USING (address_id);

-- 10
SELECT SUM(amount), first_name, payment_date
FROM staff
JOIN payment
USING (staff_id)
JOIN inventory
USING (store_id)
WHERE payment_date LIKE ('2005-08%')
GROUP BY first_name, amount, payment_date
order BY first_name
LIMIT 10;

-- 11
SELECT DISTINCT(title), COUNT(actor_id)
FROM film
JOIN film_actor
USING (film_id);