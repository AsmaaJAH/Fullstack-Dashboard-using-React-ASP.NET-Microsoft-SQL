create table dbo.InternetQuestion(
QuestionSerialNumber int identity(1,1),
QuestionTitle nvarchar(500), 
)

insert into dbo.InternetQuestion values ('How to do connect to the internet??')
insert into dbo.InternetQuestion values ('How to do onboarding?')

select * from dbo.InternetQuestion


create table dbo.FAQ(
Id int identity(1,1),
QuestionTitle nvarchar(500), 
Answer nvarchar(500),
PostingDate	 datetime,
PhotoFileName nvarchar(500)
)

insert into dbo.FAQ values ('how to do something?', 'IT', GETDATE(), 'anonymous.png')
insert into dbo.FAQ values ('how to register a course?', 'IT', GETDATE(), 'anonymous.png')



select * from dbo.FAQ

