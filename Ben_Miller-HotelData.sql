USE hotelSoftwareGuild;

-- Insert Amenities
INSERT INTO Amenities VALUES (1, "Microwave");
INSERT INTO Amenities VALUES (2, "Refridgerator");
INSERT INTO Amenities VALUES (3, "Oven");
INSERT INTO Amenities VALUES (4, "Jacuzzi");

-- Insert Guests
INSERT INTO Guests VALUES (0, "Ben", "Miller", "123 Trinity Lane", "Vancouver", "BC", 12321, "(123) 456-5432");
INSERT INTO Guests VALUES (1, "Mack", "Simmer", "379 Old Shore Street", "Council Bluffs", "IA", 51501,	"(291) 553-0508");
INSERT INTO Guests VALUES (2, "Bettyann", "Seery", "750 Wintergreen Dr.", "Wasilla", "AK", 99654, "(478) 277-9632");
INSERT INTO Guests VALUES (3, "Duane", "Cullison", "9662 Foxrun Lane", "Harlingen", "TX", 78552, "(308) 494-0198");
INSERT INTO Guests VALUES (4, "Karie", "Yang", "9378 W. Augusta Ave.", "West Deptford", "NJ", 08096, "(214) 730-0298");
INSERT INTO Guests VALUES (5, "Aurore", "Lipton", "762 Wild Rose Street", "Saginaw", "MI", 48601, "(377) 507-0974");
INSERT INTO Guests VALUES (6, "Zachery", "Luechtefeld", "7 Poplar Dr.", "Arvada", "CO", 80003, "(814) 485-2615");
INSERT INTO Guests VALUES (7, "Jeremiah", "Pendergrass", "70 Oakwood St.", "Zion", "IL", 60099, "(279) 491-0960");
INSERT INTO Guests VALUES (8, "Walter", "Holaway", "7556 Arrowhead St.", "Cumberland", "RI", 02864, "(446) 396-6785");
INSERT INTO Guests VALUES (9, "Wilfred", "Vise", "77 West Surrey Street", "Oswego", "NY", 13126, "(834) 727-1001");
INSERT INTO Guests VALUES (10, "Maritza", "Tilton", "939 Linda Rd.", "Burke", "VA", 22015, "(446) 351-6860");
INSERT INTO Guests VALUES (11, "Joleen", "Tison", "87 Queen St.", "Drexel Hill", "PA", 19026, "(231) 893-2755");

-- Insert Rooms
INSERT INTO Rooms VALUES (201, "Double", FALSE, 2, 4, 199.99, 10);
INSERT INTO Rooms VALUES (202, "Double", TRUE, 2, 4, 174.99, 10);
INSERT INTO Rooms VALUES (203, "Double", FALSE, 2, 4, 199.99, 10);
INSERT INTO Rooms VALUES (204, "Double", TRUE, 2, 4, 174.99, 10);
INSERT INTO Rooms VALUES (205, "Single", FALSE, 2, 2, 174.99, NULL);
INSERT INTO Rooms VALUES (206, "Single", TRUE, 2, 2, 149.99, NULL);
INSERT INTO Rooms VALUES (207, "Single", FALSE, 2, 2, 174.99, NULL);
INSERT INTO Rooms VALUES (208, "Single", TRUE, 2, 2, 149.99, NULL);
INSERT INTO Rooms VALUES (301, "Double", FALSE, 2, 4, 199.99, 10);
INSERT INTO Rooms VALUES (302, "Double", TRUE, 2, 4, 174.99, 10);
INSERT INTO Rooms VALUES (303, "Double", FALSE, 2, 4, 199.99, 10);
INSERT INTO Rooms VALUES (304, "Double", TRUE, 2, 4, 174.99, 10);
INSERT INTO Rooms VALUES (305, "Single", FALSE, 2, 2, 174.99, NULL);
INSERT INTO Rooms VALUES (306, "Single", TRUE, 2, 2, 149.99, NULL);
INSERT INTO Rooms VALUES (307, "Single", FALSE, 2, 2, 174.99, NULL);
INSERT INTO Rooms VALUES (308, "Single", TRUE, 2, 2, 149.99, NULL);
INSERT INTO Rooms VALUES (401, "Suite", TRUE, 3, 8, 399.99, 20);
INSERT INTO Rooms VALUES (402, "Suite", TRUE, 3, 8, 399.99, 20);

-- Insert Reservations
INSERT INTO Reservations VALUES (1, 1, 308, 1, 0, "2023-02-02", "2023-02-04", 299.98);
INSERT INTO Reservations VALUES (2, 2, 203, 2, 1, "2023-02-05", "2023-02-10", 999.95);
INSERT INTO Reservations VALUES (3, 3, 305, 2, 0, "2023-02-22", "2023-02-24", 349.98);
INSERT INTO Reservations VALUES (4, 4, 201, 2, 2, "2023-03-06", "2023-03-07", 199.99);
INSERT INTO Reservations VALUES (5, 0, 307, 1, 1, "2023-03-17", "2023-03-20", 524.97);
INSERT INTO Reservations VALUES (6, 5, 302, 3, 0, "2023-03-18", "2023-03-23", 924.95);
INSERT INTO Reservations VALUES (7, 6, 202, 2, 2, "2023-03-29", "2023-03-31", 349.98);
INSERT INTO Reservations VALUES (8, 7, 304, 2, 0, "2023-03-31", "2023-04-05", 874.95);
INSERT INTO Reservations VALUES (9, 8, 301, 1, 0, "2023-04-09", "2023-04-13", 799.96);
INSERT INTO Reservations VALUES (10, 9, 207, 1, 1, "2023-04-23", "2023-04-24", 174.99);
INSERT INTO Reservations VALUES (11, 10, 401, 2, 4, "2023-05-30", "2023-06-02", 1199.97);
INSERT INTO Reservations VALUES (12, 11, 206, 2, 0, "2023-06-10", "2023-06-14", 599.96);
INSERT INTO Reservations VALUES (13, 11, 208, 1, 0, "2023-06-10", "2023-06-14", 599.96);
INSERT INTO Reservations VALUES (14, 5, 304, 3, 0, "2023-06-17", "2023-06-18", 184.99);
INSERT INTO Reservations VALUES (15, 0, 205, 2, 0, "2023-06-28", "2023-07-02", 699.96);
INSERT INTO Reservations VALUES (16, 8, 204, 3, 1, "2023-07-13", "2023-07-14", 184.99);
INSERT INTO Reservations VALUES (17, 9, 401, 4, 2, "2023-07-18", "2023-07-21", 1259.97);
INSERT INTO Reservations VALUES (18, 2, 303, 2, 1, "2023-07-28", "2023-07-29", 199.99);
INSERT INTO Reservations VALUES (19, 2, 305, 1, 0, "2023-08-30", "2023-09-1", 349.98);
INSERT INTO Reservations VALUES (20, 1, 208, 2, 0, "2023-09-16", "2023-09-17", 149.99);
INSERT INTO Reservations VALUES (21, 4, 203, 2, 2, "2023-09-13", "2023-09-15", 399.98);
INSERT INTO Reservations VALUES (22, 3, 401, 2, 2, "2023-11-22", "2023-11-25", 1199.97);
INSERT INTO Reservations VALUES (23, 1, 206, 2, 0, "2023-11-22", "2023-11-25", 449.97);
INSERT INTO Reservations VALUES (24, 1, 301, 2, 2, "2023-11-22", "2023-11-25", 599.97);
INSERT INTO Reservations VALUES (25, 10, 302, 2, 0, "2023-12-24", "2023-12-28", 699.96);

-- Insert 
