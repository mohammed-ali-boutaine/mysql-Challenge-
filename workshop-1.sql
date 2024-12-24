create database SaleOrderQuiz;
use SaleOrderQuiz;

create table Client(
	CustomerID int primary key auto_increment,
	CustomerFirstName  VARCHAR(50) NOT null ,
	CustomerLastName  VARCHAR(50) NOT null,
	CustomerAddress  VARCHAR(50) NOT null,
	CustomerCity  VARCHAR(50) NOT null,
	CustomerPostCode  CHAR(4) null,
	CustomerPhoneNumber  CHAR(12) NULL

);



create table Inventaire(
	InventoryID  TINYINT NOT NULL primary key auto_increment,
	InventoryName  VARCHAR(50) NOT null,
	InventoryDescription  VARCHAR(255)  NULL
);
insert into Client (CustomerFirstName,CustomerLastName,CustomerAddress,CustomerCity,CustomerPostCode,CustomerPhoneNumber)
values ("mohammed ali","boutaine","hay nasser ","sale","1100","0650505050"),
("med","bout","hay nasser ","sale","1100","0650505050"),
("apah ali","plala","hay nasser ","sale","1100","0650505050");


create table Employe(
	EmployeeID  TINYINT NOT NULL primary key auto_increment,
	EmployeeFirstName  VARCHAR(50) NOT null,
	EmployeeLastName  VARCHAR(50) NOT null,
	EmployeeExtension  CHAR(4) NULL
);



 create Table Sale (
	SaleID  int primary key auto_increment ,
	CustomerID  INT NOT null ,
	InventoryID  TINYINT NOT null,
	EmployeeID  TINYINT NOT null,
	SaleDate  DATE NOT null,
	SaleQuantity  INT NOT null,
	SaleUnitPrice  DECIMAL(10, 2) NOT null,
	
	 FOREIGN KEY (CustomerID) REFERENCES  Client(CustomerID),
	 FOREIGN KEY (InventoryID) REFERENCES  Inventaire(InventoryID),
	 FOREIGN key (EmployeeID) REFERENCES  Employe(EmployeeID)

);


-- Partie 3 : Manipulation des 
-- 1
insert into Client (CustomerFirstName,CustomerLastName,CustomerAddress,CustomerCity,CustomerPostCode,CustomerPhoneNumber)
values ("mohammed ali","boutaine","hay nasser ","sale","1100","0650505050"),
("med","bout","hay nasser ","sale","1100","0650505050"),
("apah ali","plala","hay nasser ","sale","1100","0650505050");

insert into Employe (EmployeeFirstName, EmployeeLastName, EmployeeExtension)
values ("Anass", "Boutaib", "0654"),
("Athman", "Chakir", "2369"),
("Asma", "Bichara", "5698");


insert into Inventaire (InventoryName, InventoryDescription)
values ("Central-inv", "The main inventory"),
("Additional-inv", "This is the secondary inventory"),
("New-inv", "Newly created inventory");


insert into Sale (CustomerID, InventoryID, EmployeeID, SaleDate, SaleQuantity, SaleUnitPrice)
values (1, 1, 1, '2024-12-12', 3, 133),
(2, 1, 2, "2024-12-03", 4, 152),
(2, 2, 3, "2024-12-11", 1, 206),
(3, 3, 3, "2024-11-09", 2, 75),
(3, 2, 1, "2024-11-06", 2, 255);

-- partie 3-2

-- 1
select * from Client;

-- 2
select * , (SaleQuantity * SaleUnitPrice) as montants
 from Sale
order by montants desc;

-- 3

select * ,(Sale.SaleQuantity * Sale.SaleUnitPrice) as montants
from Employe
join Sale 
on Employe.EmployeeID = Sale.EmployeeID;

-------------------------------
-- Partie 4 : Modifications des Tables

-- 1
alter table Client 
add  CustomerEmail varchar(225);

-- 2 
alter table Client
modify COLUMN  CustomerEmail  varchar(225) unique;

-- 3 
delete from Client
where CustomerCity= "New York";

-------------------------------
-- Partie 5 : Requêtes Avancées
-- 1
select * from sale
where  CURDATE() - saleDate < 30;

-- 2
select * from Client
join Sale 
on Client.CustomerID = Sale.CustomerID and SaleQuantity> 5;

-- 3

select  Inventaire.InventoryName,
sum(Sale.SaleQuantity * Sale.SaleUnitPrice)
from Sale
join Inventaire
on  sale.InventoryID = Inventaire.InventoryID
GROUP BY Inventaire.InventoryName;


-- Partie 6 : Bonus
-- 1
select * from CustomerSalesView;

create view CustomerSalesView 
as 
select client.CustomerID,CustomerFirstName,CustomerLastName,SaleDate,InventoryName,SaleQuantity , (SaleQuantity * SaleUnitPrice) as TotalAmount from client 
join sale 
on sale.CustomerID = client.CustomerID
join Inventaire
on sale.InventoryID = Inventaire.InventoryID;

-- 2

delimiter //
CREATE PROCEDURE pr_getVentes(id int )

begin
	select * FROM sale where CustomerID= id;

end //














