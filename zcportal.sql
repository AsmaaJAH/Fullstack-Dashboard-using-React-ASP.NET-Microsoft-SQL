create table dbo.InternetQuestion(
QuestionSerialNumber int identity(1,1),
Instructions nvarchar(500), 
DeviceType nvarchar(500)
CONSTRAINT chk_device CHECK (DeviceType IN ('windows', 'mac', 'android','iphone','troubleshooting', 'Others'))
)
/*
ALTER TABLE dbo.InternetQuestion
ADD DeviceType nvarchar(500)
CONSTRAINT chk_device CHECK (DeviceType IN ('windows', 'mac', 'android','iphone'));
*/

insert into dbo.InternetQuestion values ('How to do connect to the internet??')

INSERT INTO dbo.InternetQuestion (Instructions, DeviceType )
VALUES ('How to do connect to Wifi??', 'windows');

SET IDENTITY_INSERT dbo.InternetQuestion OFF;

INSERT INTO dbo.InternetQuestion (QuestionSerialNumber,Instructions ,DeviceType )
VALUES (1, 'How to connect to the internet?' , 'mac');

INSERT INTO dbo.InternetQuestion (QuestionSerialNumber,Instructions, DeviceType )
VALUES (2, 'How to connect to the wifi?' , 'windows');


INSERT INTO dbo.InternetQuestion (QuestionSerialNumber,Instructions ,DeviceType )
VALUES (3, 'How to connect to the internet?' , 'android');

INSERT INTO dbo.InternetQuestion (QuestionSerialNumber,Instructions, DeviceType )
VALUES (4, 'How to connect to the wifi?' , 'iphone');
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

