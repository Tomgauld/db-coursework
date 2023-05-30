CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    customer_fname VARCHAR(30) NOT NULL,
    customer_lname VARCHAR(30) NOT NULL,
    customer_phone VARCHAR(12),
    customer_email VARCHAR(100) NOT NULL,
    customer_postcode VARCHAR(10) NOT NULL,
    customer_accompanied_adults INT NOT NULL,
    customer_accompanied_children INT NOT NULL
);



CREATE TABLE flight(
    flight_id SERIAL PRIMARY KEY,
    flight_departure_country VARCHAR(50) NOT NULL,
    flight_departure_city VARCHAR(50) NOT NULL,
    flight_departure_airport VARCHAR(50) NOT NULL,
    fligth_destination_country VARCHAR(50) NOT NULL,
    flight_destination_city VARCHAR(50) NOT NULL,
    flight_destination_airport VARCHAR(50) NOT NULL,
    flight_departure_date DATE NOT NULL,
    flight_return_date DATE NOT NULL
);



CREATE TABLE employee_role(
    employee_role_id SERIAL PRIMARY KEY,
    employee_role_name VARCHAR(20) NOT NULL
);



CREATE TABLE branch(
    branch_id SERIAL PRIMARY KEY,
    branch_location VARCHAR(50) NOT NULL,
    branch_name VARCHAR(20) NOT NULL
);



CREATE TABLE hotel(
    hotel_id SERIAL PRIMARY KEY,
    hotel_location VARCHAR(50) NOT NULL,
    hotel_name VARCHAR(25) NOT NULL
);



CREATE TABLE holiday_package(
    holiday_package_id SERIAL PRIMARY KEY,
    price_per_person MONEY NOT NULL
);



CREATE TABLE car_rental(
    car_registration_number VARCHAR(7) PRIMARY KEY
);



CREATE TABLE hotel_amenities(
    hotel_amenities_id SERIAL PRIMARY KEY,
    hotel_amenities_description VARCHAR(200) NOT NULL
);
   

CREATE TABLE hotel_hotel_amenities(
    hotel_amenities_id SERIAL,
    hotel_id SERIAL,
    FOREIGN KEY(hotel_amenities_id) REFERENCES hotel_amenities(hotel_amenities_id),
    FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id)
);

CREATE TABLE hotel_facilities(
    hotel_facilities_id SERIAL PRIMARY KEY,
    hotel_facilities_description VARCHAR(200) NOT NULL
);

CREATE TABLE hotel_hotel_facilities(
    hotel_facilities_id SERIAL,
    hotel_id SERIAL,
    FOREIGN KEY(hotel_facilities_id) REFERENCES hotel_facilities(hotel_facilities_id),
    FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id)
);


CREATE TABLE branch_hotel(
    branch_id SERIAL, 
    hotel_id SERIAL,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id)
);



CREATE TABLE branch_flight(
    branch_id SERIAL,
    flight_id SERIAL,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (flight_id) REFERENCES flight(flight_id)
);



CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,          
    employee_fname VARCHAR(30) NOT NULL,
    employee_lname VARCHAR(30) NOT NULL,
    employee_phone VARCHAR(12),
    employee_email VARCHAR (100) NOT NULL,
    employee_postcode VARCHAR(10) NOT NULL,
    branch_id SERIAL,
    employee_role_id SERIAL,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (employee_role_id) REFERENCES employee_role(employee_role_id)
);


CREATE TABLE bookings(
    booking_id SERIAL PRIMARY KEY,
    customer_id SERIAL,
    flight_id SERIAL,
    hotel_id SERIAL,
    branch_id SERIAL,
    holiday_package_id SERIAL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES flight(flight_id),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (holiday_package_id) REFERENCES holiday_package(holiday_package_id)
);



CREATE TABLE payment(
    payment_id SERIAL PRIMARY KEY,
    payment_status VARCHAR(10) NOT NULL,
    payment_no_installments INT NOT NULL,
    payment_amount_to_pay MONEY,
    payment_paid MONEY NOT NULL,
    booking_id SERIAL,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);


CREATE TABLE flight_booking(
    flight_id SERIAL,
    booking_id SERIAL,
    FOREIGN KEY (flight_id) REFERENCES flight(flight_id),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);


INSERT INTO flight (flight_id,flight_departure_country,flight_departure_city,flight_departure_airport,fligth_destination_country,flight_destination_city,flight_destination_airport,flight_departure_date,flight_return_date)
VALUES (1,'England','Southampton','Southampton Airport','Spain','Madrid','Adolfo Suárez Madrid Barajas Airport','2023/01/15','2023/01/22'),
       (2, 'England','London','Gatwick Airport','France','Paris','Paris Charles de Gaulle Airport','2023/01/05','2023/01/08'),
       (3, 'England', 'London','Gatwick Airport','Poland','Warsaw','Chopin airport','2023/02/04','2023/02/25'),
       (4, 'England', 'London','Heathrow Airport','Germany','Munich','Munich International Airport','2022/12/26','2022/12/30'),
       (5, 'England', 'London','Heathrow Airport', 'Germany', 'Munich', 'Munich International Airport','2023/01/20', '2023/01/25')
;


INSERT INTO customers(customer_id,
    customer_fname,
    customer_lname,
    customer_phone,
    customer_email,
    customer_postcode,
    customer_accompanied_adults,
    customer_accompanied_children)
VALUES(1,'John','Cole','07667915703','john.cole@gmail.com','SW17 6RA','0','0'),
    (2,'Cathy','Smith','07647917703','cathy.smith@gmail.com','NW13 3EA','1','0'),
    (3,'Drew','Davies','08647317108','ddavies@outlook.com','SW18 5RE','1','1'),
    (4,'Josh','Krogh','09626347101','jk@outlook.com','CR4 3AB','0','0'),
    (5,'Kim','Baker','08626351101','kimbap@hotmail.com','N1 6CB','0','1'),
    (6,'Adeena','Coleman','02623341106','adeena.coleman@hotmail.com','N1 6CB','0','1')
;
    
INSERT INTO hotel( hotel_id,
    hotel_location,
    hotel_name)
VALUES(1,'Spain','Hotel Helios'),
    (2,'France','Le Hotel'),
    (3,'Poland','Warszawa Hotel'),
    (4,'Germany','Munich Hotel'),
    (5,'Germany','Hotel Krone Achen')
;

INSERT INTO holiday_package(holiday_package_id,price_per_person)
VALUES(1,'569'),
(2,'482'),
(3,'496'),
(4,'596'),
(5,'600')
;

INSERT INTO car_rental(
    car_registration_number)
VALUES('GF54XWN'),
('JK21ADH'),
('IE12JWI')
;

INSERT INTO branch (
    branch_id,
    branch_location, 
    branch_name)
VALUES
    (1, 'Portsmouth', 'SH Fratton'),
    (2, 'Southampton', 'SH Woolston'),
    (3, 'London', 'SH Camden Town'),
    (4, 'Birmingham', 'SH Victoria Street'),
    (5, 'Chichester', 'SH Garden Street')
;

    INSERT INTO employee_role
    (employee_role_id, 
    employee_role_name)
VALUES (1, 'Manager'),
       (2, 'Accountant'), 
       (3, 'Sales Assistant')
;
    
INSERT INTO employees(    
    employee_id,   
    employee_fname, 
    employee_lname,
    employee_phone,
    employee_email,
    employee_postcode,
    branch_id,
    employee_role_id)
VALUES (1, 'Karen', 'Richardson' ,'07329167398' ,'karen.richardson@outlook.com' ,'PO1 1DZ', 1, 1),
       (2, 'Michael','Collett','072531784923','m.collett@gmail.com','PO1 2RS', 1, 2),
       (3, 'Tom', 'Ford', '078822564123','tomford1212@gmail.com','PO1 2RF', 1, 3),
       (4, 'Joe','Rogan','078222361534','joerogan461524@outlook.com','SO16 9GH', 2, 1),
       (5, 'Samantha', 'Collins', '072236159501', 'samcollins123@outlook.com', 'SO15 4PQ', 2, 2),
       (6, 'Helen','Smith', '074563019823', 'helensmith666@gmail.com', 'SO16 1WE', 2, 3),
       (7, 'Rob','Smith', '070099887766', 'robsmith55555@gmail.com', 'NW1 1TY', 3, 1),
       (8, 'John', 'Snow', '07345039283','johnsnow1212@gmail.com','NW1 1FY', 3, 2),
       (9, 'Jake', 'Black', '07883304937','jakeblack223344@gmail.com','NW1 1TF', 3, 3),
       (10, 'Adam', 'Gluck', '02312937263','adamgluck4564737@gmail.com','B23 2GF', 4, 1),
       (11, 'Freddie', 'Atlanta', '01329392837','fredat25617@gmail.com','B23 2ER', 4, 2),
       (12, 'Callum', 'Ugran', '07812323143','caltheguy3326@gmail.com','B23 2FF', 4, 3),
       (13, 'Lucas', 'Jack', '078923480123','lucasjack882@gmail.com','PO18 7TY', 5, 1),
       (14, 'Jamie', 'Ford', '076264243533','jamieford@gmail.com','PO18 7HU', 5, 2),
       (15, 'Lisa', 'Lewis', '012938203749','lisalewis22@gmail.com','PO18 UUY', 5, 3)
;

INSERT INTO branch_flight(
    branch_id, 
    flight_id)
VALUES (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    (2, 5),
    (3, 1),
    (3, 2),
    (3, 3),
    (3, 4),
    (3, 5),
    (4, 1),
    (4, 2),
    (4, 3),
    (4, 4),
    (4, 5),
    (5, 1),
    (5, 2),
    (5, 3),
    (5, 4),
    (5, 5)
;

INSERT INTO hotel_amenities( hotel_amenities_id, hotel_amenities_description)
VALUES (1, 'Bathrobe and Slippers'),
        (2, 'Free Breakfast'),
        (3, 'Free WIFI'),
        (4, 'Personal Care Package'),
        (5, 'Coffee Kit')
;


Insert INTO hotel_hotel_amenities (hotel_amenities_id, hotel_id)
VALUES (1,1),
       (1,4),
       (2,3),
       (2,5),
       (3,2),
       (3,1),
       (4,4),
       (4,5),
       (5,1),
       (5,5)
;

INSERT INTO hotel_facilities(hotel_facilities_id,hotel_facilities_description)
VALUES(1,'Gym'),
(2,'Spa'),
(3,'Swimming Pool'),
(4,'Restaurant'),
(5,'Meeting Rooms');

INSERT INTO hotel_hotel_facilities(hotel_facilities_id,hotel_id)
VALUES (1,1),
        (1,4),
        (2,3),
        (2,5),
        (3,2),
        (3,1),
        (4,4),
        (4,5),
        (5,1),
        (5,5)
;
           
INSERT INTO bookings( 
    booking_id,
    customer_id,
    flight_id,
    hotel_id,
    branch_id,
    holiday_package_id)
VALUES(1, 1, 1, 1, 1, 1),
(2, 2, 2, 2, 2, 2),
(3, 3, 3, 3, 3, 3),
(4, 4, 4, 4, 4, 4),
(5, 5, 5, 5, 5, 5)
;
           
INSERT INTO payment(
    payment_id,
    payment_status,
    payment_no_installments,
    payment_amount_to_pay,
    payment_paid,
    booking_id)
VALUES (1, 'Complete', 0, 0, 569, 1),
(2, 'Pending', 3, 200, 400, 2),
(3, 'Complete', 0, 0, 350, 3),
(4, 'Complete', 0, 0, 400, 4),
(5, 'Complete', 0 ,0, 323, 5)
;



INSERT INTO branch_hotel(branch_id, hotel_id)
VALUES (1,1),
       (1,3),
       (1,5),
       (2,2),
       (2,4),
       (2,5),
       (3,1),
       (3,2),
       (3,3),
       (4,4),
       (4,5),
       (4,1),
       (5,5),
       (5,2),
       (5,3)
;

INSERT INTO flight_booking(flight_id, booking_id)
VALUES(1,1),
    (1,3),
    (1,4),
    (1,2),
    (1,5),
    (2,1),
    (2,3),
    (2,2),
    (2,4),
    (2,5),
    (3,3),
    (3,4),
    (3,2),
    (3,5),
    (4,1),
    (4,3),
    (4,2),
    (4,4),
    (4,5),
    (5,1),
    (5,3),
    (5,2),
    (5,4),
    (5,5)
;   

Create INDEX idx_customer 
ON customers(customer_id, customer_fname, customer_lname, customer_phone, customer_email);

Create INDEX idx_flight
ON flight(flight_id, flight_departure_airport, flight_destination_airport, flight_departure_date, flight_return_date);

Create INDEX idx_employees
ON employees(employee_id, employee_fname, employee_lname, employee_phone, employee_email);

EXPLAIN ANALYZE
SELECT customers.customer_fname AS "First Name", 
    customers.customer_lname AS "Last Name", 
    flight.flight_departure_airport "Departing From", 
    flight.flight_destination_airport"Arriving At",
    flight.flight_departure_date AS "Departure Date", 
    flight.flight_return_date AS "Return Date"
FROM bookings
INNER JOIN customers ON bookings.customer_id=customers.customer_id
INNER JOIN flight ON bookings.flight_id=flight.flight_id
WHERE customer_fname ILIKE 'john';

EXPLAIN ANALYZE
SELECT employee_id AS "Employee ID",
CONCAT (employee_fname, ' ', employee_lname) AS "Employee Name",
employee_email AS "Employee Email",
employee_role_name AS "Employee Role",
branch_name AS "Branch",
branch_location AS "Branch Location"
FROM employees
INNER JOIN employee_role ON employees.employee_role_id=employee_role.employee_role_id
INNER JOIN branch ON employees.branch_id=branch.branch_id
WHERE employee_role_name ILIKE 'Manager'
ORDER BY employee_fname ASC;

CREATE VIEW bookingsview AS 
SELECT
    booking_id AS "Booking ID",
    customer_lname AS "Customer Last Name",
    customer_fname AS "Customer First Name",
    hotel_name AS "Hotel Name",
    fligth_destination_country AS "Going To",
    customer_accompanied_adults AS "Accompanying Adults",
    customer_accompanied_children AS "Accompanying Children",
    flight_departure_date AS "Departing Date" ,
    flight_return_date AS "Returning Date",
    payment_status AS "Payment Status",
    holiday_package_id AS "Holiday Package ID"
FROM 
    bookings
    JOIN customers USING (customer_id)
    JOIN hotel USING (hotel_id)
    JOIN flight USING (flight_id)
    JOIN payment USING(booking_id)
ORDER BY customer_lname;

EXPLAIN ANALYZE
SELECT *
FROM bookingsview
WHERE "Payment Status" = 'Complete';

EXPLAIN ANALYZE
SELECT 
    booking_id AS "Booking ID",
    customer_lname AS "Customer Last Name",
    customer_fname AS "Customer First Name",
    holiday_package_id AS "Holiday Package ID",
    (SUM((customer_accompanied_adults + 1) + customer_accompanied_children) * price_per_person) 
    AS "Total Amount paid"
FROM
    bookings
    JOIN customers USING (customer_id)
    JOIN holiday_package USING (holiday_package_id)
GROUP BY booking_id,customer_lname,customer_fname,holiday_package_id,price_per_person
ORDER BY customer_lname;


CREATE ROLE DatabaseAdmin WITH Superuser;


CREATE ROLE Manager;

GRANT SELECT, INSERT, UPDATE, DELETE 
ON employees
TO Manager;

CREATE ROLE Accountant;

GRANT SELECT 
ON payment, bookings, holiday_package, flight, employees, customers 
TO Accountant;
GRANT UPDATE, INSERT, DELETE 
ON payment
TO Accountant;


CREATE ROLE SalesAssistant;

GRANT SELECT 
ON bookings, customers, holiday_package, flight, hotel, hotel_facilities, hotel_amenities, car_rental
TO SalesAssistant;
GRANT UPDATE, INSERT, DELETE
ON bookings,customers,flight,hotel
TO SalesAssistant;

GRANT LOGIN Manager; ,Accountant,SalesAssistant,DatabaseAdmin;

ALTER ROLE Manager WITH LOGIN;
ALTER ROLE Accountant WITH LOGIN;
ALTER ROLE SalesAssistant WITH LOGIN;
ALTER ROLE DatabaseAdmin WITH LOGIN;

