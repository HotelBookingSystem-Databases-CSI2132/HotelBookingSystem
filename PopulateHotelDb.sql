----- Populate Tables -----

-- HotelChain Table

INSERT INTO HotelChain(id,brand_name,email_address,number_of_hotels,headquarters,street,city,province,zipCode,phone_number)

VALUES
(0,'Fairmont','fairmont@gmail.com',6,'Ottawa','98 Sparks Street','Ottawa','Ontario','K4F 2J9','613-700-3500'),
(1,'Intercontinental','intercontinental@gmail.com',6,'Ottawa','73 Queens Street','Ottawa','Ontario','K1D 2H4','613-800-4500'),
(2,'Four Seasons','fourseasons@gmail.com',6,'Ottawa','100 Wellington Street','Ottawa','Ontario','K4S 3F9','613-900-5500'),
(3,'Holiday Inn','holidayinn@gmail.com',6,'Montreal','17 Ave SW','Calgary','Alberta','K7T 3T4','403-335-0099'),
(4,'Westin','westin@gmail.com',6,'Calgary','11 Bay Street','Toronto','Ontario','K2F 2T3','416-815-1515');

-- Hotel Table

--Queries That Inserts Hotels (6 per Chain))
INSERT INTO Hotel(id,name,hotelChain,email_address,street,city,province,zipCode,number_of_rooms,phone_number,rating)

VALUES
(0,'Fairmont Chateau Laurier',0,'fairmontOttawa@gmail.com','1 Rideau Street','Ottawa','Ontario','K1N 8S7',5,'613-241-1414',5),
(1,'Fairmont Royal York',0,'fairmontToronto@gmail.com','12 Yonge Street','Toronto','Ontario','K2T 8J2',5,'416-210-1515',5),
(2,'Fairmont Vancouver Airport',0,'fairmontVancouver@gmail.com','75 Commercial Street','Vancouver','British Columbia','K2F 3S6',5,'604-101-1010',5),
(3,'Fairmont Palliser',0,'fairmontCalgary@gmail.com','1 Ave SW','Calgary', 'Alberta','K1N 3J7',5,'403-301-0011',5),
(4,'Fairmont The Queen Elizabeth',0,'fairmontMontreal@gmail.com','1 Old Montreal Street','Montreal','Quebec','K1N 3G7',5,'514-201-1200',5),
(5,'Fairmont Winnipeg',0,'fairmontWinnipeg@gmail.com','5 Joy Street','Winnipeg','Manitoba','K1H 8F7',5,'204-555-3535',5),

(6,'Intercontinental Ottawa',1,'intercontinentalOttawa@gmail.com','1 Rideau Street','Ottawa','Ontario','K1N 8S7',5,'613-241-1414',4),
(7,'Intercontinental Toronto',1,'intercontinentalToronto@gmail.com','12 Yonge Street','Toronto','Ontario','K2T 8J2',5,'416-210-1515',4),
(8,'Intercontinental Vancouver',1,'intercontinentalVancouver@gmail.com','75 Commercial Street','Vancouver','British Columbia','K2F 3S6',5,'604-101-1010',4),
(9,'Intercontinental Calgary',1,'intercontinentalCalgary@gmail.com','1 Ave SW','Calgary', 'Alberta','K1N 3J7',5,'403-301-0011',4),
(10,'Intercontinental Montreal',1,'intercontinentalMontreal@gmail.com','1 Old Montreal Street','Montreal','Quebec','K1N 3G7',5,'514-201-1200',4),
(11,'Intercontinental Winnipeg',1,'intercontinentalWinnipeg@gmail.com','5 Joy Street','Winnipeg','Manitoba','K1H 8F7',5,'204-555-3535',4),

(12,'Four Seasons Ottawa',2,'fsOttawa@gmail.com','1 Rideau Street','Ottawa','Ontario','K1N 8S7',5,'613-241-1414',3),
(13,'Four Seasons Toronto',2,'fsToronto@gmail.com','12 Yonge Street','Toronto','Ontario','K2T 8J2',5,'416-210-1515',3),
(14,'Four Seasons Vancouver',2,'fsVancouver@gmail.com','75 Commercial Street','Vancouver','British Columbia','K2F 3S6',5,'604-101-1010',3),
(15,'Four Seasons Calgary',2,'fsCalgary@gmail.com','1 Ave SW','Calgary', 'Alberta','K1N 3J7',5,'403-301-0011',3),
(16,'Four Seasons Montreal',2,'fsMontreal@gmail.com','1 Old Montreal Street','Montreal','Quebec','K1N 3G7',5,'514-201-1200',3),
(17,'Four Seasons Winnipeg',2,'fsWinnipeg@gmail.com','5 Joy Street','Winnipeg','Manitoba','K1H 8F7',5,'204-555-3535',3),


(18,'Holiday Inn Ottawa',3,'holidayInnOttawa@gmail.com','1 Rideau Street','Ottawa','Ontario','K1N 8S7',5,'613-241-1414',3),
(19,'Holiday Inn Toronto',3,'holidayInnToronto@gmail.com','12 Yonge Street','Toronto','Ontario','K2T 8J2',5,'416-210-1515',3),
(20,'Holiday Inn Vancouver',3,'holidayInnVancouver@gmail.com','75 Commercial Street','Vancouver','British Columbia','K2F 3S6',5,'604-101-1010',3),
(21,'Holiday Inn Calgary',3,'holidayInnCalgary@gmail.com','1 Ave SW','Calgary', 'Alberta','K1N 3J7',5,'403-301-0011',3),
(22,'Holiday Inn Montreal',3,'holidayInnMontreal@gmail.com','1 Old Montreal Street','Montreal','Quebec','K1N 3G7',5,'514-201-1200',3),
(23,'Holiday Inn Winnipeg',3,'holidayInnWinnipeg@gmail.com','5 Joy Street','Winnipeg','Manitoba','K1H 8F7',5,'204-555-3535',3),


(24,'Westin Ottawa',4,'WestinOttawa@gmail.com','1 Rideau Street','Ottawa','Ontario','K1N 8S7',5,'613-241-1414',4),
(25,'Westin Toronto',4,'WestinToronto@gmail.com','12 Yonge Street','Toronto','Ontario','K2T 8J2',5,'416-210-1515',4),
(26,'Westin Vancouver',4,'WestinVancouver@gmail.com','75 Commercial Street','Vancouver','British Columbia','K2F 3S6',5,'604-101-1010',4),
(27,'Westin Calgary',4,'WestinCalgary@gmail.com','1 Ave SW','Calgary', 'Alberta','K1N 3J7',5,'403-301-0011',4),
(28,'Westin Montreal',4,'WestinMontreal@gmail.com','1 Old Montreal Street','Montreal','Quebec','K1N 3G7',5,'514-201-1200',4),
(29,'Westin Winnipeg',4,'WestinWinnipeg@gmail.com','5 Joy Street','Winnipeg','Manitoba','K1H 8F7',5,'204-555-3535',4);

--Employee Table

--Queries that Inserts Employees (1 employee per hotel)

INSERT INTO Employee(id,employed_at,first_name,last_name,email_address,street,city,province,zipCode,job_title,start_date,end_date,salary)

VALUES
(0,0, 'John', 'Smith','smith@gmail.com' , '34 Leitrim Road', 'Ottawa' , 'Ontario', 'K1F 2T1', 'Manager', '2015-01-01 00:00:01', null, 89000),
(1,1, 'Jane', 'Doe', 'doe@gmail.com' , '50 Bay Street', 'Toronto' , 'Ontario', 'K1F 2F2', 'Manager', '2013-01-01 00:00:01', null, 90000),
(2,2, 'Sally', 'Fisher', 'fisher@gmail.com' , '101 Commercial Road', 'Vancouver' , 'British Columbia', 'K2G 4H1', 'Manager', '2019-01-01 00:00:01', null, 84000),
(3,3, 'Jack', 'Miller', 'miller@gmail.com' , '30 Terry Fox Road', 'Calgary' , 'Alberta', 'K4S 2N3', 'Manager', '2020-01-01 00:00:01', null, 95000),
(4,4, 'Tom', 'Willis', 'roger@gmail.com' , '21 Port Boulevard ',  'Montreal', 'Quebec', 'K3B 2G1', 'Manager', '2012-01-01 00:00:01', null, 109000),
(5,5, 'Sarah', 'Roger', 'roger@gmail.com' , '21 King Avenue', 'Winnipeg' , 'Manitoba', 'K3B 2G1', 'Manager','2015-01-01 00:00:01', null, 109000),

(6,6, 'Nikolas', 'Cannolly', 'cannolly@gmail.com' , '35 Sparks Street', 'Ottawa' , 'Ontario', 'K1F 2T1', 'Manager', '2009-01-01 00:00:0', null, 79000),
(7,7, 'Hajrah', 'Sykes', 'sykes@gmail.com' , '40 Yonge Street', 'Toronto' , 'Ontario', 'K1F 2F2', 'Manager', '2016-01-01 00:00:0', null, 92000),
(8,8, 'Caio', 'Chandler', 'chandler@gmail.com' , '100 Commercial Road', 'Vancouver' , 'British Columbia', 'K2G 4H1', 'Manager', '2019-01-01 00:00:01', null, 81000),
(9,9, 'Claire', 'Houston', 'houston@gmail.com' , '20 Terry Fox Road', 'Calgary' , 'Alberta', 'K4S 2N3', 'Manager', '2010-01-01 00:00:01', null, 105000),
(10,10, 'Lacie', 'Costa', 'costa@gmail.com' , '20 Port Boulevard ',  'Montreal', 'Quebec', 'K3B 2G1', 'Manager', '2014-01-01 00:00:01', null, 102000),
(11,11, 'Solomon', 'Callaghan', 'callaghan@gmail.com' , '30 King Avenue', 'Winnipeg' , 'Manitoba', 'K3B 2G1', 'Manager','2021-01-01 00:00:01', null, 100000),

(12,12, 'Arsalan', 'Woods', 'woods@gmail.com' , '40 Sparks Street', 'Ottawa' , 'Ontario', 'K1F 2T1', 'Manager', '2005-01-01 00:00:0', null, 89000),
(13,13, 'Gabriela', 'Kidd', 'kidd@gmail.com' , '20 Yonge Street', 'Toronto' , 'Ontario', 'K1F 2F2', 'Manager', '2018-01-01 00:00:0', null, 98500),
(14,14, 'Jovan', 'Alford', 'alford@gmail.com' , '10 Commercial Road', 'Vancouver' , 'British Columbia', 'K2G 4H1', 'Manager', '2017-01-01 00:00:01', null, 87000),
(15,15, 'Earnest', 'Valencia', 'valencia@gmail.com' , '15 Terry Fox Road', 'Calgary' , 'Alberta', 'K4S 2N3', 'Manager', '2020-01-01 00:00:01', null, 104000),
(16,16, 'Vihaan', 'Logan', 'logan@gmail.com' , '25 Port Boulevard ',  'Montreal', 'Quebec', 'K3B 2G1', 'Manager', '2021-01-01 00:00:01', null, 83000),
(17,17, 'Marcus', 'Cottrell', 'cottrell@gmail.com' , '45 King Avenue', 'Winnipeg' , 'Manitoba', 'K3B 2G1', 'Manager','2007-01-01 00:00:01', null, 85400),

(18,18, 'Federico', 'Portillo', 'portillo@gmail.com' , '50 Sparks Street', 'Ottawa' , 'Ontario', 'K1F 2T1', 'Manager', '2009-01-01 00:00:0', null, 80000),
(19,19, 'Saeed', 'Griffith', 'griffith@gmail.com' , '30 Yonge Street', 'Toronto' , 'Ontario', 'K1F 2F2', 'Manager', '2011-01-01 00:00:0', null, 84300),
(20,20, 'Ellice', 'Sanford', 'sanford@gmail.com' , '200 Commercial Road', 'Vancouver' , 'British Columbia', 'K2G 4H1', 'Manager', '2015-01-01 00:00:01', null, 96000),
(21,21, 'Kenya', 'Wolfe', 'wolfe@gmail.com' , '120 Terry Fox Road', 'Calgary' , 'Alberta', 'K4S 2N3', 'Manager', '2013-01-01 00:00:01', null, 104000),
(22,22, 'Kim', 'Blankenship', 'blankenship@gmail.com' , '25 Port Boulevard ',  'Montreal', 'Quebec', 'K3B 2G1', 'Manager', '2019-01-01 00:00:01', null, 103000),
(23,23, 'Tanya', 'Norris', 'norris@gmail.com' , '101 King Avenue', 'Winnipeg' , 'Manitoba', 'K3B 2G1', 'Manager','2010-01-01 00:00:01', null, 88500),

(24,24, 'Alessandra', 'Chan', 'chan@gmail.com' , '100 Sparks Street', 'Ottawa' , 'Ontario', 'K1F 2T1', 'Manager', '2019-01-01 00:00:0', null, 96000),
(25,25, 'Walid', 'Chaney', 'chaney@gmail.com' , '90 Yonge Street', 'Toronto' , 'Ontario', 'K1F 2F2', 'Manager', '2021-01-01 00:00:0', null, 88300),
(26,26, 'Nicky', 'Albert', 'albert@gmail.com' , '99 Commercial Road', 'Vancouver' , 'British Columbia', 'K2G 4H1', 'Manager', '2013-01-01 00:00:01', null, 91000),
(27,27, 'Kirsty', 'Fraser', 'fraser@gmail.com' , '85 Terry Fox Road', 'Calgary' , 'Alberta', 'K4S 2N3', 'Manager', '2015-01-01 00:00:01', null, 89000),
(28,28, 'Donnell', 'Mendoza', 'mendoza@gmail.com' , '74 Port Boulevard ',  'Montreal', 'Quebec', 'K3B 2G1', 'Manager', '2016-01-01 00:00:01', null, 95000),
(29,29, 'Nel', 'Brookes', 'brookes@gmail.com' , '7 King Avenue', 'Winnipeg' , 'Manitoba', 'K3B 2G1', 'Manager','2007-01-01 00:00:01', null, 110500);

-- Amenities Table

INSERT INTO Amenities (amenities_RoomKey, tv, minibar, fridge, airconditioner, wifi, others)

VALUES
(0, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(1, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette", "living_area", "safe"}'),
(2, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(3, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(4, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(5, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),

(6, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(7, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(8, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(9, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(10, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(11, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(12, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(13, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(14, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(15, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(16, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(17, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(18, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(19, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(20, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(21, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(22, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(23, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(24, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(25, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(26, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(27, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(28, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(29, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(30, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(31, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(32, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(33, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(34, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(35, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(36, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(37, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(38, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(39, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(40, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(41, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(42, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(43, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(44, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(45, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(46, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(47, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(48, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(49, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(50, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(51, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(52, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(53, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(54, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(55, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(56, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(57, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(58, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(59, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(60, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(61, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(62, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(63, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(64, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(65, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(66, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(67, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(68, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(69, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(70, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(71, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(72, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(73, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(74, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(75, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(76, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(77, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(78, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(79, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(80, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(81, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(82, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(83, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(84, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(85, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(86, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(87, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(88, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(89, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(90, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(91, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(92, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(93, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(94, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(95, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(96, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(97, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(98, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(99, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(100, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(101, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(102, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(103, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(104, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(105, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(106, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(107, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(108, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(109, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(110, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(111, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(112, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(113, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(114, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(115, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(116, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(117, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(118, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(119, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(120, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(121, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(122, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(123, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(124, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(125, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(126, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(127, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(128, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(129, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(130, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(131, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(132, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(133, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(134, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(135, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(136, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(137, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(138, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(139, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(140, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(141, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(142, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(143, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(144, TRUE, TRUE, TRUE, TRUE, TRUE, '{}'),
(145, TRUE, TRUE, TRUE, TRUE, TRUE, '{"jaccuzi", "kitchenette"}'),

(146, FALSE, FALSE, TRUE, TRUE, FALSE, '{}'),
(147, FALSE, FALSE, TRUE, TRUE, TRUE, '{}'),
(148, TRUE, FALSE, TRUE, TRUE, TRUE, '{}'),
(149, TRUE, TRUE, TRUE, TRUE, TRUE, '{}');

-- HotelRoom Table

INSERT INTO HotelRoom (room_number, hotel, price, can_be_extended, sea_view, mountain_view, capacity, amenities)

VALUES
(0, 0, 200, TRUE, TRUE, FALSE, 2, 0),
(1, 0, 1000, TRUE, TRUE, TRUE, 2, 1),
(2, 0, 500, TRUE, TRUE, FALSE, 3, 2),
(3, 0, 1000, TRUE, TRUE, FALSE, 4, 3),
(4, 0, 2000, TRUE, TRUE, FALSE, 5, 4),
(5, 0, 3000, TRUE, TRUE, TRUE, 7, 5),

(6, 1, 200, FALSE, TRUE, TRUE, 2,6),
(7, 1, 500, FALSE, TRUE, TRUE, 3,7),
(8, 1, 1000, FALSE, TRUE, TRUE, 4,8),
(9, 1, 2000, FALSE, TRUE, TRUE, 5,9),
(10, 1, 3000, TRUE, TRUE, TRUE, 7,10),

(11, 2, 200, FALSE, TRUE, FALSE, 2,11),
(12, 2, 500, FALSE, TRUE, FALSE, 3,12),
(13, 2, 1000, FALSE, TRUE, FALSE, 4,13),
(14, 2, 2000, FALSE, TRUE, FALSE, 5,14),
(15, 2, 3000, TRUE, TRUE, TRUE, 7,15),

(16, 3, 200, TRUE, TRUE, FALSE, 2,16),
(17, 3, 500, TRUE, TRUE, FALSE, 3,17),
(18, 3, 1000, TRUE, TRUE, FALSE, 4,18),
(19, 3, 2000, TRUE, TRUE, FALSE, 5,19),
(20, 3, 3000, TRUE, TRUE, TRUE, 7,20),

(21, 4, 200, FALSE, TRUE, TRUE, 2,21),
(22, 4, 500, FALSE, TRUE, TRUE, 3,22),
(23, 4, 1000, FALSE, TRUE, TRUE, 4,23),
(24, 4, 2000, FALSE, TRUE, TRUE, 5,24),
(25, 4, 3000, TRUE, TRUE, TRUE, 7,25),

(26, 5, 200, FALSE, TRUE, FALSE, 2,26),
(27, 5, 500, FALSE, TRUE, FALSE, 3,27),
(28, 5, 1000, FALSE, TRUE, FALSE, 4,28),
(29, 5, 2000, FALSE, TRUE, FALSE, 5,29),
(30, 5, 3000, TRUE, TRUE, TRUE, 7,30),

(31, 6, 200, TRUE, TRUE, FALSE, 2,31),
(32, 6, 500, TRUE, TRUE, FALSE, 3,32),
(33, 6, 1000, TRUE, TRUE, FALSE, 4,33),
(34, 6, 2000, TRUE, TRUE, FALSE, 5,34),
(35, 6, 3000, TRUE, TRUE, TRUE, 7,35),

(36, 7, 200, FALSE, TRUE, TRUE, 2,36),
(37, 7, 500, FALSE, TRUE, TRUE, 3,37),
(38, 7, 1000, FALSE, TRUE, TRUE, 4,38),
(39, 7, 2000, FALSE, TRUE, TRUE, 5,39),
(40, 7, 3000, TRUE, TRUE, TRUE, 7,40),

(41, 8, 200, FALSE, TRUE, FALSE, 2,41),
(42, 8, 500, FALSE, TRUE, FALSE, 3,42),
(43, 8, 1000, FALSE, TRUE, FALSE, 4,43),
(44, 8, 2000, FALSE, TRUE, FALSE, 5,44),
(45, 8, 3000, TRUE, TRUE, TRUE, 7,45),

(46, 9, 200, TRUE, TRUE, FALSE, 2,46),
(47, 9, 500, TRUE, TRUE, FALSE, 3,47),
(48, 9, 1000, TRUE, TRUE, FALSE, 4,48),
(49, 9, 2000, TRUE, TRUE, FALSE, 5,49),
(50, 9, 3000, TRUE, TRUE, TRUE, 7,50),

(51, 10, 200, FALSE, TRUE, TRUE, 2,51),
(52, 10, 500, FALSE, TRUE, TRUE, 3,52),
(53, 10, 1000, FALSE, TRUE, TRUE, 4,53),
(54, 10, 2000, FALSE, TRUE, TRUE, 5,54),
(55, 10, 3000, TRUE, TRUE, TRUE, 7,55),

(56, 11, 200, FALSE, TRUE, FALSE, 2,56),
(57, 11, 500, FALSE, TRUE, FALSE, 3,57),
(58, 11, 1000, FALSE, TRUE, FALSE, 4,58),
(59, 11, 2000, FALSE, TRUE, FALSE, 5,59),
(60, 11, 3000, TRUE, TRUE, TRUE, 7,60),

(61, 12, 200, TRUE, TRUE, FALSE, 2,61),
(62, 12, 500, TRUE, TRUE, FALSE, 3,62),
(63, 12, 1000, TRUE, TRUE, FALSE, 4,63),
(64, 12, 2000, TRUE, TRUE, FALSE, 5,64),
(65, 12, 3000, TRUE, TRUE, TRUE, 7,65),

(66, 13, 200, FALSE, TRUE, TRUE, 2,66),
(67, 13, 500, FALSE, TRUE, TRUE, 3,67),
(68, 13, 1000, FALSE, TRUE, TRUE, 4,68),
(69, 13, 6969, FALSE, TRUE, TRUE, 6,69),
(70, 13, 3000, TRUE, TRUE, TRUE, 7,70),

(71, 14, 200, FALSE, TRUE, FALSE, 2,71),
(72, 14, 500, FALSE, TRUE, FALSE, 3,72),
(73, 14, 1000, FALSE, TRUE, FALSE, 4,73),
(74, 14, 2000, FALSE, TRUE, FALSE, 5,74),
(75, 14, 3000, TRUE, TRUE, FALSE, 7,75),

(76, 15, 200, TRUE, TRUE, FALSE, 2,76),
(77, 15, 500, TRUE, TRUE, FALSE, 3,77),
(78, 15, 1000, TRUE, TRUE, FALSE, 4,78),
(79, 15, 2000, TRUE, TRUE, FALSE, 5,79),
(80, 15, 3000, TRUE, TRUE, TRUE, 7,80),

(81, 16, 200, FALSE, TRUE, TRUE, 2,81),
(82, 16, 500, FALSE, TRUE, TRUE, 3,82),
(83, 16, 1000, FALSE, TRUE, TRUE, 4,83),
(84, 16, 2000, FALSE, TRUE, TRUE, 5,84),
(85, 16, 3000, TRUE, TRUE, TRUE, 7,85),

(86, 17, 500, FALSE, TRUE, FALSE, 2,86),
(87, 17, 500, FALSE, TRUE, FALSE, 3,87),
(88, 17, 1000, FALSE, TRUE, FALSE, 4,88),
(89, 17, 2000, FALSE, TRUE, FALSE, 5,89),
(90, 17, 3000, TRUE, TRUE, TRUE, 7,90),

(91, 18, 200, TRUE, TRUE, FALSE, 2,91),
(92, 18, 500, TRUE, TRUE, FALSE, 3,92),
(93, 18, 1000, TRUE, TRUE, FALSE, 4,93),
(94, 18, 2000, TRUE, TRUE, FALSE, 5,94),
(95, 18, 3000, TRUE, TRUE, TRUE, 7,95),

(96, 19, 200, FALSE, TRUE, TRUE, 2,96),
(97, 19, 500, FALSE, TRUE, TRUE, 3,97),
(98, 19, 1000, FALSE, TRUE, TRUE, 4,98),
(99, 19, 2000, FALSE, TRUE, TRUE, 5,99),
(100, 19, 3000, TRUE, TRUE, TRUE, 7,100),

(101, 20, 200, FALSE, TRUE, FALSE, 2,101),
(102, 20, 500, FALSE, TRUE, FALSE, 3,102),
(103, 20, 1000, FALSE, TRUE, FALSE, 4,103),
(104, 20, 2000, FALSE, TRUE, FALSE, 5,104),
(105, 20, 3000, TRUE, TRUE, TRUE, 7,105),

(106, 21, 200, TRUE, TRUE, FALSE, 2,106),
(107, 21, 500, TRUE, TRUE, FALSE, 3,107),
(108, 21, 1000, TRUE, TRUE, FALSE, 4,108),
(109, 21, 2000, TRUE, TRUE, FALSE, 5,109),
(110, 21, 3000, TRUE, TRUE, TRUE, 7,110),

(111, 22, 200, FALSE, TRUE, TRUE, 2,111),
(112, 22, 500, FALSE, TRUE, TRUE, 3,112),
(113, 22, 1000, FALSE, TRUE, TRUE, 4,113),
(114, 22, 2000, FALSE, TRUE, TRUE, 5,114),
(115, 22, 3000, TRUE, TRUE, TRUE, 7,115),

(116, 23, 200, FALSE, TRUE, FALSE, 2,116),
(117, 23, 500, FALSE, TRUE, FALSE, 3,117),
(118, 23, 1000, FALSE, TRUE, FALSE, 4,118),
(119, 23, 2000, FALSE, TRUE, FALSE, 5,119),
(120, 23, 3000, TRUE, TRUE, TRUE, 7,120),

(121, 24, 200, TRUE, TRUE, FALSE, 2,121),
(122, 24, 500, TRUE, TRUE, FALSE, 3,122),
(123, 24, 1000, TRUE, TRUE, FALSE, 4,123),
(124, 24, 2000, TRUE, TRUE, FALSE, 5,124),
(125, 24, 3000, TRUE, TRUE, TRUE, 7,125),

(126, 25, 200, FALSE, TRUE, TRUE, 2,126),
(127, 25, 500, FALSE, TRUE, TRUE, 3,127),
(128, 25, 1000, FALSE, TRUE, TRUE, 4,128),
(129, 25, 2000, FALSE, TRUE, TRUE, 5,129),
(130, 25, 3000, TRUE, TRUE, TRUE, 7,130),

(131, 26, 200, FALSE, TRUE, FALSE, 2,131),
(132, 26, 500, FALSE, TRUE, FALSE, 3,132),
(133, 26, 1000, FALSE, TRUE, FALSE, 5,133),
(134, 26, 2000, FALSE, TRUE, FALSE, 4,134),
(135, 26, 3000, TRUE, TRUE, TRUE, 7,135),

(136, 27, 200, TRUE, TRUE, FALSE, 2,136),
(137, 27, 500, TRUE, TRUE, FALSE, 3,137),
(138, 27, 1000, TRUE, TRUE, FALSE, 4,138),
(139, 27, 2000, TRUE, TRUE, FALSE, 5,139),
(140, 27, 3000, TRUE, TRUE, TRUE, 7,140),

(141, 28, 200, FALSE, TRUE, TRUE, 2,141),
(142, 28, 500, FALSE, TRUE, TRUE, 3,142),
(143, 28, 1000, FALSE, TRUE, TRUE, 4,143),
(144, 28, 2000, FALSE, TRUE, TRUE, 5,144),
(145, 28, 3000, TRUE, TRUE, TRUE, 7,145),

(146, 29, 200, FALSE, TRUE, FALSE, 2,146),
(147, 29, 500, FALSE, TRUE, FALSE, 3,147),
(148, 29, 1000, FALSE, TRUE, FALSE, 4,148),
(149, 29, 2000, FALSE, TRUE, FALSE, 5,149);


-- Availability Table

INSERT INTO Availability (availability_id, hotel_id, room_number, isAvailable)

VALUES
(0, 0, 0, TRUE),
(1, 0, 1, TRUE),
(2, 0, 2, TRUE),
(3, 0, 3, TRUE),
(4, 0, 4, TRUE),
(5, 0, 5, TRUE),

(6, 1, 6, TRUE),
(7, 1, 7, TRUE),
(8, 1, 8, TRUE),
(9, 1, 9, TRUE),
(10, 1, 10, TRUE),

(11, 2, 11, TRUE),
(12, 2, 12, TRUE),
(13, 2, 13, TRUE),
(14, 2, 14, TRUE),
(15, 2, 15, TRUE),

(16, 3, 16, TRUE),
(17, 3, 17, TRUE),
(18, 3, 18, TRUE),
(19, 3, 19, TRUE),
(20, 3, 20, TRUE),

(21, 4, 21, TRUE),
(22, 4, 22, TRUE),
(23, 4, 23, TRUE),
(24, 4, 24, TRUE),
(25, 4, 25, TRUE),

(26, 5, 26, TRUE),
(27, 5, 27, TRUE),
(28, 5, 28, TRUE),
(29, 5, 29, TRUE),
(30, 5, 30, TRUE),

(31, 6, 31, TRUE),
(32, 6, 32, TRUE),
(33, 6, 33, TRUE),
(34, 6, 34, TRUE),
(35, 6, 35, TRUE),

(36, 7, 36, TRUE),
(37, 7, 37, TRUE),
(38, 7, 38, TRUE),
(39, 7, 39, TRUE),
(40, 7, 40, TRUE),

(41, 8, 41, TRUE),
(42, 8, 42, TRUE),
(43, 8, 43, TRUE),
(44, 8, 44, TRUE),
(45, 8, 45, TRUE),

(46, 9, 46, TRUE),
(47, 9, 47, TRUE),
(48, 9, 48, TRUE),
(49, 9, 49, TRUE),
(50, 9, 50, TRUE),

(51, 10, 51, TRUE),
(52, 10, 52, TRUE),
(53, 10, 53, TRUE),
(54, 10, 54, TRUE),
(55, 10, 55, TRUE),

(56, 11, 56, TRUE),
(57, 11, 57, TRUE),
(58, 11, 58, TRUE),
(59, 11, 59, TRUE),
(60, 11, 60, TRUE),

(61, 12, 61, TRUE),
(62, 12, 62, TRUE),
(63, 12, 63, TRUE),
(64, 12, 64, TRUE),
(65, 12, 65, TRUE),

(66, 13, 66, TRUE),
(67, 13, 67, TRUE),
(68, 13, 68, TRUE),
(69, 13, 69, TRUE),
(70, 13, 70, TRUE),

(71, 14, 71, TRUE),
(72, 14, 72, TRUE),
(73, 14, 73, TRUE),
(74, 14, 74, TRUE),
(75, 14, 75, TRUE),

(76, 15, 76, TRUE),
(77, 15, 77, TRUE),
(78, 15, 78, TRUE),
(79, 15, 79, TRUE),
(80, 15, 80, TRUE),

(81, 16, 81, TRUE),
(82, 16, 82, TRUE),
(83, 16, 83, TRUE),
(84, 16, 84, TRUE),
(85, 16, 85, TRUE),

(86, 17, 86, TRUE),
(87, 17, 87, TRUE),
(88, 17, 88, TRUE),
(89, 17, 89, TRUE),
(90, 17, 90, TRUE),

(91, 18, 91, TRUE),
(92, 18, 92, TRUE),
(93, 18, 93, TRUE),
(94, 18, 94, TRUE),
(95, 18, 95, TRUE),

(96, 19, 96, TRUE),
(97, 19, 97, TRUE),
(98, 19, 98, TRUE),
(99, 19, 99, TRUE),
(100, 19, 100, TRUE),

(101, 20, 101, TRUE),
(102, 20, 102, TRUE),
(103, 20, 103, TRUE),
(104, 20, 104, TRUE),
(105, 20, 105, TRUE),

(106, 21, 106, TRUE),
(107, 21, 107, TRUE),
(108, 21, 108, TRUE),
(109, 21, 109, TRUE),
(110, 21, 110, TRUE),

(111, 22, 111, TRUE),
(112, 22, 112, TRUE),
(113, 22, 113, TRUE),
(114, 22, 114, TRUE),
(115, 22, 115, TRUE),

(116, 23, 116, TRUE),
(117, 23, 117, TRUE),
(118, 23, 118, TRUE),
(119, 23, 119, TRUE),
(120, 23, 120, TRUE),

(121, 24, 121, TRUE),
(122, 24, 122, TRUE),
(123, 24, 123, TRUE),
(124, 24, 124, TRUE),
(125, 24, 125, TRUE),

(126, 25, 126, TRUE),
(127, 25, 127, TRUE),
(128, 25, 128, TRUE),
(129, 25, 129, TRUE),
(130, 25, 130, TRUE),

(131, 26, 131, TRUE),
(132, 26, 132, TRUE),
(133, 26, 133, TRUE),
(134, 26, 134, TRUE),
(135, 26, 135, TRUE),

(136, 27, 136, TRUE),
(137, 27, 137, TRUE),
(138, 27, 138, TRUE),
(139, 27, 139, TRUE),
(140, 27, 140, TRUE),

(141, 28, 141, TRUE),
(142, 28, 142, TRUE),
(143, 28, 143, TRUE),
(144, 28, 144, TRUE),
(145, 28, 145, TRUE),

(146, 29, 146, TRUE),
(147, 29, 147, TRUE),
(148, 29, 148, TRUE),
(149, 29, 149, TRUE);

-- Cutomer Table

INSERT INTO Customer
  (id,first_name, last_name, registeration_date, street, city, province, zipCode, securityCode, card_type, card_number, expiration_month, experation_year, phone_number)
VALUES
  (0, 'John', 'Doe', '2004-10-19 10:23:54+02', 'Sarcee Trail', 'Calgary', 'Alberta', 'G6H 9F8', 010, 'Visa', '7451-1100-3204-5672', 8, 2023,'613-241-1414'),
  (1, 'Jan', 'Doe', '2004-10-19 10:23:54+02', 'King Edward Avenue', 'Ottawa', 'Ontario', 'B7C 0S8', 140, 'Visa', '1918-1987-7432-0281', 3, 2023,'416-210-1515'),
  (2, 'Mike', 'Edward', '2004-10-19 10:23:54+02', 'Quebec Street', 'Monterial', 'Quebec', 'A6D 6J8', 610, 'Mastercard', '3434-8678-1260-1183', 2, 2025,'403-301-0011'),
  (3, 'Judy', 'Green', '2004-10-19 10:23:54+02', 'Yonge Street', 'Toronto', 'Ontario', 'K2H 9F5', 019, 'Visa', '6286-0479-1781-9559', 5, 2022,'204-555-3535'),
  (6, 'Chandler', 'Rose', '2021-03-07', '17 Street', 'Edmonton', 'Alberta', 'X6V 9P7', 213, 'Mastercard', '3525-5956-3738-2829', 7, 2024,'604-101-1010');

-- BookingInfo Table
INSERT INTO BookingInfo
  ( confirmation_number, customer_id, booking_date, room_type, price, check_in_month, check_in_day, check_in_year, check_out_month, check_out_day, check_out_year, number_of_occupants, days_booked, hotel_ID, room_number)
VALUES
  (259485837, 0, '2021-03-05', 'Single', 200, 3, 5, 2021, 3, 15, 2021, 1, 10, 0, 5),
  (631388097, 1, '2021-03-06', 'Double', 300, 3, 5, 2021, 3, 15, 2021, 2, 12, 1, 10),
  (572145387, 2, '2021-03-07', 'Triple', 400, 4, 10, 2021, 3, 15, 2021, 3, 2, 2, 15),
  (745110007, 3, '2021-03-09', 'King', 700, 5, 10, 2021, 3, 15, 2021, 2, 3, 3, 20),
  (784345857, 6, '2021-03-15', 'Queen', 600, 6, 10, 2021, 3, 15, 2021, 2, 4, 4, 25),

  (259858346, 0, '2021-03-05', 'Single', 200, 3, 5, 2021, 3, 15, 2021, 1, 10, 5, 30),
  (633880896, 1, '2021-03-06', 'Double', 300, 3, 5, 2021, 3, 15, 2021, 2, 12, 6, 35),
  (521458386, 2, '2021-03-07', 'Triple', 400, 3, 5, 2021, 3, 15, 2021, 3, 2, 7, 40),
  (751110006, 3, '2021-03-09', 'King', 700, 3, 5, 2021, 3, 15, 2021, 2, 3, 8, 45),
  (743345856, 6, '2021-03-15', 'Queen', 600, 3, 5, 2021, 3, 15, 2021, 2, 4, 9, 50),

  (294858345, 0, '2021-03-05', 'Single', 200, 3, 5, 2021, 3, 15, 2021, 1, 10, 10, 55),
  (613880895, 1, '2021-03-06', 'Double', 300, 3, 5, 2021, 3, 15, 2021, 2, 12, 11, 60),
  (521458385, 2, '2021-03-07', 'Triple', 400, 3, 5, 2021, 3, 15, 2021, 3, 2, 12, 65),
  (751110005, 3, '2021-03-09', 'King', 700, 3, 5, 2021, 3, 15, 2021, 2, 3, 13, 70),
  (743345855, 6, '2021-03-15', 'Queen', 600, 3, 5, 2021, 3, 15, 2021, 2, 4, 14, 75),


  (294858344, 0, '2021-03-05', 'Single', 200, 3, 5, 2021, 3, 15, 2021, 1, 10, 15, 80),
  (613880894, 1, '2021-03-06', 'Double', 300, 3, 5, 2021, 3, 15, 2021, 2, 12, 16, 85),
  (521458384, 2, '2021-03-07', 'Triple', 400, 3, 5, 2021, 3, 15, 2021, 3, 2, 17, 90),
  (751110004, 3, '2021-03-09', 'King', 700, 3, 5, 2021, 3, 15, 2021, 2, 3, 18, 95),
  (743345854, 6, '2021-03-15', 'Queen', 600, 3, 5, 2021, 3, 15, 2021, 2, 4, 19, 100),


  (259858343, 0, '2021-03-05', 'Single', 200, 3, 5, 2021, 3, 15, 2021, 1, 10, 20, 105),
  (631880893, 1, '2021-03-06', 'Double', 300, 3, 5, 2021, 3, 15, 2021, 2, 12, 21, 110),
  (572458383, 2, '2021-03-07', 'Triple', 400, 3, 5, 2021, 3, 15, 2021, 3, 2, 22, 115),
  (745110003, 3, '2021-03-09', 'King', 700, 3, 5, 2021, 3, 15, 2021, 2, 3, 23, 120),
  (784345853, 6, '2021-03-15', 'Queen', 600, 3, 5, 2021, 3, 15, 2021, 2, 4, 24, 125),

  (294858342, 0, '2021-03-05', 'Single', 200, 3, 5, 2021, 3, 15, 2021, 1, 10, 25, 130),
  (633880892, 1, '2021-03-06', 'Double', 300, 3, 5, 2021, 3, 15, 2021, 2, 12, 26, 135),
  (571458382, 2, '2021-03-07', 'Triple', 400, 3, 5, 2021, 3, 15, 2021, 3, 2, 27, 140),
  (741110002, 3, '2021-03-09', 'King', 700, 3, 5, 2021, 3, 15, 2021, 2, 3, 28, 145),
  (783345852, 6, '2021-03-15', 'Queen', 600, 3, 5, 2021, 3, 15, 2021, 2, 4, 29, 149);

-- Renting Table

INSERT INTO Renting
  ( confirmation_number, customer_id, renting_date, room_type, price, check_in_month, check_in_day, check_in_year, check_out_month, check_out_day, check_out_year, number_of_occupants, days_rented, hotel_ID, room_number, booking)
VALUES
  (259485837, 0, '2021-03-05', 'Single', 200, 3, 5, 2021, 3, 15, 2021, 1, 10, 0, 5, 259485837),
  (631388097, 1, '2021-03-06', 'Double', 300, 3, 5, 2021, 3, 15, 2021, 2, 12, 1, 10, 631388097),
  (572145387, 2, '2021-03-07', 'Triple', 400, 3, 5, 2021, 3, 15, 2021, 3, 2, 2, 15, NULL),
  (745110007, 3, '2021-03-09', 'King', 700, 3, 5, 2021, 3, 15, 2021, 2, 3, 3, 20, NULL),
  (784345857, 6, '2021-03-15', 'Queen', 600, 3, 5, 2021, 3, 15, 2021, 2, 4, 4, 25, NULL),

  (259858346, 0, '2021-03-05', 'Single', 200, 3, 5, 2021, 3, 15, 2021, 1, 10, 5, 30, NULL),
  (633880896, 1, '2021-03-06', 'Double', 300, 3, 5, 2021, 3, 15, 2021, 2, 12, 6, 35, NULL),
  (521458386, 2, '2021-03-07', 'Triple', 400, 3, 5, 2021, 3, 15, 2021, 3, 2, 7, 40, 521458386),
  (751110006, 3, '2021-03-09', 'King', 700, 3, 5, 2021, 3, 15, 2021, 2, 3, 8, 45, NULL),
  (743345856, 6, '2021-03-15', 'Queen', 600, 3, 5, 2021, 3, 15, 2021, 2, 4, 9, 50, NULL),

  (294858345, 0, '2021-03-05', 'Single', 200, 3, 5, 2021, 3, 15, 2021, 1, 10, 10, 55, NULL),
  (613880895, 1, '2021-03-06', 'Double', 300, 3, 5, 2021, 3, 15, 2021, 2, 12, 11, 60, NULL),
  (521458385, 2, '2021-03-07', 'Triple', 400, 3, 5, 2021, 3, 15, 2021, 3, 2, 12, 65, NULL),
  (751110005, 3, '2021-03-09', 'King', 700, 3, 5, 2021, 3, 15, 2021, 2, 3, 13, 70, 751110005),
  (743345855, 6, '2021-03-15', 'Queen', 600, 3, 5, 2021, 3, 15, 2021, 2, 4, 14, 75, 743345855),


  (294858344, 0, '2021-03-05', 'Single', 200, 3, 5, 2021, 3, 15, 2021, 1, 10, 15, 80, NULL),
  (613880894, 1, '2021-03-06', 'Double', 300, 3, 5, 2021, 3, 15, 2021, 2, 12, 16, 85, 613880894),
  (521458384, 2, '2021-03-07', 'Triple', 400, 12, 10, 2021, 3, 15, 2021, 3, 2, 17, 90, NULL),
  (751110004, 3, '2021-03-09', 'King', 700, 3, 5, 2021, 3, 15, 2021, 2, 3, 18, 95, NULL),
  (743345854, 6, '2021-03-15', 'Queen', 600, 3, 5, 2021, 3, 15, 2021, 2, 4, 19, 100, NULL),


  (259858343, 0, '2021-03-05', 'Single', 200, 3, 5, 2021, 3, 15, 2021, 1, 10, 20, 105, NULL),
  (631880893, 1, '2021-03-06', 'Double', 300, 6, 10, 2021, 3, 15, 2021, 2, 12, 21, 110, NULL),
  (572458383, 2, '2021-03-07', 'Triple', 400, 7, 10, 2021, 3, 15, 2021, 3, 2, 22, 115, NULL),
  (745110003, 3, '2021-03-09', 'King', 700, 4, 10, 2021, 3, 15, 2021, 2, 3, 23, 120, 745110003),
  (784345853, 6, '2021-03-15', 'Queen', 600, 3, 5, 2021, 3, 15, 2021, 2, 4, 24, 125, NULL),

  (294858342, 0, '2021-03-05', 'Single', 200, 3, 5, 2021, 3, 15, 2021, 1, 10, 25, 130, NULL),
  (633880892, 1, '2021-03-06', 'Double', 300, 3, 5, 2021, 3, 15, 2021, 2, 12, 26, 135, NULL),
  (571458382, 2, '2021-03-07', 'Triple', 400, 3, 5, 2021, 3, 15, 2021, 3, 2, 27, 140, NULL),
  (741110002, 3, '2021-03-09', 'King', 700, 3, 5, 2021, 3, 15, 2021, 2, 3, 28, 145, NULL),
  (783345852, 6, '2021-03-15', 'Queen', 600, 3, 5, 2021, 3, 15, 2021, 2, 4, 29, 149, 783345852)
