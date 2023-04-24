--Select--
SELECT * FROM Customers;
SELECT City FROM Customers;
SELECT DISTINCT Country FROM Customers;
--Where--
SELECT * FROM Customers WHERE City = 'Berlin';
SELECT * FROM Customers WHERE NOT City = 'Berlin';
SELECT * FROM Customers WHERE CustomerID = 32;
SELECT * FROM Customers WHERE City = 'Berlin' AND PostalCode = 12209;
SELECT * FROM Customers WHERE City = 'Berlin' OR City = 'London';
--Order by--
SELECT * FROM Customers ORDER BY City;
SELECT * FROM Customers ORDER BY City DESC;
SELECT * FROM Customers ORDER BY Country, City;
--Insert--
INSERT INTO Customers (CustomerName, Address, City, PostalCode, Country)
	VALUES ('Hekkan Burger','Gateveien 15','Sandnes','4306','Norway');
--Update--
UPDATE Customers SET City = 'Oslo';
UPDATE Customers SET City = 'Oslo' WHERE Country = 'Norway';
--Delete--
DELETE FROM Customers WHERE Country = 'Norway';
DELETE FROM Customers;
--Like--
SELECT * FROM Customers WHERE City LIKE 'a%';
SELECT * FROM Customers WHERE City LIKE '%a';
SELECT * FROM Customers WHERE City LIKE '%a%';
SELECT * FROM Customers WHERE City LIKE 'a%b';
SELECT * FROM Customers WHERE City NOT LIKE 'a%';
--Wildcards--
SELECT * FROM CustomersWHERE City LIKE '_a%';
SELECT * FROM CustomersWHERE City LIKE '[acs]%';
SELECT * FROM CustomersWHERE City LIKE '[a-f]%';
SELECT * FROM CustomersWHERE City LIKE '[!acf]%';
--In--
SELECT * FROM Customers WHERE Country IN ('Norway','France');
SELECT * FROM Customers WHERE Country NOT IN ('Norway','France');
--Between--
SELECT * FROM Customers WHERE Price BETWEEN 10 AND 20;
SELECT * FROM Customers WHERE Price  Not BETWEEN 10 AND 20;
SELECT * FROM Customers WHERE ProductName BETWEEN 'Geitost' AND 'Pavlova';
--Alias--
SELECT CustomerName, Address, PostalCode AS Pno FROM Customers;
SELECT * FROM Customers  AS Consumers;
--Group by--
SELECT COUNT(CustomerID),Country FROM Customers GROUP BY Country;
SELECT COUNT(CustomerID),Country FROM Customers GROUP BY Country
	ORDER BY COUNT(CustomerID) DESC;
