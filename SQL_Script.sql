CREATE DATABASE uber_ride_analytics;
USE uber_ride_analytics;
CREATE TABLE bookings (
    Booking_ID VARCHAR(50),
    Calendar_ID VARCHAR(50),
    Customer_ID VARCHAR(50),
    Vehicle_ID VARCHAR(50),
    Pickup_Location_ID VARCHAR(50),
    Drop_Location_ID VARCHAR(50),
    Payment_ID VARCHAR(50),
    Booking_Status VARCHAR(50),
    Booking_Value DECIMAL(12,2),
    Ride_Distance DECIMAL(10,2),
    Avg_VTAT DECIMAL(10,2),
    Avg_CTAT DECIMAL(10,2),
    Driver_Rating DECIMAL(3,2)
);

CREATE TABLE customers (
    Customer_ID VARCHAR(50),
    Customer_Rating DECIMAL(3,2)
);

CREATE TABLE calendar (
    Date DATE,
    Calendar_ID VARCHAR(50),
    Day INT,
    Month INT,
    Month_Name VARCHAR(20),
    Quarter INT,
    Year INT,
    Weekday VARCHAR(20),
    Weekend_Flag BOOLEAN
);

CREATE TABLE vehicles (
    Vehicle_ID VARCHAR(50),
    Vehicle_Type VARCHAR(50)
);

CREATE TABLE locations (
    Location_ID VARCHAR(50),
    Location_Name VARCHAR(100)
);

CREATE TABLE payments (
    Payment_ID VARCHAR(50),
    Payment_Method VARCHAR(50)
);

CREATE TABLE cancellation (
    Booking_ID VARCHAR(50),
    Cancelled_By_Customer INT,
    Customer_Cancellation_Reason VARCHAR(255),
    Cancelled_By_Driver INT,
    Driver_Cancellation_Reason VARCHAR(255),
    Incomplete_Rides INT,
    Incomplete_Rides_Reason VARCHAR(255)
);

SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';

# Import Bookings:
LOAD DATA LOCAL INFILE "C:/Users/HP/Documents/Documents/SQL/Portfolio Project/Relational_Tables/Bookings.csv"
INTO TABLE bookings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# Import customers:
LOAD DATA LOCAL INFILE "C:/Users/HP/Documents/Documents/SQL/Portfolio Project/Relational_Tables/Customers.csv"
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# Import Calendar:
LOAD DATA LOCAL INFILE "C:/Users/HP/Documents/Documents/SQL/Portfolio Project/Relational_Tables/Calendar.csv"
INTO TABLE calendar
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


# Import Vehicles:
LOAD DATA LOCAL INFILE "C:/Users/HP/Documents/Documents/SQL/Portfolio Project/Relational_Tables/Vehicles.csv"
INTO TABLE vehicles
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# Import Locations:
LOAD DATA LOCAL INFILE "C:/Users/HP/Documents/Documents/SQL/Portfolio Project/Relational_Tables/Locations.csv"
INTO TABLE locations
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# Import Payments:
LOAD DATA LOCAL INFILE "C:/Users/HP/Documents/Documents/SQL/Portfolio Project/Relational_Tables/Payments.csv"
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# Import Concellation:
LOAD DATA LOCAL INFILE "C:/Users/HP/Documents/Documents/SQL/Portfolio Project/Relational_Tables/Cancellation.csv"
INTO TABLE cancellation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from bookings;
select * from customers;
select * from calendar;
select * from vehicles;
select * from locations;
select * from payments;
select * from cancellation;

# Business-Related Questions:

# How many total bookings were made?
SELECT COUNT(DISTINCT Booking_ID) AS Total_Bookings
FROM bookings;


# How many bookings were successful, cancelled by customers, cancelled by drivers, or incomplete?
SELECT Booking_Status,
    COUNT(DISTINCT Booking_ID) AS Total_Bookings
FROM bookings
GROUP BY Booking_Status
ORDER BY Total_Bookings DESC;


# What is the overall booking success rate?
SELECT ROUND(COUNT(DISTINCT CASE 
            WHEN Booking_Status = 'Completed' THEN Booking_ID 
        END) * 100.0
        / COUNT(DISTINCT Booking_ID),
        2) AS Booking_Success_Rate_Percent
FROM bookings;


# What is the total booking revenue?
SELECT
    ROUND(SUM(Booking_Value), 2) AS Total_Booking_Revenue
FROM bookings;


# What is the average booking value?
SELECT ROUND(AVG(Booking_Value), 2) AS Average_Booking_Value
FROM bookings;


# What is the total ride distance?
SELECT
    ROUND(SUM(Ride_Distance), 2) AS Total_Successful_Ride_Distance
FROM bookings
WHERE Booking_Status = 'Completed';


# What is the average ride distance per booking?
SELECT
    ROUND(AVG(Ride_Distance), 2) AS Average_Ride_Distance_Per_Booking
FROM bookings;


# Which vehicle type has the highest number of bookings?
SELECT v.Vehicle_Type,
    COUNT(DISTINCT b.Booking_ID) AS Total_Bookings
FROM bookings AS b
JOIN vehicles AS v
ON b.Vehicle_ID = v.Vehicle_ID
GROUP BY v.Vehicle_Type
ORDER BY Total_Bookings DESC
LIMIT 1;


# Which payment method is most commonly used?
SELECT p.Payment_Method,
    COUNT(DISTINCT b.Booking_ID) AS Total_Bookings
FROM bookings AS b
JOIN payments AS p
ON b.Payment_ID = p.Payment_ID
GROUP BY p.Payment_Method
ORDER BY Total_Bookings DESC
LIMIT 1;


# Time-based Analysis:
# How does booking volume vary by month?
WITH Monthly_Bookings AS (SELECT
        c.Year, c.Month, c.Month_Name,
        COUNT(DISTINCT b.Booking_ID) AS Total_Bookings
    FROM bookings AS b
    JOIN calendar AS c
	ON b.Calendar_ID = c.Calendar_ID
    GROUP BY c.Year, c.Month, c.Month_Name)
SELECT Year, Month, Month_Name,
    Total_Bookings,
    LAG(Total_Bookings) OVER (
        ORDER BY Year, Month
    ) AS Previous_Month_Bookings
FROM Monthly_Bookings
ORDER BY Year, Month;


# Which day of the week has the highest booking volume?
SELECT c.Weekday,
    COUNT(DISTINCT b.Booking_ID) AS Total_Bookings
FROM bookings AS b
JOIN calendar AS c
ON b.Calendar_ID = c.Calendar_ID
GROUP BY c.Weekday
ORDER BY Total_Bookings DESC
LIMIT 1;


# Which quarter generates the highest revenue?
SELECT c.Year, c.Quarter,
    ROUND(SUM(b.Booking_Value), 2) AS Total_Revenue
FROM bookings AS b
JOIN calendar AS c
ON b.Calendar_ID = c.Calendar_ID
GROUP BY c.Year, c.Quarter
ORDER BY Total_Revenue DESC;


# What is the monthly revenue trend?
SELECT c.Year, c.Month, c.Month_Name,
    ROUND(SUM(b.Booking_Value), 2) AS Monthly_Booking_Value
FROM bookings AS b
JOIN calendar AS c
ON b.Calendar_ID = c.Calendar_ID
GROUP BY c.Year, c.Month, c.Month_Name
ORDER BY c.Year, c.Month;


# Vehicle Analysis:
# Which vehicle type generates the highest revenue?
SELECT v.Vehicle_Type,
    ROUND(SUM(b.Booking_Value), 2) AS Total_Booking_Value
FROM bookings AS b
JOIN vehicles AS v
ON b.Vehicle_ID = v.Vehicle_ID
GROUP BY v.Vehicle_Type
ORDER BY Total_Booking_Value DESC;


# Which vehicle type has the highest average booking value?
SELECT v.Vehicle_Type,
    ROUND(AVG(b.Booking_Value), 2) AS Average_Booking_Value
FROM bookings AS b
JOIN vehicles AS v
ON b.Vehicle_ID = v.Vehicle_ID
GROUP BY v.Vehicle_Type
ORDER BY Average_Booking_Value DESC;


# Which vehicle type has the highest average ride distance?
SELECT v.Vehicle_Type,
    ROUND(AVG(b.Ride_Distance), 2) AS Average_Ride_Distance
FROM bookings AS b
JOIN vehicles AS v
ON b.Vehicle_ID = v.Vehicle_ID
GROUP BY v.Vehicle_Type
ORDER BY Average_Ride_Distance DESC
LIMIT 1;


# Rank vehicle types by revenue within each month.
SELECT c.Year, c.Month, c.Month_Name, v.Vehicle_Type,
    ROUND(SUM(b.Booking_Value), 2) AS Total_Booking_Value,
    RANK() OVER (PARTITION BY c.Year, c.Month
        ORDER BY SUM(b.Booking_Value) DESC
    ) AS Revenue_Rank
FROM bookings AS b
JOIN vehicles AS v
ON b.Vehicle_ID = v.Vehicle_ID
JOIN calendar AS c
ON b.Calendar_ID = c.Calendar_ID
GROUP BY c.Year, c.Month, c.Month_Name, v.Vehicle_Type
ORDER BY c.Year, c.Month, Revenue_Rank;


# Calculate each vehicle type's percentage contribution to total revenue.
SELECT v.Vehicle_Type,
    ROUND(SUM(b.Booking_Value), 2) AS Total_Revenue,
    ROUND(SUM(b.Booking_Value) * 100.0
        / SUM(SUM(b.Booking_Value)) OVER (), 2
    ) AS Revenue_Contribution_Percent
FROM bookings b
JOIN vehicles v
ON b.Vehicle_ID = v.Vehicle_ID
GROUP BY v.Vehicle_Type
ORDER BY Total_Revenue DESC;


# Which vehicle types have the highest cancellation rates?
WITH Vehicle_Cancellation AS (
    SELECT v.Vehicle_Type,
        COUNT(DISTINCT b.Booking_ID) AS Total_Bookings,
        COUNT(DISTINCT CASE
            WHEN b.Booking_Status IN ('Cancelled by Customer', 'Cancelled by Driver')
            THEN b.Booking_ID
        END) AS Cancelled_Bookings
    FROM bookings AS b
    JOIN vehicles AS v
	ON b.Vehicle_ID = v.Vehicle_ID
    GROUP BY v.Vehicle_Type)
SELECT Vehicle_Type, Total_Bookings, Cancelled_Bookings,
    ROUND(Cancelled_Bookings * 100.0 / Total_Bookings, 2
) AS Cancellation_Rate_Percent
FROM Vehicle_Cancellation
WHERE Total_Bookings >= 100
ORDER BY Cancellation_Rate_Percent DESC;


# Payment Analysis:
# Which payment method generates the highest revenue?
SELECT p.Payment_Method,
    ROUND(SUM(b.Booking_Value), 2) AS Total_Booking_Value
FROM bookings AS b
JOIN payments AS p
ON b.Payment_ID = p.Payment_ID
GROUP BY p.Payment_Method
ORDER BY Total_Booking_Value DESC
LIMIT 1;


# Does average booking value differ by payment method?
SELECT p.Payment_Method,
    ROUND(AVG(b.Booking_Value), 2) AS Average_Booking_Value
FROM bookings AS b
JOIN payments AS p
ON b.Payment_ID = p.Payment_ID
GROUP BY p.Payment_Method
ORDER BY Average_Booking_Value DESC;


# Location Analysis:
# Which pickup locations generate the most bookings?
SELECT l.Location_Name AS Pickup_Location,
    COUNT(DISTINCT b.Booking_ID) AS Total_Bookings
FROM bookings AS b
JOIN locations AS l
ON b.Pickup_Location_ID = l.Location_ID
GROUP BY l.Location_Name
ORDER BY Total_Bookings DESC
LIMIT 1;


# Which drop locations receive the most bookings?
SELECT l.Location_Name AS Drop_Location,
    COUNT(DISTINCT b.Booking_ID) AS Total_Bookings
FROM bookings AS b
JOIN locations AS l
ON b.Drop_Location_ID = l.Location_ID
GROUP BY l.Location_Name
ORDER BY Total_Bookings DESC
LIMIT 1;


# Find the top 3 locations by revenue in every month.
WITH Monthly_Location_Revenue AS (SELECT
        c.Year, c.Month, c.Month_Name,
        l.Location_Name AS Pickup_Location,
        SUM(b.Booking_Value) AS Total_Revenue,
        DENSE_RANK() OVER (
            PARTITION BY c.Year, c.Month
            ORDER BY SUM(b.Booking_Value) DESC
        ) AS Revenue_Rank
    FROM bookings b
    JOIN calendar c
	ON b.Calendar_ID = c.Calendar_ID
    JOIN locations l
	ON b.Pickup_Location_ID = l.Location_ID
    GROUP BY c.Year, c.Month, c.Month_Name, l.Location_Name)
SELECT Year, Month, Month_Name, Pickup_Location,
    ROUND(Total_Revenue, 2) AS Total_Revenue, Revenue_Rank
FROM Monthly_Location_Revenue
WHERE Revenue_Rank <= 3
ORDER BY Year, Month, Revenue_Rank;


# Which pickup locations have the highest cancellation rates? (Very useful business question)
SELECT l.Location_Name AS Pickup_Location,
    COUNT(DISTINCT b.Booking_ID) AS Total_Bookings,
    COUNT(DISTINCT CASE
        WHEN b.Booking_Status IN ('Cancelled by Customer', 'Cancelled by Driver')
        THEN b.Booking_ID
    END) AS Cancelled_Bookings,
    ROUND(COUNT(DISTINCT CASE
            WHEN b.Booking_Status IN ('Cancelled by Customer', 'Cancelled by Driver')
            THEN b.Booking_ID
        END) * 100.0/ COUNT(DISTINCT b.Booking_ID), 2
    ) AS Cancellation_Rate_Percent
FROM bookings AS b
JOIN locations AS l
ON b.Pickup_Location_ID = l.Location_ID
GROUP BY l.Location_Name
ORDER BY Cancellation_Rate_Percent DESC;


# Which routes have the highest booking volume?
SELECT pickup.Location_Name AS Pickup_Location,
    dropoff.Location_Name AS Drop_Location,
    COUNT(DISTINCT b.Booking_ID) AS Total_Bookings
FROM bookings AS b
JOIN locations AS pickup
ON b.Pickup_Location_ID = pickup.Location_ID
JOIN locations AS dropoff
ON b.Drop_Location_ID = dropoff.Location_ID
GROUP BY pickup.Location_Name, dropoff.Location_Name
ORDER BY Total_Bookings DESC
LIMIT 10;


# Which routes generate the highest revenue?
SELECT pickup.Location_Name AS Pickup_Location,
    dropoff.Location_Name AS Drop_Location,
    ROUND(SUM(b.Booking_Value), 2) AS Total_Booking_Value
FROM bookings AS b
JOIN locations AS pickup
ON b.Pickup_Location_ID = pickup.Location_ID
JOIN locations AS dropoff
ON b.Drop_Location_ID = dropoff.Location_ID
GROUP BY pickup.Location_Name, dropoff.Location_Name
ORDER BY Total_Booking_Value DESC
LIMIT 10;


# Customer Analysis:
# Who are the highest-value customers?
SELECT Customer_ID,
    COUNT(DISTINCT Booking_ID) AS Total_Bookings,
    ROUND(SUM(Booking_Value), 2) AS Total_Booking_Value
FROM bookings
GROUP BY Customer_ID
ORDER BY Total_Booking_Value DESC
LIMIT 10;


# Which customers have made the most bookings?
SELECT Customer_ID,
    COUNT(DISTINCT Booking_ID) AS Total_Bookings
FROM bookings
GROUP BY Customer_ID
ORDER BY Total_Bookings DESC
LIMIT 10;


# Which customers have the highest average ratings?
SELECT c.Customer_ID, c.Customer_Rating,
    COUNT(DISTINCT b.Booking_ID) AS Total_Bookings
FROM customers AS c
JOIN bookings AS b
ON c.Customer_ID = b.Customer_ID
WHERE c.Customer_Rating IS NOT NULL
GROUP BY c.Customer_ID, c.Customer_Rating
ORDER BY c.Customer_Rating DESC, Total_Bookings DESC
LIMIT 10;


# Are high-frequency customers also high-revenue customers?
SELECT Customer_ID,
    COUNT(DISTINCT Booking_ID) AS Total_Bookings,
    ROUND(SUM(Booking_Value), 2) AS Total_Booking_Value
FROM bookings
GROUP BY Customer_ID
ORDER BY Total_Bookings DESC, Total_Booking_Value DESC;


# Which locations have unusually high cancellation rates?
SELECT l.Location_Name AS Pickup_Location,
    COUNT(DISTINCT b.Booking_ID) AS Total_Bookings,
    COUNT(DISTINCT CASE
        WHEN b.Booking_Status IN ('Cancelled by Customer', 'Cancelled by Driver')
        THEN b.Booking_ID
    END) AS Cancelled_Bookings,
    ROUND(COUNT(DISTINCT CASE
            WHEN b.Booking_Status IN ('Cancelled by Customer', 'Cancelled by Driver')
            THEN b.Booking_ID
        END) * 100.0/ COUNT(DISTINCT b.Booking_ID), 2
    ) AS Cancellation_Rate_Percent
FROM bookings AS b
JOIN locations AS l
ON b.Pickup_Location_ID = l.Location_ID
GROUP BY l.Location_Name
HAVING COUNT(DISTINCT b.Booking_ID) >= 100
ORDER BY Cancellation_Rate_Percent DESC;


# Calculate month-over-month revenue growth.
WITH Monthly_Revenue AS (SELECT c.Year, c.Month, c.Month_Name,
        SUM(b.Booking_Value) AS Monthly_Revenue
    FROM bookings AS b
    JOIN calendar AS c
	ON b.Calendar_ID = c.Calendar_ID
    GROUP BY c.Year, c.Month, c.Month_Name),
Revenue_Growth AS (
    SELECT Year, Month, Month_Name, Monthly_Revenue,
        LAG(Monthly_Revenue) OVER (ORDER BY Year, Month
        ) AS Previous_Month_Revenue
    FROM Monthly_Revenue)
SELECT Year,Month, Month_Name,
    ROUND(Monthly_Revenue, 2) AS Monthly_Revenue,
    ROUND(Previous_Month_Revenue, 2) AS Previous_Month_Revenue,
    ROUND((Monthly_Revenue - Previous_Month_Revenue)
        * 100.0/ Previous_Month_Revenue, 2
    ) AS MoM_Revenue_Growth_Percent
FROM Revenue_Growth
ORDER BY Year, Month;

# *** End of Analysis ***