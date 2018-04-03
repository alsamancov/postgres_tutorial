SELECT name, SUM (salary) FROM company GROUP BY name;

SELECT * FROM company;

INSERT INTO COMPANY VALUES (8, 'Paul', 24, 'Houston', 20000.00);
INSERT INTO COMPANY VALUES (9, 'James', 44, 'Norway', 5000.00);
INSERT INTO COMPANY VALUES (10, 'James', 45, 'Texas', 5000.00);

SELECT name, SUM (salary) FROM company GROUP BY name ORDER BY name;

SELECT name, SUM (salary) FROM company GROUP BY name ORDER BY name DESC;