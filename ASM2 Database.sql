USE [master]
GO
/****** Object:  Database [ASM 1]    Script Date: 4/5/2024 11:53:55 PM ******/
CREATE DATABASE [ASM 1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASM 1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ASM 1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASM 1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ASM 1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ASM 1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASM 1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASM 1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASM 1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASM 1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASM 1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASM 1] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASM 1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASM 1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASM 1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASM 1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASM 1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASM 1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASM 1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASM 1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASM 1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASM 1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ASM 1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASM 1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASM 1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASM 1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASM 1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASM 1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASM 1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASM 1] SET RECOVERY FULL 
GO
ALTER DATABASE [ASM 1] SET  MULTI_USER 
GO
ALTER DATABASE [ASM 1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASM 1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASM 1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASM 1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASM 1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASM 1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASM 1', N'ON'
GO
ALTER DATABASE [ASM 1] SET QUERY_STORE = ON
GO
ALTER DATABASE [ASM 1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ASM 1]
GO
/****** Object:  Table [dbo].[Classrooms]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classrooms](
	[ClassroomID] [int] NOT NULL,
	[Building] [varchar](50) NULL,
	[RoomNumber] [varchar](10) NULL,
	[Capacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassroomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] NOT NULL,
	[CourseName] [varchar](100) NOT NULL,
	[Department] [varchar](50) NULL,
	[Credits] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[InstructorID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Department] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[ScheduleID] [int] NOT NULL,
	[CourseID] [int] NULL,
	[InstructorID] [int] NULL,
	[ClassroomID] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[DayOfWeek] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([ClassroomID])
REFERENCES [dbo].[Classrooms] ([ClassroomID])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([ClassroomID])
REFERENCES [dbo].[Classrooms] ([ClassroomID])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([ClassroomID])
REFERENCES [dbo].[Classrooms] ([ClassroomID])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructors] ([InstructorID])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructors] ([InstructorID])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructors] ([InstructorID])
GO
/****** Object:  StoredProcedure [dbo].[deleteSchedules]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteSchedules]
@ScheduleID int
as
begin
begin try
DELETE FROM Schedules
WHERE @ScheduleID=@ScheduleID;
return 1;
end try
begin catch
return 0;
end catch

end
GO
/****** Object:  StoredProcedure [dbo].[getListClassrooms]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getListClassrooms]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        ClassroomID,
        RoomNumber,
        Capacity
    FROM
        Classrooms
    ORDER BY
        ClassroomID;
END;
GO
/****** Object:  StoredProcedure [dbo].[getListCourses]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getListCourses]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        CourseID,
        CourseName,
        Department,
        Credits
    FROM
        Courses
    ORDER BY
        CourseID;
END;
GO
/****** Object:  StoredProcedure [dbo].[getListInstructors]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getListInstructors]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        I.InstructorID,
        LOWER(I.FirstName) AS FirstName,
        LOWER(I.LastName) AS LastName,
        LOWER(I.Department) AS Department
    FROM
        Instructors AS I;
END;
GO
/****** Object:  StoredProcedure [dbo].[getListSchedules]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getListSchedules]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        S.ScheduleID,
        I.InstructorID,
        C.CourseID,
        CL.ClassroomID,
        S.StartTime,
        S.EndTime,
        S.DayOfWeek
    FROM
        Schedules AS S
    LEFT JOIN
        Courses AS C ON S.CourseID = C.CourseID
    LEFT JOIN
        Instructors AS I ON S.InstructorID = I.InstructorID
    LEFT JOIN
        Classrooms AS CL ON S.ClassroomID = CL.ClassroomID
    ORDER BY
        S.ScheduleID;
END
GO
/****** Object:  StoredProcedure [dbo].[selectClassrooms]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[selectClassrooms]
      @ClassroomID int
AS
Begin
Select
		Building,
		RoomNumber,
		Capacity
from Classrooms
where ClassroomID = @ClassroomID
End
	
GO
/****** Object:  StoredProcedure [dbo].[selectCourse]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[selectCourse]
      @CourseID int
AS
Begin
Select
		CourseName,
		Department,
		Credits
from Courses
where CourseID = @CourseID
End
	
GO
/****** Object:  StoredProcedure [dbo].[selectInstructors]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[selectInstructors]
      @InstructorID int
AS
Begin
Select
		FirstName,
		LastName,
		Department
from Instructors
where InstructorID = @InstructorID
End
GO
/****** Object:  StoredProcedure [dbo].[selectSchedules]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[selectSchedules]
      @ScheduleID int
AS
Begin
Select
		CourseID,
		InstructorID,
		ClassroomID,
		StartTime,
		EndTime,
		DayOfWeek
from Schedules
where ScheduleID = @ScheduleID
End
	
GO
/****** Object:  StoredProcedure [dbo].[updateClassrooms]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[updateClassrooms]
		
      @ClassroomID int,
	  @Building varchar(50),
	  @RoomNumber varchar (50),
	  @Capacity int
AS
Begin
Update Classrooms
Set
		
		Building = @Building,
		RoomNumber = @RoomNumber,
		Capacity = @Capacity

where ClassroomID = @ClassroomID
End
	
GO
/****** Object:  StoredProcedure [dbo].[updateCourses]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[updateCourses]
		
      @CourseID int,
	  @CourseName nvarchar(100),
	  @Department nvarchar (50),
	  @Credits int
AS
Begin
Update Courses
Set
		
		CourseName = @CourseName,
		Department = @Department,
		Credits = @Credits

where CourseID = @CourseID
End
	
GO
/****** Object:  StoredProcedure [dbo].[updateInstructors]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[updateInstructors]
		
      @InstructorID int,
	  @FirstName varchar(50),
	  @LastName varchar (50),
	  @Department varchar (50)
AS
Begin
Update Instructors
Set
		
		FirstName = @FirstName,
		LastName = @LastName,
		Department = @Department

where InstructorID = @InstructorID
End
	
GO
/****** Object:  StoredProcedure [dbo].[updateSchedules]    Script Date: 4/5/2024 11:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[updateSchedules]
		
      @ScheduleID int,
	  @CourseID int,
	  @InstructorID int,
	  @ClassroomID int,
	  @StartTime datetime,
	  @EndTime datetime,
	  @DayOfWeek varchar (10)
AS
Begin
Update Schedules
Set
		CourseID = @CourseID,
		InstructorID = @InstructorID,
		ClassroomID = @ClassroomID,
		StartTime = @StartTime,
		EndTime = @EndTime,
		DayOfWeek = @DayOfWeek

where ScheduleID = @ScheduleID
End
	
GO
USE [master]
GO
ALTER DATABASE [ASM 1] SET  READ_WRITE 
GO
