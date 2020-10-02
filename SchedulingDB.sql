
/****** Object:  Database [Scheduling]    Script Date: 10/2/2020 5:13:08 PM ******/
CREATE DATABASE [Scheduling]
Go
Use Scheduling
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
/****** Object:  Table [dbo].[Course]    Script Date: 10/2/2020 5:13:08 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 10/2/2020 5:13:09 PM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 10/2/2020 5:13:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeDevice]    Script Date: 10/2/2020 5:13:09 PM ******/
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
/****** Object:  Table [dbo].[EmployeeRelated]    Script Date: 10/2/2020 5:13:09 PM ******/
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
/****** Object:  Table [dbo].[Exam]    Script Date: 10/2/2020 5:13:09 PM ******/
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
	[Status] [nvarchar](255) NULL,
	[CreateTime] [datetime] NULL,
	[CreatePerson] [nvarchar](255) NULL,
	[UpdateTime] [datetime] NULL,
	[UpdatePerson] [nvarchar](255) NULL,
	[SemesterID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamCourse]    Script Date: 10/2/2020 5:13:09 PM ******/
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
/****** Object:  Table [dbo].[ExamGroup]    Script Date: 10/2/2020 5:13:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ExamGroupBegin] [datetime] NULL,
	[ExamGroupEnd] [datetime] NULL,
	[ExamID] [int] NULL,
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
/****** Object:  Table [dbo].[ExamSession]    Script Date: 10/2/2020 5:13:09 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Major]    Script Date: 10/2/2020 5:13:09 PM ******/
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
/****** Object:  Table [dbo].[Register]    Script Date: 10/2/2020 5:13:09 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/2/2020 5:13:09 PM ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 10/2/2020 5:13:09 PM ******/
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
/****** Object:  Table [dbo].[Semester]    Script Date: 10/2/2020 5:13:09 PM ******/
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
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 10/2/2020 5:13:09 PM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 10/2/2020 5:13:09 PM ******/
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
/****** Object:  Table [dbo].[WorkingTimeRequiredDepartment]    Script Date: 10/2/2020 5:13:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingTimeRequiredDepartment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NULL,
	[ExamID] [int] NULL,
	[MinHour] [time](7) NULL,
	[MaxHour] [time](7) NULL,
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
/****** Object:  Table [dbo].[WorkingTimeRequiredEmployee]    Script Date: 10/2/2020 5:13:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingTimeRequiredEmployee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL,
	[ExamID] [int] NULL,
	[MinHour] [time](7) NULL,
	[MaxHour] [time](7) NULL,
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
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [DepartmentName], [Description], [CreateTime]) VALUES (1, N'Department 1', N'ABC', CAST(N'2020-10-01 22:49:18.960' AS DateTime))
INSERT [dbo].[Department] ([ID], [DepartmentName], [Description], [CreateTime]) VALUES (2, N'Department 2', N'QWE', CAST(N'2020-10-01 22:49:18.960' AS DateTime))
INSERT [dbo].[Department] ([ID], [DepartmentName], [Description], [CreateTime]) VALUES (3, N'Department 3', N'ASD', CAST(N'2020-10-01 22:49:18.960' AS DateTime))
INSERT [dbo].[Department] ([ID], [DepartmentName], [Description], [CreateTime]) VALUES (4, N'Department 4', N'ZZZ', CAST(N'2020-10-01 22:49:18.960' AS DateTime))
INSERT [dbo].[Department] ([ID], [DepartmentName], [Description], [CreateTime]) VALUES (5, N'Department 5', N'AAA', CAST(N'2020-10-01 22:49:18.960' AS DateTime))
INSERT [dbo].[Department] ([ID], [DepartmentName], [Description], [CreateTime]) VALUES (6, N'Department 6', N'HHH', CAST(N'2020-10-01 22:49:18.960' AS DateTime))
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID]) VALUES (1, N'namth', N'Tran Hoang Nam', N'011111111', N'namthse130257@fpt.edu.vn', CAST(N'2020-10-01 22:49:18.960' AS DateTime), NULL, NULL, 1, N'ABC', 2)
INSERT [dbo].[Employee] ([ID], [Username], [Fullname], [Phone], [Email], [CreateTime], [UpdateTime], [UpdatePerson], [DepartmentID], [Description], [RoleID]) VALUES (2, N'khanhtoanng', N'Nguyen Khanh Toan ', N'011111111', N'toannkse130120@fpt.edu.vn', CAST(N'2020-10-01 22:49:18.960' AS DateTime), NULL, NULL, 2, N'ABC', 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
INSERT [dbo].[Role] ([ID], [Role]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([ID], [Role]) VALUES (2, N'employee')
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([ID], [SemesterName], [SemesterBegin], [SemesterEnd], [Description], [CreateTime], [UpdateTime], [UpdatePerson], [EmpID]) VALUES (1, N'Semester 1', CAST(N'2020-05-01 22:49:18.960' AS DateTime), CAST(N'2020-10-01 22:49:18.960' AS DateTime), N'ABC', CAST(N'2020-05-01 22:49:18.960' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Semester] ([ID], [SemesterName], [SemesterBegin], [SemesterEnd], [Description], [CreateTime], [UpdateTime], [UpdatePerson], [EmpID]) VALUES (2, N'Semester 2', CAST(N'2020-07-01 22:49:18.960' AS DateTime), CAST(N'2020-10-01 22:49:18.960' AS DateTime), N'ABC', CAST(N'2020-07-01 22:49:18.960' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[Semester] ([ID], [SemesterName], [SemesterBegin], [SemesterEnd], [Description], [CreateTime], [UpdateTime], [UpdatePerson], [EmpID]) VALUES (3, N'Semester 3', CAST(N'2020-02-01 22:49:18.960' AS DateTime), CAST(N'2020-05-01 22:49:18.960' AS DateTime), N'ABC', CAST(N'2020-02-01 22:49:18.960' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[Semester] ([ID], [SemesterName], [SemesterBegin], [SemesterEnd], [Description], [CreateTime], [UpdateTime], [UpdatePerson], [EmpID]) VALUES (4, N'UpdateAA', CAST(N'2020-10-02 09:55:30.847' AS DateTime), CAST(N'2020-10-02 09:55:30.847' AS DateTime), N'string', CAST(N'2020-10-02 09:55:30.847' AS DateTime), CAST(N'2020-10-02 09:55:30.847' AS DateTime), N'string', 2)
SET IDENTITY_INSERT [dbo].[Semester] OFF
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
