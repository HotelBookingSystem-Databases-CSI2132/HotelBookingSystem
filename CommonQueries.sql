-- #Point 8 --

---- Query 1 -----
Select r.* from hotelroom r, Availability a where r.room_number = a.room_number and a.isAvailable = FALSE

---- Query 2 -----

Create view CustomerListView as Select DISTINCT c.id, c.first_name, c.last_name, c.registeration_date, c.street,
c.city, c.province, c.zipCode, c.securityCode, c.card_type, c.card_number, c.expiration_month, c.experation_year,
c.phone_number, h.hotelChain
From customer c, Renting r, hotel h
Where r.customer_id = c.id and h.id = r.hotel_ID
group by c.id, c.first_name, c.last_name, c.registeration_date, c.street,
c.city, c.province, c.zipCode, c.securityCode, c.card_type, c.card_number, c.expiration_month, c.experation_year,
c.phone_number, h.hotelChain
order by h.hotelChain

select * from CustomerListView 

---- Query 3 -----
select r.* from hotelroom r, hotel h where r.hotel = h.id and price = (select min(r2.price) from hotelroom r2)

---- Query 4 -----
Select r.*, h.name, h.rating from hotelroom r, hotel h where r.hotel = h.id and h.city = 'Ottawa' order by h.rating desc, r.price asc

---- Query 5 -----
Select * from renting c where c.check_in_day=10 and c.check_in_month=4

---- Query 6 -----
Update customer set phone_number='456-123-7790' where id=2;

---- Query 7 -----
SELECT RATING AS preferred_category FROM
(SELECT rating, COUNT(hotel_id) AS hotel_num From Hotel H, BookingInfo B 
WHERE B.hotel_id = H.id
GROUP BY rating) AS TABLEA

WHERE TABLEA.hotel_num = (SELECT MAX(hotel_num) FROM
(SELECT rating, COUNT(hotel_id) AS hotel_num From Hotel H, BookingInfo B 
WHERE B.hotel_id = H.id
GROUP BY rating) AS TABLEB);

---- Query 8 -----
SELECT Max(Salary) AS second_max_salary FROM (SELECT Salary From Employee
EXCEPT (SELECT MAX(Salary) FROM Employee)) as SalaryTable;
