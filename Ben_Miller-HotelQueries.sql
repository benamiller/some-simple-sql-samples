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
WHERE Reservations.children + Reservations.adults > 3
AND 5 BETWEEN MONTH(Reservations.startDate) AND MONTH(Reservations.endDate)
AND YEAR(Reservations.startDate) <= 2023 AND YEAR(Reservations.endDate) >= 2023;

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

