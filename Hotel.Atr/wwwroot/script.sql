USE [master]
GO
/****** Object:  Database [ATR]    Script Date: 25.08.2022 21:56:12 ******/
CREATE DATABASE [ATR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ATR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER99\MSSQL\DATA\ATR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ATR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER99\MSSQL\DATA\ATR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ATR] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ATR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ATR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ATR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ATR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ATR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ATR] SET ARITHABORT OFF 
GO
ALTER DATABASE [ATR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ATR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ATR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ATR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ATR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ATR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ATR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ATR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ATR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ATR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ATR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ATR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ATR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ATR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ATR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ATR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ATR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ATR] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ATR] SET  MULTI_USER 
GO
ALTER DATABASE [ATR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ATR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ATR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ATR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ATR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ATR] SET QUERY_STORE = OFF
GO
USE [ATR]
GO
/****** Object:  Table [dbo].[Availabilty]    Script Date: 25.08.2022 21:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Availabilty](
	[AvailabilityId] [int] NOT NULL,
	[ReservationStart] [datetime] NOT NULL,
	[ReservationEnd] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Picture]    Script Date: 25.08.2022 21:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[PictureId] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[UrlPicture] [nvarchar](500) NOT NULL,
	[MainPicture] [bit] NOT NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[PictureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 25.08.2022 21:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(0,1) NOT NULL,
	[RoomGuid] [uniqueidentifier] NOT NULL,
	[Status] [bit] NOT NULL,
	[Floor] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Discount] [decimal](18, 0) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomProperties]    Script Date: 25.08.2022 21:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomProperties](
	[RoomPropertiesId] [int] NOT NULL,
	[NamePropery] [varchar](50) NOT NULL,
	[ValuePropery] [varchar](50) NOT NULL,
	[RoomId] [int] NULL,
 CONSTRAINT [PK_RoomProperties] PRIMARY KEY CLUSTERED 
(
	[RoomPropertiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Picture] ON 

INSERT [dbo].[Picture] ([PictureId], [RoomId], [Name], [UrlPicture], [MainPicture]) VALUES (1, 1, N'Name', N'/img/room/10.jpg', 1)
INSERT [dbo].[Picture] ([PictureId], [RoomId], [Name], [UrlPicture], [MainPicture]) VALUES (2, 2, N'Name', N'/img/room/11.jpg', 1)
INSERT [dbo].[Picture] ([PictureId], [RoomId], [Name], [UrlPicture], [MainPicture]) VALUES (3, 3, N'Name', N'/img/room/12.jpg', 1)
INSERT [dbo].[Picture] ([PictureId], [RoomId], [Name], [UrlPicture], [MainPicture]) VALUES (5, 4, N'Name', N'/img/room/13.jpg', 1)
INSERT [dbo].[Picture] ([PictureId], [RoomId], [Name], [UrlPicture], [MainPicture]) VALUES (6, 5, N'Name', N'/img/room/14.jpg', 1)
INSERT [dbo].[Picture] ([PictureId], [RoomId], [Name], [UrlPicture], [MainPicture]) VALUES (7, 6, N'Name', N'/img/room/15.jpg', 1)
SET IDENTITY_INSERT [dbo].[Picture] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomId], [RoomGuid], [Status], [Floor], [Level], [Price], [Discount], [Name], [Description]) VALUES (1, N'4bf55a1e-7218-4e65-99bd-7acb32633a5b', 1, 2, 3, CAST(45000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), N'Клубный Люкс Mirage', N'Проведите великолепно время в клубном номере Mirage. Столик с минибаром и полным набором для создания коктелей, быстрый выход к изысканному бассейну и живописный вид на прекрасную архитектуру нашего отеля')
INSERT [dbo].[Room] ([RoomId], [RoomGuid], [Status], [Floor], [Level], [Price], [Discount], [Name], [Description]) VALUES (2, N'c400fe6d-b2d6-495d-9b92-92f43f5c1065', 1, 2, 2, CAST(79000 AS Decimal(18, 0)), CAST(5000 AS Decimal(18, 0)), N'Делюкс с видом на океан', N'Путешествуете один или с вашей второй половинкой и ищите уединение у океана? Тогда Делюкс с видом на океан ваш выбор!')
INSERT [dbo].[Room] ([RoomId], [RoomGuid], [Status], [Floor], [Level], [Price], [Discount], [Name], [Description]) VALUES (3, N'a2ca34c3-c164-4740-baec-f5cde2d7c4d2', 1, 3, 3, CAST(25000 AS Decimal(18, 0)), CAST(6000 AS Decimal(18, 0)), N'Семейный номер', N'Семейная жизнь не преграда для путешествий, когда вы берёте Семейный номер! Развлекательная зона для детей не даст им заскучать, и позволит каждому путешественнику насладиться приключениями и отдыхом')
INSERT [dbo].[Room] ([RoomId], [RoomGuid], [Status], [Floor], [Level], [Price], [Discount], [Name], [Description]) VALUES (4, N'1ff21acc-7aa7-4b5d-8e95-0afc952b8ed0', 1, 3, 4, CAST(35000 AS Decimal(18, 0)), CAST(7000 AS Decimal(18, 0)), N'Спа Делюкс', N'Хотите чтобы ваше тело запело? Тогда комплекс бань с разных частей света, ароматные масла и массаж от сотрудниц нашего отеля исполнит ваше желание')
INSERT [dbo].[Room] ([RoomId], [RoomGuid], [Status], [Floor], [Level], [Price], [Discount], [Name], [Description]) VALUES (5, N'e3fd765d-ac64-4323-a098-eeb2a720b66c', 1, 4, 4, CAST(80000 AS Decimal(18, 0)), CAST(2000 AS Decimal(18, 0)), N'Семейный номер делюкс с видом на океан', N'Этот номер подходит для большой семьи, ведь каждый знает как трудно занять однеого ребёнка, не то что двух или трёх. В номере вы найдёте игровую комнату, множество спальнь и огромную банную комнату')
INSERT [dbo].[Room] ([RoomId], [RoomGuid], [Status], [Floor], [Level], [Price], [Discount], [Name], [Description]) VALUES (6, N'c2cde850-0432-4062-9756-258a5a6e300c', 1, 4, 5, CAST(1000000 AS Decimal(18, 0)), CAST(3000 AS Decimal(18, 0)), N'Делюкс класса премиум с видом на океан', N'Изысканный, утончённый, гордость всего нашего отеля-Делюкс класса премиум с видом на океан. Ряд достоинств других номеров соеденён и воплощён в лучшем виде. Самый величавый вид, и самое лучшее обслуживание. Всё это только для вас.')
SET IDENTITY_INSERT [dbo].[Room] OFF
INSERT [dbo].[RoomProperties] ([RoomPropertiesId], [NamePropery], [ValuePropery], [RoomId]) VALUES (1, N'Wi-Fi', N'Wi-Fi', 1)
INSERT [dbo].[RoomProperties] ([RoomPropertiesId], [NamePropery], [ValuePropery], [RoomId]) VALUES (2, N'Breakfast Include', N'Breakfast Include', 1)
INSERT [dbo].[RoomProperties] ([RoomPropertiesId], [NamePropery], [ValuePropery], [RoomId]) VALUES (3, N'Private Balcony', N'Private Balcony', 1)
INSERT [dbo].[RoomProperties] ([RoomPropertiesId], [NamePropery], [ValuePropery], [RoomId]) VALUES (4, N'Free Newspaper', N'Free Newspaper', 1)
ALTER TABLE [dbo].[Picture] ADD  CONSTRAINT [DF_Picture_MainPicture]  DEFAULT ((0)) FOR [MainPicture]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_Picture_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_Picture_Room]
GO
USE [master]
GO
ALTER DATABASE [ATR] SET  READ_WRITE 
GO
