Create database RetailSystem ;

create table Supplier(
SupplierId int identity Primary Key ,
Name Varchar(50) Not null, 
Country Varchar(100) not null,
Email varchar(100) not null,
Address varchar(100) not null ,
ContactNumber Varchar(100) not null

);

Create table Customer(
CustomerId int identity Primary Key ,
FullName Varchar(100) not null,
Email Varchar(100) not null,
PhoneNumber Varchar(100) not null,
ShippingAddress Varchar(100) not null,
RegistrationDate Date

);
Alter table Customer
Alter Column RegistrationDate Date Not null;

Create Table Categories(
CategoryId int identity Primary Key ,
Name Varchar(100) not null,
Description Varchar(100) not null,
MainCategory int Foreign key (MainCategory) references Categories(CategoryId)
);

create table Products(
ProductId int identity Primary Key ,
Name Varchar(100) not null,
Description Varchar(100) not null,
AddedDate Date Not null,
UnitPrice decimal(5,2) Not null ,
StockQuantity int not null ,
CategoryId int References Categories(CategoryId)
);

Create table Reviews(
ReviewId int identity Primary Key ,
Rating int Not null,
comment varchar(max) not null,
Date Date not null ,
ProductId int references Products(ProductId),
CustomerId int references Customer(CustomerId)

);

create table StockTransactions(
TransId int identity Primary Key,
QuantityChange int not null ,
Type int not null ,
Reference Varchar(100)  not null,
ProductId int references Products(ProductId)
);

Create table Orders (
OrderId int identity Primary Key ,
Status int not null ,
TotalAmount int not null ,
OrderDate Date not null,
CustomerId int Foreign Key (CustomerId) references Customer(CustomerId)
);

Create table Payment(
PaymentId int identity Primary Key,
PaymentDate Date  not null,
Amount Decimal not null ,
Status int not null,
Method int not null 
);

Create table order_Payment(
OrderId int references Orders(orderId) ,
PaymentId int references Payment(PaymentId)
Primary Key (OrderId, PaymentId)
);
 create table OrderItem(
 OrderItemId int identity Primary Key ,
 Quantity int not null ,
 UnitPrice Decimal not null,
 ProductId int references Products(ProductId),
 OrderId int references Orders(OrderId)
 );

 Create table Shipments(
 ShipmentId  int Primary Key identity ,
 ShipmentDate Date Not null,
 Status int not null,
 DeliveryDate Date not null,
 CarrierName Varchar(100) not null,
 TrackingNumber  int not null,
 OrderId int references Orders(OrderId)
 );

 Create table Supplier_Product(
 
 ProductId int references Products(ProductId),
 SupplierId int references Supplier(SupplierId),
 Primary Key (ProductId , SupplierId)
 
 
 );
 ----------