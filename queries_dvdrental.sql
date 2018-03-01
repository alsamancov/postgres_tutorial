SELECT first_name, last_name, email FROM customer;

SELECT first_name, last_name FROM customer ORDER BY first_name ASC;

SELECT first_name, last_name FROM customer ORDER BY last_name DESC;

SELECT first_name, last_name FROM customer ORDER BY first_name ASC, last_name DESC;

CREATE TABLE t1(
  id SERIAL NOT NULL PRIMARY KEY,
  bcolor VARCHAR,
  fcolor VARCHAR
);

INSERT INTO t1 (bcolor, fcolor)
VALUES
  ('red', 'red'),
  ('red', 'red'),
  ('red', NULL),
  (NULL, 'red'),
  ('red', 'green'),
  ('red', 'blue'),
  ('green', 'red'),
  ('green', 'blue'),
  ('green', 'green'),
  ('blue', 'red'),
  ('blue', 'green'),
  ('blue', 'blue');

SELECT id, bcolor, fcolor FROM t1;

SELECT DISTINCT bcolor FROM t1 ORDER BY bcolor;

SELECT DISTINCT bcolor, fcolor FROM t1 ORDER BY bcolor, fcolor;

SELECT DISTINCT ON (bcolor) bcolor, fcolor FROM t1 ORDER BY bcolor, fcolor;

SELECT last_name, first_name FROM customer WHERE first_name = 'Jamie';

SELECT last_name, first_name FROM customer WHERE first_name = 'Jamie' AND last_name = 'Rice';

SELECT customer_id, amount, payment_date FROM payment WHERE amount <= 1 OR amount >= 8 ORDER BY amount DESC;

SELECT film_id, title, release_year FROM film ORDER BY film_id LIMIT 5;

SELECT film_id, title, release_year FROM film ORDER BY film_id LIMIT 4 OFFSET 3;

SELECT film_id, title, rental_rate FROM film ORDER BY rental_rate DESC LIMIT 10;


--Introduction to PostgreSQL LIKE operator

SELECT first_name, last_name FROM customer WHERE first_name LIKE 'Jen%';

SELECT first_name, last_name FROM customer WHERE first_name LIKE '%er%';

SELECT first_name, last_name FROM customer WHERE first_name LIKE '_her%';

SELECT first_name, last_name FROM customer WHERE first_name NOT LIKE 'Jen%';

SELECT first_name, last_name FROM customer WHERE first_name ILIKE 'BAR%';



SELECT first_name, last_name FROM customer WHERE first_name ~~ 'Jen%';

SELECT first_name, last_name FROM customer WHERE first_name ~~ '%er%';

SELECT first_name, last_name FROM customer WHERE first_name ~~ '_her%';

SELECT first_name, last_name FROM customer WHERE first_name !~~ 'Jen%';

SELECT first_name, last_name FROM customer WHERE first_name ~~* 'BAR%';

--PostgreSQL IN operator syntax

--CREATE DATABASE dvdrental_test WITH TEMPLATE dvdrental;

SELECT customer_id, rental_id, return_date FROM rental WHERE customer_id IN (1, 2) ORDER BY return_date DESC;

SELECT rental_id, customer_id, return_date FROM rental WHERE customer_id = 1 OR customer_id = 2 ORDER BY return_date DESC;

SELECT customer_id, rental_id, return_date FROM rental WHERE customer_id NOT IN (1, 2);

SELECT customer_id, rental_id, return_date FROM rental WHERE customer_id <> 1 AND customer_id <> 2;

SELECT customer_id, return_date FROM rental WHERE cast(return_date AS DATE) = '2005-05-27';

SELECT first_name, last_name FROM customer WHERE customer_id IN (SELECT customer_id FROM rental WHERE cast(return_date AS DATE) = '2005-05-27');

--Introduction to the PostgreSQL BETWEEN operator

SELECT customer_id, payment_id, amount FROM payment WHERE amount BETWEEN 8 AND 9;

SELECT customer_id, payment_id, amount FROM payment WHERE amount NOT BETWEEN 8 AND 9;

SELECT customer_id, payment_id, amount, payment_date FROM payment WHERE payment_date BETWEEN '2007-02-07' AND '2007-02-15';

--Column alias

SELECT first_name || ' ' || last_name FROM customer ORDER BY first_name || ' ' || last_name;

SELECT first_name || ' ' || last_name AS full_name FROM customer ORDER BY full_name;

--Introduction to PostgreSQL INNER JOIN clause