# Travel Booking System

A SQL-based DBMS project that simulates a travel booking system. The database manages customers, destinations, bookings, and payment transactions while demonstrating core relational database concepts.

## Features

* Customer and destination management
* Travel booking and payment records
* Primary and Foreign Key constraints
* Data filtering, sorting, and aggregation
* SQL Joins and Subqueries
* Revenue and booking analysis
* Database normalization up to 3NF

## Database Structure

The system consists of four main tables:

* **Customers** — Stores customer details
* **Destinations** — Stores destination and pricing information
* **Bookings** — Stores customer bookings and travel details
* **Payments** — Stores payment transactions

Relationships between the tables are maintained using primary and foreign keys.

## SQL Concepts Used

* SELECT, INSERT, UPDATE, DELETE
* WHERE, LIKE, IN
* ORDER BY, LIMIT, OFFSET
* COUNT, SUM, AVG, MAX, MIN
* GROUP BY and HAVING
* JOINs
* Subqueries
* Primary and Foreign Keys
* Constraints
* Normalization (1NF, 2NF, 3NF)

The project includes **40 SQL queries**, ranging from basic data retrieval to joins, aggregation, and subqueries.

## Project Structure

```text
Travel-Booking-System/
│
├── README.md
├── database.sql
├── queries.sql
└── normalization.md
```

### Files

* `database.sql` — Database, tables, constraints, and sample data
* `queries.sql` — 40 SQL queries for data analysis
* `normalization.md` — Database normalization from 1NF to 3NF

## Normalization

The database was analyzed and improved up to **Third Normal Form (3NF)** to reduce redundancy and maintain data consistency.

The normalized design introduces a `Countries` table and `LockedPricePerDay` in `Bookings` to preserve historical pricing.

## Technologies

* SQL
* MySQL
* Relational Database Management System (RDBMS)

## Author

**Namrata**

