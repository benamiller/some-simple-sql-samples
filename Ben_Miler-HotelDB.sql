DROP DATABASE IF EXISTS hotelSoftwareGuild;

CREATE DATABASE hotelSoftwareGuild;

USE hotelSoftwareGuild;

CREATE TABLE Amenities (
	amenityID INT PRIMARY KEY,
    amenityType VARCHAR(20)
);

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

CREATE TABLE Rooms (
	roomNumber Int Primary Key,
    type VARCHAR(15),
    adaAccessible BOOLEAN,
    standardOccupancy Int,
    maximumOccupancy Int,
    basePrice Float,
    extraPersonPrice Float
);

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

CREATE TABLE GuestsToReservations (
	guestID INT,
    reservationID INt,
	FOREIGN KEY (guestID) REFERENCES Guests (guestID),
    FOREIGN KEY (reservationID) REFERENCES Reservations (reservationID)
);

CREATE TABLE RoomsToAmenities (
	roomNumber INT,
    amenityID INT,
	FOREIGN KEY (roomNumber) REFERENCES Rooms (roomNumber),
    FOREIGN KEY (amenityID) REFERENCES Amenities (amenityID)
);

/*
CREATE TABLE ReservationsToRooms (
	reservationID INT,
    roomNumber INT,
	FOREIGN KEY (reservationID) REFERENCES Reservations (reservationID),
    FOREIGN KEY (roomNumber) REFERENCES Rooms (roomNumber)
);
*/