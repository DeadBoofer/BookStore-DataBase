create database Bookstore
on
(
name =	'Bookstore-data',
filename = 'd:\db\Bookstore-data.mdf',
size = 8 mb,
filegrowth = 50mb
)

log on 
(
name =	'Bookstore-log',
filename = 'd:\db\Bookstore-log.ldf',
size = 8 mb,
filegrowth = 50mb,
maxsize = 500mb
)
go 

use Bookstore


go
create table T_Author 
(
A_ID int constraint PK__Author_ID primary key identity(1001,1),
A_First_Name nvarchar(20) not null,
A_Last_Name nvarchar(30) not null,
A_Birth_Date date constraint DF__Birth_Date default getdate(),
A_Bio nvarchar(max)
)  

go
create table T_Publisher
(
P_ID int constraint PK__Publisher_ID primary key identity(1001,1),
P_Name nvarchar(30) not null constraint UN__Publisher_Name unique,
P_Address nvarchar(max),
P_Phone char(11) 
)


go
create table T_Books
(
B_ID int primary key,
B_Title nvarchar(20) not null,
B_Author_ID int constraint FK__Books_author_ID foreign key references T_Author(A_ID),
B_Publisher_ID int constraint FK__Books_Publisher_ID foreign key references T_Publisher(P_ID),
B_Year_Published int constraint DF__Books_Year_Published default year(getdate()),
B_Genre nvarchar(20),
B_Page_Count varchar(max)
)

go 
create table T_User 
(
U_ID int constraint PK__User_ID primary key identity(1000,1),
U_Name nvarchar(20),
U_Last_Neme nvarchar(30),
U_Membership_Date date constraint DF__User_Membership_Date default getdate()
)

go
create table Borrowing
(
BO_ID int constraint PK__Borrowing_ID primary key identity(4000,1),
BO_User_ID int constraint FK__Borrowing_User_ID foreign key references T_User(U_ID),
BO_Book_ID int constraint FK__Borrowing_Books_ID foreign key references T_Books(B_ID),
BO_Borrow_Date date constraint DF__Borrowing_Borrow_Date default getdate(),
BO_Return_Date date
)

