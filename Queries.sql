-- =====================================================
-- TRAVEL BOOKING SYSTEM
-- SQL QUERIES
-- =====================================================

USE TravelBookingSystem;


-- 1. View all customer details
SELECT * FROM Customers;


-- 2. View all destination offerings
SELECT * FROM Destinations;


-- 3. List all booking records
SELECT * FROM Bookings;


-- 4. Review all payment transactions
SELECT * FROM Payments;


-- 5. Fetch only the names and emails of customers
SELECT Name, Email
FROM Customers;


-- 6. Show destination cities and their daily prices
SELECT CityName, PricePerDay
FROM Destinations;


-- 7. Find all customers living in 'Mumbai'
SELECT *
FROM Customers
WHERE City = 'Mumbai';


-- 8. List destinations that cost more than Rs. 200 per day
SELECT *
FROM Destinations
WHERE PricePerDay > 200.00;


-- 9. Find bookings for a duration of exactly 7 days
SELECT *
FROM Bookings
WHERE DurationDays = 7;


-- 10. Retrieve payments made via 'UPI'
SELECT *
FROM Payments
WHERE PaymentMethod = 'UPI';


-- 11. Find destinations located in 'France' or 'Italy'
SELECT *
FROM Destinations
WHERE Country IN ('France', 'Italy');


-- 12. List bookings scheduled after June 1, 2026
SELECT *
FROM Bookings
WHERE TravelDate > '2026-06-01';


-- 13. Find payments exceeding $1500
SELECT *
FROM Payments
WHERE Amount > 1500.00;


-- 14. Find customers whose names start with 'A'
SELECT *
FROM Customers
WHERE Name LIKE 'A%';


-- 15. List customers alphabetically by name
SELECT *
FROM Customers
ORDER BY Name ASC;


-- 16. Display destinations from most expensive to least expensive
SELECT *
FROM Destinations
ORDER BY PricePerDay DESC;


-- 17. Show the 3 most recent payments
SELECT *
FROM Payments
ORDER BY PaymentDate DESC
LIMIT 3;


-- 18. List the top 5 longest trips booked
SELECT *
FROM Bookings
ORDER BY DurationDays DESC
LIMIT 5;


-- 19. Count the total number of registered customers
SELECT COUNT(CustomerID) AS TotalCustomers
FROM Customers;


-- 20. Calculate the average price per day across all destinations
SELECT AVG(PricePerDay) AS AveragePrice
FROM Destinations;


-- 21. Calculate the total revenue generated from all payments
SELECT SUM(Amount) AS TotalRevenue
FROM Payments;


-- 22. Find the highest single payment amount
SELECT MAX(Amount) AS HighestPayment
FROM Payments;


-- 23. Find the shortest booking duration in days
SELECT MIN(DurationDays) AS ShortestDuration
FROM Bookings;


-- 24. Count how many customers are in each city
SELECT City, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY City;


-- 25. Show the number of destinations available per country
SELECT Country, COUNT(*) AS DestinationCount
FROM Destinations
GROUP BY Country;


-- 26. Calculate total revenue generated per payment method
SELECT PaymentMethod, SUM(Amount) AS TotalRevenue
FROM Payments
GROUP BY PaymentMethod;


-- 27. Find payment methods that have generated more than Rs. 2000 total
SELECT PaymentMethod, SUM(Amount) AS TotalRevenue
FROM Payments
GROUP BY PaymentMethod
HAVING SUM(Amount) > 2000;


-- 28. Calculate the average booking duration per destination ID
SELECT DestinationID, AVG(DurationDays) AS AverageDuration
FROM Bookings
GROUP BY DestinationID;


-- 29. Show booking IDs alongside the corresponding customer names
SELECT b.BookingID, c.Name
FROM Bookings b
JOIN Customers c
    ON b.CustomerID = c.CustomerID;


-- 30. Display travel dates and the destination city names
SELECT b.TravelDate, d.CityName
FROM Bookings b
JOIN Destinations d
    ON b.DestinationID = d.DestinationID;


-- 31. List all payment details along with the travel date they paid for
SELECT p.*, b.TravelDate
FROM Payments p
JOIN Bookings b
    ON p.BookingID = b.BookingID;


-- 32. Complete Itinerary:
-- Customer Name, Destination City, and Travel Date
SELECT c.Name, d.CityName, b.TravelDate
FROM Bookings b
JOIN Customers c
    ON b.CustomerID = c.CustomerID
JOIN Destinations d
    ON b.DestinationID = d.DestinationID;


-- 33. Financial Report:
-- Customer Name, Payment Method, and Amount
SELECT c.Name, p.PaymentMethod, p.Amount
FROM Payments p
JOIN Bookings b
    ON p.BookingID = b.BookingID
JOIN Customers c
    ON b.CustomerID = c.CustomerID;


-- 34. Find out which customer booked the trip to 'Paris'
SELECT c.Name
FROM Customers c
JOIN Bookings b
    ON c.CustomerID = b.CustomerID
JOIN Destinations d
    ON b.DestinationID = d.DestinationID
WHERE d.CityName = 'Paris';


-- 35. Find customers who booked a trip longer than the average trip duration
SELECT DISTINCT c.Name
FROM Customers c
JOIN Bookings b
    ON c.CustomerID = b.CustomerID
WHERE b.DurationDays > (
    SELECT AVG(DurationDays)
    FROM Bookings
);


-- 36. Find the destination details for the most expensive daily rate
SELECT *
FROM Destinations
WHERE PricePerDay = (
    SELECT MAX(PricePerDay)
    FROM Destinations
);


-- 37. Retrieve the name of the customer who made the highest single payment
SELECT c.Name
FROM Customers c
JOIN Bookings b
    ON c.CustomerID = b.CustomerID
JOIN Payments p
    ON b.BookingID = p.BookingID
WHERE p.Amount = (
    SELECT MAX(Amount)
    FROM Payments
);


-- 38. List destinations that currently have NO bookings
-- Using a subquery
SELECT *
FROM Destinations
WHERE DestinationID NOT IN (
    SELECT DestinationID
    FROM Bookings
);


-- 39. Find the second highest payment amount
-- Using OFFSET
SELECT Amount
FROM Payments
ORDER BY Amount DESC
LIMIT 1 OFFSET 1;


-- 40. Calculate total cost of all trips to 'Japan'
-- Using JOINs and aggregation
SELECT SUM(p.Amount) AS TotalJapanRevenue
FROM Payments p
JOIN Bookings b
    ON p.BookingID = b.BookingID
JOIN Destinations d
    ON b.DestinationID = d.DestinationID
WHERE d.Country = 'Japan';
