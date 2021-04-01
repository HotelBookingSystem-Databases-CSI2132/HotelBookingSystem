set search_path='hotel_db';

-- ****Create Tables**** -- 

-- Create HotelChain Table Query with Primary Keys, Foreign Keys and Constraints

CREATE TABLE HotelChain (
	id INTEGER NOT NULL,
	brand_name VARCHAR(30) NOT NULL,
	email_address VARCHAR(50) NOT NULL,
	number_of_hotels INTEGER NOT NULL,
	headquarters VARCHAR(20) NOT NULL,
	street VARCHAR(50) NOT NULL,
	city VARCHAR(20) NOT NULL,
	province VARCHAR(20) NOT NULL,
	zipCode VARCHAR(7) NOT NULL,
	phone_number VARCHAR(20) NOT NULL,
	CONSTRAINT HotelChain_pk PRIMARY KEY (id),
	CONSTRAINT number_of_hotels_check CHECK (number_of_hotels >= 0),
	CONSTRAINT province_type_check CHECK (Province IN
            ('British Columbia','Alberta','Saskatchewan','Manitoba','Ontario',
	 'Quebec','New Brunswick','Newfoundland and Labrador','Nova Scotia',
	 'Prince Edward Island','Nunavut','Northwest Territories','Yukon'))
);


-- Create Hotel Table Query with Primary Keys, Foreign Keys and Constraints

CREATE TABLE Hotel (
	id INTEGER NOT NULL,
	name VARCHAR(30) NOT NULL,
	hotelChain INTEGER NOT NULL,
	email_address VARCHAR(50) NOT NULL,
	street VARCHAR(50) NOT NULL,
	city VARCHAR(20) NOT NULL,
	province VARCHAR(20) NOT NULL,
	zipCode VARCHAR(7) NOT NULL,
	number_of_rooms INTEGER NOT NULL,
	phone_number VARCHAR(20) NOT NULL,
	rating INTEGER, 
	CONSTRAINT Hotel_pk PRIMARY KEY (id),
	CONSTRAINT id_check CHECK (id >= 0),
	CONSTRAINT number_of_rooms_check CHECK (number_of_rooms >= 0),
	CONSTRAINT rating CHECK (rating >=0 AND rating <=5),
	CONSTRAINT province_type_check CHECK (Province IN
            ('British Columbia','Alberta','Saskatchewan','Manitoba','Ontario',
	 'Quebec','New Brunswick','Newfoundland and Labrador','Nova Scotia',
	 'Prince Edward Island','Nunavut','Northwest Territories','Yukon')),
	CONSTRAINT hotel_fkey FOREIGN KEY(hotelChain)
	REFERENCES HotelChain(id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create Employee Table Query with Primary Keys, Foreign Keys and Constraints

CREATE TABLE Employee (
	id INTEGER NOT NULL,
	employed_at INTEGER NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL, 
	email_address VARCHAR(50) NOT NULL,
	street VARCHAR(50) NOT NULL,
	city VARCHAR(30) NOT NULL,
	province VARCHAR(40) NOT NULL,
	zipCode VARCHAR(7) NOT NULL,
	job_title VARCHAR(20) NOT NULL,
	start_date TIMESTAMP NOT NULL,
	end_date TIMESTAMP,
	salary INTEGER NOT NULL,
	CONSTRAINT Employee_pk PRIMARY KEY (id),
	CONSTRAINT id_check CHECK (id >= 0),
	CONSTRAINT salary_check CHECK (salary >= 0),
	CONSTRAINT province_type_check CHECK (Province IN
            ('British Columbia','Alberta','Saskatchewan','Manitoba','Ontario',
	 'Quebec','New Brunswick','Newfoundland and Labrador','Nova Scotia',
	 'Prince Edward Island','Nunavut','Northwest Territories','Yukon')),
	CONSTRAINT Employee_fkey FOREIGN KEY(employed_at)
	REFERENCES Hotel(id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create Amenities Table Query with Primary Keys, Foreign Keys and Constraints

CREATE TABLE Amenities (
	amenities_RoomKey INTEGER NOT NULL,
	tv BOOLEAN NOT NULL,
	miniBar BOOLEAN NOT NULL,
	fridge BOOLEAN NOT NULL,
	airConditioner BOOLEAN NOT NULL,
	wifi BOOLEAN NOT NULL,
	others VARCHAR[],
	CONSTRAINT amenities_pkey PRIMARY KEY (amenities_RoomKey)
);

-- Create HotelRoom Table Query with Primary Keys, Foreign Keys and Constraints

CREATE TABLE HotelRoom (
	room_number INTEGER NOT NULL,
	hotel INTEGER NOT NULL,
	price INTEGER NOT NULL,
	can_be_extended BOOLEAN NOT NULL,
	sea_view BOOLEAN NOT NULL,
	mountain_view BOOLEAN NOT NULL,
	capacity INTEGER NOT NULL,
	amenities INTEGER NOT NULL,
	CONSTRAINT capacity_range CHECK (capacity >=2 and capacity <= 7),
	CONSTRAINT price_range CHECK (price>=0),
	CONSTRAINT amenities_fkey FOREIGN KEY (amenities) 
	REFERENCES Amenities (amenities_RoomKey) MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT hotel_fkey FOREIGN KEY (hotel)
	REFERENCES Hotel (id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT room_num_pkey PRIMARY KEY (room_number)
);

-- Create Avaliability Table Query with Primary Keys, Foreign Keys and Constraints

CREATE TABLE Availability (
	availability_id INTEGER NOT NULL,
	hotel_id INTEGER NOT NULL,
	room_number INTEGER NOT NULL,
	isAvailable BOOLEAN NOT NULL,
	CONSTRAINT availability_pkey PRIMARY KEY (availability_id),
	CONSTRAINT hotel_id_fkey FOREIGN KEY (hotel_id)
		REFERENCES Hotel (id) MATCH SIMPLE
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT availability_fkey FOREIGN KEY (room_number)
		REFERENCES HotelRoom (room_number) MATCH SIMPLE
		ON UPDATE CASCADE ON DELETE CASCADE
);


-- Create Customer Table Query with Primary Keys, Foreign Keys and Constraints

CREATE TABLE Customer (
  id int PRIMARY KEY,
  first_name varchar NOT NULL,
  last_name varchar NOT NULL,
  registeration_date timestamp NOT NULL,
  street varchar NOT NULL,
  city varchar NOT NULL,
  province varchar NOT NULL,
  zipCode varchar NOT NULL,
  securityCode int NOT NULL,
  card_type varchar NOT NULL,
  card_number VARCHAR(19) NOT NULL,
  expiration_month int NOT NULL,
  experation_year int NOT NULL,
  CONSTRAINT check_month CHECK (expiration_month > 0 AND expiration_month < 13),
  CONSTRAINT check_year CHECK (experation_year >= 2021),
  CONSTRAINT check_securityCode CHECK (securityCode >= 001 and securityCode <= 999), 
  CONSTRAINT check_cardType CHECK (card_type = 'Visa' or card_type = 'Mastercard' or card_type = 'Cash'),
  CONSTRAINT check_province CHECK (province in ('British Columbia','Alberta','Saskatchewan','Manitoba','Ontario','Quebec','New Brunswick','Newfoundland and Labrador','Nova Scotia','Prince Edward Island','Nunavut','Northwest Territories','Yukon')));

	
-- Create BookingInfo Table Query with Primary Keys, Foreign Keys and Constraints

CREATE TABLE BookingInfo (
  confirmation_number int PRIMARY KEY,
  customer_id int NOT NULL,
  booking_date timestamp NOT NULL,
  room_type varchar,
  price int,
  check_in_date timestamp NOT NULL,
  check_out_date timestamp NOT NULL,
  number_of_occupants int,
  days_booked int,
  hotel_ID int NOT NULL,
  room_number int NOT NULL,
  Constraint boooking_custID FOREIGN KEY (customer_id) REFERENCES customer(id),
  Constraint booking_hotelID FOREIGN KEY (hotel_ID) REFERENCES hotel(id),
  Constraint booking_roomNum FOREIGN KEY (room_number) REFERENCES hotelroom(room_number),
  CONSTRAINT check_daysBooked CHECK (days_booked > 0),
  CONSTRAINT booking_roomType CHECK (room_type = 'Single' or room_type = 'Double' or room_type = 'Queen' or room_type = 'King' or room_type = 'Triple' or room_type = 'Quad'),
  CONSTRAINT check_bookPrice CHECK (price > 0),
  CONSTRAINT check_bookDays CHECK (days_booked > 0),
  CONSTRAINT check_bookOccupants CHECK (number_of_occupants > 0)
);


-- Create Renting Table Query with Primary Keys, Foreign Keys and Constraints

CREATE TABLE Renting (
  confirmation_number int PRIMARY KEY,
  customer_id int NOT NULL,
  room_number int NOT NULL,
  renting_date timestamp NOT NULL,
  room_type varchar NOT NULL,
  price int,
  check_in_date timestamp NOT NULL,
  check_out_date timestamp NOT NULL,
  days_rented int,
  number_of_occupants int,
  hotel_ID int NOT NULL,
  booking int,
  Constraint custID FOREIGN KEY (customer_id) REFERENCES Customer (id),
  Constraint roomNum FOREIGN KEY (room_number) REFERENCES HotelRoom (room_number),
  Constraint hotelID FOREIGN KEY (hotel_ID) REFERENCES Hotel (id),
  Constraint booked FOREIGN KEY (booking) REFERENCES BookingInfo (confirmation_number),
  CONSTRAINT roomType CHECK (room_type = 'Single' or room_type = 'Double' or room_type = 'Queen' or room_type = 'King' or room_type = 'Triple' or room_type = 'Quad'),
  CONSTRAINT check_price CHECK (price > 0),
  CONSTRAINT check_days CHECK (days_rented > 0),
  CONSTRAINT check_occupants CHECK (number_of_occupants > 0)
);


-- Create Functions and Triggers 

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


