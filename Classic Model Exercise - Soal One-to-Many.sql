SHOW DATABASES;
USE classicmodels;
SHOW TABLES;

# 1
SELECT customerName, CONCAT(firstName," ",lastName) AS employeeName
	FROM customers JOIN employees ON
	salesRepEmployeeNumber = employeeNumber;
    
# 2
SELECT customerName,SUM(amount) FROM customers JOIN payments
	USING (customerNumber) WHERE customerName = 'Atelier Graphique';

# 3
SELECT paymentDate, SUM(amount) AS tota_per_day FROM payments
	GROUP BY paymentDate;
    
# 4
SELECT productName FROM products
	WHERE productCode NOT IN (
    SELECT DISTINCT productCode FROM orderdetails);
	# Or
SELECT productCode, productName, orderNumber FROM products
	LEFT JOIN orderdetails USING (productCode)
	WHERE orderNumber IS NULL;
    
# 5
SELECT customerNumber, customerName, SUM(amount) FROM customers
	JOIN payments USING (customerNumber)
	GROUP BY customerNumber;

# 6
SELECT COUNT(*) AS jumlah_order FROM customers
	JOIN orders USING (customerNumber)
    WHERE customerName = 'Herkku Gifts';
    
# 7
SELECT CONCAT(firstName, " ", lastName) AS Employees_Name FROM employees
	JOIN offices USING (officeCode)
    WHERE city = 'Boston';
    
# 8
SELECT customerName, amount FROM customers
	JOIN payments USING (customerNumber)
    WHERE amount > 100000
    ORDER BY amount DESC;
    
# 9
SELECT orderNumber, SUM(quantityOrdered*priceEach) AS Nilai_Order
FROM orderdetails JOIN orders
USING (orderNumber) WHERE status = 'On Hold'
GROUP BY orderNumber;

# 10
SELECT customerName, status FROM customers JOIN orders
	USING (customerNumber) WHERE status = 'On Hold';

# Displaying number of orders
SELECT customerName, COUNT(*) AS Status_On_Hold
	FROM customers JOIN orders USING (customerNumber)
	WHERE status = 'On Hold' GROUP BY customerName;