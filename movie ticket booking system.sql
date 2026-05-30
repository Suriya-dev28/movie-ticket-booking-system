CREATE DATABASE movie_ticket_booking_system;
USE movie_ticket_booking_system;

-- MOVIE TABLE-- 
CREATE TABLE movies (movie_id INT PRIMARY KEY AUTO_INCREMENT,movie_name VARCHAR(100) NOT NULL,language VARCHAR(50),
    genre VARCHAR(50),duration INT,rating DECIMAL(2,1));
INSERT INTO movies(movie_name, language, genre, duration, rating) VALUES
('Leo', 'Tamil', 'Action', 165, 8.5),
('Jailer', 'Tamil', 'Action', 155, 8.8),
('Avengers Endgame', 'English', 'Superhero', 180, 9.0),
('KGF 2', 'Kannada', 'Action', 170, 8.7),
('RRR', 'Telugu', 'Historical', 175, 8.9),
('Master', 'Tamil', 'Drama', 160, 8.1),
('Vikram', 'Tamil', 'Action', 170, 9.1),
('Interstellar', 'English', 'Sci-Fi', 190, 9.3),
('Doctor', 'Tamil', 'Comedy', 150, 7.9),
('Beast', 'Tamil', 'Action', 158, 7.5),
('Bigil', 'Tamil', 'Sports', 177, 8.0),
('Kaithi', 'Tamil', 'Thriller', 145, 9.2),
('Pushpa', 'Telugu', 'Action', 179, 8.4),
('96', 'Tamil', 'Romance', 150, 8.6),
('Soorarai Pottru', 'Tamil', 'Drama', 153, 9.4);
SELECT * FROM MOVIES;

-- THEATERS TABLE-- 
CREATE TABLE theaters (theater_id INT PRIMARY KEY AUTO_INCREMENT,theater_name VARCHAR(100),
    location VARCHAR(100));
INSERT INTO theaters(theater_name, location) VALUES
('PVR Velachery', 'Chennai'),
('AGS Villivakkam', 'Chennai'),
('INOX Marina Mall', 'Chennai'),
('SPI Sathyam', 'Chennai'),
('Rohini Silver Screens', 'Chennai');
SELECT * FROM THEATERS;

-- SEATS TABLE-- 
CREATE TABLE seats (seat_id INT PRIMARY KEY AUTO_INCREMENT,theater_id INT,seat_number VARCHAR(10),
    seat_type VARCHAR(20),FOREIGN KEY(theater_id)REFERENCES theaters(theater_id));
INSERT INTO seats(theater_id, seat_number, seat_type) VALUES
(1,'A1','Regular'),
(1,'A2','Regular'),
(1,'A3','Regular'),
(1,'B1','Premium'),
(1,'B2','Premium'),
(2,'A1','Regular'),
(2,'A2','Regular'),
(2,'B1','Premium'),
(3,'C1','VIP'),
(3,'C2','VIP'),
(4,'D1','Premium'),
(4,'D2','Premium'),
(5,'E1','VIP'),
(5,'E2','VIP'),
(5,'E3','Regular');
SELECT * FROM SEATS;

-- CUSTOMERS TABLE-- 
CREATE TABLE customers (customer_id INT PRIMARY KEY AUTO_INCREMENT,customer_name VARCHAR(100),city VARCHAR(50),
    phone VARCHAR(15) UNIQUE);
INSERT INTO customers(customer_name, city, phone) VALUES
('Ajay','Chennai','9876543210'),
('Arun','Madurai','9876543211'),
('Priya','Chennai','9876543212'),
('Divya','Coimbatore','9876543213'),
('Kavin','Salem','9876543214'),
('Nisha','Chennai','9876543215'),
('Rahul','Trichy','9876543216'),
('Vijay','Erode','9876543217'),
('Suriya','Chennai','9876543218'),
('Meena','Madurai','9876543219'),
('Hari','Salem','9876543220'),
('Pooja','Chennai','9876543221'),
('Sanjay','Trichy','9876543222'),
('Anu','Vellore','9876543223'),
('Ramesh','Chennai','9876543224');
SELECT * FROM CUSTOMERS;

-- BOOKING TABLE-- 
CREATE TABLE bookings (booking_id INT PRIMARY KEY AUTO_INCREMENT,customer_id INT,movie_id INT,theater_id INT,
    seat_id INT,booking_date DATE,show_time TIME,total_amount DECIMAL(10,2),payment_status VARCHAR(20),
    FOREIGN KEY(customer_id)REFERENCES customers(customer_id),
    FOREIGN KEY(movie_id)REFERENCES movies(movie_id),
    FOREIGN KEY(theater_id)REFERENCES theaters(theater_id),
    FOREIGN KEY(seat_id)REFERENCES seats(seat_id));
INSERT INTO bookings(customer_id, movie_id, theater_id, seat_id, booking_date, show_time, total_amount, payment_status) VALUES
(1,1,1,1,'2026-06-01','10:00:00',180,'Paid'),
(2,2,2,6,'2026-06-01','02:00:00',200,'Paid'),
(3,3,3,9,'2026-06-01','06:00:00',250,'Pending'),
(4,4,4,11,'2026-06-01','09:00:00',220,'Paid'),
(5,5,1,2,'2026-06-02','11:00:00',190,'Cancelled'),
(6,6,2,7,'2026-06-02','03:00:00',170,'Paid'),
(7,7,3,10,'2026-06-02','07:00:00',260,'Paid'),
(8,8,4,12,'2026-06-02','08:00:00',300,'Pending'),
(9,9,5,13,'2026-06-03','10:30:00',350,'Paid'),
(10,10,1,3,'2026-06-03','01:00:00',180,'Paid'),
(11,11,2,8,'2026-06-03','04:00:00',220,'Cancelled'),
(12,12,3,9,'2026-06-03','07:30:00',250,'Paid'),
(13,13,4,11,'2026-06-04','09:00:00',240,'Paid'),
(14,14,5,14,'2026-06-04','06:00:00',320,'Pending'),
(15,15,5,15,'2026-06-04','08:00:00',280,'Paid');
SELECT * FROM BOOKINGS;

-- PAYMENTS STATUS-- 
CREATE TABLE payment_status (payment_id INT PRIMARY KEY AUTO_INCREMENT,booking_id INT,payment_method VARCHAR(50),
    payment_date DATETIME,amount DECIMAL(10,2),payment_status VARCHAR(20),
    FOREIGN KEY(booking_id)REFERENCES bookings(booking_id));
INSERT INTO payment_status(booking_id, payment_method, payment_date, amount, payment_status)VALUES
(1, 'UPI', NOW(), 180, 'Success'),
(2, 'Credit Card', NOW(), 200, 'Success'),
(3, 'Debit Card', NOW(), 250, 'Pending'),
(4, 'Cash', NOW(), 220, 'Success'),
(5, 'UPI', NOW(), 190, 'Failed'),
(6, 'Net Banking', NOW(), 170, 'Success'),
(7, 'Credit Card', NOW(), 260, 'Success'),
(8, 'UPI', NOW(), 300, 'Pending'),
(9, 'Cash', NOW(), 350, 'Success'),
(10, 'Debit Card', NOW(), 180, 'Success'),
(11, 'UPI', NOW(), 220, 'Failed'),
(12, 'Credit Card', NOW(), 250, 'Success'),
(13, 'Net Banking', NOW(), 240, 'Success'),
(14, 'UPI', NOW(), 320, 'Pending'),
(15, 'Cash', NOW(), 280, 'Success');
SELECT * FROM PAYMENT_STATUS;

DROP TRIGGER IF EXISTS preventDuplicateSeat;
DELIMITER //
CREATE TRIGGER preventDuplicateSeat
BEFORE INSERT ON bookings
FOR EACH ROW
BEGIN
DECLARE seatCount INT;
SELECT COUNT(*)
INTO seatCount
FROM bookings
WHERE seat_id = NEW.seat_id
AND booking_date = NEW.booking_date
AND show_time = NEW.show_time;
IF seatCount > 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Seat Already Booked';
END IF;
END //
DELIMITER ;
INSERT INTO bookings
(customer_id,movie_id,theater_id,seat_id,booking_date,show_time,total_amount,payment_status)
VALUES
(2,1,1,1,'2026-06-01','10:00:00',200,'Paid');

drop trigger if exists paymentAutomation;
delimiter //
create trigger paymentAutomation
after insert on payment_status
for each row
begin
declare totalAmt decimal(10,2);
declare paidAmt decimal(10,2);
select total_amount into totalAmt
from bookings
where booking_id = NEW.booking_id;
select coalesce(sum(amount),0)
into paidAmt
from payment_status
where booking_id = NEW.booking_id;
if totalAmt = paidAmt then
update bookings
set payment_status = 'Paid'
where booking_id = NEW.booking_id;
elseif totalAmt < paidAmt then
update bookings
set payment_status = 'Suspicious'
where booking_id = NEW.booking_id;
else
update bookings
set payment_status = 'Pending'
where booking_id = NEW.booking_id;
end if;
end //
delimiter ;
INSERT INTO payment_status
(booking_id, payment_method, payment_date, amount, payment_status)
VALUES
(3, 'UPI', NOW(), 250, 'Success');

drop procedure if exists CheckSeat;
delimiter //
create procedure CheckSeat
(
IN p_seatID int
)
begin
declare seatCount int;
select count(*)
into seatCount
from bookings
where seat_id = p_seatID;
if seatCount > 0 then
signal sqlstate '45000'
set MESSAGE_TEXT = 'Seat Not Available';
else
select 'Seat Available';
end if;
end //
delimiter ;
CALL CheckSeat(1);

drop procedure if exists TotalRevenue;
delimiter //
create procedure TotalRevenue()
begin
select sum(total_amount) as revenue
from bookings
where payment_status='Paid';
end //
delimiter ;
call TotalRevenue();