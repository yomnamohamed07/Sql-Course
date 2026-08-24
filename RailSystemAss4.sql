
/*INSERT OPERATIONS :
● Insert a new Customer (FullName, PhoneNumber, Email,
ShippingAddress, RegistrationDate)*/
insert into Customer (FullName, PhoneNumber, Email,
ShippingAddress, RegistrationDate)
Values
('yomna', '01021124259', 'yomnamohamed30000@gmail.com','cairo','10-6-2025');


--Insert 3 new Suppliers

insert into Supplier  (Name,Country,Email,Address,ContactNumber)
Values 
('yara', 'Egypt', 'yaramohamed30000@gmail.com','cairo','01002730336'),
('nour', 'Egypt', 'nourahmed30000@gmail.com', 'alexandria', '01223456789'),
('salma', 'Egypt', 'salmahassan30000@gmail.com', 'cairo', '01034567890');


--Insert 2 Categories
insert into Categories (Name , Description,MainCategory) 
Values 
--('Electronics', 'Electronic devices and accessories',Null),
('Laptops', 'Laptops and notebooks', 4);

--Insert a Product but only (Name, UnitPrice)
insert into Products (Name , UnitPrice)
Values ('iPhone 15', 4.500),
('Samsung Galaxy S24', 3.800);



/*
Create table ArchivedStock (TranId, ProductId, QuantityChange,
TranDate) Insert into ArchivedStock all StockTransactions before 2023*/

ALTER TABLE StockTransactions
ADD TransDate DATE DEFAULT CAST(GETDATE() AS DATE);


INSERT INTO StockTransactions
    (QuantityChange, Type, Reference, ProductId, TransDate)
VALUES
    (10, 'Purchase', 'PO-001', 2, '2025-01-15'),
    (-2, 'Sale',     'SO-001', 3, '2025-02-10'),
    (20, 'Purchase', 'PO-002', 2, '2024-11-20'),
    (-5, 'Sale',     'SO-002', 2, '2024-12-05'),
    (15, 'Purchase', 'PO-003', 3, '2023-08-12'),
    (-3, 'Sale',     'SO-003', 3, '2025-06-18');

select * from StockTransactions;
ALTER TABLE StockTransactions
ADD TransDate DATE;

Create table  ##ArchivedStock
(TranId int  Primary key,
ProductId int , 
QuantityChange int not null,
TranDate Date );
Drop table ##ArchivedStock;


insert into ##ArchivedStock 
(TranId ,ProductId , QuantityChange ,TranDate )
Select TransId ,ProductId , QuantityChange ,TransDate 
from StockTransactions
Where TransDate <'2025-01-01';



/*TEMPORARY TABLES
● Create #CustomerOrders with (OrderId, CustomerId, TotalAmount)
Insert customers who made orders above 5000.*/

Create Table #CustomerOrders  
(OrderId int not null , 
CustomerId int not null ,
Primary Key (OrderId , CustomerId),
TotalAmount int );

INSERT INTO Orders
VALUES
('Pending', 10000, '2026-08-24', 1),
('Completed', 250, '2026-08-27', 1),
('Pending', 55000, '2026-08-12', 1);

insert into #CustomerOrders ( OrderId, CustomerId, TotalAmount)
select OrderId, CustomerId, TotalAmount
from Orders
Where TotalAmount >5000 ;

/*Create ##TopRatedProducts with (ProductId, Rating) Insert
products with rating ≥ 4.5*/

INSERT INTO Reviews
VALUES
(5, 'Excellent product', '2026-08-24', 2, 1),
(4, 'Very good', '2026-08-23', 2, 1),
(3, 'Good', '2026-08-22', 3, 1);

Create  table ##TopRatedProducts (ProductId int not null  ,
 Rating int not null );


insert into ##TopRatedProducts (ProductId, Rating)
select ProductId, Rating
from Reviews
where Rating >4.5


/*UPDATE OPERATIONS
● Increase all UnitPrice by 10% for products under 100 EGP*/

update Products
Set  UnitPrice *= 0.1
where UnitPrice <100;

/*Update Order Status: If TotalAmount > 5000 → “Premium” Else →
“Standard */

update Orders
Set [Status] = CASE
When TotalAmount >5000 then 'Premium'
Else 'Standard'
End;


/*DELETE OPERATIONS
● Delete a Review by ReviewId
● Delete all Orders with Status = “Cancelled
● Delete OrderItems for a given OrderId */

Delete from Reviews
where ReviewId =1;

Delete from Orders
where Status = 'Cancelled';

INSERT INTO OrderItem
VALUES
(2, 100, 2, 3),
(1, 250, 2, 4),
(3, 150, 3, 4);

delete from OrderItem
where ProductId =3;

/*MERGE OPERATION
● Create table #ProductsUpdate (ProductId, Name, UnitPrice,
StockQuantity)
MERGE logic:
If product exists → UPDATE price & stock
If new → INSERT
If a product exists in main table but not in update table →
DELETE*/

Create table #ProductsUpdate (ProductId int , Name varchar(50), UnitPrice decimal(5,2),
StockQuantity int );

Merge into Products As target
using #ProductsUpdate As Source
on target.ProductId = Source.ProductId
when  matched then
update 
set target.UnitPrice = Source.UnitPrice,
target.StockQuantity = Source.StockQuantity

when not matched by target
then 
insert ( Name, UnitPrice,
StockQuantity)
Values( Source.Name, Source.UnitPrice,
Source.StockQuantity)

when not matched by source
then delete ;



