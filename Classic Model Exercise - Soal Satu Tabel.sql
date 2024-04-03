SHOW DATABASES;
USE classicmodels;
SHOW TABLES;
DESC offices;

# 1
SELECT officeCode, country, state, city
	FROM offices ORDER BY country, state, city;
    
# 2
SELECT COUNT(*) FROM employees;

# 3
SELECT FORMAT(SUM(amount),0) FROM payments;

# 4
SELECT productLine FROM productlines 
	WHERE productLine LIKE "%Car%";
    
# 5
SELECT FORMAT(SUM(amount),0) FROM payments
	WHERE paymentDate = '2004-10-28';

# 6
SELECT * FROM payments
	WHERE paymentDate = '2004-10-28' AND amount > 100000;

# 7
SELECT productLine, productName FROM products
	ORDER BY productLine;
    
# 8
SELECT productLine, COUNT(productName) FROM products
	GROUP BY productLine;

# 9
SELECT FORMAT(MIN(amount),0) FROM payments;

# 10 Subquery
SELECT * FROM payments
	WHERE amount > (SELECT AVG(amount)*2 AS rata FROM payments);

# 11
SELECT AVG(MSRP-buyPrice) AS rata_keuntungan FROM products;

# 12
SELECT DISTINCT productName FROM products;

# 13
SELECT customerName, city, salesRepEmployeeNumber FROM customers
	WHERE salesRepEmployeeNumber IS NULL;
    
# 14
SELECT CONCAT(firstName, " ", LastName) AS Nama, jobTitle FROM employees
	WHERE jobTitle LIKE "%VP%" OR jobTitle LIKE "%Manager%";
    
# 15
SELECT orderNumber, SUM(priceEach*quantityOrdered) AS total_order FROM orderdetails
	GROUP BY orderNumber HAVING total_order>5000;