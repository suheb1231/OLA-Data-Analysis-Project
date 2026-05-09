CREATE DATABASE OLA_Analyst_Project ;

SELECT*FROM Bookings;

---------------------------------------------------------------------------------------------------------
--1. Retrieve all successful bookings:
CREATE VIEW successful_bookings AS
SELECT*
FROM Bookings
WHERE Booking_status = 'Success';

SELECT*FROM successful_bookings
------------------------------------------------------------------------------------------------------
--2. Find the average ride distance for each vehicle type:
CREATE VIEW Vehicle_type_Wise_Avg_distance AS
SELECT Vehicle_Type,
AVG(Ride_Distance) as Avg_ride_distance
FROM Bookings
GROUP BY Vehicle_Type;

SELECT*FROM Vehicle_type_Wise_Avg_distance
----------------------------------------------------------------------------------------------------------
--3. Get the total number of cancelled rides by customers:
CREATE VIEW cancelled_rides_by_customers AS 
SELECT Customer_ID ,
COUNT(*) AS total_booking
FROM Bookings
WHERE Booking_Status = 'Canceled by Customer'
GROUP BY Customer_ID;

SELECT*FROM cancelled_rides_by_customers ORDER BY total_booking DESC; 

---------------------------------------------------------------------------------------------------------------------
--4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW customer_wise_highest_no_of_booking AS   ---Create View
SELECT TOP 5 Customer_ID, 
COUNT(Booking_ID) AS highest_no_of_booking
FROM bookings
GROUP BY Customer_ID
ORDER BY highest_no_of_booking DESC ;

SELECT*FROM customer_wise_highest_no_of_booking ;
---------------------------------------------------------------------------------------------------------
--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW Cancelled_booking AS ---Create View
SELECT
COUNT(Booking_ID) AS no_of_canceled_rides
FROM Bookings
WHERE Booking_Status = 'Canceled by Driver'
AND
Canceled_Rides_by_Driver = 'Personal & Car related issue'

SELECT*FROM Cancelled_booking;
-------------------------------------------------------------------------------------------------------------------------
--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create VIEW prime_sedan_min_max_rating AS -- Create View
SELECT 
MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM Bookings 
WHERE Vehicle_Type  = 'Prime Sedan'

SELECT*FROM prime_sedan_min_max_rating;
-------------------------------------------------------------------------------------------
--7. Retrieve all rides where payment was made using UPI:
CREATE VIEW payment_upi_method AS --Create View
SELECT*
FROM Bookings
WHERE Payment_Method = 'UPI'

SELECT*FROM payment_upi_method
------------------------------------------------------------------------------------------------
--8. Find the average customer rating per vehicle type:
CREATE VIEW vehicle_wise_avg AS --Create View
SELECT Vehicle_Type,
AVG(Customer_Rating) avg_cust_rating
FROM Bookings
GROUP BY Vehicle_Type
--View Table
SELECT*FROM vehicle_wise_avg ORDER BY avg_cust_rating DESC
------------------------------------------------------------------------------------------------------------
--9. Calculate the total booking value of rides completed successfully:
--Create View
CREATE VIEW total_successful_booking AS
SELECT 
COUNT(Booking_ID) AS total_booking
FROM Bookings
WHERE Booking_Status = 'Success'

--View Table
SELECT*FROM total_successful_booking

--------------------------------------------------------------------------------------------------
--10. List all incomplete rides along with the reason:
--Create View
CREATE VIEW incomplete_rides_reason AS
SELECT Booking_ID , Incomplete_Rides_Reason
FROM Bookings
WHERE Incomplete_Rides = 1

--View Table
SELECT*FROM incomplete_rides_reason
--------------------------------------------------------------------------------------------





















