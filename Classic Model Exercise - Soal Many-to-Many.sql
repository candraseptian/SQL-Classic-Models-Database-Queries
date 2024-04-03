SHOW DATABASES;
USE classicmodels;
SHOW TABLES;

# 1
SELECT orderDate, productName FROM products
	JOIN orderdetails USING(productCode)
    JOIN orders USING(orderNumber)
    ORDER BY orderDate;
    
# 2
SELECT orderNumber, orderDate, productName FROM products
	JOIN orderdetails USING(productCode)
    JOIN orders USING(orderNumber)
    WHERE productName = '1940 Ford Pickup Truck';
    
# 3
SELECT customerName, orderNumber, SUM(quantityOrdered*priceEach) AS Nilai_Order
	FROM customers JOIN orders USING(customerNumber)
	JOIN orderdetails USING(orderNumber)
	GROUP BY orderNumber
	HAVING Nilai_order > 25000;

# 4
SELECT productCode, COUNT(*) AS banyak FROM orderdetails
	GROUP BY productCode HAVING banyak = (
SELECT COUNT(*) FROM orders);

# 5
SELECT orderNumber, productName, priceEach, MSRP FROM products
	JOIN orderdetails USING (productCode)
    JOIN orders USING (orderNumber)
    WHERE priceEach < MSRP;
    
# 6
SELECT productName, priceEach-buyPrice AS Profit, buyPrice
	FROM products JOIN orderdetails USING (productCode)
    WHERE priceEach-buyPrice > buyPrice;
    
# 6
SELECT DAYNAME(orderDate), productName FROM products
	JOIN orderdetails USING (productCode)
    JOIN orders USING (orderNumber)
    WHERE DAYOFWEEK(orderDate) = 2;
    
# 7
SELECT SUM(quantityOrdered) AS Total
	FROM orderdetails JOIN orders USING (orderNumber)
    WHERE status = 'On Hold';