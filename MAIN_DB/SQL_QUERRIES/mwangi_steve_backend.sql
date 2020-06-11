USE mwangi_steve_db
GO



--SELECT * FROM EMPLOYEE

--Inserting into the Employee's Table(10 Random Employee's)
INSERT INTO EMPLOYEE (EmployeeID, EmployeeFirstName, EmployeeMiddleName,EmployeeLastName,EmployeeHourlyPay,EmployeeSalary,EmployeeHireDate,EmployeeRole) VALUES
(1, 'Steve', 'A', 'Stephenson',45.00,NULL,'13-JUN-2020', 'Janitor'),
(2, 'Mark', 'B', 'Markson',48.00,NULL,'13-JUN-2020', 'Sales'),
(3, 'John', 'C', 'Johnson',45.60,NULL,'13-JUN-2020', 'Sales'),
(4, 'Akon', 'D', 'Akonson',42.70,NULL,'13-JUN-2020', 'Sales'),
(5, 'Wayne', 'E', 'Waynson',34.00,NULL,'13-JUN-2020', 'Receptionist'),
(6, 'Satas', 'F', 'Satson',24.00,NULL,'13-JUN-2020', 'Manager'),
(7, 'Nick', 'G', 'Nickson',25.00,NULL,'13-JUN-2020', 'Manager'),
(8, 'Jeff', 'H', 'Jefferson',25.00,NULL,'13-JUN-2020', 'Assistant Manager'),
(9, 'Cobb', 'I', 'Cobbson',35.00,NULL,'13-JUN-2020', 'Branch Manager'),
(10, 'Wes', 'J', 'Wesson',45.00,NULL,'13-JUN-2020', 'Executive Manager');

SELECT * FROM EMPLOYEE

INSERT INTO EMPLOYEE_PHONES (EmployeeID, EmployeePhoneNumber) VALUES
(1, '253-456-7777'),
(2, '243-456-5747'),
(3, '263-456-4767'),
(4, '253-446-3774'),
(5, '253-456-7773'),
(6, '243-456-5772'),
(7, '263-456-4771'),
(8, '253-446-3666'),
(9, '273-436-2755'),
(10, '273-436-2885'),
(10, '273-436-2775');

SELECT * FROM EMPLOYEE_PHONES

INSERT INTO EMPLOYEE_EMAILS (EmployeeID, EmployeeEmail) VALUES
(1, 'ss1@ios.uwd'),
(2, 'ss2@ios.uwd'),
(3, 'ss3@ios.uwd'),
(4, 'ss4@ios.uwd'),
(5, 'ss5@ios.uwd'),
(6, 'ss6@ios.uwd'),
(7, 'ss7@ios.uwd'),
(8, 'ss8@ios.uwd'),
(9, 'ss9@ios.uwd'),
(10, 'ss10@ios.uwd'),
(10, 'ss11@ios.uwd');

SELECT * FROM EMPLOYEE_EMAILS

INSERT INTO LOCATION (LocationID, LocationName, LocationCity, LocationState, LocationZipCode, SaleLot, RentalLot) VALUES
(21, 'Seattle Branch', 'Settle', 'WA', 98092, 1, 1),
(22, 'Auburn Branch', 'Auburn', 'WA', 98093, 0, 1),
(23, 'Kent Branch', 'Kent', 'WA', 98095, 1, 0),
(24, 'Tacoma Branch', 'Tacoma', 'WA', 98096, 1, 1),
(25, 'Renton Branch', 'Renton', 'WA', 98097, 1, 1);

SELECT * FROM LOCATION

INSERT INTO RENTALLOT(LotID, LocationID, RentalLotName, LocationAddress) VALUES
(31, 21, 'Seattle Rents', '4786 Jackson St'),
(34, 24, 'Tacoma Rents', '4786 Pierce St'),
(35, 25, 'Renton Rents', '4786 Renton Ave'),
(32, 22, 'Auburn Rents', '4786 Auburn Way');

SELECT * FROM RENTALLOT

INSERT INTO SALELOT(LotID, LocationID, SaleLotName, LocationAddress) VALUES
(41, 21, 'Seattle Sale', '786 Jackson St'),
(44, 24, 'Tacoma Sale', '786 Pierce St'),
(45, 25, 'Renton Sale', '786 Renton Ave'),
(42, 22, 'Auburn Sale', '786 Auburn Way');

SELECT * FROM SALELOT

INSERT INTO VEHICLE(VIN, LocationID, VehicleType, VehicleAvailability, PlateNumber, Make, Model, SalePrice, SaleDownpayment, FuelType, DriveType) VALUES
('asdafasdadasddsas', 21, 'SUV', 1, 'AFSFA', 'Toyota', 'Prado', 14535.45, 2000.00, 'Gasoline', 'Automatic'),
('bsdafasdadasddsas', 22, 'Sedan', 1, 'ADSFA', 'Honda', 'Accent', 10535.45, 3000.00, 'Diesel', 'Manual'),
('csdafasdadasddsas', 23, 'Sport', 0, 'AASFA', 'Lexus', 'LS250', 34535.45, 4000.00, 'Hybrid', 'Automatic'),
('dsdafasdadasddsas', 24, 'Luxury', 1, 'BFSFA', 'Audi', 'R8', 94535.45, 5000.00, 'Electric', 'Automatic'),
('esdafasdadasddsas', 25, 'SUV', 1, 'AFGFA', 'Range', 'Rover', 54535.45, 2000.00, 'Gasoline', 'Automatic');

SELECT * FROM VEHICLE

INSERT INTO POINTS (Points, RewardTier) VALUES
(10000, 'SILVER'),
(20000, 'GOLD'),
(30000, 'PLATINUM'),
(40000, 'DIAMOND'), 
(50000, 'PLUTONIUM');

SELECT * FROM POINTS

--Inserting into the Employee's Table(10 Random Employee's)
INSERT INTO CUSTOMER (CustomerID, FirstName, MiddleName, LastName, CustomerAddress,CustomerDOB,Points) VALUES
(1111, 'CuSteve', 'A', 'Stephenson','44 Jeff St','1-JUN-2020', 50000),
(2222, 'CuMark', 'B', 'Markson','4 Jeff St','2-JUN-2000', 50000),
(3333, 'CuJohn', 'C', 'Johnson','34 Ave St','3-JUN-2000', 40000),
(4444, 'CuAkon', 'D', 'Akonson','234 Place St','4-JUN-1980', 20000),
(5555, 'CuWayne', 'E', 'Waynson','24 Rd St','5-JUN-1988', 20000),
(6666, 'CuSatas', 'F', 'Satson','53 St St','3-JUN-1980', 20000),
(7777, 'CuNick', 'G', 'Nickson','43 Ave St','3-JUN-1990', 30000),
(8888, 'CuJeff', 'H', 'Jefferson','23 A St','13-JUN-2004', 30000),
(9999, 'CuCobb', 'I', 'Cobbson','2 F St','13-JUN-1920', 20000),
(10000, 'CuWes', 'J', 'Wesson','34 G St','13-JUN-1990', 10000);

SELECT * FROM CUSTOMER

INSERT INTO CUSTOMER_PHONES (CustomerID, CustomerPhoneNumber) VALUES
(1111, '553-456-7777'),
(2222, '543-456-5747'),
(3333, '663-456-4767'),
(4444, '653-446-3774'),
(5555, '553-456-7773'),
(6666, '443-456-5772'),
(7777, '463-456-4771'),
(8888, '453-446-3666'),
(9999, '473-436-2755'),
(10000, '373-436-2885'),
(10000, '473-436-2775');

SELECT * FROM CUSTOMER_PHONES

INSERT INTO CUSTOMER_EMAILS (CustomerID, CustomerEmail) VALUES
(1111, 'cuss1@ios.uwd'),
(2222, 'cuss2@ios.uwd'),
(3333, 'cuss3@ios.uwd'),
(4444, 'cuss4@ios.uwd'),
(5555, 'cuss5@ios.uwd'),
(6666, 'cuss6@ios.uwd'),
(7777, 'cuss7@ios.uwd'),
(8888, 'cuss8@ios.uwd'),
(9999, 'cuss9@ios.uwd'),
(10000, 'cuss10@ios.uwd'),
(10000, 'cuss11@ios.uwd');

SELECT * FROM CUSTOMER_EMAILS

INSERT INTO PREMIUM_MEMBERSHIP (CustomerID, Points, RewardTier, Discount) VALUES
(1111, 50000, 'PLUTONIUM', 0.25),
(7777, 30000, 'PLATINUM', 0.15),
(9999, 20000, 'GOLD', 0.1);

SELECT * FROM PREMIUM_MEMBERSHIP

INSERT INTO SALE_BILLING (SaleBillingID, CustomerID, BillingAmount, BillingDate, Deposit, Balance) VALUES
(41,1111, 8000.0, '2-MAY-2020', 2000.00, 6000.00),
(42,2222, 24000.34, '3-MAY-2020', 1000.00, 23000.00);

SELECT * FROM SALE_BILLING

INSERT INTO RENTAL_RESERVATION (ReservationID, VIN, CustomerID, ReservationDate, PickUpDate, ReturnDate) VALUES
(55, 'bsdafasdadasddsas',3333, '11-MAY-2020', '13-MAY-2020', '16-MAY-2020'),
(54, 'asdafasdadasddsas',4444, '10-MAY-2020', '11-MAY-2020', '30-MAY-2020');

SELECT * FROM RENTAL_RESERVATION


INSERT INTO RENTAL_BILLING (RentalBillingID, ReservationID, CustomerID, BillingDate, BillingAmount, Deposit, Balance, LateFee) VALUES
(65, 55,3333, '11-MAY-2020', 85.00, 0.0, 231.23, 0.0),
(64, 54,4444, '10-MAY-2020', 139.32, 20.0, 0.0, 0.0);

SELECT * FROM RENTAL_RESERVATION

INSERT INTO RENTAL_DRIVER (ReservationID, CustomerID, VIN) VALUES
(55,3333,'bsdafasdadasddsas'),
(54,4444,'asdafasdadasddsas');

SELECT * FROM RENTAL_DRIVER

INSERT INTO RENTAL_INSURANCE (CustomerID, PolicyNumber, CoverageType,CostPerDay) VALUES
(3333,'QQQWRSDFAS', 'PARTIAL', 23.00),
(4444,'ASFAAAAAFE', 'FULL', 45.00);

SELECT * FROM RENTAL_INSURANCE

INSERT INTO RENTAL_CAR_CLASS(ClassType, VIN, CarMake, CarModel, NumberOfSeats, LuggageCapacity, CarDailyPrice) VALUES
('Sedan', 'bsdafasdadasddsas', 'Honda', 'Accent', 4, 2, 120.00),
('Sport', 'csdafasdadasddsas', 'Lexus', 'LS250', 4, 2, 180.88),
('Luxury', 'dsdafasdadasddsas', 'Audi', 'R8', 2, 0, 335.00);

SELECT * FROM RENTAL_CAR_CLASS

INSERT INTO RENTAL_SUV_CLASS(SUVType, VIN, SUVMake, SUVModel, NumberOfSeats, LuggageCapacity, SUVDailyPrice) VALUES
('SUV', 'asdafasdadasddsas', 'Toyota', 'Prado', 7, 6, 250.00),
('SUV', 'esdafasdadasddsas', 'Range', 'Rover', 6, 5, 380.50);

SELECT * FROM RENTAL_SUV_CLASS