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