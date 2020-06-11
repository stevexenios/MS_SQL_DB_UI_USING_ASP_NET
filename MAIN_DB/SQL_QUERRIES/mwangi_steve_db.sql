USE master
GO

ALTER DATABASE mwangi_steve_db SET MULTI_USER

DROP DATABASE mwangi_steve_db
GO

CREATE DATABASE mwangi_steve_db
GO

USE mwangi_steve_db
GO

--TABLE 1
CREATE TABLE EMPLOYEE
(
	EmployeeID int Primary Key not null,
	EmployeeFirstName varchar(50) not null,
	EmployeeMiddleName varchar(50),
	EmployeeLastName varchar(50) not null,
	EmployeeHourlyPay decimal(4,2),
	EmployeeSalary int,
	EmployeeHireDate char(11) not null, --Accepted formats 'DD-MON-YYYY'
	EmployeeRole varchar(50) not null
)

--TABLE 16
CREATE TABLE EMPLOYEE_PHONES
(
	EmployeeID int not null,
	EmployeePhoneNumber varchar(12) Primary Key not null,
	FOREIGN KEY (EmployeeID)
		REFERENCES EMPLOYEE(EmployeeID)
		ON UPDATE CASCADE
)

--TABLE 17
CREATE TABLE EMPLOYEE_EMAILS
(
	EmployeeID int not null,
	EmployeeEmail varchar(50) Primary Key not null,
	FOREIGN KEY (EmployeeID)
		REFERENCES EMPLOYEE(EmployeeID)
		ON UPDATE CASCADE
)

--TABLE 2
CREATE TABLE LOCATION
(
	LocationID int Primary Key not null,
	LocationName varchar(50) not null,
	LocationCity varchar(50) not null,
	LocationState char(2) not null,
	LocationZipCode varchar(5) not null,
	SaleLot bit not null, -- Defines if the location has sale lot
	RentalLot bit not null-- Defines if the location has rental lot
)

--TABLE 3
CREATE TABLE RENTALLOT
(
	LotID int Primary Key not null,
	LocationID int not null,
	RentalLotName varchar(50) not null,
	LocationAddress varchar(50) not null unique,
	FOREIGN KEY (LocationID)
		REFERENCES LOCATION(LocationID)
		ON UPDATE CASCADE
)

--TABLE 4
CREATE TABLE SALELOT
(
	LotID int Primary Key not null,
	LocationID int not null,
	SaleLotName varchar(50) not null,
	LocationAddress varchar(50) not null unique,
	FOREIGN KEY (LocationID)
		REFERENCES LOCATION(LocationID)
		ON UPDATE CASCADE
)

--DROP TABLE VEHICLE
--TABLE 5
CREATE TABLE VEHICLE
(
	VIN char(17) not null unique,
	LocationID int not null,
	VehicleType varchar(50),
	VehicleAvailability bit not null,
	PlateNumber varchar(10) not null unique,
	Make varchar(20) not null,
	Model varchar(20) not null,
	SalePrice decimal(7,2) not null,
	SaleDownpayment decimal(7,2) not null, 
	FuelType varchar(20) not null,
	DriveType varchar(20) not null,
	PRIMARY KEY (VIN, LocationID),
	FOREIGN KEY (LocationID)
		REFERENCES LOCATION(LocationID)
		ON UPDATE CASCADE
)

--TABLE 7
CREATE TABLE POINTS
(
	Points int not null,
	RewardTier varchar(10) not null, --e.g. SILVER, DIAMOND, GOLD, PLATINUM
	PRIMARY KEY (Points)
)

--TABLE 8
CREATE TABLE CUSTOMER
(
	CustomerID int Primary Key not null,
	FirstName varchar(50) not null,
	MiddleName varchar(50),
	LastName varchar(50) not null,
	CustomerAddress varchar(50) not null,
	CustomerDOB char(11) not null, --Accepted formats 'DD-MON-YYYY'
	Points int not null,
	FOREIGN KEY (Points) 
		REFERENCES POINTS(Points)
		ON UPDATE CASCADE
)

--TABLE 18
CREATE TABLE CUSTOMER_PHONES
(
	CustomerID int not null,
	CustomerPhoneNumber varchar(12) Primary Key  not null,
	FOREIGN KEY (CustomerID)
		REFERENCES CUSTOMER(CustomerID)
		ON UPDATE CASCADE
)

--TABLE 19
CREATE TABLE CUSTOMER_EMAILS
(
	CustomerID int not null,
	CustomerEmail varchar(50) Primary Key  not null,
	FOREIGN KEY (CustomerID)
		REFERENCES CUSTOMER(CustomerID)
		ON UPDATE CASCADE
)

--TABLE 6
CREATE TABLE PREMIUM_MEMBERSHIP
(
	CustomerID int not null unique,
	Points int not null,
	RewardTier varchar(10) not null,
	Discount numeric(2,2) not null, -- Should be percentages, e.g. 0.02, 0.03, 0.05, 0.09 
	PRIMARY KEY (CustomerID, Points),
	FOREIGN KEY (Points) REFERENCES POINTS(Points),
	FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
)

--TABLE 9
CREATE TABLE SALE_BILLING
(
	SaleBillingID int not null unique,
	CustomerID int not null,
	BillingAmount decimal(7,2) not null,
	BillingDate char(11) not null, --Accepted formats 'DD-MON-YYYY'
	Deposit decimal(7,2) not null,
	Balance decimal(7,2) not null,
	PRIMARY KEY (CustomerID, SaleBillingID, BillingAmount),
	FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
)

--TABLE 10
CREATE TABLE RENTAL_RESERVATION
(
	ReservationID int not null unique,
	VIN char(17) not null unique,
	CustomerID int not null,
	ReservationDate char(11) not null, --Accepted formats 'DD-MON-YYYY'
	PickUpDate char(11) not null, --Accepted formats 'DD-MON-YYYY'
	ReturnDate char(11) not null, --Accepted formats 'DD-MON-YYYY'
	PRIMARY KEY(ReservationID, VIN, CustomerID),
	FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
	FOREIGN KEY (VIN) REFERENCES VEHICLE(VIN)
)

--TABLE 11
CREATE TABLE RENTAL_BILLING
(
	RentalBillingID int not null unique,
	ReservationID int not null,
	CustomerID int not null,
	BillingDate char(11) not null, --Accepted formats 'DD-MON-YYYY'
	BillingAmount decimal(7,2) not null,
	Deposit decimal(7,2) not null,
	Balance decimal(7,2) not null,
	LateFee decimal(7,2) not null,
	PRIMARY KEY (CustomerID, RentalBillingID, ReservationID, BillingAmount),
	FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
	FOREIGN KEY (ReservationID) REFERENCES RENTAL_RESERVATION(ReservationID),
)

--TABLE 12
CREATE TABLE RENTAL_DRIVER
(
	ReservationID int not null,
	CustomerID int not null,
	VIN char(17) not null unique,
	PRIMARY KEY(CustomerID, ReservationID),
	FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
	FOREIGN KEY (ReservationID) REFERENCES RENTAL_RESERVATION(ReservationID),
	FOREIGN KEY (VIN) REFERENCES VEHICLE(VIN)
)

--TABLE 13
CREATE TABLE RENTAL_INSURANCE
(
	CustomerID int not null,
	PolicyNumber varchar(10) not null,
	CoverageType varchar(10) not null,
	CostPerDay decimal(4,2) not null
	PRIMARY KEY(PolicyNumber, CustomerID)
)

--TABLE 14
CREATE TABLE RENTAL_CAR_CLASS
(
	ClassType char(10) not null, --CLASSES ARE Compact, Standard, Luxury, Minivan, Pickup
	VIN char(17) not null unique,
	CarMake varchar(20) not null,
	CarModel varchar(20) not null,
	NumberOfSeats int not null,
	LuggageCapacity int not null,
	CarDailyPrice decimal(7,2) not null,
	PRIMARY KEY(ClassType, VIN),
	FOREIGN KEY (VIN) REFERENCES VEHICLE(VIN)
)

--TABLE 15
CREATE TABLE RENTAL_SUV_CLASS
(
	SUVType char(10) not null, --CLASSES ARE Compact, Intermediate, Standard, Luxury, Full, Elite, Premium, OffRoad
	VIN char(17) not null unique,
	SUVMake varchar(20) not null,
	SUVModel varchar(20) not null,
	NumberOfSeats int not null,
	LuggageCapacity int not null,
	SUVDailyPrice decimal(7,2) not null,
	PRIMARY KEY(SUVType, VIN),
	FOREIGN KEY (VIN) REFERENCES VEHICLE(VIN)
)