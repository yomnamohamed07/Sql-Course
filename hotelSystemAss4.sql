/* INSERT OPERATIONS :
● Insert a Guest (FullName, Nationality, PassportNumber,
DateOfBirth)
● Insert multiple Guests in one statemen*/

INSERT INTO Guests
VALUES ('Yomna Mohamed', 'Egyptian', '12345678', '2003-05-20');

INSERT INTO Guests
VALUES
('Yomna Mohamed', 'Egyptian', '12345678', '2003-05-20'),
('Ahmed Ali', 'Egyptian', '98765432', '2001-10-15'),
('Sara Mohamed', 'Egyptian', '45678912', '2002-03-10');

/*. UPDATE OPERATIONS
● Increase DailyRate by 15% for all suites
● Update ReservationStatus: If CheckoutDate < GETDATE() →
'Completed' If CheckinDate > GETDATE() → 'Upcoming' Else →
'Active*/

INSERT INTO [HotelSystems].[dbo].[room]
VALUES
( 'Single', 1, 500, 1, 1),
( 'Double', 2, 800, 1, 1),
('Suite', 4, 1500, 0, 1);
INSERT INTO Staff
VALUES
( 'Ahmed Ali', 'Manager', 1 , 4000),
( 'Sara Mohamed', 'Receptionist', 1 , 3000),
( 'Omar Hassan', 'Chef', 2, 6000),
('Mona Ali', 'Receptionist', 3 ,999);

delete from Staff ;

INSERT INTO Hotels
VALUES
('Grand Hotel', '123 Nile St', 'Cairo', 5, '01012345678', NULL),
('Sun Hotel', '45 Main St', 'Giza', 4, '01123456789', NULL),
('Royal Hotel', '78 Sea St', 'Alexandria', 5, '01234567890', NULL);

update room
set DailyRate *= 0.15;

INSERT INTO reservation
VALUES
('2026-08-24', '2026-09-01', '2026-09-05', 'Confirmed', 2000, 2, 1),
('2026-08-24', '2026-09-10', '2026-09-12', 'Pending', 1200, 1, 0),
('2026-08-24', '2026-10-01', '2026-10-07', 'Confirmed', 3500, 2, 2);

delete from reservation;

update reservation
set [reservationStatus] = CASE
when checkoutdate <GETDATE()then 'Completed'
when  CheckinDate > GETDATE()  then 'Upcoming'
Else 'Active' 
End;

/*DELETE OPERATIONS
● Delete Reservation_Guest for a reservation */

insert into reservation_Guest
values(2,5);

delete from reservation_Guest
where ReservationId =5;


Create table #StaffUpdates (StaffId int not null , FullName varchar(50), Position varchar(50) , Salary decimal );

/*. MERGE OPERATION
● Create table #StaffUpdates (StaffId, FullName, Position, Salary)
MERGE logic:
Match → Update Position + Salary
Not matched in Hotel DB → Insert
Not matched in Update table → Delete*/

merge into Staff as target 
using #StaffUpdates as source
on target.StaffId = source.StaffId

when matched
then update
set target. Position = source.Position ,
     target.Salary = source.Salary

when not matched by target then
insert ( FullName, Position, Salary)
values( source.FullName,source. Position, Source.Salary)
when not matched by source then
delete ;