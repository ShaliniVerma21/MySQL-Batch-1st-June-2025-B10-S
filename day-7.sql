
USE airline123; -- Set the context to the airline database


 -- Clauses {Where, Distinct, From, Order By, Group By, Having}
 
 -- 1. WHERE Clause Queries

 /*
The WHERE clause is used to filter records in a table based on specific conditions. 
It is typically used with SELECT, UPDATE, and DELETE statements.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE condition;  
 */
 
 -- Select flights that are delayed
 SELECT * FROM Flights WHERE Status = 'Delayed';
 
 -- Select flights departing from Delhi
 SELECT * FROM Flights WHERE Departure_Airport = 'Delhi (DEL)';
 
 -- Select flights arriving in Mumbai
 SELECT * FROM Flights WHERE Arrival_Airport = 'Mumbai (BOM)';
 
 -- Select flights with a duration greater than 120 minutes
 SELECT * FROM Flights WHERE Flight_Duration > 120;
 
 -- Select flights with available seats less than 30
 SELECT * FROM Flights WHERE Seats_Available < 30;
 
 -- Select flights that departed after a specific date
 SELECT * FROM Flights WHERE Departure_Time > '2023-10-01 00:00:00';
 
 -- Select flights with a specific flight number
 SELECT * FROM Flights WHERE Flight_Number = 'AI101';
 
 -- Select flights that are either cancelled or delayed
SELECT * FROM Flights WHERE Status IN ('Cancelled', 'Delayed');

-- Select flights with a flight duration between 90 and 150 minutes
SELECT * FROM Flights WHERE Flight_Duration BETWEEN 90 AND 150;

-- Select flights with more than 50 available seats
SELECT * FROM Flights WHERE Seats_Available > 50;



-- 2. DISTINCT Clause Queries
/*
The DISTINCT clause is used to return unique values from a column by removing duplicates 
in the result set.

Syntax:

SELECT DISTINCT column1  
FROM table_name;  

*/

select * from flights;

-- Select distinct aircraft types used in flights
SELECT DISTINCT Aircraft_Type FROM Flights;

-- Select distinct departure airports
SELECT DISTINCT Departure_Airport FROM Flights;

-- Select distinct arrival airports
SELECT DISTINCT Arrival_Airport FROM Flights;

-- Select distinct flight statuses
SELECT DISTINCT Status FROM Flights;

-- Select distinct flight numbers
SELECT DISTINCT Flight_Number FROM Flights;

-- Select distinct combinations of departure and arrival airports
SELECT DISTINCT Departure_Airport, Arrival_Airport FROM Flights;

-- Select distinct flight durations
SELECT DISTINCT Flight_Duration FROM Flights;

-- Select distinct departure times
SELECT DISTINCT Departure_Time FROM Flights;

-- Select distinct arrival times
SELECT DISTINCT Arrival_Time FROM Flights;

-- Select distinct seat availability counts
SELECT DISTINCT Seats_Available FROM Flights;


-- 3. FROM Clause Queries
/*
The FROM clause specifies the table or tables from which the data is retrieved. 
It is a mandatory part of the SELECT statement and can also be used with joins for 
combining data from multiple tables.

Syntax:

SELECT column1, column2  
FROM table_name; 
*/

-- Select all records from Flights table
SELECT * FROM Flights;

-- Select flight numbers and statuses from Flights table
SELECT Flight_Number, Status FROM Flights;

-- Select departure and arrival airports from Flights table
SELECT Departure_Airport, Arrival_Airport FROM Flights;

-- Select flight ID and duration from Flights table
SELECT Flight_ID, Flight_Duration FROM Flights;

-- Select all columns from Flights table where status is 'On Time'
SELECT * FROM Flights WHERE Status = 'On Time';

-- Select all flights with a specific aircraft type
SELECT * FROM Flights WHERE Aircraft_Type = 'Boeing 737';

-- Select all flights departing after a specific time
SELECT * FROM Flights WHERE Departure_Time > '2023-10-01 12:00:00';

-- Select all flights arriving in a specific city
SELECT * FROM Flights WHERE Arrival_Airport = 'Chennai (MAA)';

-- Select all flights with available seats greater than 40
SELECT * FROM Flights WHERE Seats_Available > 40;

-- Select all flights with a specific flight duration
SELECT * FROM Flights WHERE Flight_Duration = 120;


-- 4. ORDER BY Clause Queries
/*
The ORDER BY clause is used to sort the result set in ascending (ASC) or descending (DESC) order 
based on one or more columns.

Syntax:

SELECT column1, column2  
FROM table_name  
ORDER BY column_name [ASC|DESC];  
*/

-- Select all flights ordered by Departure_Time
SELECT * FROM Flights ORDER BY Departure_Time;

-- Select all flights ordered by Flight_Duration in descending order
SELECT * FROM Flights ORDER BY Flight_Duration DESC;

-- Select all flights ordered by Seats_Available
SELECT * FROM Flights ORDER BY Seats_Available;

-- Select all flights ordered by Status and then by Departure_Time
SELECT * FROM Flights ORDER BY Status, Departure_Time;

SELECT * FROM Flights ORDER BY Arrival_Airport, Departure_Time;

-- Select all flights ordered by Arrival_Airport
SELECT * FROM Flights ORDER BY Arrival_Airport;

-- Select all flights ordered by Flight_Number in descending order
SELECT * FROM Flights ORDER BY Flight_Number DESC;

-- Select all flights ordered by Departure_Airport and then by Flight_Duration
SELECT * FROM Flights ORDER BY Departure_Airport, Flight_Duration;

-- Select all flights ordered by Arrival_Time in descending order
SELECT * FROM Flights ORDER BY Arrival_Time DESC;

-- Select all flights ordered by Flight_ID
SELECT * FROM Flights ORDER BY Flight_ID;

-- Select all flights ordered by Arrival_Time
SELECT * FROM Flights ORDER BY Arrival_Time;


-- 5. GROUP BY Clause Queries
/*
The GROUP BY clause groups rows with the same values into summary rows, 
often used with aggregate functions (e.g., COUNT, SUM, AVG).

Syntax:

SELECT column1, aggregate_function(column2)  
FROM table_name  
GROUP BY column1;
*/

select * from flights;

-- Count flights grouped by status
SELECT Status, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Status;

SELECT COUNT(*) AS NumberOfFlights FROM Flights;

-- Group flights by Departure_Airport and count them
SELECT Departure_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Departure_Airport;

-- Group flights by Arrival_Airport and count them
SELECT Arrival_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Arrival_Airport;

-- Group flights by Aircraft_Type and calculate average duration
SELECT Aircraft_Type, AVG(Flight_Duration) AS AverageDuration FROM Flights GROUP BY Aircraft_Type;

-- Group flights by Flight_Number and count them
SELECT Flight_Number, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Flight_Number;

-- Group flights by Departure_Airport and calculate total available seats
SELECT Departure_Airport, SUM(Seats_Available) AS TotalSeats FROM Flights GROUP BY Departure_Airport;

-- Group flights by Status and calculate maximum duration
SELECT Status, MAX(Flight_Duration) AS MaxDuration FROM Flights GROUP BY Status;

-- Group flights by Arrival_Airport and calculate minimum duration
SELECT Arrival_Airport, MIN(Flight_Duration) AS MinDuration FROM Flights GROUP BY Arrival_Airport;

-- Group flights by Departure_Airport and calculate average available seats
SELECT Departure_Airport, AVG(Seats_Available) AS AverageSeats FROM Flights GROUP BY Departure_Airport;

-- Group flights by Aircraft_Type and count distinct statuses
SELECT Aircraft_Type, COUNT(DISTINCT Status) AS DistinctStatusCount FROM Flights GROUP BY Aircraft_Type;


-- 6. HAVING Clause Queries
/*
The HAVING clause is used to filter grouped data after the GROUP BY clause. 
It works similarly to the WHERE clause but is applied to aggregated results.

Syntax:

SELECT column1, aggregate_function(column2)  
FROM table_name  
GROUP BY column1  
HAVING condition;  
*/
use airline123;
-- Select statuses with more than 5 flights
SELECT Status, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Status HAVING COUNT(*) > 5;

-- Select departure airports with more than 3 flights
SELECT Departure_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Departure_Airport HAVING COUNT(*) > 3;

-- Select aircraft types with an average flight duration greater than 120 minutes
SELECT Aircraft_Type, AVG(Flight_Duration) AS AverageDuration FROM Flights GROUP BY Aircraft_Type HAVING 
AVG(Flight_Duration) > 120;

-- Select arrival airports with less than 2 flights
SELECT Arrival_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Arrival_Airport HAVING COUNT(*) < 2;

-- Select statuses with a total of available seats greater than 200
SELECT Status, SUM(Seats_Available) AS TotalSeats FROM Flights GROUP BY Status HAVING SUM(Seats_Available) > 200;

-- Select flight numbers with more than 1 occurrence
SELECT Flight_Number, COUNT(*) AS Occurrences FROM Flights GROUP BY Flight_Number HAVING COUNT(*) > 0;

-- Select departure airports with an average available seat count less than 50
SELECT Departure_Airport, AVG(Seats_Available) AS AverageSeats FROM Flights GROUP BY Departure_Airport 
HAVING AVG(Seats_Available) < 50;

-- Select aircraft types with a maximum flight duration of less than 150 minutes
SELECT Aircraft_Type, MAX(Flight_Duration) AS MaxDuration FROM Flights GROUP BY Aircraft_Type HAVING 
MAX(Flight_Duration) < 150;

-- Select statuses with a count of flights equal to 1
SELECT Status, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Status HAVING COUNT(*) = 1;

-- Select arrival airports with an average flight duration greater than 100 minutes
SELECT Arrival_Airport, AVG(Flight_Duration) AS AverageDuration FROM Flights GROUP BY Arrival_Airport 
HAVING AVG(Flight_Duration) > 100;


-- 7. LIMIT (or FETCH or TOP) Clause

/*

In MySQL, the LIMIT clause is used to restrict the number of rows returned by a query. 
Unlike some other SQL databases (e.g., SQL Server or PostgreSQL) that use TOP or FETCH, 
MySQL exclusively supports LIMIT. 

Syntax for LIMIT

SELECT column1, column2, ...
FROM table_name
LIMIT [offset,] row_count;

Key Components

1. row_count: Specifies the number of rows to return.
2. offset (optional): Specifies the starting point from which rows are returned. If omitted, 
the default is 0 (start from the first row).
3. LIMIT: Used to specify the maximum number of records to return.
4. Using LIMIT with a comma: An alternative way to specify both the offset and the limit in a single clause.
5. ROW_COUNT(): While not directly applicable, you can use SQL_CALC_FOUND_ROWS and FOUND_ROWS() to get the 
total count of rows.

*/

-- Select the first 5 flights
SELECT * FROM Flights LIMIT 5;

SELECT * FROM Flights LIMIT 5 offset 2;

-- Select the first 10 flights ordered by Departure_Time
SELECT * FROM Flights ORDER BY Departure_Time LIMIT 10;

-- Select the last 3 flights based on Flight_ID
SELECT * FROM Flights ORDER BY Flight_ID DESC LIMIT 3;

-- Select the first 7 flights that are delayed
SELECT * FROM Flights WHERE Status = 'Delayed' LIMIT 7;

-- Select the first 5 flights departing from Delhi
SELECT * FROM Flights WHERE Departure_Airport = 'Delhi (DEL)' LIMIT 5;

-- Select the first 10 flights with available seats greater than 50
SELECT * FROM Flights WHERE Seats_Available > 50 LIMIT 10;

-- Select the first 5 flights arriving in Mumbai
SELECT * FROM Flights WHERE Arrival_Airport = 'Mumbai (BOM)' LIMIT 5;

-- Select the first 10 flights with a flight duration greater than 120 minutes
SELECT * FROM Flights WHERE Flight_Duration > 120 LIMIT 10;

-- Select the first 5 flights ordered by Flight_Number
SELECT * FROM Flights ORDER BY Flight_Number LIMIT 5;

-- Select the first 3 flights that departed after a specific date
SELECT * FROM Flights WHERE Departure_Time > '2023-10-01 00:00:00' LIMIT 3;

-- Select 5 flights starting from the 10th record (OFFSET)
SELECT * FROM Flights LIMIT 5 OFFSET 10;

-- Select 10 flights starting from the 20th record
SELECT * FROM Flights LIMIT 10 OFFSET 20;

-- Select 3 flights starting from the 5th record
SELECT * FROM Flights LIMIT 3 OFFSET 5;

-- Select 7 flights starting from the 15th record
SELECT * FROM Flights LIMIT 7 OFFSET 15;

-- Select 4 flights starting from the 0th record (first record)
SELECT * FROM Flights LIMIT 4 OFFSET 0;

-- Select 5 flights starting from the 10th record
SELECT * FROM Flights LIMIT 10, 5;  -- This means skip 10 records and then return the next 5

-- Select 10 flights starting from the 20th record
SELECT * FROM Flights LIMIT 20, 10;  -- Skip 20 records and return the next 10

-- Select 3 flights starting from the 5th record
SELECT * FROM Flights LIMIT 5, 3;  -- Skip 5 records and return the next 3

-- Select 7 flights starting from the 15th record
SELECT * FROM Flights LIMIT 15, 7;  -- Skip 15 records and return the next 7

-- Select 4 flights starting from the 0th record (first record)
SELECT * FROM Flights LIMIT 0, 4;  -- Skip 0 records and return the first 4

-- Get the total number of flights and limit the results
SELECT SQL_CALC_FOUND_ROWS * FROM Flights LIMIT 5; 

SELECT FOUND_ROWS();  -- This will return the total number of rows without the LIMIT


-- 8. JOIN Clause

/*
The JOIN clause is used to combine rows from two or more tables based on a related column.

Syntax:

SELECT columns  
FROM table1  
JOIN table2  
ON table1.common_column = table2.common_column;  

Note - to join 2 or more table their 1 attributes must be common.

INNER JOIN: Returns records that have matching values in both tables.

LEFT JOIN: Returns all records from the left table (Flights) and the matched records from the right 
table (Bookings or Airlines). If there is no match, NULL values are returned for columns from the right table.

RIGHT JOIN: Returns all records from the right table (Bookings) and the matched records from the left table 
(Flights). If there is no match, NULL values are returned for columns from the left table.
*/
-- Join Flights with Bookings to get flight details along with booking information
SELECT f.Flight_ID, f.Flight_Number, b.Booking_ID, b.Booking_Date, b.Number_of_Seats
FROM Flights f
INNER JOIN Bookings b ON f.Flight_ID = b.Flight_ID;

-- Join Flights with Passengers to get flight details along with passenger information
SELECT t1.Flight_ID, t1.Flight_Number, t3.Passenger_ID, t3.First_Name, t3.Last_Name
FROM Flights t1
INNER JOIN Bookings t2 ON t1.Flight_ID = t2.Flight_ID
INNER JOIN Passengers t3 ON t2.Passenger_ID = t3.Passenger_ID;

-- Left join Flights with Bookings to get all flights and their booking status (if any)
SELECT f.Flight_ID, f.Flight_Number, b.Booking_ID, b.Booking_Status
FROM Flights f
LEFT JOIN Bookings b ON f.Flight_ID = b.Flight_ID;

-- Left join Flights with Airlines to get flight details along with airline information
SELECT f.Flight_ID, f.Flight_Number, a.Airline_Name, a.IATA_Code
FROM Flights f
LEFT JOIN Airlines a ON f.Airline_ID = a.Airline_ID;  -- Assuming Airline_ID is added to Flights table

-- Right join Bookings with Flights to get all bookings and their corresponding flight details (if any)
SELECT b.Booking_ID, b.Booking_Date, f.Flight_Number, f.Departure_Airport
FROM Bookings b
RIGHT JOIN Flights f ON b.Flight_ID = f.Flight_ID;


-- 9. UNION Clause

/*
The UNION clause is used to combine the results of two or more SELECT statements. Duplicate rows are 
removed by default.

Syntax:

SELECT column1, column2  
FROM table1  
UNION  
SELECT column1, column2  
FROM table2;  
*/

-- 1. Select Flights from Two Different Departure Airports
SELECT Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport 
FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)'
UNION
SELECT Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport 
FROM Flights 
WHERE Departure_Airport = 'Mumbai (BOM)';

-- 2. Select All Delayed and Cancelled Flights
SELECT Flight_ID, Flight_Number, Status 
FROM Flights 
WHERE Status = 'Delayed'
UNION
SELECT Flight_ID, Flight_Number, Status 
FROM Flights 
WHERE Status = 'Cancelled';

-- 3. Select Flights with More Than 50 Available Seats
SELECT Flight_ID, Flight_Number, Seats_Available 
FROM Flights 
WHERE Seats_Available > 50
UNION
SELECT Flight_ID, Flight_Number, Seats_Available 
FROM Flights 
WHERE Flight_Duration < 120;  -- Assuming you want to compare with a different condition

-- 4. Select Flights to Chennai and Bangalore
SELECT Flight_ID, Flight_Number, Arrival_Airport 
FROM Flights 
WHERE Arrival_Airport = 'Chennai (MAA)'
UNION
SELECT Flight_ID, Flight_Number, Arrival_Airport 
FROM Flights 
WHERE Arrival_Airport = 'Bangalore (BLR)';

-- 5. Select Flights with Specific Flight Numbers
SELECT Flight_ID, Flight_Number, Departure_Airport 
FROM Flights 
WHERE Flight_Number = 'AI101'
UNION
SELECT Flight_ID, Flight_Number, Departure_Airport 
FROM Flights 
WHERE Flight_Number = 'AI102';

-- 6. Select Flights with a Duration Greater Than 150 Minutes
SELECT Flight_ID, Flight_Number, Flight_Duration 
FROM Flights 
WHERE Flight_Duration > 150
UNION
SELECT Flight_ID, Flight_Number, Flight_Duration 
FROM Flights 
WHERE Status = 'On Time';

-- 7. Select Flights with Arrival in Specific Cities
SELECT Flight_ID, Flight_Number, Arrival_Airport 
FROM Flights 
WHERE Arrival_Airport = 'Hyderabad (HYD)'
UNION
SELECT Flight_ID, Flight_Number, Arrival_Airport 
FROM Flights 
WHERE Arrival_Airport = 'Pune (PNQ)';

-- 8. Select Flights with Specific Statuses
SELECT Flight_ID, Flight_Number, Status 
FROM Flights 
WHERE Status = 'On Time'
UNION
SELECT Flight_ID, Flight_Number, Status 
FROM Flights 
WHERE Status = 'Delayed';

-- 9. Select Flights with Departure After a Specific Time
SELECT Flight_ID, Flight_Number, Departure_Time 
FROM Flights 
WHERE Departure_Time > '2023-10-01 12:00:00'
UNION
SELECT Flight_ID, Flight_Number, Departure_Time 
FROM Flights 
WHERE Departure_Time > '2023-10-01 14:00:00';

-- 10. Select Flights with Different Aircraft Types
SELECT Flight_ID, Flight_Number, Aircraft_Type 
FROM Flights 
WHERE Aircraft_Type = 'Boeing 737'
UNION
SELECT Flight_ID, Flight_Number, Aircraft_Type 
FROM Flights 
WHERE Aircraft_Type = 'Airbus A320';


-- 10. INTO Clause (Mysql does not support into clause directly in this way)
/*
The INTO clause is used to insert query results into a new table or export data.

Syntax:

SELECT columns  
INTO new_table_name  
FROM table_name  
WHERE condition;  
*/

-- Create a new table to store flights with less than 50 available seats
SELECT Flight_Number, Departure_Airport 
INTO New_Flights_Table 
FROM Flights 
WHERE Seats_Available < 50;

-- Create a new table to store details of flights that are delayed
SELECT Flight_ID, Flight_Number, Arrival_Airport 
INTO Delayed_Flights 
FROM Flights 
WHERE Status = 'Delayed';

-- Create a new table for flights that use Boeing 737 aircraft
SELECT Flight_Number, Departure_Airport, Arrival_Airport 
INTO Boeing737_Flights 
FROM Flights 
WHERE Aircraft_Type = 'Boeing 737';

-- Create a new table for flights that have a duration greater than 150 minutes
SELECT Flight_Number, Flight_Duration 
INTO Long_Flights 
FROM Flights 
WHERE Flight_Duration > 150;

-- Create a new table for flights departing from Delhi (DEL)
SELECT Flight_Number, Arrival_Airport 
INTO Delhi_Departures 
FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)';

-- Create a new table for flights that have no available seats
SELECT Flight_Number, Departure_Airport, Arrival_Airport 
INTO Fully_Booked_Flights 
FROM Flights 
WHERE Seats_Available = 0;

-- Create a new table for flights arriving at either Mumbai (BOM) or Chennai (MAA)
SELECT Flight_Number, Arrival_Airport 
INTO Mumbai_Chennai_Arrivals 
FROM Flights 
WHERE Arrival_Airport IN ('Mumbai (BOM)', 'Chennai (MAA)');

-- Create a new table for flights that have a duration of less than 90 minutes
SELECT Flight_Number, Flight_Duration 
INTO Short_Flights 
FROM Flights 
WHERE Flight_Duration < 90;

-- Create a new table for flights that are currently cancelled
SELECT Flight_Number, Departure_Airport, Arrival_Airport 
INTO Cancelled_Flights 
FROM Flights 
WHERE Status = 'Cancelled';

-- -- Create a new table for flights that depart between 2 PM and 4 PM
SELECT Flight_Number, Departure_Time 
INTO Afternoon_Flights 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 14:00:00' AND '2023-10-01 16:00:00';


-- 11. CASE Clause
/*
The CASE clause allows conditional logic in SQL queries, similar to an if-else statement.

Syntax:

SELECT column1,  
       CASE  
           WHEN condition1 THEN result1  
           WHEN condition2 THEN result2  
           ELSE result3  
       END AS alias_name  
FROM table_name; 
*/
select * from flights;

-- Select flight numbers and provide a descriptive status message
SELECT Flight_Number, 
       CASE 
           WHEN Status = 'On Time' THEN 'Flight is on schedule' 
           WHEN Status = 'Delayed' THEN 'Flight is delayed' 
           ELSE 'Flight is cancelled' 
       END AS Flight_Status 
FROM Flights;

-- Select flight numbers and categorize them based on duration
SELECT Flight_Number, 
       CASE 
           WHEN Flight_Duration <= 90 THEN 'Short Flight' 
           WHEN Flight_Duration BETWEEN 90 AND 140 THEN 'Medium Flight' 
           ELSE 'Long Flight' 
       END AS Flight_Category 
FROM Flights;

-- Select flight numbers and categorize seat availability
SELECT Flight_Number, 
       CASE 
           WHEN Seats_Available > 50 THEN 'Plenty of Seats Available' 
           WHEN Seats_Available BETWEEN 20 AND 50 THEN 'Limited Seats Available' 
           ELSE 'Almost Full' 
       END AS Seat_Status 
FROM Flights;

-- Select flight numbers and convert flight duration from minutes to hours
SELECT Flight_Number, 
       CASE 
           WHEN Flight_Duration < 60 THEN CONCAT(Flight_Duration, ' minutes') 
           ELSE CONCAT(Flight_Duration / 60, ' hours') 
       END AS Duration 
FROM Flights;

-- Select flight numbers and provide status based on departure time
SELECT Flight_Number, 
       CASE 
           WHEN Departure_Time < NOW() THEN 'Flight has departed' 
           WHEN Departure_Time = NOW() THEN 'Flight is departing now' 
           ELSE 'Flight is scheduled to depart' 
       END AS Departure_Status 
FROM Flights;

-- Select flight numbers and categorize based on aircraft type
SELECT Flight_Number, 
       CASE 
           WHEN Aircraft_Type LIKE 'Boeing%' THEN 'Boeing Aircraft' 
           WHEN Aircraft_Type LIKE 'Airbus%' THEN 'Airbus Aircraft' 
           ELSE 'Other Aircraft' 
       END AS Aircraft_Type_Category 
FROM Flights;

-- Select flight numbers and provide a status message based on flight duration
SELECT Flight_Number, 
       CASE 
           WHEN Flight_Duration < 120 THEN 'Short Trip' 
           WHEN Flight_Duration BETWEEN 120 AND 180 THEN 'Standard Trip' 
           ELSE 'Long Trip' 
       END AS Trip_Length 
FROM Flights;

-- Select flight numbers and provide custom messages based on flight status
SELECT Flight_Number, 
       CASE 
           WHEN Status = 'On Time' THEN 'All systems go!' 
           WHEN Status = 'Delayed' THEN 'Please wait for updates.' 
           WHEN Status = 'Cancelled' THEN 'We apologize for the inconvenience.' 
           ELSE 'Unknown status' 
       END AS Custom_Status_Message 
FROM Flights;

-- Select flight numbers and categorize based on arrival airport
SELECT Flight_Number, 
       CASE 
           WHEN Arrival_Airport = 'Delhi (DEL)' THEN 'Arriving in Capital' 
           WHEN Arrival_Airport = 'Mumbai (BOM)' THEN 'Arriving in Financial Hub' 
           ELSE 'Arriving Elsewhere' 
       END AS Arrival_Category 
FROM Flights;

-- Select flight numbers and provide status based on current time and flight status
SELECT Flight_Number, 
       CASE 
           WHEN Status = 'On Time' AND Departure_Time > NOW() THEN 'On Schedule' 
           WHEN Status = 'Delayed' THEN 'Delayed' 
           WHEN Status = 'Cancelled' THEN 'Cancelled' 
           ELSE 'Flight has already departed' 
       END AS Final_Flight_Status 
FROM Flights;


-- 12. IN Clause
/*
The IN clause is used to filter records based on a list of values.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name IN (value1, value2, ...);  
*/
-- Select all flights arriving at Mumbai (BOM) or Delhi (DEL)
SELECT * 
FROM Flights 
WHERE Arrival_Airport IN ('Mumbai (BOM)', 'Delhi (DEL)');

-- Select all flights departing from Delhi (DEL), Chennai (MAA), or Bangalore (BLR)
SELECT * 
FROM Flights 
WHERE Departure_Airport IN ('Delhi (DEL)', 'Chennai (MAA)', 'Bangalore (BLR)');

-- Select flights with specific flight numbers AI101, AI102, and AI103
SELECT * 
FROM Flights 
WHERE Flight_Number IN ('AI101', 'AI102', 'AI103');

-- Select all flights that are either Delayed or Cancelled
SELECT * 
FROM Flights 
WHERE Status IN ('Delayed', 'Cancelled');

-- Select flights that use either Boeing 737 or Airbus A320 aircraft
SELECT * 
FROM Flights 
WHERE Aircraft_Type IN ('Boeing 737', 'Airbus A320');

-- Select flights that depart at specific times
SELECT * 
FROM Flights 
WHERE Departure_Time IN ('2023-10-01 06:00:00', '2023-10-01 09:00:00');

-- Select flights that have a duration of either 120 or 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration IN (120, 150);

-- Select flights that have either 30 or 50 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available IN (30, 50);

-- Select flights arriving at major cities: Mumbai, Delhi, Kolkata, or Chennai
SELECT * 
FROM Flights 
WHERE Arrival_Airport IN ('Mumbai (BOM)', 'Delhi (DEL)', 'Kolkata (CCU)', 'Chennai (MAA)');

-- Select flights that arrive at specific times
SELECT * 
FROM Flights 
WHERE Arrival_Time IN ('2023-10-01 08:00:00', '2023-10-01 10:30:00');


-- 13. BETWEEN Clause
/*
The BETWEEN clause filters data within a specified range, inclusive of the boundaries.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name BETWEEN value1 AND value2;  
*/
 -- Select all flights with a duration between 120 and 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration BETWEEN 120 AND 150;

-- Select flights that depart between 8 AM and 12 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 08:00:00' AND '2023-10-01 12:00:00';

-- Select flights that arrive between 10 AM and 2 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Arrival_Time BETWEEN '2023-10-01 10:00:00' AND '2023-10-01 14:00:00';

-- Select flights that have between 20 and 60 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available BETWEEN 20 AND 60;

-- Select flights with Flight_IDs between 5 and 10
SELECT * 
FROM Flights 
WHERE Flight_ID BETWEEN 5 AND 10;

-- Select flights with a duration less than 90 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration < 90;  -- Using < instead of BETWEEN for clarity

-- Select flights that depart between 12 PM and 6 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 12:00:00' AND '2023-10-01 18:00:00';

-- Select flights that arrive between 6 PM and 10 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Arrival_Time BETWEEN '2023-10-01 18:00:00' AND '2023-10-01 22:00:00';

-- Select flights with a duration greater than 180 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration > 180;  -- Using > instead of BETWEEN for clarity

-- Select flights that were scheduled to depart between 1 PM and 3 PM
SELECT * 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 13:00:00' AND '2023-10-01 15:00:00';


-- 14. LIKE Clause
/*
The LIKE clause is used to search for a specified pattern in a column. Wildcards include % (any number of 
characters) and _ (a single character).

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name LIKE pattern;  
*/
-- Select all flights where the flight number starts with 'AI'
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE 'AI%';

-- Select all flights where the flight number ends with '101'
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE '%101';

-- Select all flights where the flight number contains '10'
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE '%10%';

-- Select all flights departing from airports that have 'Delhi' in their name
SELECT * 
FROM Flights 
WHERE Departure_Airport LIKE '%Delhi%';

-- Select all flights arriving at airports that have 'BOM' in their code
SELECT * 
FROM Flights 
WHERE Arrival_Airport LIKE '%BOM%';

-- Select all flights that use aircraft types starting with 'Airbus'
SELECT * 
FROM Flights 
WHERE Aircraft_Type LIKE 'Airbus%';

-- Select all flights where the status contains the word 'Delayed'
SELECT * 
FROM Flights 
WHERE Status LIKE '%Delayed%';

-- Select all flights where the flight number matches the pattern 'AI1__'
-- (where '_' represents a single character)
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE 'AI1__';

-- Select all flights departing from airports that have 'MAA' in their code
SELECT * 
FROM Flights 
WHERE Departure_Airport LIKE '%MAA%';

-- Select all flights arriving at airports that start with the letter 'K'
SELECT * 
FROM Flights 
WHERE Arrival_Airport LIKE 'K%';

-- Home till here.

-- 15. EXISTS Clause
/*
The EXISTS clause checks for the existence of rows in a subquery.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE EXISTS (subquery); 
*/
-- Select all flights where there exists at least one cancelled flight to the same arrival airport
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Status = 'Cancelled' AND Arrival_Airport = f.Arrival_Airport
);

-- Select all flights where there exists at least one delayed flight from the same departure airport
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Status = 'Delayed' AND Departure_Airport = f.Departure_Airport
);

-- Select all flights where there exists at least one flight to the same destination with available seats
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Arrival_Airport = f.Arrival_Airport AND Seats_Available > 0
);

-- Select all flights where there exists at least one flight departing at the same time
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Departure_Time = f.Departure_Time
);

-- Select all flights where there exists at least one flight using the same aircraft type
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Aircraft_Type = f.Aircraft_Type
);

-- Select all flights where there exists at least one flight arriving at the same airport
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Arrival_Airport = f.Arrival_Airport
);

-- Select all flights where there exists at least one flight scheduled on the same day
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE DATE(Departure_Time) = DATE(f.Departure_Time)
);

-- Select all flights where there exists at least one flight with the same flight number
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Flight_Number = f.Flight_Number
);

-- Select all flights where there exists at least one flight with a similar duration (within 10 minutes)
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE ABS(Flight_Duration - f.Flight_Duration) <= 10
);

-- Select all flights where there exists at least one flight with the same status
SELECT * 
FROM Flights f 
WHERE EXISTS (
    SELECT 1 
    FROM Flights 
    WHERE Status = f.Status
);


-- 16. As Clause
/*
The AS clause is used to provide an alias (temporary name) for columns or tables, 
improving query readability.

Syntax:

SELECT column_name AS alias_name  
FROM table_name;    
*/
-- Create a new table with flight details
CREATE TABLE Flight_Summary AS 
SELECT Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport 
FROM Flights;

-- Select flight numbers and give them a custom alias
SELECT Flight_Number AS FlightCode 
FROM Flights;

-- Select flight duration in hours and give it a custom alias
SELECT Flight_Number, Flight_Duration / 60 AS Duration_Hours 
FROM Flights;

-- Select departure and arrival airports with custom aliases
SELECT Departure_Airport AS Departure, Arrival_Airport AS Arrival 
FROM Flights;

-- Select flight status and give it a custom alias
SELECT Flight_Number, Status AS Current_Status 
FROM Flights;

-- Create a new table with average flight duration per departure airport
CREATE TABLE Average_Flight_Duration AS 
SELECT Departure_Airport, AVG(Flight_Duration) AS Average_Duration 
FROM Flights 
GROUP BY Departure_Airport;

-- Select available seats and give it a custom alias
SELECT Flight_Number, Seats_Available AS Available_Seats 
FROM Flights;

-- Select flight ID and aircraft type with custom aliases
SELECT Flight_ID AS ID, Aircraft_Type AS Plane_Type 
FROM Flights;

-- Select flights with custom aliases for departure and arrival times
SELECT Flight_Number, Departure_Time AS Depart_Time, Arrival_Time AS Arrive_Time 
FROM Flights;

-- Create a new table summarizing flight status counts
CREATE TABLE Flight_Status_Summary AS 
SELECT Status AS Flight_Status, COUNT(*) AS Total_Flights 
FROM Flights 
GROUP BY Status;


-- Mysql Alias

/*

In MySQL, an alias is a temporary name assigned to a table or a column for the duration of a query
(within the scope of a query). Aliases are primarily used to enhance the readability and clarity of 
SQL statements, making it easier for users to understand the purpose of the data being retrieved or manipulated.

Key Points about MySQL Aliases:

1. Temporary Nature: 
Aliases exist only for the duration of the query. Once the query execution is complete, 
the alias ceases to exist.

2. Improved Readability: 
By using aliases, you can simplify complex column names or provide more meaningful names 
that better describe the data. This is particularly useful when dealing with long or complicated column names.

Syntax:

For column aliases, the syntax is:

SELECT column_name AS alias_name
FROM table_name;

For table aliases, the syntax is:

SELECT column_name
FROM table_name AS alias_name;

3. Usage in Queries: 
Aliases can be used in various SQL statements, including SELECT, UPDATE, and DELETE. 
They can also be used in conjunction with aggregate functions, joins, and subqueries.

4. No Impact on Database Structure: 
Using an alias does not change the actual table or column names in the database; 
it only affects how they arek referenced in the query.

*/

-- Table Alias
SELECT f.Flight_ID, f.Flight_Number, f.Departure_Airport, f.Arrival_Airport
FROM Flights f;

-- Column Alias
SELECT f.Flight_ID AS ID, f.Flight_Number AS Num, f.Departure_Airport AS Departure, 
f.Arrival_Airport AS Arrival FROM Flights f;

-- Derived Table Alias
SELECT *
FROM (
  SELECT f.Flight_ID, f.Flight_Number, f.Departure_Airport, f.Arrival_Airport
  FROM Flights f
) AS FlightInfo;

-- Filtering with Alias
SELECT f.Flight_ID, f.Flight_Number, f.Departure_Airport, f.Arrival_Airport
FROM Flights f
WHERE f.Departure_Airport = 'Delhi (DEL)';

-- Sorting with Alias
SELECT f.Flight_ID, f.Flight_Number, f.Departure_Airport, f.Arrival_Airport
FROM Flights f
ORDER BY f.Departure_Time;

-- Grouping with Alias
SELECT f.Departure_Airport, COUNT(f.Flight_ID) AS NumFlights
FROM Flights f
GROUP BY f.Departure_Airport;

-- Aggregate Functions with Alias
SELECT f.Departure_Airport, AVG(f.Flight_Duration) AS AvgDuration
FROM Flights f
GROUP BY f.Departure_Airport;

-- Having Clause with Alias
SELECT f.Departure_Airport, AVG(f.Flight_Duration) AS AvgDuration
FROM Flights f
GROUP BY f.Departure_Airport
HAVING AVG(f.Flight_Duration) = 4;

-- ---------------------------------- Task ------------------------------------------
-- add a column then write a query to enter all details at 1 time.
ALTER TABLE Flights ADD Flight_Status varchar(20);

select * from Flights;

-- insert same value in a table column
UPDATE Flights
SET Flight_Status = 'Scheduled'
WHERE Flight_ID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15);

-- insert multiple value in a table column
UPDATE Flights SET Flight_Status = 
  CASE
    WHEN Flight_ID IN (1, 2, 3) THEN 'Scheduled' 
    WHEN Flight_ID IN (4, 5) THEN 'Departed'
    WHEN Flight_ID IN (6,11,13) THEN 'Arrived'
    WHEN Flight_ID IN (7,12) THEN 'Delayed'
    WHEN Flight_ID IN (8,14,15) THEN 'Cancelled'
    WHEN Flight_ID IN (9) THEN 'Diverted' 
    WHEN Flight_ID IN (10) THEN 'Held' 
    ELSE 'Unknown' 
  END
  WHERE Flight_ID IN  (1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15);





 
