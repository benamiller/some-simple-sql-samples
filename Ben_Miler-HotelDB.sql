-- Ben Miller 2022-03-10

-- Make sure we drop this database if it exists to reset structure
DROP DATABASE IF EXISTS hotelSoftwareGuild;

-- Recreate the database
CREATE DATABASE hotelSoftwareGuild;

-- Ensure we are using this database
USE hotelSoftwareGuild;

/*
Create an amenities table that maps between
IDs to amenity types
This allows for rooms to have many amenities
*/
CREATE TABLE Amenities (
	amenityID INT PRIMARY KEY,
    amenityType VARCHAR(20)
);

/*
Create table of guests, each with their own ID, 
and all related contact information
*/
CREATE TABLE Guests (
	guestID Int Primary Key,
	firstName VARCHAR(20),
    lastName VARCHAR(20),
    address VARCHAR(50),
    city VARCHAR(20),
    stateAbbr VARCHAR(2),
    zip Int,
    phone VARCHAR(14)
);

/*
Create Rooms
The Type of room is kept here, with the
standard occupancy and maximum occupancy
in case a single or double room could
accommodate a different number of guests
*/
CREATE TABLE Rooms (
	roomNumber Int Primary Key,
    type VARCHAR(15),
    adaAccessible BOOLEAN,
    standardOccupancy Int,
    maximumOccupancy Int,
    basePrice Float,
    extraPersonPrice Float
);

/*
Create Reservations
The primary key is composite so that one reservation
can include multiple rooms, while having the same reservationID
This references the guestID from Guests
and the roomNumber from Rooms
*/
CREATE TABLE Reservations (
	reservationID Int,
    guestID Int,
    roomNumber Int,
    adults Int,
    children Int,
    startDate Date,
    endDate Date,
    cost Float,
    PRIMARY KEY (reservationID, roomNumber),
    FOREIGN KEY (guestID) REFERENCES Guests (guestID),
    FOREIGN KEY (roomNumber) REFERENCES Rooms (roomNumber)
);

/*
Creates an intermediary between Guests to their Reservations
since one guest may have many reservations at different times
*/
CREATE TABLE GuestsToReservations (
	guestID INT,
    reservationID INt,
	FOREIGN KEY (guestID) REFERENCES Guests (guestID),
    FOREIGN KEY (reservationID) REFERENCES Reservations (reservationID)
);

/*
Creates an intermediary between Rooms to Amenities
since one room may have many amenities
*/
CREATE TABLE RoomsToAmenities (
	roomNumber INT,
    amenityID INT,
	FOREIGN KEY (roomNumber) REFERENCES Rooms (roomNumber),
    FOREIGN KEY (amenityID) REFERENCES Amenities (amenityID)
);

/*
-- This table is extraneous
CREATE TABLE ReservationsToRooms (
	reservationID INT,
    roomNumber INT,
	FOREIGN KEY (reservationID) REFERENCES Reservations (reservationID),
    FOREIGN KEY (roomNumber) REFERENCES Rooms (roomNumber)
);
*/