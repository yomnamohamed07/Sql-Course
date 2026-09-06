
Create Database HotelSystems;

CREATE TABLE Hotels (
    HotelId INT IDENTITY PRIMARY KEY,
    Names VARCHAR(100) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    StarRating INT,
    ContactNumber VARCHAR(100) NOT NULL,
 -- ManagerId INT Foreign Key(ManagerId) References Staff(StaffId)
);

Create Table Staff(
StaffId Int identity PRIMARY KEY,
FullName Varchar(100) Not Null,
Position Varchar(100) Not Null ,
HotelId Int Foreign Key (HotelId) References Hotels(HotelId)

);

Alter Table Hotels
Add  ManagerId INT Foreign Key(ManagerId) References Staff(StaffId);

Create Table Services
(
ServiceId int identity Primary Key ,
ServicesName Varchar(100) Not Null,
Charge  DECIMAL(12,0) ,
RequestDate Date,
StaffId int Foreign Key (StaffId) References Staff(StaffId)
);

Create table room (
RoomNumber int identity Primary Key ,
RoomType Varchar(100) not Null,
Capacity int not null,
DailyRate int not null,
Availability Bit Not null ,
HotelId int references Hotels(HotelId)
);

create table Amenities (
RoomNumber int references room(RoomNumber),
Amenity Int Identity Primary Key
);

create table Guests(
GuestId int Primary Key Identity,
FullName Varchar(100) Not null,
Nationality varchar(100) not null ,
PassportNumber int not null ,
dateofbirth date ,

);

create  table Guest_Contact (
GuestId int  references  Guests(GuestId),
Details Varchar(100),
Primary key(GuestId, Details)


);
 create table reservation
 (
 ReservationId int Primary key identity,
 BookingDate date not null,
 checkinDate date not null ,
 checkoutdate date not null,
 reservationStatus bit not null ,
 totalPrice decimal(12,0),
 NumberofAdults int not null ,
 NumberofChildren int not null
 );
 Alter table reservation
 Alter Column totalPrice  decimal(12,2) not null ;

 create table Payments(
 PaymentId int identity Primary key ,
 Method Varchar(50) not null ,
 Date Date not null ,
 Amount int not null ,
 confirmationnumber int not null 
 
 );

 create table reservation_Services(
 
 ServiceId int foreign key(ServiceId) references Services(ServiceId),
 ReservationId int foreign key(ReservationId) references reservation(ReservationId),
 Primary Key(ReservationId,ServiceId) 
 );

  create table reservation_Guest(
 
 GuestId int references Guests(GuestId),
 ReservationId int references reservation(ReservationId),
 Primary Key(ReservationId,GuestId) 
 );

   create table reservation_Room(
 
 RoomNumber int references room(RoomNumber),
 ReservationId int references reservation(ReservationId),
 Primary Key(ReservationId,RoomNumber) 
 );
  create table reservation_Payment(
 
 PaymentId int references Payments(PaymentId),
 ReservationId int references reservation(ReservationId),
 Primary Key(ReservationId,PaymentId) 
 );