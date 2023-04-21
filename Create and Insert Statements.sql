Create Table Car_Category
(
Car_name varchar(25) not null , 
Passenger_count int (8) not null , 
Cost_per_Day float (2) not null,
kml float (4) not null ,
primary key (Car_name)
);


INSERT INTO Car_Category VALUES('Economy', 5, 30, 20.0);
INSERT INTO Car_Category VALUES('Truck', 5, 55, 15.0);
INSERT INTO Car_Category VALUES('Sedan', 5, 42, 18.0);
INSERT INTO Car_Category VALUES('Mini_Van', 7, 65, 12.0);
INSERT INTO Car_Category VALUES('Standard_SUV', 5, 50, 14.0);
INSERT INTO Car_Category VALUES('Full_Size_SUV', 8, 75, 10.0);


CREATE TABLE Car
(
    make VARCHAR(25) not null,
    model_name VARCHAR(25) not null,
    CarYear SMALLINT not null, 
    VIN VARCHAR(17) not null,
    Availability INTEGER(2) not null,
    Mileage float(2) not null, 
    Car_name VARCHAR(25) not null,
    Primary key (VIN),
    CONSTRAINT CARFK1
    Foreign key(Car_name) REFERENCES Car_Category(Car_name)
);


INSERT INTO Car VALUES('Toyota' , 'Camry',2020, 'WDBHM36E3VF540750',1,45000, 'Sedan');
INSERT INTO Car VALUES('Hyundai', 'Elentra',2019, 'KMHD35LH6EU998951',1,63600,'Sedan');
INSERT INTO Car VALUES('Honda', 'CRV',2019, '1FTZX1722XKA76091',1,56040,'Standard_SUV');
INSERT INTO Car VALUES('Tesla', 'ModelX' ,2022 , 'JH4NA1260NT000255',1,2000, 'Standard_SUV');
INSERT INTO Car VALUES('Toyota', 'Sienna',2021, '4T1BB46K27UU00854',1,21400, 'Mini_Van');
INSERT INTO Car VALUES('Dodge', 'Caravan' ,2016, '1GNDT13S582215117',1,40000, 'Mini_Van');
INSERT INTO Car VALUES('Ford', 'Raptor' ,2021, 'JH4KA7530PC000671',1,20000, 'Truck');
INSERT INTO Car VALUES('Dodge', 'Trx' ,2022 , '2GCHG31K6J4141689',1,500, 'Truck');
INSERT INTO Car VALUES('Cadillac', 'Escalade' ,2016 ,  '4V4NC9JH21N322086',1,15000, 'Full_Size_SUV');
INSERT INTO Car VALUES('Chevy',  'Taho', 2022, 'JH4DA3340HS032394',1,50000, 'Full_Size_SUV');
INSERT INTO Car VALUES('Honda', 'Civic' ,2018, 'JH4DA3350GS005185',1,19000, 'Economy');
INSERT INTO Car VALUES('Toyota' , 'Prius',2022, '5TEWN72N642345626',1,9400, 'Economy');


CREATE TABLE Employees(
    EmployeeId VARCHAR(10) NOT NULL,
    DateOfBirth DATE NOT NULL,
    FName VARCHAR(25) NOT NULL,
    LName VARCHAR(20) NOT NULL,
    HoursWorked FLOAT(2) NOT NULL,
    PRIMARY KEY (EmployeeId)
);
INSERT INTO Employees VALUES('222221', '1990-02-22', 'Jasondeep', 'Barry', 23.7);
INSERT INTO Employees VALUES('111111', '1980-04-19', 'Kevin', 'Lio', 17.1);
INSERT INTO Employees VALUES('999997', '1997-12-15', 'Jon', 'Snow', 19.9);
INSERT INTO Employees VALUES('777777', '1967-02-22', 'Jess', 'Starr', 14.0);
INSERT INTO Employees VALUES('333333', '1980-09-11', 'Jackson', 'bacon', 31.3);
INSERT INTO Employees VALUES('000001', '1983-09-03', 'Laura', 'May', 26.2);
INSERT INTO Employees VALUES('555664', '1999-04-05', 'Christian', 'Martinez', 36.7);



CREATE TABLE EmployeeContact (
    EmployeeId VARCHAR(10) NOT NULL,
    PhoneNumber VARCHAR(12) NOT NULL,
    PRIMARY KEY (EmployeeId),
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);
INSERT INTO EmployeeContact VALUES('222221','4169019999');
INSERT INTO EmployeeContact VALUES('111111','4169930000');
INSERT INTO EmployeeContact VALUES('999997','4167659878');
INSERT INTO EmployeeContact VALUES('777777','4169056699');
INSERT INTO EmployeeContact VALUES('333333','6479990000');
INSERT INTO EmployeeContact VALUES('000001','9059103433');
INSERT INTO EmployeeContact VALUES('555664','4169321799');



CREATE TABLE CustomerInfo (
    Driver_License VARCHAR(50) NOT NULL,
    First_Name VARCHAR(100) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cell_phone VARCHAR(10) NOT NULL,
    PRIMARY KEY (Driver_License)
);

INSERT INTO CustomerInfo VALUES ('1234567890', 'John', 'Doe', 'johndoe@example.com', '1234567890');

INSERT INTO CustomerInfo VALUES ('0987654321', 'Jane', 'Doe', 'janedoe@example.com', '9876543210');

INSERT INTO CustomerInfo VALUES ('5678901234', 'Bob', 'Smith', 'bobsmith@example.com', '5678901234');

INSERT INTO CustomerInfo VALUES ('1112223334', 'Emily', 'Jones', 'emilyjones@example.com', '1112223334');

INSERT INTO CustomerInfo VALUES ('4445556667', 'Michael', 'Davis', 'michaeldavis@example.com', '4445556667');


CREATE TABLE CustomerAddress (
    Driver_License VARCHAR(50) NOT NULL,
    street_Name VARCHAR(25) NOT NULL,
    Province_Name CHAR(12) NOT NULL,
    City_Name CHAR(15) NOT NULL,
    Postal_Code VARCHAR(6) NOT NULL,
    PRIMARY KEY (Driver_License, Postal_Code),
    FOREIGN KEY (Driver_License) REFERENCES CustomerInfo(Driver_License)
);

INSERT INTO CustomerAddress VALUES ('1234567890', 'Main St', 'Ontario', 'Toronto', 'M1S2K2');

INSERT INTO CustomerAddress VALUES ('0987654321', 'Bird St', 'Ontario', 'Thunderbay', 'V5V2X5');

INSERT INTO CustomerAddress VALUES ('5678901234', 'King St', 'Alberta', 'Calgary', 'T2E6W8');

INSERT INTO CustomerAddress VALUES ('1112223334', 'Yonge St', 'Ontario', 'Toronto', 'M4W1J7');

INSERT INTO CustomerAddress VALUES ('4445556667', 'Robson St', 'Ontario', 'Milton', 'V6Z1C1');


CREATE TABLE Location
(	
	LocationID varchar(10) not null,
	AddressProvince char(15) not null,
	AddressStreet varchar(30) not null,
	AddressCity varchar(50) not null, 
	PostalCode varchar(7) not null,
	Primary key(LocationID, PostalCode)
);

INSERT INTO Location VALUES('1111122666' , 'ON', 'Jacksonville' , 'Punjab', 'N0B190');
INSERT INTO Location VALUES('1234440001' , 'ON', 'Hazel' , 'Waterloo', 'N0BLH3');
INSERT INTO Location VALUES('7889943211' , 'ON', 'Sus' , 'Oshawa', 'NJ2180');
INSERT INTO Location VALUES('3451277800' , 'ON', 'Mary' , 'London', 'N0B324');
INSERT INTO Location VALUES( '1111122111' , 'ON', 'Hammersly'  ,'Brampton', 'NJ2180');



CREATE TABLE RentalInsurance(
PolicyNum INT(20) not null,
CostPerDay FLOAT(7) not null,
CoverageType VARCHAR(100) not null,
FirstName VARCHAR(100) not null,
LastName VARCHAR(100) not null,
UNIQUE(PolicyNum),
Primary key (PolicyNum)
);

INSERT INTO RentalInsurance VALUES(822343, 20.5, 'Partial', 'John', 'Doe' );
INSERT INTO RentalInsurance VALUES(233333, 20.5, 'Full', 'Jane', 'Doe');
INSERT INTO RentalInsurance VALUES(215999, 20.5, 'Partial', 'Bob', 'Smith');
INSERT INTO RentalInsurance VALUES(764899, 20.5, 'Full', 'Emily', 'Jones');
INSERT INTO RentalInsurance VALUES(908776, 20.5, 'Full','Michael', 'Davis' );


CREATE TABLE Booking (
    Booking_Num INT(6) NOT NULL,
    Return_date DATE NOT NULL,
    Pickup_date DATE NOT NULL,
    Booking_status INT(2) NOT NULL,
    ActualReturnDate DATE NOT NULL,
    PickupLocation VARCHAR(10) NOT NULL,
    DropoffLocation VARCHAR(10) NOT NULL,
    CarVin VARCHAR(17) NOT NULL,
    PRIMARY KEY (Booking_Num),
    FOREIGN KEY (PickupLocation) REFERENCES Location (LocationID),
    FOREIGN KEY (DropoffLocation) REFERENCES Location (LocationID),
    FOREIGN KEY (CarVin) REFERENCES Car (VIN)
);
INSERT INTO Booking VALUES(564322, '2023-02-05', '2022-12-27', 1, '2023-02-05', '1111122666', '3451277800', 'WDBHM36E3VF540750');
INSERT INTO Booking VALUES(434111, '2023-01-05', '2022-12-29', 1, '2023-01-05', '7889943211', '3451277800', '4T1BB46K27UU00854');
INSERT INTO Booking VALUES(453333, '2023-02-07', '2023-01-25', 1, '2023-02-07', '1111122111', '1111122111', '4V4NC9JH21N322086');
INSERT INTO Booking VALUES(123456, '2023-01-05', '2022-12-30', 1, '2023-01-05', '7889943211', '3451277800', '4T1BB46K27UU00854');
INSERT INTO Booking VALUES(902335, '2023-01-06', '2022-08-27', 1, '2023-02-05', '1111122111', '3451277800', '2GCHG31K6J4141689');


CREATE TABLE Booking_RentalInsurance (
    Booking_Num INT(6) NOT NULL,
    PolicyNum INT NOT NULL,
    PRIMARY KEY (Booking_Num),
    FOREIGN KEY (Booking_Num) REFERENCES Booking (Booking_Num),
    FOREIGN KEY (PolicyNum) REFERENCES RentalInsurance (PolicyNum)
);

INSERT INTO Booking_RentalInsurance VALUES(564322, 822343);
INSERT INTO Booking_RentalInsurance VALUES(434111, 233333);
INSERT INTO Booking_RentalInsurance VALUES(453333, 215999);
INSERT INTO Booking_RentalInsurance VALUES(123456, 764899);
INSERT INTO Booking_RentalInsurance VALUES(902335, 908776);

CREATE TABLE Booking_Customer (
    Booking_Num INT(6) NOT NULL,
    Driver_License VARCHAR(50) NOT NULL,
    PRIMARY KEY (Booking_Num),
    FOREIGN KEY (Booking_Num) REFERENCES Booking (Booking_Num),
    FOREIGN KEY (Driver_License) REFERENCES  CustomerInfo(Driver_License)
);

INSERT INTO Booking_Customer VALUES(564322,'1234567890');
INSERT INTO Booking_Customer VALUES(434111,'0987654321');
INSERT INTO Booking_Customer VALUES(453333,'5678901234');
INSERT INTO Booking_Customer VALUES(123456,'1112223334');
INSERT INTO Booking_Customer VALUES(902335,'4445556667');

CREATE TABLE Billing (
  BillNum INT PRIMARY KEY,
  TotalAmount FLOAT NOT NULL
);

INSERT INTO Billing VALUES(10233,220.23);
INSERT INTO Billing VALUES(54673,240.46);
INSERT INTO Billing VALUES(23457,300.45);
INSERT INTO Billing VALUES(23840,190.24);
INSERT INTO Billing VALUES(32034,400.89);


CREATE TABLE Tax_billing (
  BillNum INT,
  Booking_num INT,
  TaxAmount FLOAT NOT NULL,
  PRIMARY KEY (BillNum, Booking_num),
  FOREIGN KEY (BillNum) REFERENCES Billing(BillNum),
  FOREIGN KEY (Booking_num) REFERENCES Booking_Customer(Booking_num)
);
INSERT INTO Tax_billing VALUES(10233, 564322,20.23);
INSERT INTO Tax_billing VALUES(54673,434111,25.46);
INSERT INTO Tax_billing VALUES(23457,453333,30.45);
INSERT INTO Tax_billing VALUES(23840,123456,20.24);
INSERT INTO Tax_billing VALUES(32034,902335,50.89);

CREATE TABLE SecurityDeposit_billing (
  BillNum INT,
  Booking_num INT,
  SecurityDeposit FLOAT NOT NULL,
  PRIMARY KEY (BillNum, Booking_num),
  FOREIGN KEY (BillNum) REFERENCES Billing(BillNum),
  FOREIGN KEY (Booking_num) REFERENCES Booking(Booking_num)
);
INSERT INTO SecurityDeposit_billing VALUES(10233, '434111', 100);
INSERT INTO SecurityDeposit_billing VALUES(54673, '564322', 100);
INSERT INTO SecurityDeposit_billing VALUES(23457, '902335', 100);
INSERT INTO SecurityDeposit_billing VALUES(23840, '453333', 100);
INSERT INTO SecurityDeposit_billing VALUES(32034, '123456', 100);




CREATE TABLE Repair_Info(
InvoiceNum INT(25) not null,
DamageCost FLOAT(6) not null,
CarDamaged VARCHAR(30) not null,
TypeDamage VARCHAR(255) not null,
CauseDamage CHAR(255) not null,
Primary key (InvoiceNum)
);
INSERT INTO Repair_Info VALUES (1001, 1500.00, 'Toyota Camry', 'Body Damage', 'Car accident');
INSERT INTO Repair_Info VALUES (1002, 1000.50, 'Honda Crv', 'Mechanical', 'Engine failure');
INSERT INTO Repair_Info VALUES (1003, 5000.25, 'Ford Raptor', 'Electrical', 'Faulty wiring');


CREATE TABLE Repair_Customer(
InvoiceNum INT(25) not null,
DriverLicense VARCHAR(50) not null,
FirstName VARCHAR(100) not null,
Primary key (InvoiceNum,DriverLicense),
Foreign key (DriverLicense) references CustomerInfo(Driver_License)
);

INSERT INTO Repair_Customer VALUES (1001, '1234567890', 'John');
INSERT INTO Repair_Customer VALUES (1002, '5678901234', 'Jane');
INSERT INTO Repair_Customer VALUES (1003, '1112223334', 'Emily');



CREATE TABLE Repair_Billing(
InvoiceNum INT(25) not null,
Bill_Num INT not null,
Primary key (InvoiceNum),
Foreign key (Bill_Num) references Billing(BillNum)
);

INSERT INTO Repair_Billing VALUES (1001, 23457);
INSERT INTO Repair_Billing VALUES (1002, 32034);
INSERT INTO Repair_Billing VALUES (1003, 23840);






















