USE [master]
GO
/****** Object:  Database [zcportal]    Script Date: 12/9/2024 10:55:36 AM ******/
CREATE DATABASE [zcportal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'zcportal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\zcportal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'zcportal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\zcportal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [zcportal] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [zcportal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [zcportal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [zcportal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [zcportal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [zcportal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [zcportal] SET ARITHABORT OFF 
GO
ALTER DATABASE [zcportal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [zcportal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [zcportal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [zcportal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [zcportal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [zcportal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [zcportal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [zcportal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [zcportal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [zcportal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [zcportal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [zcportal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [zcportal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [zcportal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [zcportal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [zcportal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [zcportal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [zcportal] SET RECOVERY FULL 
GO
ALTER DATABASE [zcportal] SET  MULTI_USER 
GO
ALTER DATABASE [zcportal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [zcportal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [zcportal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [zcportal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [zcportal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [zcportal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'zcportal', N'ON'
GO
ALTER DATABASE [zcportal] SET QUERY_STORE = ON
GO
ALTER DATABASE [zcportal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [zcportal]
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 12/9/2024 10:55:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Content] [nvarchar](max) NULL,
	[PostingDate] [datetime] NULL,
	[PhotoFileName] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 12/9/2024 10:55:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionTitle] [nvarchar](500) NULL,
	[Answer] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InternetQuestion]    Script Date: 12/9/2024 10:55:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternetQuestion](
	[QuestionSerialNumber] [int] IDENTITY(1,1) NOT NULL,
	[Instructions] [nvarchar](500) NULL,
	[DeviceType] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 12/9/2024 10:55:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[Password] [nvarchar](500) NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Announcement] ON 

INSERT [dbo].[Announcement] ([Id], [Title], [Content], [PostingDate], [PhotoFileName]) VALUES (1, N'Event1', N'What is Lorem Ipsum?
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', CAST(N'2024-12-19T00:00:00.000' AS DateTime), N'chaty.png')
INSERT [dbo].[Announcement] ([Id], [Title], [Content], [PostingDate], [PhotoFileName]) VALUES (2, N'HR Bazaar Event ', N'What is Lorem Ipsum?
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', CAST(N'2024-11-29T00:00:00.000' AS DateTime), N'zewail.PNG')
INSERT [dbo].[Announcement] ([Id], [Title], [Content], [PostingDate], [PhotoFileName]) VALUES (3, N'IT Announcement', N'What is Lorem Ipsum?
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', CAST(N'2024-12-04T00:00:00.000' AS DateTime), N'it_.PNG')
INSERT [dbo].[Announcement] ([Id], [Title], [Content], [PostingDate], [PhotoFileName]) VALUES (4, N'Announcement ', N'Event content should be here', CAST(N'2024-12-06T00:00:00.000' AS DateTime), N'zewail_logo.PNG')
SET IDENTITY_INSERT [dbo].[Announcement] OFF
GO
SET IDENTITY_INSERT [dbo].[FAQ] ON 

INSERT [dbo].[FAQ] ([Id], [QuestionTitle], [Answer]) VALUES (1, N'how to do something?', N'seek help from IT')
INSERT [dbo].[FAQ] ([Id], [QuestionTitle], [Answer]) VALUES (2, N'how to register a course?', N'seek help from registrar')
SET IDENTITY_INSERT [dbo].[FAQ] OFF
GO
SET IDENTITY_INSERT [dbo].[InternetQuestion] ON 

INSERT [dbo].[InternetQuestion] ([QuestionSerialNumber], [Instructions], [DeviceType]) VALUES (1, N'How to connect to the internet?', N'mac')
INSERT [dbo].[InternetQuestion] ([QuestionSerialNumber], [Instructions], [DeviceType]) VALUES (2, N'How to connect to the wifi?', N'windows')
INSERT [dbo].[InternetQuestion] ([QuestionSerialNumber], [Instructions], [DeviceType]) VALUES (3, N'How to connect to the internet?', N'android')
INSERT [dbo].[InternetQuestion] ([QuestionSerialNumber], [Instructions], [DeviceType]) VALUES (4, N'How to do..?', N'others')
SET IDENTITY_INSERT [dbo].[InternetQuestion] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [Name], [Email], [Password], [isAdmin]) VALUES (1, N'asmaa gamal', N'asma@zewailcity.edu.eg', N'hello world', 1)
INSERT [dbo].[Person] ([Id], [Name], [Email], [Password], [isAdmin]) VALUES (2, N'asmaa', N'asmaagamal.nagy@zewailcity.edu.eg', N'password', 0)
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
ALTER TABLE [dbo].[InternetQuestion]  WITH CHECK ADD  CONSTRAINT [chk_device] CHECK  (([DeviceType]='others' OR [DeviceType]='troubleshooting' OR [DeviceType]='iphone' OR [DeviceType]='android' OR [DeviceType]='mac' OR [DeviceType]='windows'))
GO
ALTER TABLE [dbo].[InternetQuestion] CHECK CONSTRAINT [chk_device]
GO
/****** Object:  StoredProcedure [dbo].[personlogin]    Script Date: 12/9/2024 10:55:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[personlogin] (@Email nvarchar(500), @Password nvarchar(500))
AS
BEGIN
		SELECT * from dbo.Person WHERE Email=@Email AND Password=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[registration]    Script Date: 12/9/2024 10:55:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registration] (@Name nvarchar(500) ,@Email nvarchar(500), @Password nvarchar(500), @isAdmin int)
AS
BEGIN
		INSERT INTO dbo.Person(Name, Email, Password, isAdmin) VALUES (@Name, @Email, @Password, @isAdmin)
END
GO
USE [master]
GO
ALTER DATABASE [zcportal] SET  READ_WRITE 
GO
