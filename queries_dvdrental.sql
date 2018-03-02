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

-------------------------------------------------------------

--Section 4. Joining multiple tables

--Introduction to PostgreSQL INNER JOIN clause

SELECT
customer.customer_id,
first_name,
last_name,
email,
amount,
payment_date
FROM
customer
INNER JOIN
payment
ON
payment.customer_id = customer.customer_id;

SELECT
customer.customer_id,
first_name,
last_name,
email,
amount,
payment_date
FROM
customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
ORDER BY
customer.customer_id;

SELECT
customer.customer_id,
first_name,
last_name,
email,
amount,
payment_date
FROM
customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
WHERE customer.customer_id = 2;

SELECT
customer.customer_id,
customer.first_name customer_first_name,
customer.last_name customer_last_name,
customer.email,
staff.first_name staff_first_name,
staff.last_name staff_last_name,
amount,
payment_date
FROM
customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
INNER JOIN staff ON payment.staff_id = staff.staff_id;

--PostgreSQL FULL OUTER JOIN

CREATE TABLE IF NOT EXISTS departments(
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS employees(
  employee_id SERIAL PRIMARY KEY,
  employee_name VARCHAR(255),
  department_id INTEGER
);

INSERT INTO departments(department_name) VALUES ('Sales'), ('Marketing'), ('HR'), ('IT'), ('Production');

INSERT INTO employees (employee_name, department_id) VALUES ('Bette Nicholson', 1), ('Christian Gable', 1), ('Joe Swank', 2), ('Fred Costner', 3), ('Sandra Kilmer', 4), ('Julia Mcqueen', NULL );

SELECT employee_name, department_name FROM employees e FULL OUTER JOIN departments d ON d.department_id = e.department_id;

SELECT employee_name, department_name FROM employees e FULL OUTER JOIN departments d ON d.department_id = e.department_id WHERE employee_name ISNULL ;

SELECT employee_name, department_name FROM employees e FULL OUTER JOIN departments d ON d.department_id = e.department_id WHERE department_name ISNULL ;

--PostgreSQL LEFT JOIN

--To join the A table to the B table, you need to:

--Specify the columns from which you want to select data in the SELECT clause.
--Specify the left table i.e., A table where you want to get all rows, in the FROM clause.
--Specify the right table i.e., B table in the LEFT JOIN clause. In addition, specify the condition for joining two tables.

SELECT film.film_id, film.title, inventory_id FROM film LEFT JOIN inventory ON inventory.film_id = film.film_id;

SELECT film.film_id, film.title, inventory_id FROM film LEFT JOIN inventory ON inventory.film_id = film.film_id WHERE inventory.film_id ISNULL ;

--PostgreSQL NATURAL JOIN Explained By Examples

CREATE TABLE categories (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL
);

CREATE TABLE products (
  product_id SERIAL PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories (category_name) VALUES ('Smart Phone'), ('Laptop'), ('Tablet');

INSERT INTO products (product_name, category_id) VALUES ('iPhone', 1), ('Samsung Galaxy', 1), ('Hp Elite', 2), ('Lenovo Thinkpad', 2), ('iPad', 3), ('Kindle Fire', 3);

SELECT * FROM products NATURAL JOIN categories;

SELECT * FROM products INNER JOIN categories USING (category_id);

SELECT * FROM city NATURAL JOIN country;

--PostgreSQL Cross Join By Example

CREATE TABLE T1 (label CHAR(1) PRIMARY KEY);

CREATE TABLE T2 (score INT PRIMARY KEY);

INSERT INTO T1(label) VALUES ('A'), ('B');

CREATE TABLE T1 (label CHAR(1) PRIMARY KEY);

CREATE TABLE T2 (score INT PRIMARY KEY);

INSERT INTO T1 (label)
VALUES
  ('A'),
  ('B');

INSERT INTO T2 (score) VALUES (1), (2), (3);

SELECT * FROM t1 CROSS JOIN t2;

----------------------------------

--Section 5. Grouping data

SELECT * FROM payment;

SELECT customer_id FROM payment GROUP BY customer_id;

SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id;

SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC;

SELECT staff_id, COUNT(payment_id) FROM payment GROUP BY staff_id;

--https://www.youtube.com/watch?v=ZgS6dPamOKQ&index=9&list=PLi3gxGWPyGGQOBAp-n-zWaj6QZeFtXLHh

--https://www.youtube.com/watch?v=yT6ueNCqWcs&list=PLk1kxccoEnNEtwGZW-3KAcAlhI_Guwh8x&index=2
SELECT SUM(amount) FROM payment GROUP BY staff_id;

