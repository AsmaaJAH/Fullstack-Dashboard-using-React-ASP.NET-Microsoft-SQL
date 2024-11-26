
/*=================================== inside app ====================================================*/
/*---------------------- Onboarding internet questions-----------------------------------------------*/

create table dbo.InternetQuestion(
QuestionSerialNumber int identity(1,1),
Instructions nvarchar(500), 
DeviceType nvarchar(500)
CONSTRAINT chk_device CHECK (DeviceType IN ('windows', 'mac', 'android','iphone','troubleshooting', 'others'))
)
/*
ALTER TABLE dbo.InternetQuestion
ADD DeviceType nvarchar(500)
CONSTRAINT chk_device CHECK (DeviceType IN ('windows', 'mac', 'android','iphone'));
*/

insert into dbo.InternetQuestion values ('How to do connect to the internet??')

INSERT INTO dbo.InternetQuestion (Instructions, DeviceType )
VALUES ('How to do ..??', 'troubleshooting');

SET IDENTITY_INSERT dbo.InternetQuestion OFF;

INSERT INTO dbo.InternetQuestion (QuestionSerialNumber,Instructions ,DeviceType )
VALUES (1, 'How to connect to the internet?' , 'mac');

INSERT INTO dbo.InternetQuestion (QuestionSerialNumber,Instructions, DeviceType )
VALUES (2, 'How to connect to the wifi?' , 'windows');


INSERT INTO dbo.InternetQuestion (QuestionSerialNumber,Instructions ,DeviceType )
VALUES (3, 'How to connect to the internet?' , 'android');

INSERT INTO dbo.InternetQuestion (QuestionSerialNumber,Instructions, DeviceType )
VALUES (4, 'How to do..?' , 'others');
select * from dbo.InternetQuestion

/*----------------------FAQ------------------------*/
create table dbo.FAQ(
Id int identity(1,1),
QuestionTitle nvarchar(500), 
Answer nvarchar(500),
/* PostingDate	 datetime,
PhotoFileName nvarchar(500),
UrlLink nvarchar(1000)*/

)

insert into dbo.FAQ values ('how to do something?', 'seek help from IT'/*, GETDATE(), 'anonymous.png'*/)
insert into dbo.FAQ values ('how to register a course?', 'seek help from registrar'/*, GETDATE(), 'anonymous.png'*/)



select * from dbo.FAQ

/*---------------------- Announcement ------------------------*/
create table dbo.Announcement(
Id int identity(1,1),
Title nvarchar(500),
Content nvarchar(500),
PostingDate	 datetime,
PhotoFileName nvarchar(500),
)

ALTER TABLE Announcement ALTER COLUMN Content NVARCHAR(MAX);
ALTER TABLE Announcement ADD SubTitle NVARCHAR(500);
ALTER TABLE Announcement Drop COLUMN  SubTitle;




insert into dbo.Announcement values ('Event1', 'Event content should be here..!', GETDATE(), 'anonymous.png')
insert into dbo.Announcement values ('Event2', 'Event content should be here', GETDATE(), 'anonymous.png')
insert into dbo.Announcement values ('Event3', 'Event content should be here..!', GETDATE(), 'anonymous.png')
insert into dbo.Announcement values ('Event4', 'Event content should be here', GETDATE(), 'anonymous.png')


select * from dbo.Announcement

/*======================================================================================================================================*/
/*------------------------------------------------------- Person Authentication --------------------------------------------------------*/
create table dbo.Person(
Id int identity(1,1) primary key,
Name nvarchar(500),
Email nvarchar(500),
Password nvarchar(500),
isAdmin int,
)
insert into dbo.Person values ('asmaa','asmaagamal.nagy@gmail.com','password', 1)
select * from dbo.Person

CREATE PROCEDURE personlogin (@Email nvarchar(500), @Password nvarchar(500))
AS
BEGIN
		SELECT * from dbo.Person WHERE Email=@Email AND Password=@Password
END

/*
CREATE PROCEDURE registration (@Name nvarchar(500) ,@Email nvarchar(500), @Password nvarchar(500), @isAdmin int)
AS
BEGIN
		INSERT INTO dbo.Person(Name, Email, Password, isAdmin) VALUES (@Name, @Email, @Password, @isAdmin)
END
*/


/* delete from dbo.Person where Id=3 */


/* UPDATE dbo.Person
SET Name = 'asmaa gamal', Email = 'asma@gmail.com', Password='hello world'
WHERE Id=3; */