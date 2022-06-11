---- Team_12 Capgemini_Company

create database [Team_12 Capgemini_Company]
use [Team_12 Capgemini_Company]
go


-- Data Defination Language (DDL)

create table Employee(
EmployeeID		nvarchar(10) not null primary key check(EmployeeID like ('E[0-9][0-9]-[0-9][0-9][0-9]')),
[Name]			varchar(100) not null,
[Address]		nvarchar(150) not null,
Birth_Date		date not null,
Salary			money not null,
Phone_No		nvarchar(15) not null unique check(Phone_No like ('03[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

)

create table Project(
ProjectID		int identity(1,1) primary key not null,
Project_Name	nvarchar(50) not null unique,
Starting_Date	date not null

)

create table Pro_Emp(
Pro_Emp_ID		int identity(1,1) primary key not null,
ProjectID		int foreign key references Project(ProjectID),
EmployeeID		nvarchar(10) foreign key references Employee(EmployeeID)

)


create table Project_Manager(
Manager_ID		int identity(100,1) primary key not null,
[Name]			nvarchar(100) not null,
Gender			varchar(6) check(Gender in ('M', 'F', 'm', 'f', 'male', 'female', 'MALE', 'FEMALE', 'Male', 'Female')) not null,
[Address]		nvarchar(150) not null,
Phone_No		nvarchar(15) not null unique check(Phone_No like ('03[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

)

create table Pro_Man(
Pro_Man_ID		int identity(1,1) primary key not null,
ProjectID		int foreign key references Project(ProjectID),
ManagerID		int foreign key references Project_Manager(Manager_ID)

)

create table Resources(
ResourceID		int identity(1,1) primary key not null,
Resource_Type	nvarchar(10) not null check(Resource_Type in ('Software', 'SOFTWARE', 'software', 'Hardware', 'HARDWARE', 'hardware')),
Price			money default 10000,
Brand			nvarchar(30)

)

create table Pro_Res(
Pro_Res_ID		int identity(1,1) primary key not null,
ProjectID		int foreign key references Project(ProjectID) not null,
ResourceID		int foreign key references Resources(ResourceID) not null,
Date_Of_Use		date default getdate() not null

)

create table IT_Department(
IT_Dept_ID				int primary key not null,
Director				varchar(100) not null,
Director_Contact_No		nvarchar(15) not null unique check(Director_Contact_No like ('03[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
Department_Mail			nvarchar(30) not null check (Department_Mail like ('__%@__%.__%')),
Budget					money default 1000000

)

create table Pro_Dept(
Pro_Dept_ID		int identity(1,1) primary key not null,
ProjectID		int foreign key references Project(ProjectID) not null,
IT_Dept_ID		int foreign key references IT_Department(IT_Dept_ID) not null

)

create table Client(
ClientID		nvarchar(10) not null primary key check(ClientID like ('C[0-9][0-9]-[0-9][0-9][0-9]')),
[Name]			varchar(100) not null,
Gender			varchar(2) check(Gender in ('M', 'F')) not null,
[Address]		nvarchar(150) not null,
Phone_No		nvarchar(15) not null unique check(Phone_No like ('03[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))

)

create table [Contract](
ContractID		int identity(1,1) primary key not null, 
ProjectID		int foreign key references Project(ProjectID) not null,
ClientID		nvarchar(10) foreign key references Client(ClientID) not null,
Contract_Date	date default getdate()

)


-- Data Manipulation Language (DML)

insert into Employee(EmployeeID, [Name], [Address], Birth_Date, Salary, Phone_No)
values	('E20-001',	'Bareerah Batool',	'Lahore',		'12-02-2000',	70000,	'0300-4872611'),
		('E20-002',	'Muhammad Anas',	'Muridke',		'07-25-2000',	70000,	'0309-4009084'),
		('E20-003',	'Ahmed Naeem',		'Sheikhupura',	'02-16-2001',	70000,	'0308-0633280'),
		('E20-005',	'Rasikh Ali',		'Lahore',		'05-05-2001',	70000,	'0312-1472153'),
		('E20-004',	'Mudassar Afzal',	'Raiwind',		'10-19-1999',	70000,	'0313-4765323'),
		('E20-006',	'Muneeb Saleem',	'Multan',		'04-23-1998',	70000,	'0320-4582051')


insert into Project(Project_Name, Starting_Date)
values	('E-Commerece Website',		'09-14-2020'),
		('Digital Application',		'10-25-2020'),
		('Project Management Tool',	'10-30-2020'),
		('Stress Test',				'11-12-2020'),
		('Website Designing Tool',	'12-05-2020')


insert into Resources(Resource_Type, Price, Brand)
values	('Software',	 5000,	'Microsoft'),
		('Hardware',	47000,	'Nvidia'),
		('Hardware',	25000,	'Intel'),
		('Software',   115000,	'Unity Technologies'),
		('Hardware',	23000,	'AMD'),
		('Hardware',	 5000,	'Arduino Tech.')


insert into Client(ClientID, [Name], Gender, [Address], Phone_No)
values	('C20-001',		'Usman Bezaar',			'M',		'Lahore',		'0300-0000001'),
		('C20-002',		'Kanwal Aftab',			'F',		'Sialkot',		'0300-0000002'),
		('C20-003',		'Attaullah Esakhelvi',	'M',		'Mianwali',		'0300-0000003'),
		('C20-004',		'Yousuf Raza Gilani',	'M',		'Islamabad',	'0300-0000004'),
		('C20-005',		'Shafqat Mehmood',		'M',		'Lahore',		'0300-0000005'),
		('C20-006',		'Muneeba Mazari',		'F',		'Islamabad',	'0300-0000006')


insert into Project_Manager([Name], Gender, [Address], Phone_No)
values	('Ali Zain',		'Male',		'Lahore',	'0301-0000001'),
		('Hassan Ali',		'Male',		'Lahore',	'0301-0000002'),
		('Alizey Khan',		'Female',	'Peshawar',	'0301-0000003'),
		('Umer Sheikh',		'Male',		'Multan',	'0301-0000004'),
		('Yusaib Ali',		'Male',		'Karachi',	'0301-0000005'),
		('Amir Khan',		'Male',		'Lahore',	'0301-0000006'),
		('Rumaisa Iqbal',	'Female',	'Karachi',	'0301-0000007')


insert into IT_Department(IT_Dept_ID, Director, Director_Contact_No, Department_Mail)
values	( 46,	'Tabish Siraaj',	'0300-1111111',		'Ta.Bish@gmail.com')


insert into [Contract](ProjectID, ClientID, Contract_Date)
values  ( 1, 'C20-001', '10-01-2020'),
		( 3, 'C20-002', '10-23-2020'),
		( 2, 'C20-001', '10-04-2020'),
		( 1, 'C20-002', '10-29-2020'),
		( 3, 'C20-003', '11-14-2020'),
		( 4, 'C20-005', '11-30-2020'),
		( 1, 'C20-004', '12-01-2020'),
		( 4, 'C20-006', '12-04-2020')


insert into Pro_Emp(ProjectID, EmployeeID)
values	( 1, 'E20-001'),
		( 2, 'E20-001'),
		( 1, 'E20-002'),
		( 3, 'E20-004'),
		( 4, 'E20-005'),
		( 1, 'E20-002'),
		( 3, 'E20-004')


insert into Pro_Res(ProjectID, ResourceID, Date_Of_Use)
values	( 2, 2, '10-05-2020'),
		( 3, 6, '10-25-2020'),
		( 2, 3, '10-09-2020'),
		( 4, 5, '12-01-2020'),
		( 2, 5, '11-14-2020'),
		( 4, 2, '12-05-2020')


insert into Pro_Dept(ProjectID, IT_Dept_ID)
values	( 1, 46),
		( 2, 46),
		( 3, 46),
		( 4, 46),
		( 5, 46)


insert into Pro_Man(ProjectID, ManagerID)
values  ( 1, 101),
		( 2, 106),
		( 3, 100),
		( 4, 102),
		( 5, 103)


-- Data Query Language (DQL) / Data Retrieval Language (DRL)

--						 1)	Show record of those employees, who have worked/are working on "N" number of Projects 
--							(shows record of all number of project if entered null)

/*

create function Specific_Projects(@num int)
returns table
as
return(	select E.EmployeeID, E.[Name] as [Employee Full Name], E.Phone_No, E.Salary, count(PE.ProjectID) as [Total Projects] from Employee E
		join Pro_Emp PE
		on E.EmployeeID = PE.EmployeeID
		group by E.EmployeeID, E.[Name], E.Phone_No, E.Salary
		having count(PE.ProjectID) = isnull(@num,count(PE.ProjectID)))

*/

select * from dbo.Specific_Projects(null)


--						 2)	Increment in salary: "given amount" per each number of projects 

/*
create function Increment_Money(@money money)
returns table
as
return( select E.EmployeeID, E.[Name] as [Employee Full Name], E.Phone_No, count(PE.ProjectID) as [Total Projects], E.Salary as [Original Salary],  
		case
		when count(PE.ProjectID) > 1
		then E.Salary + (count(PE.ProjectID)*@money)

		when count(PE.ProjectID) = 1
		then E.Salary + @money

		else E.Salary
		end as [Incremented Salary]
	
		from Employee E

		join Pro_Emp PE
		on E.EmployeeID = PE.EmployeeID
		group by E.EmployeeID, E.[Name], E.Phone_No, E.Salary)

*/

select * from dbo.Increment_Money(5740)


--						 3)	Show Record of All those Employees, who aren't assigned any project

/*

create view Employee_Without_project as
select E.EmployeeID, E.[Name] as [Employee Full Name], E.Phone_No, E.Salary, count(PE.ProjectID) as [Total Projects] from Employee E
left join Pro_Emp PE
on E.EmployeeID = PE.EmployeeID
group by E.EmployeeID, E.[Name], E.Phone_No, E.Salary
having count(PE.ProjectID) < 1

*/

select * from dbo.Employee_Without_project
















/*

select * from Employee
select * from Project
select * from Resources
select * from Client
select * from Project_Manager
select * from IT_Department
select * from [Contract]
select * from Pro_Dept
select * from Pro_Emp
select * from Pro_Man
select * from Pro_Res

*/

