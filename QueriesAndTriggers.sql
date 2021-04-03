-- Point 5: Two Queries and Two Triggers

--Function and Trigger 1:

--Function that updates number of hotels in hotelChain:

CREATE FUNCTION update_number_of_hotels()
RETURNS TRIGGER AS
$BODY$
BEGIN

UPDATE HotelChain
SET number_of_hotels = (SELECT count(*)
FROM Hotel H WHERE H.id = id);

RETURN NEW;
END

$BODY$ LANGUAGE plpgsql;


--Trigger that runs before a hotel instance is deleted. Calls above function.

CREATE TRIGGER number_of_hotels_trigger
AFTER UPDATE ON Hotel
EXECUTE PROCEDURE update_number_of_hotels();

--Function and Trigger 2

CREATE FUNCTION update_room_availability()
RETURNS TRIGGER AS
$BODY$
BEGIN

UPDATE Availability
SET isAvailable  = FALSE
WHERE room_number = new.room_number;

RETURN NEW;
END

$BODY$ LANGUAGE plpgsql;


--Trigger that runs after a new renting instance is inserted to update rooms availability. Calls above function.

CREATE TRIGGER update_Availability
AFTER INSERT ON Renting
FOR EACH ROW
EXECUTE PROCEDURE update_room_availability()


--Query 1: Finds the minimum price of a hotel that is at least for stars

SELECT MIN(price) AS min_price FROM (SELECT * FROM HotelRoom AS TableA
JOIN
(SELECT rating,id FROM Hotel WHERE rating >= 4) AS TableB
ON TableA.hotel = TableB.id) As TableC


--Query 2: Finds the average room price per hotel chains

SELECT AVG(price) avPrice,brand_name FROM BookingInfo BI, Hotel H, HotelChain HC
WHERE BI.hotel_id = H.id AND H.hotelChain = HC.id
GROUP BY brand_name
