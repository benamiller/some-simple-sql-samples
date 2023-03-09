USE hotelSoftwareGuild;

-- Insert Amenities
INSERT INTO Amenities VALUES (1, "Microwave");
INSERT INTO Amenities VALUES (2, "Refridgerator");
INSERT INTO Amenities VALUES (3, "Oven");
INSERT INTO Amenities VALUES (4, "Jacuzzi");

-- Insert Guests
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

-- Rooms
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