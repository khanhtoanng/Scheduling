USE [master]
GO
/****** Object:  Database [Scheduling]    Script Date: 10/16/2020 10:12:47 AM ******/
CREATE DATABASE [Scheduling]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Scheduling', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Scheduling.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Scheduling_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Scheduling_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Scheduling] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Scheduling].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Scheduling] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Scheduling] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Scheduling] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Scheduling] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Scheduling] SET ARITHABORT OFF 
GO
ALTER DATABASE [Scheduling] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Scheduling] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Scheduling] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Scheduling] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Scheduling] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Scheduling] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Scheduling] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Scheduling] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Scheduling] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Scheduling] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Scheduling] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Scheduling] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Scheduling] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Scheduling] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Scheduling] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Scheduling] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Scheduling] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Scheduling] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Scheduling] SET  MULTI_USER 
GO
ALTER DATABASE [Scheduling] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Scheduling] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Scheduling] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Scheduling] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Scheduling] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Scheduling]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[SubjectID] [int] NULL,
	[SemesterID] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreatePerson] [nvarchar](255) NULL,
	[UpdateTime] [datetime] NULL,
	[UpdatePerson] [nvarchar](255) NULL,
	[NumberOfStudents] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[CreateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NULL,
	[Fullname] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[UpdatePerson] [nvarchar](255) NULL,
	[DepartmentID] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[RoleID] [int] NULL,
	[Photo] [varchar](max) NULL,
	[DelFlg] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeDevice]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDevice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[DeviceId] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeRelated]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeRelated](
	[EmployeeRelatedID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[EmployeeFullname] [nvarchar](255) NULL,
	[ExamSessionID] [int] NULL,
	[Status] [varchar](50) NULL,
	[Type] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreatePerson] [nvarchar](255) NULL,
	[UpdateTime] [datetime] NULL,
	[UpdatePerson] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeRelatedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ExamBegin] [datetime] NULL,
	[ExamEnd] [datetime] NULL,
	[Type] [nvarchar](255) NULL,
	[CreateTime] [datetime] NULL,
	[CreatePerson] [nvarchar](255) NULL,
	[UpdateTime] [datetime] NULL,
	[UpdatePerson] [nvarchar](255) NULL,
	[SemesterID] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamCourse]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamCourse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[ExamID] [int] NULL,
	[NumberOfStudent] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreatePerson] [nvarchar](255) NULL,
	[UpdateTime] [datetime] NULL,
	[UpdatePerson] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamGroup]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ExamID] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreatePerson] [nvarchar](255) NULL,
	[UpdateTime] [datetime] NULL,
	[UpdatePerson] [nvarchar](255) NULL,
	[TimeBegin] [time](7) NULL,
	[TimeEnd] [time](7) NULL,
	[ExamDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamSession]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamSession](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NULL,
	[RoomName] [nvarchar](255) NULL,
	[ExamGroupID] [int] NULL,
	[ExamGroupName] [nvarchar](255) NULL,
	[CreateTime] [datetime] NULL,
	[CreatePerson] [nvarchar](255) NULL,
	[UpdateTime] [datetime] NULL,
	[UpdatePerson] [nvarchar](255) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Major]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Register]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[ExamGroupID] [int] NULL,
	[Value] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[UpdateAdminId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] NOT NULL,
	[Role] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[RoomType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semester]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [nvarchar](255) NULL,
	[SemesterBegin] [datetime] NULL,
	[SemesterEnd] [datetime] NULL,
	[Description] [nvarchar](255) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[UpdatePerson] [nvarchar](255) NULL,
	[EmpID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[NumberOfStudent] [int] NULL,
	[CourseID] [int] NULL,
	[ExamSessionID] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreatePerson] [nvarchar](255) NULL,
	[UpdateTime] [datetime] NULL,
	[UpdatePerson] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[MajorID] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreatePerson] [nvarchar](255) NULL,
	[UpdateTime] [datetime] NULL,
	[UpdatePerson] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkingTimeRequiredDepartment]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingTimeRequiredDepartment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NULL,
	[ExamID] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreatePerson] [nvarchar](255) NULL,
	[UpdateTime] [datetime] NULL,
	[UpdatePerson] [nvarchar](255) NULL,
	[MaxHour] [int] NULL,
	[MinHour] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkingTimeRequiredEmployee]    Script Date: 10/16/2020 10:12:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingTimeRequiredEmployee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[ExamID] [int] NULL,
	[CreateTime] [datetime] NULL,
	[CreatePerson] [nvarchar](255) NULL,
	[UpdateTime] [datetime] NULL,
	[UpdatePerson] [nvarchar](255) NULL,
	[MinHour] [int] NULL,
	[MaxHour] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (1, N'SWD_1', N'Slot 1', 1, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (2, N'SWD_2', N'Slot 2', 1, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (3, N'SWD_3', N'Slot 3', 1, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (4, N'SWD_4', N'Slot 4', 1, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (5, N'HCI_1', N'Slot 1', 2, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (6, N'HCI_2', N'Slot 2', 2, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (7, N'HCI_3', N'Slot 3', 2, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (8, N'JP201_1', N'Slot 1', 6, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (9, N'JP201_2', N'Slot 2', 6, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (10, N'JP201_3', N'Slot 3', 6, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (11, N'HCM_1', N'Slot 1', 3, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (12, N'HCM_2', N'Slot 2', 3, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (13, N'ETC_1', N'Slot 1', 4, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (14, N'ETC_2', N'Slot 2', 4, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (15, N'MAS_1', N'Slot 1', 5, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (16, N'MAS_2', N'Slot 2', 5, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (17, N'MAS_3', N'Slot 3', 5, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (18, N'MAS_4', N'Slot 4', 5, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (19, N'MAS_5', N'Slot 5', 5, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (20, N'MAS_6', N'Slot 6', 5, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (21, N'SWD_5', N'Slot 5', 1, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (22, N'HCI_4', N'Slot 4', 2, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (23, N'HCM_3', N'Slot 3', 3, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
INSERT [dbo].[Course] ([ID], [Name], [Description], [SubjectID], [SemesterID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [NumberOfStudents]) VALUES (24, N'HCM_4', N'Slot 4', 3, 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoang', NULL, NULL, 30)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [DepartmentName], [Description], [CreateTime]) VALUES (1, N'Department 1', N'ABC', CAST(N'2020-10-01 22:49:18.960' AS DateTime))
INSERT [dbo].[Department] ([ID], [DepartmentName], [Description], [CreateTime]) VALUES (2, N'Department 2', N'QWE', CAST(N'2020-10-01 22:49:18.960' AS DateTime))
INSERT [dbo].[Department] ([ID], [DepartmentName], [Description], [CreateTime]) VALUES (3, N'Department 3', N'ASD', CAST(N'2020-10-01 22:49:18.960' AS DateTime))
INSERT [dbo].[Department] ([ID], [DepartmentName], [Description], [CreateTime]) VALUES (4, N'Department 4', N'ZZZ', CAST(N'2020-10-01 22:49:18.960' AS DateTime))
INSERT [dbo].[Department] ([ID], [DepartmentName], [Description], [CreateTime]) VALUES (5, N'Department 5', N'AAA', CAST(N'2020-10-01 22:49:18.960' AS DateTime))
INSERT [dbo].[Department] ([ID], [DepartmentName], [Description], [CreateTime]) VALUES (6, N'Department 6', N'HHH', CAST(N'2020-10-01 22:49:18.960' AS DateTime))
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (1, N'namth', N'Tran Hoang Nam', N'011111111', N'namthse130257@fpt.edu.vn', CAST(N'2020-10-01 22:49:18.960' AS DateTime), NULL, NULL, 2, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (2, N'khanhtoanng', N'Nguyen Khanh Toan ', N'011111111', N'toannkse130120@fpt.edu.vn', CAST(N'2020-10-01 22:49:18.960' AS DateTime), NULL, NULL, 1, N'ABC', 1, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (5, N'thuannt', N'Thuan Nguyen', N'011111111', N'namthse130257@fpt.edu.vn', CAST(N'2020-10-01 22:49:18.960' AS DateTime), NULL, NULL, 3, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (6, N'quanghm', N'Ho Minh Quang', N'011111111', N'namthse130257@fpt.edu.vn', CAST(N'2020-10-01 22:49:18.960' AS DateTime), NULL, NULL, 4, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (7, N'baminhng', N'Ba Minh', N'011111111', N'namthse130257@fpt.edu.vn', CAST(N'2020-10-01 22:49:18.960' AS DateTime), NULL, NULL, 5, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (8, N'thieunm', N'Minh Thieu', N'011111111', N'namthse130257@fpt.edu.vn', CAST(N'2020-10-01 22:49:18.960' AS DateTime), NULL, NULL, 6, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (9, N'test1 ', N'test1 ', N'011111111', N'namthse130257@fpt.edu.vn', CAST(N'2020-10-01 22:49:18.960' AS DateTime), NULL, NULL, 2, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (10, N'test2', N'test2', N'011111111', N'namthse130257@fpt.edu.vn', CAST(N'2020-10-01 22:49:18.960' AS DateTime), NULL, NULL, 2, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (11, N'test3', N'test3', N'011111111', N'namthse130257@fpt.edu.vn', CAST(N'2020-10-01 22:49:18.960' AS DateTime), NULL, NULL, 2, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (12, N'test4', N'test4', N'011111111', N'namthse130257@fpt.edu.vn', CAST(N'2020-10-01 22:49:18.960' AS DateTime), NULL, NULL, 2, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (13, N'test5', N'test5', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:33:04.860' AS DateTime), NULL, NULL, 3, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (14, N'test6', N'test6', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:33:04.860' AS DateTime), NULL, NULL, 3, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (15, N'test7', N'test7', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:33:04.860' AS DateTime), NULL, NULL, 3, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (16, N'test8', N'test8', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:33:04.860' AS DateTime), NULL, NULL, 3, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (17, N'test9', N'test9', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:33:36.280' AS DateTime), NULL, NULL, 4, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (18, N'test11', N'test11', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:33:36.280' AS DateTime), NULL, NULL, 4, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (19, N'test12', N'test12', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:33:36.280' AS DateTime), NULL, NULL, 4, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (20, N'test13', N'test13', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:33:36.280' AS DateTime), NULL, NULL, 4, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (21, N'test14', N'test14', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:35:44.080' AS DateTime), NULL, NULL, 5, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (22, N'test15', N'test15', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:35:44.080' AS DateTime), NULL, NULL, 5, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (23, N'test16', N'test16', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:35:44.080' AS DateTime), NULL, NULL, 5, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (24, N'test17', N'test17', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:35:44.080' AS DateTime), NULL, NULL, 5, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (25, N'test18', N'test18', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:41:18.340' AS DateTime), NULL, NULL, 6, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (26, N'test19', N'test19', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:41:18.340' AS DateTime), NULL, NULL, 6, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (27, N'test20', N'test20', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:41:18.340' AS DateTime), NULL, NULL, 6, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (28, N'test21', N'test21', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:41:18.340' AS DateTime), NULL, NULL, 6, N'ABC', 2, NULL, 0)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID], [Photo], [DelFlg]) VALUES (29, N'test22', N'test22', N'011111111', N'test@fpt.edu.vn', CAST(N'2020-10-16 09:41:47.650' AS DateTime), NULL, NULL, 6, N'ABC', 2, NULL, 0)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([ID], [Name], [ExamBegin], [ExamEnd], [Type], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [SemesterID], [Status]) VALUES (1, N'string', CAST(N'2020-10-03 04:45:18.913' AS DateTime), CAST(N'2020-10-03 04:45:18.913' AS DateTime), N'string', CAST(N'2020-10-03 04:45:18.913' AS DateTime), N'string', CAST(N'2020-10-03 04:45:18.913' AS DateTime), N'string', NULL, 1)
INSERT [dbo].[Exam] ([ID], [Name], [ExamBegin], [ExamEnd], [Type], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [SemesterID], [Status]) VALUES (2, N'Fall_2020', CAST(N'2020-10-03 04:45:18.913' AS DateTime), CAST(N'2020-10-03 04:45:18.913' AS DateTime), NULL, CAST(N'2020-10-03 04:45:18.913' AS DateTime), NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Exam] OFF
SET IDENTITY_INSERT [dbo].[ExamGroup] ON 

INSERT [dbo].[ExamGroup] ([ID], [Name], [ExamID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [TimeBegin], [TimeEnd], [ExamDate]) VALUES (1, N'Slot 1', 1, CAST(N'2020-10-03 04:46:55.250' AS DateTime), NULL, NULL, NULL, CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), CAST(N'2020-10-03' AS Date))
INSERT [dbo].[ExamGroup] ([ID], [Name], [ExamID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [TimeBegin], [TimeEnd], [ExamDate]) VALUES (2, N'Slot 2', 1, CAST(N'2020-10-03 04:46:55.250' AS DateTime), N'string', CAST(N'2020-10-03 04:46:55.250' AS DateTime), N'string', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'2020-10-03' AS Date))
INSERT [dbo].[ExamGroup] ([ID], [Name], [ExamID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [TimeBegin], [TimeEnd], [ExamDate]) VALUES (3, N'Slot 3 ', 1, CAST(N'2020-10-03 04:46:55.250' AS DateTime), NULL, NULL, NULL, CAST(N'10:30:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'2020-10-03' AS Date))
INSERT [dbo].[ExamGroup] ([ID], [Name], [ExamID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [TimeBegin], [TimeEnd], [ExamDate]) VALUES (4, N'Slot 4', 1, CAST(N'2020-10-03 04:46:55.250' AS DateTime), NULL, NULL, NULL, CAST(N'12:30:00' AS Time), CAST(N'13:30:00' AS Time), CAST(N'2020-10-03' AS Date))
INSERT [dbo].[ExamGroup] ([ID], [Name], [ExamID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [TimeBegin], [TimeEnd], [ExamDate]) VALUES (5, N'Slot 1', 1, CAST(N'2020-10-03 04:46:55.250' AS DateTime), NULL, NULL, NULL, CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), CAST(N'2020-10-04' AS Date))
INSERT [dbo].[ExamGroup] ([ID], [Name], [ExamID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [TimeBegin], [TimeEnd], [ExamDate]) VALUES (6, N'Slot 2', 1, CAST(N'2020-10-03 04:46:55.250' AS DateTime), NULL, NULL, NULL, CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'2020-10-04' AS Date))
INSERT [dbo].[ExamGroup] ([ID], [Name], [ExamID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [TimeBegin], [TimeEnd], [ExamDate]) VALUES (7, N'Slot 3 ', 1, CAST(N'2020-10-03 04:46:55.250' AS DateTime), NULL, NULL, NULL, CAST(N'10:30:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'2020-10-04' AS Date))
INSERT [dbo].[ExamGroup] ([ID], [Name], [ExamID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson], [TimeBegin], [TimeEnd], [ExamDate]) VALUES (8, N'Slot 4', 1, CAST(N'2020-10-03 04:46:55.250' AS DateTime), NULL, NULL, NULL, CAST(N'12:30:00' AS Time), CAST(N'13:30:00' AS Time), CAST(N'2020-10-04' AS Date))
SET IDENTITY_INSERT [dbo].[ExamGroup] OFF
SET IDENTITY_INSERT [dbo].[Major] ON 

INSERT [dbo].[Major] ([ID], [Name], [Description]) VALUES (1, NULL, N'update')
INSERT [dbo].[Major] ([ID], [Name], [Description]) VALUES (2, N'JS', N'Japanese Software Engineering')
INSERT [dbo].[Major] ([ID], [Name], [Description]) VALUES (3, N'IOT', N'Internet Of Thing')
INSERT [dbo].[Major] ([ID], [Name], [Description]) VALUES (4, N'ETC', N'Ethic')
INSERT [dbo].[Major] ([ID], [Name], [Description]) VALUES (5, N'HCM', N'HoChiMinh')
SET IDENTITY_INSERT [dbo].[Major] OFF
INSERT [dbo].[Role] ([ID], [Role]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([ID], [Role]) VALUES (2, N'employee')
INSERT [dbo].[Role] ([ID], [Role]) VALUES (3, N'supervior')
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (1, N'A-100', N'AAA', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (2, N'A-101', N'QQQ', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (3, N'A-102', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (4, N'A-103', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (5, N'A-111', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (6, N'A-104', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (7, N'A-105', N'ABC', 1)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (8, N'A-106', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (9, N'A-107', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (10, N'A-107', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (11, N'A-108', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (12, N'A-109', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (13, N'A-110', N'ABC', 1)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (14, N'A-110', NULL, 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (15, N'A-111', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (16, N'A-111', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (17, N'A-112', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (18, N'A-113', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (19, N'A-114', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (20, N'A-115', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (21, N'A-116', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (22, N'A-117', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (23, N'A-118', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (24, N'A-119', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (25, N'A-120', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (26, N'A-121', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (27, N'A-122', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (28, N'A-123', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (29, N'A-124', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (30, N'A-125', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (31, N'A-126', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (32, N'A-127', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (33, N'A-128', N'ABC', 0)
INSERT [dbo].[Room] ([ID], [RoomName], [Description], [RoomType]) VALUES (34, N'A-129', N'ABC', 0)
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([ID], [SemesterName], [SemesterBegin], [SemesterEnd], [Description], [CreateTime], [UpdateTime], [UpdatePerson], [EmpID]) VALUES (1, N'Semester 1', CAST(N'2020-05-01 22:49:18.960' AS DateTime), CAST(N'2020-10-01 22:49:18.960' AS DateTime), N'ABC', CAST(N'2020-05-01 22:49:18.960' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Semester] ([ID], [SemesterName], [SemesterBegin], [SemesterEnd], [Description], [CreateTime], [UpdateTime], [UpdatePerson], [EmpID]) VALUES (2, N'Semester 2', CAST(N'2020-07-01 22:49:18.960' AS DateTime), CAST(N'2020-10-01 22:49:18.960' AS DateTime), N'ABC', CAST(N'2020-07-01 22:49:18.960' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[Semester] ([ID], [SemesterName], [SemesterBegin], [SemesterEnd], [Description], [CreateTime], [UpdateTime], [UpdatePerson], [EmpID]) VALUES (3, N'Semester 3', CAST(N'2020-02-01 22:49:18.960' AS DateTime), CAST(N'2020-05-01 22:49:18.960' AS DateTime), N'ABC', CAST(N'2020-02-01 22:49:18.960' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[Semester] ([ID], [SemesterName], [SemesterBegin], [SemesterEnd], [Description], [CreateTime], [UpdateTime], [UpdatePerson], [EmpID]) VALUES (4, N'UpdateAA', CAST(N'2020-10-02 09:55:30.847' AS DateTime), CAST(N'2020-10-02 09:55:30.847' AS DateTime), N'string', CAST(N'2020-10-02 09:55:30.847' AS DateTime), CAST(N'2020-10-02 09:55:30.847' AS DateTime), N'string', 2)
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([ID], [Name], [Description], [MajorID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson]) VALUES (1, N'SWD', N'Software Architectual', 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoanng', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [Name], [Description], [MajorID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson]) VALUES (2, N'HCI', N'Human Computer', 1, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoanng', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [Name], [Description], [MajorID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson]) VALUES (3, N'HCM', N'HoChiMinh', 5, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoanng', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [Name], [Description], [MajorID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson]) VALUES (4, N'ETC', N'Ethic', 4, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoanng', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [Name], [Description], [MajorID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson]) VALUES (5, N'MAS', N'Math', 3, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoanng', NULL, NULL)
INSERT [dbo].[Subject] ([ID], [Name], [Description], [MajorID], [CreateTime], [CreatePerson], [UpdateTime], [UpdatePerson]) VALUES (6, N'JP201', N'Japanese', 2, CAST(N'2020-10-02 18:36:25.460' AS DateTime), N'khanhtoanng', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Subject] OFF
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semester] ([ID])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[EmployeeDevice]  WITH CHECK ADD FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[EmployeeRelated]  WITH CHECK ADD FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[EmployeeRelated]  WITH CHECK ADD FOREIGN KEY([ExamSessionID])
REFERENCES [dbo].[ExamSession] ([ID])
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semester] ([ID])
GO
ALTER TABLE [dbo].[ExamCourse]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[ExamCourse]  WITH CHECK ADD FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[ExamGroup]  WITH CHECK ADD FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[ExamSession]  WITH CHECK ADD FOREIGN KEY([ExamGroupID])
REFERENCES [dbo].[ExamGroup] ([ID])
GO
ALTER TABLE [dbo].[ExamSession]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD FOREIGN KEY([ExamGroupID])
REFERENCES [dbo].[ExamGroup] ([ID])
GO
ALTER TABLE [dbo].[Semester]  WITH CHECK ADD FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD FOREIGN KEY([ExamSessionID])
REFERENCES [dbo].[ExamSession] ([ID])
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD FOREIGN KEY([MajorID])
REFERENCES [dbo].[Major] ([ID])
GO
ALTER TABLE [dbo].[WorkingTimeRequiredDepartment]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[WorkingTimeRequiredDepartment]  WITH CHECK ADD FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[WorkingTimeRequiredEmployee]  WITH CHECK ADD FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[WorkingTimeRequiredEmployee]  WITH CHECK ADD FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
GO
USE [master]
GO
ALTER DATABASE [Scheduling] SET  READ_WRITE 
GO
