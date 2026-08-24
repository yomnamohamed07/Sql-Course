

insert into Customer (FullName, PhoneNumber, Email,
ShippingAddress, RegistrationDate)
Values
('yomna', '01021124259', 'yomnamohamed30000@gmail.com','cairo','10-6-2025');

insert into Supplier  (Name,Country,Email,Address,ContactNumber)
Values 
('yara', 'Egypt', 'yaramohamed30000@gmail.com','cairo','01002730336'),
('nour', 'Egypt', 'nourahmed30000@gmail.com', 'alexandria', '01223456789'),
('salma', 'Egypt', 'salmahassan30000@gmail.com', 'cairo', '01034567890');

insert into Categories (Name , Description,MainCategory) 
Values 
--('Electronics', 'Electronic devices and accessories',Null),
('Laptops', 'Laptops and notebooks', 4);

insert into Products (Name , UnitPrice)
Values ('iPhone 15', 4.500),
('Samsung Galaxy S24', 3.800);



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


