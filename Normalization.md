# Database Normalization

The Travel Booking System database was analyzed and normalized up to the **Third Normal Form (3NF)** to reduce redundancy, improve data consistency, and maintain data integrity.

## 1NF — First Normal Form

### Rule

A table should contain atomic values, and there should be no repeating groups.

### Issue

The original `Customers` table stores the complete customer name in a single `Name` column.

For example:

`Amit Sharma`

If the system needs to separately access the first name or last name, additional string processing would be required.

### Solution

The `Name` attribute can be divided into:

* `FirstName`
* `LastName`

This ensures that the values are atomic.

---

## 2NF — Second Normal Form

### Rule

A table must be in 1NF, and every non-key attribute must depend on the entire primary key.

### Analysis

The tables in this system use single-column primary keys such as:

* `CustomerID`
* `DestinationID`
* `BookingID`
* `PaymentID`

Since there are no composite primary keys, partial dependencies do not occur.

### Result

The schema satisfies **2NF**.

---

## 3NF — Third Normal Form

### Rule

A table must be in 2NF and must not contain transitive dependencies.

### Issue 1: Country Dependency

In the `Destinations` table, `Country` is associated with the destination's city. Keeping country information directly in the table can introduce geographical redundancy.

### Solution

A separate `Countries` table can be introduced:

```text
Countries
---------
CountryID (PK)
CountryName
```

The `Destinations` table then references `CountryID` instead of storing the country information repeatedly.

---

### Issue 2: Historical Pricing

The payment amount is related to:

```text
DurationDays × PricePerDay
```

However, destination prices may change in the future.

For example, if the price of a destination changes in 2027, using the current `PricePerDay` to calculate an older 2026 booking could produce an incorrect historical amount.

### Solution

Store the price at the time of booking as:

```text
LockedPricePerDay
```

inside the `Bookings` table.

This preserves the original booking price even if the destination's current price changes later.

---

# Final 3NF Schema

The normalized database consists of five tables:

### Countries

* `CountryID` — Primary Key
* `CountryName`

### Customers

* `CustomerID` — Primary Key
* `FirstName`
* `LastName`
* `Email`
* `Phone`
* `City`

### Destinations

* `DestinationID` — Primary Key
* `CountryID` — Foreign Key
* `CityName`
* `CurrentPricePerDay`

### Bookings

* `BookingID` — Primary Key
* `CustomerID` — Foreign Key
* `DestinationID` — Foreign Key
* `TravelDate`
* `DurationDays`
* `LockedPricePerDay`

### Payments

* `PaymentID` — Primary Key
* `BookingID` — Foreign Key
* `AmountPaid`
* `PaymentMethod`
* `PaymentDate`

## Benefits of Normalization

* Reduces data redundancy
* Prevents update anomalies
* Maintains historical pricing information
* Improves data consistency
* Strengthens referential integrity
* Makes the database easier to maintain and extend
