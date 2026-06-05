# movie-ticket-booking-system
The Movie Ticket Booking System is a database management project developed using MySQL. It is designed to manage movie information, customer details, theater information, seat availability, bookings, and payment records.

This project demonstrates various SQL concepts including DDL, DML, DQL, Joins, Subqueries, Aggregate Functions, Views, Triggers, Stored Procedures, TCL, and DCL commands.
# Features
- Movie Management
- Customer Management
- Theater Management
- Seat Management
- Ticket Booking Management
- Payment Status Tracking
- Revenue Calculation
- Duplicate Seat Booking Prevention
- Automated Payment Status Updates
  
## Technologies Used
| Technology | Description |
|------------|-------------|
| MySQL | Database Management System |
| SQL | Query Language |
| MySQL Workbench | Database Design & Query Execution |

## Database Tables
| Table Name | Description |
|------------|-------------|
| movies | Stores movie information |
| customers | Stores customer details |
| theaters | Stores theater information |
| seats | Stores seat details |
| bookings | Stores booking records |
| payment_status | Stores payment information |

## Entity Relationship Highlights

* One Customer can make multiple Bookings (1:M).
* One Movie can have multiple Bookings (1:M).
* One Theater can host multiple Bookings (1:M).
* One Theater contains multiple Seats (1:M).
* One Seat can be associated with multiple Bookings on different dates and show times (1:M).
* One Booking can have one or more Payment Records (1:M).
* The Bookings table acts as the central entity connecting Customers, Movies, Theaters, Seats, and Payment Status.
* Primary Keys (PK) uniquely identify records in each table.
* Foreign Keys (FK) maintain relationships and ensure data integrity between tables.

## SQL Concepts Used

| SQL Concept | Description |
|------------|-------------|
| DDL Commands | CREATE, ALTER, DROP |
| DML Commands | INSERT, UPDATE, DELETE |
| DQL Commands | SELECT Queries |
| Constraints | PRIMARY KEY, FOREIGN KEY, UNIQUE |
| Joins | INNER JOIN, LEFT JOIN, RIGHT JOIN, CROSS JOIN |
| Aggregate Functions | COUNT(), SUM(), AVG(), MAX(), MIN() |
| Group By | Grouping records for analysis |
| Having Clause | Filtering grouped data |
| Order By | Sorting records |
| Like Operator | Pattern matching searches |
| Limit & Offset | Pagination and record limiting |
| Subqueries | Single Row, Multi Row, Correlated, Scalar |
| Views | Virtual tables for reports |
| Stored Procedures | Reusable SQL programs |
| Triggers | Automated database actions |
| Window Functions | RANK(), DENSE_RANK(), ROW_NUMBER() |
| TCL Commands | COMMIT, ROLLBACK, SAVEPOINT |
| DCL Commands | GRANT, REVOKE |

# Sample Analytical Queries

## 1. Most Booked Movie

```sql
SELECT m.movie_name,
       COUNT(b.booking_id) AS Total_Bookings
FROM bookings b
JOIN movies m
ON b.movie_id = m.movie_id
GROUP BY m.movie_name
ORDER BY COUNT(b.booking_id) DESC;
```

---

## 2. Top Revenue Generating Movie

```sql
SELECT m.movie_name,
       SUM(b.total_amount) AS Total_Revenue
FROM bookings b
JOIN movies m
ON b.movie_id = m.movie_id
GROUP BY m.movie_name
ORDER BY SUM(b.total_amount) DESC;
```
# Project Objectives
- To manage movie ticket booking operations efficiently.
- To maintain customer, movie, theater, seat, and payment records.
- To prevent duplicate seat bookings and automate payment tracking.
- To generate reports and perform booking analytics using SQL queries.

## Learning Outcomes

This project helped in improving:

- SQL Query Writing
- Database Design
- Joins and Subqueries
- Triggers and Stored Procedures
- Data Analysis
- Problem Solving
- Relational Database Modeling
- Report Generation

  ## Future Enhancements

This project can be enhanced by:

- Online Payment Integration
- Ticket Cancellation and Refund System
- Email and SMS Notifications
- Movie Recommendation System

  ## How to Run the Project

1. Open MySQL Workbench.
2. Create the database `movie_ticket_booking_system`.
3. Execute the SQL script file (`movie_ticket_booking.sql`).
4. Verify that all tables are created successfully.
5. Insert the sample data.
6. Run the SQL queries, triggers, and stored procedures.
7. Test the project using sample booking and payment queries.
8. View the generated outputs and reports.

   ## Conclusion

The Movie Ticket Booking System was successfully developed using MySQL to manage movies, customers, theaters, seats, bookings, and payment records. The project demonstrates various SQL concepts including joins, subqueries, aggregate functions, triggers, and stored procedures. Advanced features such as duplicate seat booking prevention and payment automation improve the efficiency and reliability of the system. Overall, this project provides practical experience in database design and real-world business application development.
