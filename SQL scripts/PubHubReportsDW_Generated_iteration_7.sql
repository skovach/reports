/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [PubHubReports]    Script Date: 7/10/2020 10:27:28 AM ******/
CREATE DATABASE [PubHubReports]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PubHubReports', FILENAME = N'C:\Users\User\PubHubReports.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PubHubReports_log', FILENAME = N'C:\Users\User\PubHubReports_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PubHubReports] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PubHubReports].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PubHubReports] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PubHubReports] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PubHubReports] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PubHubReports] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PubHubReports] SET ARITHABORT OFF 
GO
ALTER DATABASE [PubHubReports] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PubHubReports] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PubHubReports] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PubHubReports] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PubHubReports] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PubHubReports] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PubHubReports] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PubHubReports] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PubHubReports] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PubHubReports] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PubHubReports] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PubHubReports] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PubHubReports] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PubHubReports] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PubHubReports] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PubHubReports] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PubHubReports] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PubHubReports] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PubHubReports] SET  MULTI_USER 
GO
ALTER DATABASE [PubHubReports] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PubHubReports] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PubHubReports] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PubHubReports] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PubHubReports] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PubHubReports] SET QUERY_STORE = OFF
GO
USE [PubHubReports]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PubHubReports]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[Id] [int] NOT NULL,
	[ActivityTimeId] [int] NULL,
	[ActivityType] [varchar](50) NULL,
	[IdleTimeId] [int] NULL,
	[AllocationId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Allocations]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allocations](
	[Id] [int] NOT NULL,
	[AllocationTime] [varchar](50) NULL,
	[StartTime] [varchar](50) NULL,
	[EndTime] [varchar](50) NULL,
	[IdleTime] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[IsRejected] [bit] NULL,
	[ScheduleDeadline] [date] NULL,
	[Remarks] [varchar](50) NULL,
	[RoundNumber] [int] NULL,
	[WorkflowId] [int] NULL,
	[WorkflowDetailsId] [int] NULL,
	[ImprintId] [int] NULL,
	[BatchTaskStatusId] [int] NULL,
 CONSTRAINT [PK_Allocations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Batches]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[Batch] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_Batch] UNIQUE NONCLUSTERED 
(
	[JobId] ASC,
	[Batch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchFact]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchFact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BatchId] [int] NOT NULL,
	[FacilityId] [int] NULL,
	[ImprintId] [int] NULL,
	[EditorId] [int] NULL,
	[BookTitleId] [int] NULL,
	[Round1AcceptanceDeliveryDate] [date] NULL,
	[AcceptanceRound] [varchar](10) NULL,
	[ScheduledDelivery] [date] NULL,
	[ActualDelivery] [date] NULL,
	[CCOnTimeDeliveries] [varchar](16) NULL,
	[TaskId] [int] NULL,
	[UnitsOfWorkCompleted] [decimal](8, 2) NULL,
	[TotalWorkUnits] [decimal](8, 2) NULL,
	[ElapsedTime] [int] NULL,
	[TotalCalendarDays] [int] NULL,
	[CCWorkCompleted] [int] NULL,
	[CCScheduleElapsed] [int] NULL,
	[CCDeliveryStatusDaysAhead] [decimal](3, 2) NULL,
	[Client] [varchar](128) NULL,
	[DateId] [int] NULL,
	[TotalIssues] [int] NULL,
	[ResolvedWithin24Hrs] [int] NULL,
	[Billing] [decimal](8, 2) NULL,
	[DeliveryDate] [date] NULL,
	[CCAbove] [varchar](16) NULL,
	[GPRRewardsEarned] [decimal](8, 2) NULL,
	[CCGPRRewardsMissed] [decimal](8, 2) NULL,
 CONSTRAINT [PK_ApexJobFact] PRIMARY KEY CLUSTERED 
(
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchSetups]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchSetups](
	[Id] [int] NOT NULL,
	[BatchNumber] [int] NULL,
	[PrinterName] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Subtitle] [varchar](50) NULL,
	[IsSeries] [bit] NULL,
	[Status] [varchar](50) NULL,
	[DeliveryDateStandard] [date] NULL,
	[DeliveryDateExpedited] [date] NULL,
	[FacilityAssignedDate] [date] NULL,
	[CreationAndDeliveryTimeInterval] [varchar](50) NULL,
	[ImprintId] [int] NULL,
	[SeriesId] [int] NULL,
	[JobId] [int] NULL,
	[WorkflowId] [int] NULL,
	[FacilityId] [int] NULL,
	[UserCreatedId] [int] NULL,
	[UserModifiedId] [int] NULL,
	[DisciplineId] [int] NULL,
	[Subdiscipline] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchTaskStatus]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchTaskStatus](
	[Id] [int] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [varchar](50) NULL,
	[TaskDuration] [int] NULL,
	[UserId] [int] NULL,
	[BatchSetupId] [int] NULL,
	[TaskId] [int] NULL,
	[AllocationId] [int] NULL,
 CONSTRAINT [PK_BatchTaskStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookTitles]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookTitles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusinessUnits]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessUnits](
	[Id] [int] NOT NULL,
	[Code] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[OrganizationId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Date]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Day] [int] NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK__Date__3214EC075B2FDF54] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_Date] UNIQUE NONCLUSTERED 
(
	[Day] ASC,
	[Month] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editors]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpFact]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpFact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NOT NULL,
	[DateId] [int] NOT NULL,
	[FacilityId] [int] NULL,
	[LoginHrs] [decimal](5, 2) NULL,
	[AttendanceDays] [decimal](5, 2) NULL,
	[CCAttendanceHrs] [decimal](5, 2) NULL,
	[Designation] [varchar](128) NULL,
	[Tenure] [decimal](5, 2) NULL,
	[CCAverageNPHForLast3Month] [decimal](5, 2) NULL,
	[CCFaciAndEmp] [varchar](120) NULL,
	[CCCountOfEmp] [decimal](5, 2) NULL,
	[NPH] [decimal](5, 2) NULL,
	[CCTenureAbove3Month] [int] NULL,
	[CCQuality] [bit] NULL,
 CONSTRAINT [PK_EmpFact] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC,
	[DateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpJobFact]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpJobFact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[EmpId] [int] NOT NULL,
	[DateId] [int] NOT NULL,
	[FacilityId] [int] NULL,
	[LoginHrs] [decimal](5, 2) NULL,
	[PHr] [decimal](5, 2) NULL,
	[EHr] [decimal](5, 2) NULL,
	[CCNPH] [decimal](5, 2) NULL,
	[SampledPHr] [decimal](5, 2) NULL,
	[CertifiedWithin24Hrs] [int] NULL,
	[TotalCertified] [int] NULL,
 CONSTRAINT [PK_EmpJobFact] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[EmpId] ASC,
	[DateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpCode] [int] NOT NULL,
	[JoinDate] [date] NOT NULL,
 CONSTRAINT [PK__Employee__3214EC07D7FDF0F5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExternalDelaysFact]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalDelaysFact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BatchId] [int] NOT NULL,
	[ImprintId] [int] NULL,
	[EmpId] [int] NULL,
	[BookTitleId] [int] NULL,
	[TaskId] [int] NULL,
	[DueDate] [date] NULL,
	[ActualDate] [date] NULL,
	[CCDaysAhead] [int] NULL,
 CONSTRAINT [PK_ExternalDelaysFact] PRIMARY KEY CLUSTERED 
(
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExternalTasks]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalTasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Task] [varchar](128) NOT NULL,
	[Type] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facilities]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilityFact]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilityFact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacilityId] [int] NOT NULL,
	[DateId] [int] NOT NULL,
	[FacilitySizeProductionPlanId] [int] NULL,
	[FacilitySizeCapacityPlanId] [int] NULL,
	[CCFacilitySizeRatio] [int] NULL,
	[InfrastructureProductionPlanId] [int] NULL,
	[InfrastructureCapacityPlanId] [int] NULL,
	[CCInfrastructureRatio] [int] NULL,
	[StaffingProductionPlanId] [int] NULL,
	[StaffingCapacityPlanId] [int] NULL,
	[CCStaffingRatio] [int] NULL,
	[RPEWorkDays] [varchar](max) NULL,
	[FacilityWorkDays] [varchar](max) NULL,
	[RPEAsPerPP] [varchar](max) NULL,
	[CCRPEvsFacWDays] [varchar](max) NULL,
	[NetIncome] [decimal](8, 2) NULL,
	[Revenue] [decimal](8, 2) NULL,
	[RPESeats] [int] NULL,
	[Shifts] [int] NULL,
	[CCRPEFacilityDays] [int] NULL,
 CONSTRAINT [PK_FacilityFact] PRIMARY KEY CLUSTERED 
(
	[FacilityId] ASC,
	[DateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HiresFact]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HiresFact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateId] [int] NOT NULL,
	[FacilityId] [int] NOT NULL,
	[NumberOfHires] [int] NULL,
	[Certified] [int] NULL,
	[NumberOfNewTop40PercentHires] [int] NULL,
 CONSTRAINT [PK_HiresFact] PRIMARY KEY CLUSTERED 
(
	[DateId] ASC,
	[FacilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imprints]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imprints](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobFact]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobFact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [int] NOT NULL,
	[DateId] [int] NOT NULL,
	[FacilityId] [int] NULL,
	[TargerMargin] [decimal](8, 2) NULL,
	[JobRevenue] [decimal](8, 2) NULL,
	[COGS] [decimal](8, 2) NULL,
	[CCProfit] [decimal](8, 2) NULL,
	[CCProfitMargin] [decimal](3, 2) NULL,
	[CCProfitMarginRealization] [decimal](3, 2) NULL,
	[CCWeightedProfitMarginRealization] [decimal](8, 2) NULL,
	[CustomerRejections] [int] NULL,
 CONSTRAINT [PK_JobFact] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[DateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Job] [int] NOT NULL,
	[VersionNumber] [int] NULL,
	[Status] [varchar](50) NULL,
	[PurchaseOrderId] [int] NULL,
	[Workflow] [int] NULL,
	[BusinessUnitId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizations]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizations](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[ShortName] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[IdleTimeId] [int] NULL,
	[AllocationId] [int] NULL,
	[ParentOrganizationId] [int] NULL,
	[CustomerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHrPlans]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHrPlans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PHrs] [decimal](7, 2) NOT NULL,
	[DateId] [int] NOT NULL,
	[Type] [varchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productivity]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productivity](
	[Id] [int] NOT NULL,
	[JobNumber] [int] NULL,
	[BatchNumber] [int] NULL,
	[Units] [int] NULL,
	[UOMTarger] [int] NULL,
	[PHr] [decimal](5, 2) NULL,
	[EHr] [decimal](5, 2) NULL,
	[PHrStatus] [varchar](50) NULL,
	[AllocationTimeId] [int] NULL,
	[EndTimeId] [int] NULL,
	[Remarks] [varchar](50) NULL,
	[AllocationId] [int] NULL,
	[TaskId] [int] NULL,
	[UOMId] [int] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PSPs]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PSPs](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[OrganizationId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskCode] [int] NOT NULL,
	[VersionNumber] [int] NULL,
	[UOMTargets] [varchar](50) NULL,
	[ParentTasksId] [int] NULL,
	[UOMId] [int] NULL,
	[SkillId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateId] [int] NULL,
	[Hour] [int] NOT NULL,
	[Minute] [int] NOT NULL,
 CONSTRAINT [PK__Time__3214EC075B2FDF54] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_Time] UNIQUE NONCLUSTERED 
(
	[DateId] ASC,
	[Hour] ASC,
	[Minute] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UOMs]    Script Date: 7/10/2020 10:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UOMs](
	[Id] [int] NOT NULL,
	[Code] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/10/2020 10:27:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacilityId] [int] NOT NULL,
	[Status] [varchar](50) NULL,
	[DateAdded] [date] NULL,
	[OrganizationId] [int] NULL,
	[CustomerId] [int] NULL,
	[BusinessUnitId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workflow]    Script Date: 7/10/2020 10:27:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workflow](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Remarks] [varchar](50) NULL,
	[Version] [int] NULL,
	[OrganizationId] [int] NULL,
 CONSTRAINT [PK_Workflow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkflowDetails]    Script Date: 7/10/2020 10:27:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkflowDetails](
	[Id] [int] NOT NULL,
	[Status] [varchar](50) NULL,
	[DeadEnd] [bit] NULL,
	[RollBack] [bit] NULL,
	[TaskTypeIsSplit] [bit] NULL,
	[IsPartOfMerge] [bit] NULL,
	[SortOrder] [varchar](50) NULL,
	[IsParallel] [bit] NULL,
	[IsRedo] [bit] NULL,
	[AutoAllocate] [bit] NULL,
	[IsAnchor] [bit] NULL,
	[UsReconcile] [bit] NULL,
	[IsReallocation] [bit] NULL,
	[IsQC] [bit] NULL,
	[TaskId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Batches]  WITH CHECK ADD  CONSTRAINT [FK_Batches_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[Batches] CHECK CONSTRAINT [FK_Batches_Jobs]
GO
ALTER TABLE [dbo].[BatchFact]  WITH CHECK ADD  CONSTRAINT [FK_ApexJobFact_Batches] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([Id])
GO
ALTER TABLE [dbo].[BatchFact] CHECK CONSTRAINT [FK_ApexJobFact_Batches]
GO
ALTER TABLE [dbo].[BatchFact]  WITH CHECK ADD  CONSTRAINT [FK_ApexJobFact_BookTitles] FOREIGN KEY([BookTitleId])
REFERENCES [dbo].[BookTitles] ([Id])
GO
ALTER TABLE [dbo].[BatchFact] CHECK CONSTRAINT [FK_ApexJobFact_BookTitles]
GO
ALTER TABLE [dbo].[BatchFact]  WITH CHECK ADD  CONSTRAINT [FK_ApexJobFact_Date] FOREIGN KEY([DateId])
REFERENCES [dbo].[Date] ([Id])
GO
ALTER TABLE [dbo].[BatchFact] CHECK CONSTRAINT [FK_ApexJobFact_Date]
GO
ALTER TABLE [dbo].[BatchFact]  WITH CHECK ADD  CONSTRAINT [FK_ApexJobFact_Editors] FOREIGN KEY([EditorId])
REFERENCES [dbo].[Editors] ([Id])
GO
ALTER TABLE [dbo].[BatchFact] CHECK CONSTRAINT [FK_ApexJobFact_Editors]
GO
ALTER TABLE [dbo].[BatchFact]  WITH CHECK ADD  CONSTRAINT [FK_ApexJobFact_Facilities] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Facilities] ([Id])
GO
ALTER TABLE [dbo].[BatchFact] CHECK CONSTRAINT [FK_ApexJobFact_Facilities]
GO
ALTER TABLE [dbo].[BatchFact]  WITH CHECK ADD  CONSTRAINT [FK_ApexJobFact_Imprints] FOREIGN KEY([ImprintId])
REFERENCES [dbo].[Imprints] ([Id])
GO
ALTER TABLE [dbo].[BatchFact] CHECK CONSTRAINT [FK_ApexJobFact_Imprints]
GO
ALTER TABLE [dbo].[BatchFact]  WITH CHECK ADD  CONSTRAINT [FK_ApexJobFact_Tasks] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([Id])
GO
ALTER TABLE [dbo].[BatchFact] CHECK CONSTRAINT [FK_ApexJobFact_Tasks]
GO
ALTER TABLE [dbo].[EmpFact]  WITH CHECK ADD  CONSTRAINT [FK_EmpFact_Date] FOREIGN KEY([DateId])
REFERENCES [dbo].[Date] ([Id])
GO
ALTER TABLE [dbo].[EmpFact] CHECK CONSTRAINT [FK_EmpFact_Date]
GO
ALTER TABLE [dbo].[EmpFact]  WITH CHECK ADD  CONSTRAINT [FK_EmpFact_Employees] FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[EmpFact] CHECK CONSTRAINT [FK_EmpFact_Employees]
GO
ALTER TABLE [dbo].[EmpFact]  WITH CHECK ADD  CONSTRAINT [FK_EmpFact_Facilities] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Facilities] ([Id])
GO
ALTER TABLE [dbo].[EmpFact] CHECK CONSTRAINT [FK_EmpFact_Facilities]
GO
ALTER TABLE [dbo].[EmpJobFact]  WITH CHECK ADD  CONSTRAINT [FK_EmpJobFact_Date] FOREIGN KEY([DateId])
REFERENCES [dbo].[Date] ([Id])
GO
ALTER TABLE [dbo].[EmpJobFact] CHECK CONSTRAINT [FK_EmpJobFact_Date]
GO
ALTER TABLE [dbo].[EmpJobFact]  WITH CHECK ADD  CONSTRAINT [FK_EmpJobFact_Employees] FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[EmpJobFact] CHECK CONSTRAINT [FK_EmpJobFact_Employees]
GO
ALTER TABLE [dbo].[EmpJobFact]  WITH CHECK ADD  CONSTRAINT [FK_EmpJobFact_Facilities] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Facilities] ([Id])
GO
ALTER TABLE [dbo].[EmpJobFact] CHECK CONSTRAINT [FK_EmpJobFact_Facilities]
GO
ALTER TABLE [dbo].[EmpJobFact]  WITH CHECK ADD  CONSTRAINT [FK_EmpJobFact_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[EmpJobFact] CHECK CONSTRAINT [FK_EmpJobFact_Jobs]
GO
ALTER TABLE [dbo].[ExternalDelaysFact]  WITH CHECK ADD  CONSTRAINT [FK_ExternalDelaysFact_BookTitles] FOREIGN KEY([BookTitleId])
REFERENCES [dbo].[BookTitles] ([Id])
GO
ALTER TABLE [dbo].[ExternalDelaysFact] CHECK CONSTRAINT [FK_ExternalDelaysFact_BookTitles]
GO
ALTER TABLE [dbo].[ExternalDelaysFact]  WITH CHECK ADD  CONSTRAINT [FK_ExternalDelaysFact_Employees] FOREIGN KEY([EmpId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[ExternalDelaysFact] CHECK CONSTRAINT [FK_ExternalDelaysFact_Employees]
GO
ALTER TABLE [dbo].[ExternalDelaysFact]  WITH CHECK ADD  CONSTRAINT [FK_ExternalDelaysFact_ExternalTasks] FOREIGN KEY([TaskId])
REFERENCES [dbo].[ExternalTasks] ([Id])
GO
ALTER TABLE [dbo].[ExternalDelaysFact] CHECK CONSTRAINT [FK_ExternalDelaysFact_ExternalTasks]
GO
ALTER TABLE [dbo].[ExternalDelaysFact]  WITH CHECK ADD  CONSTRAINT [FK_ExternalDelaysFact_Imprints] FOREIGN KEY([ImprintId])
REFERENCES [dbo].[Imprints] ([Id])
GO
ALTER TABLE [dbo].[ExternalDelaysFact] CHECK CONSTRAINT [FK_ExternalDelaysFact_Imprints]
GO
ALTER TABLE [dbo].[FacilityFact]  WITH CHECK ADD  CONSTRAINT [FK_FacilityFact_Date] FOREIGN KEY([DateId])
REFERENCES [dbo].[Date] ([Id])
GO
ALTER TABLE [dbo].[FacilityFact] CHECK CONSTRAINT [FK_FacilityFact_Date]
GO
ALTER TABLE [dbo].[FacilityFact]  WITH CHECK ADD  CONSTRAINT [FK_FacilityFact_Facilities] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Facilities] ([Id])
GO
ALTER TABLE [dbo].[FacilityFact] CHECK CONSTRAINT [FK_FacilityFact_Facilities]
GO
ALTER TABLE [dbo].[FacilityFact]  WITH CHECK ADD  CONSTRAINT [FK_FacilityFact_PHrPlans] FOREIGN KEY([FacilitySizeProductionPlanId])
REFERENCES [dbo].[PHrPlans] ([Id])
GO
ALTER TABLE [dbo].[FacilityFact] CHECK CONSTRAINT [FK_FacilityFact_PHrPlans]
GO
ALTER TABLE [dbo].[FacilityFact]  WITH CHECK ADD  CONSTRAINT [FK_FacilityFact_PHrPlans1] FOREIGN KEY([FacilitySizeCapacityPlanId])
REFERENCES [dbo].[PHrPlans] ([Id])
GO
ALTER TABLE [dbo].[FacilityFact] CHECK CONSTRAINT [FK_FacilityFact_PHrPlans1]
GO
ALTER TABLE [dbo].[FacilityFact]  WITH CHECK ADD  CONSTRAINT [FK_FacilityFact_PHrPlans2] FOREIGN KEY([InfrastructureProductionPlanId])
REFERENCES [dbo].[PHrPlans] ([Id])
GO
ALTER TABLE [dbo].[FacilityFact] CHECK CONSTRAINT [FK_FacilityFact_PHrPlans2]
GO
ALTER TABLE [dbo].[FacilityFact]  WITH CHECK ADD  CONSTRAINT [FK_FacilityFact_PHrPlans3] FOREIGN KEY([InfrastructureCapacityPlanId])
REFERENCES [dbo].[PHrPlans] ([Id])
GO
ALTER TABLE [dbo].[FacilityFact] CHECK CONSTRAINT [FK_FacilityFact_PHrPlans3]
GO
ALTER TABLE [dbo].[FacilityFact]  WITH CHECK ADD  CONSTRAINT [FK_FacilityFact_PHrPlans4] FOREIGN KEY([StaffingProductionPlanId])
REFERENCES [dbo].[PHrPlans] ([Id])
GO
ALTER TABLE [dbo].[FacilityFact] CHECK CONSTRAINT [FK_FacilityFact_PHrPlans4]
GO
ALTER TABLE [dbo].[FacilityFact]  WITH CHECK ADD  CONSTRAINT [FK_FacilityFact_PHrPlans5] FOREIGN KEY([StaffingCapacityPlanId])
REFERENCES [dbo].[PHrPlans] ([Id])
GO
ALTER TABLE [dbo].[FacilityFact] CHECK CONSTRAINT [FK_FacilityFact_PHrPlans5]
GO
ALTER TABLE [dbo].[HiresFact]  WITH CHECK ADD  CONSTRAINT [FK_HiresFact_Date] FOREIGN KEY([DateId])
REFERENCES [dbo].[Date] ([Id])
GO
ALTER TABLE [dbo].[HiresFact] CHECK CONSTRAINT [FK_HiresFact_Date]
GO
ALTER TABLE [dbo].[HiresFact]  WITH CHECK ADD  CONSTRAINT [FK_HiresFact_Facilities] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Facilities] ([Id])
GO
ALTER TABLE [dbo].[HiresFact] CHECK CONSTRAINT [FK_HiresFact_Facilities]
GO
ALTER TABLE [dbo].[JobFact]  WITH CHECK ADD  CONSTRAINT [FK_JobFact_Date] FOREIGN KEY([DateId])
REFERENCES [dbo].[Date] ([Id])
GO
ALTER TABLE [dbo].[JobFact] CHECK CONSTRAINT [FK_JobFact_Date]
GO
ALTER TABLE [dbo].[JobFact]  WITH CHECK ADD  CONSTRAINT [FK_JobFact_Facilities] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[Facilities] ([Id])
GO
ALTER TABLE [dbo].[JobFact] CHECK CONSTRAINT [FK_JobFact_Facilities]
GO
ALTER TABLE [dbo].[JobFact]  WITH CHECK ADD  CONSTRAINT [FK_JobFact_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[JobFact] CHECK CONSTRAINT [FK_JobFact_Jobs]
GO
ALTER TABLE [dbo].[Time]  WITH CHECK ADD  CONSTRAINT [FK_Time_Date] FOREIGN KEY([DateId])
REFERENCES [dbo].[Date] ([Id])
GO
ALTER TABLE [dbo].[Time] CHECK CONSTRAINT [FK_Time_Date]
GO
USE [master]
GO
ALTER DATABASE [PubHubReports] SET  READ_WRITE 
GO
