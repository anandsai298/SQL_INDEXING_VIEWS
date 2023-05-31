create database IndexSql;
use IndexSql;
--
create table Users(
UserID int primary key,
UserName varchar(50),
UserCity varchar(50)
);
--
insert into Users values(1,'ask','hyd');
insert into Users values(2,'as','kkd');
insert into Users values(3,'df','rjy');
insert into Users values(4,'gh','vjw');
insert into Users values(5,'jk','ptpr');
insert into Users values(6,'lp','pk');
select * from Users;
--
create table Orders(
OrderId int primary key,
OrderName varchar(50),
OrderDate Date,
UserID int foreign key(UserID) REFERENCES Users(UserID)
);
--
insert into Orders values(1,'Lap','2023-05-26',1);
insert into Orders values(2,'phone','2023-05-20',2);
insert into Orders values(3,'toys','2023-05-28',3);
insert into Orders values(4,'water','2023-05-12',4);
insert into Orders values(5,'clothes','2023-05-10',5);
insert into Orders values(6,'ac','2023-05-06',6);
select * from Orders;
---
create NONCLUSTERED INDEX User_Names on Users(UserName)
--
create CLUSTERED INDEX Order_ID on Orders(OrderID)
--drop
drop INDEX Order_ID on Orders
--
create INDEX Order_Date on Orders(OrderID,OrderDate)
--
