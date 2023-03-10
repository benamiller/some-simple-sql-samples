-- Ben Miller 2022-03-10

USE hotelSoftwareGuild;

/*
1.
Write a query that returns a list of reservations that end in July 2023, 
including the name of the guest, the room number(s), and the reservation dates.
*/
SELECT 
	Reservations.reservationID AS "Reservation ID",
    Reservations.roomNumber AS "Room Number",
    Guests.firstName AS "First Name",
    Guests.lastName AS "Last Name",
    Reservations.startDate AS "Check In",
    Reservations.endDate AS "Check Out" 
FROM Reservations 
JOIN Guests ON Guests.guestID = Reservations.guestID
WHERE endDate BETWEEN "2023-07-01" AND "2023-08-01";

/*
1. RESULT
Reservation ID	Room Number	First Name	Last Name	Check In	Check Out
14				205			Ben			Miller		2023-06-28	2023-07-02
15				204			Walter		Holaway		2023-07-13	2023-07-14
16				401			Wilfred		Vise		2023-07-18	2023-07-21
17				303			Bettyann	Seery		2023-07-28	2023-07-29
/*



/*
2.
Write a query that returns a list of all reservations for rooms with a jacuzzi,
displaying the guest's name, the room number, and the dates of the reservation.
*/
SELECT
	Reservations.reservationID AS "Reservation ID",
    Amenities.amenityType AS "Amenity",
    Reservations.roomNumber AS "Room Number",
    Guests.firstName AS "First Name",
    Guests.lastName AS "Last Name",
    Reservations.startDate AS "Check In",
    Reservations.endDate AS "Check Out"
FROM Reservations
JOIN RoomsToAmenities
ON RoomsToAmenities.roomNumber = Reservations.roomNumber
JOIN Amenities 
ON RoomsToAmenities.amenityID = Amenities.amenityID
JOIN Guests
ON Guests.guestID = Reservations.guestID
WHERE RoomsToAmenities.amenityID = 4;
/*
2. RESULTS
-- THE JACUZZI FIELD IS INCLUDED FOR CLARITY
Reservation ID	Amenity	Room Number	First Name	Last Name	Check In	Check Out
4				Jacuzzi	201			Karie		Yang		2023-03-06	2023-03-07
2				Jacuzzi	203			Bettyann	Seery		2023-02-05	2023-02-10
20				Jacuzzi	203			Karie		Yang		2023-09-13	2023-09-15
14				Jacuzzi	205			Ben			Miller		2023-06-28	2023-07-02
10				Jacuzzi	207			Wilfred		Vise		2023-04-23	2023-04-24
9				Jacuzzi	301			Walter		Holaway		2023-04-09	2023-04-13
22				Jacuzzi	301			Mack		Simmer		2023-11-22	2023-11-25
17				Jacuzzi	303			Bettyann	Seery		2023-07-28	2023-07-29
3				Jacuzzi	305			Duane		Cullison	2023-02-22	2023-02-24
18				Jacuzzi	305			Bettyann	Seery		2023-08-30	2023-09-01
5				Jacuzzi	307			Ben			Miller		2023-03-17	2023-03-20
*/



/*
3.
Write a query that returns all the rooms reserved for a specific guest,
including the guest's name, the room(s) reserved,
the starting date of the reservation,
and how many people were included in the reservation.
(Choose a guest's name from the existing data.)
Bettyann Seery was selected in this case
*/
SELECT
	Reservations.reservationID AS "Reservation ID",
	Guests.firstName AS "First Name",
    Guests.lastName AS "Last Name",
    Reservations.roomNumber AS "Reserved Room Number",
    Reservations.startDate AS "Check In Date",
    Reservations.adults + Reservations.children AS "Number of People"
FROM Reservations
JOIN Guests
ON Guests.guestID = Reservations.guestID
WHERE Guests.firstName = "Bettyann" AND Guests.lastName = "Seery";
/*
3. RESULTS
Reservation ID	First Name	Last Name	Reserved Room Number	Check In Date	Number of People
2				Bettyann	Seery		203						2023-02-05		3
17				Bettyann	Seery		303						2023-07-28		3
18				Bettyann	Seery		305						2023-08-30		1
*/



/*
4.
Write a query that returns a list of rooms,
reservation ID, and per-room cost for each reservation.
The results should include all rooms,
whether or not there is a reservation associated with the room.
*/
SELECT  
	Rooms.roomNumber AS "Room Number",
	Reservations.reservationID AS "Reservation ID",
	Rooms.basePrice AS "Room Base Price",
	Reservations.cost AS "Reservation Cost For Room"
FROM Rooms LEFT JOIN Reservations ON Rooms.roomNumber = Reservations.roomNumber;
/*
4. RESULTS
Room Number	Reservation ID	Room Base Price	Reservation Cost For Room
201			4				199.99			199.99
202			7				174.99			349.98
203			2				199.99			999.95
203			20				199.99			399.98
204			15				174.99			184.99
205			14				174.99			699.96
206			12				149.99			599.96
206			22				149.99			449.97
207			10				174.99			174.99
208			12				149.99			599.96
208			19				149.99			149.99
301			9				199.99			799.96
301			22				199.99			599.97
302			6				174.99			924.95
302			23				174.99			699.96
303			17				199.99			199.99
304			13				174.99			184.99
305			3				174.99			349.98
305			18				174.99			349.98
306			NULL			149.99			NULL
307			5				174.99			524.97
308			1				149.99			299.98
401			11				399.99			1199.97
401			16				399.99			1259.97
401			21				399.99			1199.97
402			NULL			399.99			NULL
*/



/*
5.
Write a query that returns all the rooms accommodating 
at least three guests and that are reserved on any date in April 2023.
*/
SELECT
	Reservations.reservationID AS "Reservation ID",
    Reservations.roomNumber AS "Room Number",
    Reservations.children + Reservations.adults AS "Number of People",
    Reservations.startDate AS "Check In",
    Reservations.endDate AS "Check Out"
FROM Reservations
WHERE Reservations.children + Reservations.adults >= 3
AND 4 BETWEEN MONTH(Reservations.startDate) AND MONTH(Reservations.endDate)
AND YEAR(Reservations.startDate) <= 2023 AND YEAR(Reservations.endDate) >= 2023;
/*
5. RESULTS
There are no reservations that include at least one reserved day in April,
with at least three guests. This can be seen in the raw data. This query,
however, does work for any other month with results, like May.
/*

/*
5. A different interpretation
If the question is asking for rooms that COULD accomodate at least 3 guests,
and are reserved on any date in April 2023 with any number of guests,
then following query would work:
*/
SELECT
    Reservations.roomNumber AS "Room Number",
    Rooms.maximumOccupancy AS "Maximum Capacity",
    Reservations.startDate AS "Check In",
    Reservations.endDate AS "Check Out"
FROM Reservations
JOIN Rooms ON Rooms.roomNumber = Reservations.roomNumber
WHERE Rooms.maximumOccupancy >= 3
AND 4 BETWEEN MONTH(Reservations.startDate) AND MONTH(Reservations.endDate)
AND YEAR(Reservations.startDate) <= 2023 AND YEAR(Reservations.endDate) >= 2023;
/*
5. A different interpretation RESULTS
Room Number	Maximum Capacity	Check In	Check Out
301			4					2023-04-09	2023-04-13
*/


/*
6.
Write a query that returns a list of all guest names and the 
number of reservations per guest, sorted starting with the 
guest with the most reservations and then by the guest's last name.
Bit complicated, but I want to ensure that one reservation, with multiple
rooms, counts only as one reservation.
*/
SELECT 
	min(FirstName) AS "First Name",
    min(LastName) AS "Last Name",
    count(T.ReservationID) AS "Number of Reservations"
FROM (
	SELECT min(Reservations.guestID) AS "GuestID", min(Reservations.startDate) AS "CheckIn", min(Reservations.endDate) AS "CheckOut", min(Guests.firstName) AS "FirstName", min(Guests.lastName) AS "LastName", Reservations.reservationID AS "ReservationID" FROM Reservations
	JOIN Guests ON Reservations.guestID = Guests.guestID
	GROUP BY Reservations.reservationID) AS T
GROUP BY T.GuestID
ORDER BY count(T.ReservationID) DESC, min(LastName);
/*
6. RESULTS
First Name	Last Name	Number of Reservations
Bettyann	Seery		3
Mack		Simmer		3
Duane		Cullison	2
Walter		Holaway		2
Aurore		Lipton		2
Ben			Miller		2
Maritza		Tilton		2
Wilfred		Vise		2
Karie		Yang		2
Zachery		Luechtefeld	1
Joleen		Tison		1
*/



/*
7.
Write a query that displays the name, address, and phone number 
of a guest based on their phone number. (Choose a phone number from the existing data.)
*/
SELECT 
	Guests.firstName AS "First Name",
    Guests.lastName AS "Last Name",
    Guests.address AS "Address",
    Guests.phone AS "Phone"
FROM Guests
WHERE phone = "(308) 494-0198";
/*
7. RESULTS
First Name	Last Name	Address				Phone
Duane		Cullison	9662 Foxrun Lane	(308) 494-0198
*/