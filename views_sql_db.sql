create database ViewsSql;
use ViewsSql;
create table Customers(
ID int primary key,
Name varchar(50),
Address varchar(50),
Phone bigint,
Salary bigint,
);
select * from Customers;
insert into Customers values(1,'ask','hyd',7412589635,40000);
insert into Customers values(2,'anand','kkd',7412589637,50000);
insert into Customers values(3,'sai','rjy',7412589638,60000);
insert into Customers values(4,'kumar','hyd',7412589639,70000);
insert into Customers values(5,'vijaya','vjw',7412589634,80000);
----------
create table Orders(
OrderID int primary key,
OrderPrice bigint,
OrderQuantity int,
ID int foreign key(ID) REFERENCES Customers(ID),
);
Alter table Orders Add OrderName varchar(50);
update Orders set OrderName='facewash' where ID=1;
update Orders set OrderName='Sugar' where ID=2;
update Orders set OrderName='Bat' where ID=3;
update Orders set OrderName='Balls' where ID=4;
update Orders set OrderName='Volleyball' where ID=5;

select * from Orders;
insert into Orders values(1,490,1,1);
insert into Orders values(2,590,2,2);
insert into Orders values(3,690,1,3);
insert into Orders values(4,790,3,4);
insert into Orders values(5,890,1,5);
----select all columns of a table------
create view Customer_V1
AS
select * from Customers
select * from Customer_V1;
-----select specific columns of a table----
create view Customer_View2
As
select Name,Address,Salary from Customers
select * from Customer_View2;
----select columns from a table with specific conditions----
create view Customer_V3
As 
select * from Customers where ID>3
select * from Customer_V3;
---create a view that will hold the columns of different tables---
Alter view Customer_V4
As 
select Customers.ID,Customers.Name,Customers.Address,Customers.Phone,Customers.Salary,Orders.OrderName,Orders.OrderQuantity,Orders.OrderPrice from Customers
join
Orders on Orders.ID=Customers.ID
select * from Customer_V4;
----Drop the View---
drop view Customer_V1;
--Rename the view--
Sp_Rename Customer_V2 , Customer_View2;
--helptext getting information of view--
Sp_HelpText Customer_V4;
--ALter view--
Alter view Customer_V4
As 
select Customers.ID,Customers.Name,Customers.Address,Customers.Phone,Customers.Salary,Orders.OrderName,Orders.OrderQuantity,Orders.OrderPrice from Customers
join
Orders on Orders.ID=Customers.ID where Address='hyd'
select * from Customer_V4;
--Refreshing view---
create view Orders_V1
as
select * from Orders
select * from Orders_V1

--DML in view--
insert into Customer_V1 values(6,'rowthu','ptprm',7458965814,30000)
update Customer_V1 set Name='aksar' where ID=6
Delete from Customer_V1 where ID=6
select * from Customer_V1

