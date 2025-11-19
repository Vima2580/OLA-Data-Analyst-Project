create database Ola;
use ola;
desc booking;
select * FROM BOOKING;
ALTER TABLE booking CHANGE ï»¿Date Date text;
desc booking;

# 1. Retrieve all successful bookings:
select * from booking where Booking_Status = 'Success';
create view Success_Booking as select * from booking where Booking_Status = 'Success';
select * from success_booking;

# 2. Find the average ride distance for each vehicle type:
create	view Average_distance_each_vehicle as select vehicle_type, AVG(Ride_Distance) AS average_distance
FROM Booking
GROUP BY vehicle_type;
select * from Average_distance_each_vehicle;

# 3. Get the total number of cancelled rides by customers:
create view Total_number_cancelled_by_customers as select count(*) as cancelled_by_customers from booking where Booking_Status = 'canceled by customer';
select * from Total_number_cancelled_by_customers;

# 4. List the top 5 customers who booked the highest number of rides:
create view Top_5_Customers as select customer_id, count(booking_id) as total_rides
from booking
group by customer_id
order by total_rides desc limit 5;

select * from Top_5_Customers;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_cancelled_by_Driver_P_C_Issues As
select count(*) from booking 
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from Rides_cancelled_by_Driver_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating as
select max(Driver_Ratings) as max_driver_ratings, min(Driver_Ratings) 
as min_driver_ratings from	booking where Vehicle_Type = 'Prime Sedan';

select * from Max_Min_Driver_Rating;

# 7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment  as
select count(*) from booking 
where Payment_Method = 'UPI';

select * from UPI_Payment;

# 8. Find the average customer rating per vehicle type:
create view Avg_Cust_Rating as
select Vehicle_Type, round(avg(Customer_Rating),3) as Avg_Customer_Rating 
from booking group by Vehicle_Type;

select * from Avg_Cust_Rating;

# 9. Calculate the total booking value of rides completed successfully:
Create view total_successful_ride_value as
select sum(Booking_Value)  as total_successful_ride_value from booking
where Booking_Status = 'Success';

select * from total_successful_ride_value;

# 10. List all incomplete rides along with the reason:
create view Incomplete_Rides as
select Incomplete_Rides_Reason, count(Incomplete_Rides_Reason) 
from booking group by Incomplete_Rides_Reason;

select * from Incomplete_Rides_Reason;

 create view Incomplete_Rides_Reason as
 SELECT Booking_ID, Incomplete_Rides_Reason
 FROM booking
 WHERE Incomplete_Rides = 'Yes';
 
 select * from Incomplete_Rides_Reason;








