WORLD Questions

SELECT name FROM country WHERE continent = 'South America';
SELECT population FROM country WHERE name = 'Germany';
SELECT city.name FROM city JOIN country ON city.countrycode = country.code WHERE country.name = 'Japan';
SELECT name, population FROM country WHERE continent = 'Africa' ORDER BY population DESC LIMIT 3;
SELECT name, lifeexpectancy FROM country WHERE population BETWEEN 1000000 AND 5000000;
SELECT country.name FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.language = 'French' AND countrylanguage.isofficial = 'T';

Chinook Questions

SELECT Album.Title FROM Album JOIN Artist ON Album.ArtistId = Artist.ArtistId WHERE Artist.Name = 'AC/DC';
SELECT FirstName, LastName, Email FROM Customer WHERE Country = 'Brazil';
SELECT Name FROM Playlist;
SELECT COUNT(*) FROM Track JOIN Genre ON Track.GenreId = Genre.GenreId WHERE Genre.Name = 'Rock';
SELECT e.FirstName, e.LastName FROM Employee e JOIN Employee manager ON e.ReportsTo = manager.EmployeeId WHERE manager.FirstName = 'Nancy' AND manager.LastName = 'Edwards';
SELECT c.FirstName, c.LastName, SUM(i.Total) AS TotalSales FROM Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId GROUP BY c.CustomerId, c.FirstName, c.LastName ORDER BY TotalSales DESC;
CREATE your own database
1
CREATE DATABASE ewu3wx; USE ewu3wx;
2
CREATE TABLE Meals ( MealID INT AUTO_INCREMENT PRIMARY KEY, MealName VARCHAR(255) NOT NULL, Description TEXT, Price DECIMAL(10, 2), Stock INT -- Number of available servings );
CREATE TABLE Customers ( CustomerID INT AUTO_INCREMENT PRIMARY KEY, FirstName VARCHAR(100), LastName VARCHAR(100), Email VARCHAR(255) UNIQUE, PhoneNumber VARCHAR(15));
CREATE TABLE Orders ( OrderID INT AUTO_INCREMENT PRIMARY KEY, CustomerID INT, MealID INT, Quantity INT, OrderDate DATE, FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID), FOREIGN KEY (MealID) REFERENCES Meals(MealID) );
3
INSERT INTO Meals (MealName, Description, Price, Stock) VALUES ('Spaghetti Bolognese', 'Classic Italian pasta with a rich meat sauce', 12.99, 50), ('Grilled Chicken Salad', 'Fresh salad with grilled chicken, avocado, and vinaigrette', 9.99, 30), ('Beef Burger', 'Juicy beef burger with lettuce, tomato, and cheese', 10.99, 40);
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber) VALUES ('Alice', 'Brown', 'alice.brown@example.com', '1234567890'), ('Bob', 'Johnson', 'bob.johnson@example.com', '0987654321');
INSERT INTO Orders (CustomerID, MealID, Quantity, OrderDate) VALUES (1, 1, 2, '2024-09-01'), (2, 3, 1, '2024-09-02');
4
SELECT * FROM Meals;
SELECT DISTINCT Customers.FirstName, Customers.LastName FROM Customers JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
SELECT Meals.MealName, SUM(Orders.Quantity) AS TotalOrdered FROM Meals JOIN Orders ON Meals.MealID = Orders.MealID GROUP BY Meals.MealName;
