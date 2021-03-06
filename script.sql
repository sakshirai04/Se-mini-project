USE [master]
GO
/****** Object:  Database [canteen]    Script Date: 2/20/2018 4:10:29 PM ******/
CREATE DATABASE [canteen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'canteen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\canteen.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'canteen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\canteen_log.ldf' , SIZE = 76736KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [canteen] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [canteen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [canteen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [canteen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [canteen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [canteen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [canteen] SET ARITHABORT OFF 
GO
ALTER DATABASE [canteen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [canteen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [canteen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [canteen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [canteen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [canteen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [canteen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [canteen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [canteen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [canteen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [canteen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [canteen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [canteen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [canteen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [canteen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [canteen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [canteen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [canteen] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [canteen] SET  MULTI_USER 
GO
ALTER DATABASE [canteen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [canteen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [canteen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [canteen] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [canteen] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'canteen', N'ON'
GO
USE [canteen]
GO
/****** Object:  Table [dbo].[AddFood]    Script Date: 2/20/2018 4:10:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AddFood](
	[foodno] [varchar](50) NULL,
	[category] [varchar](50) NULL,
	[foodname] [varchar](50) NULL,
	[amount] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AddOffers]    Script Date: 2/20/2018 4:10:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AddOffers](
	[id] [varchar](50) NULL,
	[comboname] [varchar](50) NULL,
	[amount] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[combolk]    Script Date: 2/20/2018 4:10:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[combolk](
	[cid] [varchar](50) NULL,
	[fid] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Link]    Script Date: 2/20/2018 4:10:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Link](
	[foodid] [varchar](50) NULL,
	[prodid] [varchar](50) NULL,
	[quantity] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/20/2018 4:10:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[prod_id] [varchar](50) NULL,
	[prod_name] [varchar](50) NULL,
	[quantity] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 2/20/2018 4:10:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registration](
	[Userid] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Age] [varchar](50) NULL,
	[Gender] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StaffReg]    Script Date: 2/20/2018 4:10:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaffReg](
	[Staffid] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Age] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Uname] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[takeorder]    Script Date: 2/20/2018 4:10:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[takeorder](
	[category] [varchar](50) NULL,
	[foodno] [varchar](50) NULL,
	[foodname] [varchar](50) NULL,
	[quantity] [varchar](50) NULL,
	[total] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempr]    Script Date: 2/20/2018 4:10:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempr](
	[fooditem] [varchar](50) NULL,
	[count] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transact]    Script Date: 2/20/2018 4:10:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transact](
	[tid] [varchar](50) NULL,
	[foodno] [varchar](50) NULL,
	[foodname] [varchar](50) NULL,
	[quantity] [varchar](50) NULL,
	[amount] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[time] [varchar](50) NULL,
	[uid] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transtemp]    Script Date: 2/20/2018 4:10:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transtemp](
	[tid] [varchar](50) NULL,
	[CName] [varchar](50) NULL,
	[FoodName] [varchar](50) NULL,
	[Amount] [varchar](50) NULL,
	[flag] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[time] [time](7) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AddFood] ([foodno], [category], [foodname], [amount]) VALUES (N'1001', N'Breakfast', N'Bread Butter', N'100')
INSERT [dbo].[AddFood] ([foodno], [category], [foodname], [amount]) VALUES (N'1004', N'Starter', N'Paneer Chilly', N'250')
INSERT [dbo].[AddFood] ([foodno], [category], [foodname], [amount]) VALUES (N'1003', N'Lunch', N'Dal Rice', N'200')
INSERT [dbo].[AddOffers] ([id], [comboname], [amount]) VALUES (N'5501', N'Combo1', N'500')
INSERT [dbo].[combolk] ([cid], [fid]) VALUES (N'5501', N'1003')
INSERT [dbo].[Link] ([foodid], [prodid], [quantity]) VALUES (N'1001', N'10001', N'5')
INSERT [dbo].[Link] ([foodid], [prodid], [quantity]) VALUES (N'1001', N'10002', N'100')
INSERT [dbo].[Link] ([foodid], [prodid], [quantity]) VALUES (N'1003', N'10004', N'5')
INSERT [dbo].[Link] ([foodid], [prodid], [quantity]) VALUES (N'1003', N'10005', N'5')
INSERT [dbo].[Link] ([foodid], [prodid], [quantity]) VALUES (N'1004', N'10003', N'200')
INSERT [dbo].[Product] ([prod_id], [prod_name], [quantity]) VALUES (N'10001', N'Bread', N'1')
INSERT [dbo].[Product] ([prod_id], [prod_name], [quantity]) VALUES (N'10002', N'Butter', N'400')
INSERT [dbo].[Product] ([prod_id], [prod_name], [quantity]) VALUES (N'10003', N'Paneer', N'100')
INSERT [dbo].[Product] ([prod_id], [prod_name], [quantity]) VALUES (N'10004', N'Dal', N'447')
INSERT [dbo].[Product] ([prod_id], [prod_name], [quantity]) VALUES (N'10005', N'rice', N'452')
INSERT [dbo].[Registration] ([Userid], [Name], [Address], [Mobile], [Email], [Age], [Gender]) VALUES (N'1', N'Hardik Barve', N'Borivali', N'9664341438', N'hardikbarve440@gmail.com', N'23', N'Male')
INSERT [dbo].[StaffReg] ([Staffid], [Name], [Address], [Mobile], [Email], [Age], [Password], [Gender], [Uname]) VALUES (N'101', N'Regina', N'Mumbai', N'7123456678', N'regina@gmail.com', N'15', N'123456', N'Female', N'regina123')
INSERT [dbo].[StaffReg] ([Staffid], [Name], [Address], [Mobile], [Email], [Age], [Password], [Gender], [Uname]) VALUES (N'102', N'Samy', N'Mumbai', N'7123456789', N'samy@gmail.com', N'27', N'sam123', N'Female', N'sam')
INSERT [dbo].[tempr] ([fooditem], [count]) VALUES (N'Paneer Chilly', N'1')
INSERT [dbo].[transact] ([tid], [foodno], [foodname], [quantity], [amount], [date], [time], [uid]) VALUES (N'2501', N'1004', N'Paneer Chilly', N'1', N'250', N'14/04/2016', N'03:12', N'1')
INSERT [dbo].[transact] ([tid], [foodno], [foodname], [quantity], [amount], [date], [time], [uid]) VALUES (N'2501', N'1003', N'Dal Rice', N'1', N'200', N'14/04/2016', N'03:12', N'1')
INSERT [dbo].[transact] ([tid], [foodno], [foodname], [quantity], [amount], [date], [time], [uid]) VALUES (N'2502', N'1004', N'Paneer Chilly', N'1', N'250', N'14/04/2016', N'03:22', N'1')
INSERT [dbo].[transact] ([tid], [foodno], [foodname], [quantity], [amount], [date], [time], [uid]) VALUES (N'2503', N'5501', N'Combo1', N'1', N'500', N'14/04/2016', N'15:31', N'1')
INSERT [dbo].[transact] ([tid], [foodno], [foodname], [quantity], [amount], [date], [time], [uid]) VALUES (N'2503', N'5501', N'Combo1', N'1', N'500', N'14/04/2016', N'15:31', N'1')
INSERT [dbo].[transact] ([tid], [foodno], [foodname], [quantity], [amount], [date], [time], [uid]) VALUES (N'2504', N'1003', N'Dal Rice', N'1', N'200', N'14/04/2016', N'15:41', N'1')
INSERT [dbo].[transact] ([tid], [foodno], [foodname], [quantity], [amount], [date], [time], [uid]) VALUES (N'2504', N'1003', N'Dal Rice', N'1', N'200', N'14/04/2016', N'15:41', N'1')
INSERT [dbo].[transact] ([tid], [foodno], [foodname], [quantity], [amount], [date], [time], [uid]) VALUES (N'2505', N'5501', N'Combo1', N'1', N'500', N'2018/02/17', N'13:34', N'1')
INSERT [dbo].[transact] ([tid], [foodno], [foodname], [quantity], [amount], [date], [time], [uid]) VALUES (N'2506', N'5501', N'Combo1', N'1', N'500', N'2018/02/20', N'12:15', N'1')
INSERT [dbo].[transact] ([tid], [foodno], [foodname], [quantity], [amount], [date], [time], [uid]) VALUES (N'2507', N'5501', N'Combo1', N'1', N'500', N'2018/02/20', N'13:00', N'1')
INSERT [dbo].[transtemp] ([tid], [CName], [FoodName], [Amount], [flag], [date], [time]) VALUES (N'2507', N'Hardik Barve', N'Combo1', N'500', N'no', N'2018/02/20', CAST(N'13:00:00' AS Time))
USE [master]
GO
ALTER DATABASE [canteen] SET  READ_WRITE 
GO
