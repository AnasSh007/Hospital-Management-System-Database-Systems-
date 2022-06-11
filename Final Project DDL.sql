----Team_12 Capgemini_Company
--Data Defination Language DDL
create database [Team_12 Capgemini_Company]
use [Team_12 Capgemini_Company]
go

begin transaction
create table Employee(
EmployeeID nvarchar(10) not null primary key check(EmployeeID like ('E[A-Z][A-Z]-[0-9][0-9][0-9]')),
Name varchar(100) not null,
[Address] nvarchar(150) not null,
Birth_Date date not null,
Salary money not null,
Phone_No nvarchar(15) not null check(Phone_No like ('03[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
)

create table Project(
ProjectID int identity(1,1) primary key not null,
Project_Name nvarchar(50) not null,
Starting_Date date not null
)

create table Pro_Emp(
Pro_Emp_ID int identity(1,1) primary key not null,
ProjectID int foreign key references Project(ProjectID),
EmployeeID nvarchar(10) foreign key references Employee(EmployeeID)
)

create table Project_Manager(
Manager_ID int identity(100,1) primary key not null,
Name nvarchar(100) not null,
Gender varchar(2) check(Gender in ('M', 'F')) not null,
[Address] nvarchar(150) not null,
Phone_No nvarchar(15) not null check(Phone_No like ('03[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
)

create table Resources(
ResourceID int identity(1,1) primary key not null,
Resource_Type nvarchar(10) not null check(Resource_Type in ('Software', 'SOFTWARE', 'software', 'Hardware', 'HARDWARE', 'hardware')),
Price money default 10000,
Brand nvarchar(30)
)

create table Pro_Res(
Pro_Res_ID int identity(1,1) primary key not null,
ProjectID int foreign key references Project(ProjectID) not null,
ResourceID int foreign key references Resources(ResourceID) not null,
Date_Of_Use date default getdate() not null
)

create table IT_Department(
IT_Dept_ID int primary key not null,
Director varchar(100) not null,
Director_Contact_No nvarchar(15) not null check(Director_Contact_No like ('03[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
Department_Mail nvarchar(30) not null check (Department_Mail like ('__%@__%.__%')),
Budget money default 1000000
)

create table Client(
ClientID nvarchar(10) not null primary key check(ClientID like ('C[A-Z][A-Z]-[0-9][0-9][0-9]')),
Name varchar(100) not null,
Gender varchar(2) check(Gender in ('M', 'F')) not null,
[Address] nvarchar(150) not null,
Phone_No nvarchar(15) not null check(Phone_No like ('03[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
)

create table [Contract](
ContractID int identity(1,1) primary key not null, 
ProjectID int foreign key references Project(ProjectID) not null,
ClientID nvarchar(10) foreign key references Client(ClientID) not null,
Contact_Date date default getdate()
)
