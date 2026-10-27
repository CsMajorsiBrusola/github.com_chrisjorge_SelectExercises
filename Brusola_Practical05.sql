Create database Inventory
Use Inventory

Create Table Items (
	ItemID varchar(1000),
	ItemName varchar(1000),
	Price decimal
)
drop table items

Insert into Items (ItemID, ItemName, Price)
Values 
	('001', 'Gatorade', 90.00),
	('002', 'Vitamilk', 35.00)

Select *
From Items

-- 1. Create a login
Create Login Yorhe with password = 'pw123';
-- 2. Create another User
GO
Create User AnotherUser for Login Yorhe
-- 3. Create a User-defined role
Go 
Create Role [udr_Yorhe]
Go 
Grant Select, Update on [Items]
To [udr_Yorhe]
Go
-- 4. Assign User-defined role
Go
Alter role udr_Yorhe ADD MEMBER AnotherUser
-- 5. Grant view, update, and delete data
Go
Grant Select, Update, Delete on [Items]
To AnotherUser
-- 6. Remove role that was previously assigned 
Go 
Alter role udr_Yorhe DROP MEMBER AnotherUser
-- 7. Change access 
Go
Revoke Delete on [Items] to AnotherUser
