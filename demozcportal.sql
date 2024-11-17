create table dbo.Department(
DepartmentId int identity(1,1),
DepartmentName nvarchar(500), 
)

insert into dbo.Department values ('IT')
insert into dbo.Department values ('Support')

select * from dbo.Department


create table dbo.Employee(
EmployeeId int identity(1,1),
EmployeeName nvarchar(500), 
Department nvarchar(500),
DateOfJoining datetime,
photoFileName nvarchar(500)
)

insert into dbo.Employee values ('Bob', 'IT', GETDATE(), 'anonymous.png')


select * from dbo.Employee