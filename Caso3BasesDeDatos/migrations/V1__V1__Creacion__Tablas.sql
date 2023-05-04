USE [master]
GO
/****** Object:  Database [EsencialVerde]    Script Date: 02/05/2023 08:45:40 p. m. ******/
CREATE DATABASE [EsencialVerde]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EsencialVerde', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EsencialVerde.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EsencialVerde_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EsencialVerde_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EsencialVerde] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EsencialVerde].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EsencialVerde] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EsencialVerde] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EsencialVerde] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EsencialVerde] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EsencialVerde] SET ARITHABORT OFF 
GO
ALTER DATABASE [EsencialVerde] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EsencialVerde] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EsencialVerde] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EsencialVerde] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EsencialVerde] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EsencialVerde] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EsencialVerde] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EsencialVerde] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EsencialVerde] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EsencialVerde] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EsencialVerde] SET AUTO_UPDATE_STATISTICS_ASYNC ON 
GO
ALTER DATABASE [EsencialVerde] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EsencialVerde] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EsencialVerde] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EsencialVerde] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EsencialVerde] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EsencialVerde] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EsencialVerde] SET RECOVERY FULL 
GO
ALTER DATABASE [EsencialVerde] SET  MULTI_USER 
GO
ALTER DATABASE [EsencialVerde] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EsencialVerde] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EsencialVerde] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EsencialVerde] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EsencialVerde] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EsencialVerde] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EsencialVerde', N'ON'
GO
ALTER DATABASE [EsencialVerde] SET QUERY_STORE = OFF
GO
USE [EsencialVerde]
GO
/****** Object:  UserDefinedTableType [dbo].[TMoneyData]    Script Date: 02/05/2023 08:45:41 p. m. ******/
CREATE TYPE [dbo].[TMoneyData] AS TABLE(
	[name] [varchar](32) NULL,
	[symbol] [varchar](10) NULL,
	[deleted] [bit] NULL,
	[defaultMoney] [bit] NULL
)
GO
/****** Object:  Table [dbo].[Binnacle]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Binnacle](
	[binnacleId] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[username] [varchar](40) NOT NULL,
	[operationTypeId] [int] NOT NULL,
	[eventTypeId] [int] NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
	[sourcesId] [int] NOT NULL,
	[levelsId] [int] NOT NULL,
	[computer] [varchar](40) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[referenceId1] [bigint] NOT NULL,
	[referenceId2] [bigint] NULL,
	[value1] [varchar](60) NOT NULL,
	[value2] [varchar](60) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[brandId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](64) NOT NULL,
 CONSTRAINT [PK_VehiclesBrands] PRIMARY KEY CLUSTERED 
(
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[cityId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](32) NOT NULL,
	[stateId] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CollectionDays]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CollectionDays](
	[collectionDayId] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](16) NOT NULL,
 CONSTRAINT [PK_CollectionDays] PRIMARY KEY CLUSTERED 
(
	[collectionDayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CollectionDaysXpickingUpCycle]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CollectionDaysXpickingUpCycle](
	[pickingUpCycleId] [int] NOT NULL,
	[collectionDayId] [tinyint] NOT NULL,
	[isActive] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collections]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collections](
	[collectionId] [bigint] IDENTITY(1,1) NOT NULL,
	[containerTypeId] [smallint] NOT NULL,
	[operationType] [tinyint] NOT NULL,
	[pickupCompany] [smallint] NOT NULL,
	[realAmount] [decimal](10, 2) NOT NULL,
	[esencialVerdeHeadquarterId] [int] NULL,
	[postime] [datetime] NOT NULL,
	[vehicleId] [int] NULL,
	[wasteId] [int] NOT NULL,
	[producerHeadquarterId] [int] NOT NULL,
 CONSTRAINT [PK_ContainerInventoryLogs] PRIMARY KEY CLUSTERED 
(
	[collectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContacInfo]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContacInfo](
	[contacInfoId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](32) NOT NULL,
	[lastname] [varbinary](32) NOT NULL,
	[telephone] [int] NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContacInfo] PRIMARY KEY CLUSTERED 
(
	[contacInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContainersTypes]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainersTypes](
	[containerTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](32) NOT NULL,
	[capacity] [decimal](10, 2) NOT NULL,
	[measureId] [smallint] NOT NULL,
	[brandId] [smallint] NOT NULL,
	[modelId] [smallint] NOT NULL,
	[amountInUse] [int] NOT NULL,
	[amountOutOfService] [int] NOT NULL,
	[amountOnRepair] [int] NOT NULL,
	[amountAvailable] [int] NOT NULL,
 CONSTRAINT [PK_ContainersCategories] PRIMARY KEY CLUSTERED 
(
	[containerTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContainersTypesReceivedXReception]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainersTypesReceivedXReception](
	[containerTypeReceived] [smallint] IDENTITY(1,1) NOT NULL,
	[realAmount] [decimal](10, 2) NOT NULL,
	[receptionOfWasteId] [int] NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_ContainersTypesReceivedXReception] PRIMARY KEY CLUSTERED 
(
	[containerTypeReceived] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContainersTypesXvehicles]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainersTypesXvehicles](
	[vehicleId] [int] NOT NULL,
	[containerTypeId] [smallint] NOT NULL,
	[amount] [int] NOT NULL,
	[isActive] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContainersTypeXwaste]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContainersTypeXwaste](
	[containerTypeId] [smallint] NOT NULL,
	[wasteId] [int] NOT NULL,
	[isActive] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[contractId] [int] IDENTITY(1,1) NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[pickingUpCycleId] [int] NOT NULL,
	[producerId] [int] NOT NULL,
	[wasteId] [int] NOT NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[contractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[countryId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](64) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[driverId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](25) NOT NULL,
	[lastName] [varchar](40) NOT NULL,
	[countryId] [smallint] NOT NULL,
	[email] [varchar](40) NOT NULL,
	[dateEntry] [date] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Drivers] PRIMARY KEY CLUSTERED 
(
	[driverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverXvehicle]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverXvehicle](
	[driverId] [int] NOT NULL,
	[vehicleId] [int] NOT NULL,
	[deleted] [bit] NOT NULL,
	[date] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EsencialVerdeHeadquarters]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EsencialVerdeHeadquarters](
	[esencialVerdeHeadquarterId] [int] IDENTITY(1,1) NOT NULL,
	[locationId] [int] NOT NULL,
	[contacInfoId] [int] NULL,
 CONSTRAINT [PK_EsencialVerdeHeadquarters] PRIMARY KEY CLUSTERED 
(
	[esencialVerdeHeadquarterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EsencialVerdeHeadquartersXdrivers]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EsencialVerdeHeadquartersXdrivers](
	[esencialVerdeHeadquarterId] [int] NOT NULL,
	[driverId] [int] NOT NULL,
	[isActive] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EsencialVerdeHeadquartersXtelephones]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EsencialVerdeHeadquartersXtelephones](
	[esencialVerdeHeadquarterId] [int] NOT NULL,
	[telephoneId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EsencialVerdeHeadquartersXvehicles]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EsencialVerdeHeadquartersXvehicles](
	[esencialVerdeHeadquarterId] [int] NOT NULL,
	[vehicleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventType]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventType](
	[eventTypeId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EventType] PRIMARY KEY CLUSTERED 
(
	[eventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[languageId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](32) NOT NULL,
	[countryId] [smallint] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Levels]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levels](
	[levelId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED 
(
	[levelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[locationId] [int] IDENTITY(1,1) NOT NULL,
	[cityId] [int] NOT NULL,
	[exactAdress] [varchar](512) NOT NULL,
	[gpsLocation] [geography] NOT NULL,
	[zipCode] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[locationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[modelId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[brandId] [smallint] NOT NULL,
 CONSTRAINT [PK_VehiclesModels] PRIMARY KEY CLUSTERED 
(
	[modelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Money]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Money](
	[moneyId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](32) NOT NULL,
	[symbol] [varchar](10) NULL,
	[deleted] [bit] NOT NULL,
	[defaultMoney] [bit] NOT NULL,
	[acronym] [varchar](4) NULL,
	[countryId] [smallint] NULL,
 CONSTRAINT [PK_Money] PRIMARY KEY CLUSTERED 
(
	[moneyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoneyExchange]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoneyExchange](
	[moneyExchangeId] [int] IDENTITY(1,1) NOT NULL,
	[moneyId] [smallint] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NULL,
	[moneydefault] [bit] NOT NULL,
	[exchangeRate] [decimal](18, 5) NOT NULL,
	[computer] [varchar](64) NULL,
	[username] [varchar](40) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_MoneyExchange] PRIMARY KEY CLUSTERED 
(
	[moneyExchangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoneyXcountries]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoneyXcountries](
	[countryId] [smallint] NOT NULL,
	[moneyId] [smallint] NOT NULL,
	[isActive] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewProducts]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewProducts](
	[newProductId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[costProduction] [money] NOT NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_NewProducts] PRIMARY KEY CLUSTERED 
(
	[newProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationsTypes]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationsTypes](
	[operationType] [tinyint] NOT NULL,
	[name] [varchar](32) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_OperationsTypes] PRIMARY KEY CLUSTERED 
(
	[operationType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationType]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationType](
	[operationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](70) NOT NULL,
 CONSTRAINT [PK_OperationType] PRIMARY KEY CLUSTERED 
(
	[operationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickingUpCycle]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickingUpCycle](
	[pickingUpCycleId] [int] IDENTITY(1,1) NOT NULL,
	[producerHeadquarterId] [int] NOT NULL,
 CONSTRAINT [PK_PickingUpCycle] PRIMARY KEY CLUSTERED 
(
	[pickingUpCycleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupsCompanies]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupsCompanies](
	[pickupCompanyId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](32) NOT NULL,
	[isActive] [bit] NOT NULL,
	[registrationDate] [date] NOT NULL,
	[locationId] [int] NOT NULL,
 CONSTRAINT [PK_PickupsCompanies] PRIMARY KEY CLUSTERED 
(
	[pickupCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Processes]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Processes](
	[processId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[wasteTypeId] [smallint] NOT NULL,
 CONSTRAINT [PK_Processes] PRIMARY KEY CLUSTERED 
(
	[processId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessPriceXcountryLogs]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessPriceXcountryLogs](
	[processPriceXcountryLogs] [int] IDENTITY(1,1) NOT NULL,
	[processId] [int] NOT NULL,
	[countryId] [smallint] NOT NULL,
	[priceXkg] [money] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[isActive] [bit] NOT NULL,
	[stateId] [int] NULL,
 CONSTRAINT [PK_ProcessPriceXcountryLogs] PRIMARY KEY CLUSTERED 
(
	[processPriceXcountryLogs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producers](
	[producerId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](64) NOT NULL,
	[isActive] [bit] NOT NULL,
	[registrationDate] [date] NOT NULL,
 CONSTRAINT [PK_Producers] PRIMARY KEY CLUSTERED 
(
	[producerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProducersHeadquarters]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProducersHeadquarters](
	[producerHeadquarterId] [int] IDENTITY(1,1) NOT NULL,
	[locationId] [int] NOT NULL,
	[producerId] [int] NOT NULL,
	[contacInfoId] [int] NULL,
 CONSTRAINT [PK_Headquarters] PRIMARY KEY CLUSTERED 
(
	[producerHeadquarterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceptionsOfWastes]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceptionsOfWastes](
	[receptionOfWasteId] [int] IDENTITY(1,1) NOT NULL,
	[esencialVerdeHeadquarterId] [int] NOT NULL,
	[driverId] [int] NULL,
	[delivererName] [varchar](32) NOT NULL,
	[delivererLastName] [varchar](32) NOT NULL,
	[delivererPhone] [int] NOT NULL,
	[postime] [datetime] NOT NULL,
 CONSTRAINT [PK_ReceptionsOfWastes] PRIMARY KEY CLUSTERED 
(
	[receptionOfWasteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[regionId] [int] NOT NULL,
	[name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Regions_1] PRIMARY KEY CLUSTERED 
(
	[regionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegionsAreas]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegionsAreas](
	[regionId] [int] NOT NULL,
	[countryId] [smallint] NULL,
	[stateId] [int] NULL,
	[cityId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sources]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sources](
	[sourcesId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sources] PRIMARY KEY CLUSTERED 
(
	[sourcesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[stateId] [int] IDENTITY(1,1) NOT NULL,
	[countryId] [smallint] NOT NULL,
	[name] [varchar](64) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[stateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telephones]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telephones](
	[telephoneId] [int] IDENTITY(1,1) NOT NULL,
	[telephone] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Telephones] PRIMARY KEY CLUSTERED 
(
	[telephoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TelephoneXdrivers]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TelephoneXdrivers](
	[telephoneId] [int] NOT NULL,
	[driverId] [int] NOT NULL,
	[deleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[transactionId] [int] IDENTITY(1,1) NOT NULL,
	[moneyId] [smallint] NOT NULL,
	[moneyExchangeId] [int] NOT NULL,
	[exchangeRate] [decimal](18, 5) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
	[contractId] [int] NULL,
	[producerId] [int] NULL,
	[transactionDate] [datetime] NULL,
	[amount] [datetime] NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[transactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[vehicleId] [int] IDENTITY(1,1) NOT NULL,
	[plate] [int] NOT NULL,
	[departmentId] [int] NOT NULL,
	[modelId] [smallint] NOT NULL,
	[fabricationDate] [date] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[vehicleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Waste]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Waste](
	[wasteId] [int] IDENTITY(1,1) NOT NULL,
	[wasteTypeId] [smallint] NOT NULL,
	[newProductId] [int] NULL,
	[dateEntry] [date] NOT NULL,
	[isRecyclable] [bit] NOT NULL,
 CONSTRAINT [PK_Waste] PRIMARY KEY CLUSTERED 
(
	[wasteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WastesTypesXvehicles]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WastesTypesXvehicles](
	[vehicleId] [int] NOT NULL,
	[wasteType] [smallint] NOT NULL,
	[isActive] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WasteTypes]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WasteTypes](
	[wasteTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](60) NOT NULL,
 CONSTRAINT [PK_WasteTypes] PRIMARY KEY CLUSTERED 
(
	[wasteTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WasteXpickingUpCycle]    Script Date: 02/05/2023 08:45:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WasteXpickingUpCycle](
	[wasteId] [int] NOT NULL,
	[pickingUpCycleId] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[volume] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_MoneyExchange__moneyId]    Script Date: 02/05/2023 08:45:41 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_MoneyExchange__moneyId] ON [dbo].[MoneyExchange]
(
	[moneyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MoneyExchange_default]    Script Date: 02/05/2023 08:45:41 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_MoneyExchange_default] ON [dbo].[MoneyExchange]
(
	[moneydefault] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CollectionDaysXpickingUpCycle] ADD  CONSTRAINT [DF_CollectionDaysXpickingUpCycle_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[ContainersTypesXvehicles] ADD  CONSTRAINT [DF_ContainersTypesXvehicles_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[ContainersTypeXwaste] ADD  CONSTRAINT [DF_ContainersTypeXwaste_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquartersXdrivers] ADD  CONSTRAINT [DF_EsencialVerdeHeadquartersXdrivers_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[MoneyExchange] ADD  CONSTRAINT [DF_MoneyExchange_endDate]  DEFAULT ('9999-12-31') FOR [endDate]
GO
ALTER TABLE [dbo].[MoneyExchange] ADD  CONSTRAINT [DF_MoneyExchange_moneydefault]  DEFAULT ((0)) FOR [moneydefault]
GO
ALTER TABLE [dbo].[MoneyXcountries] ADD  CONSTRAINT [DF_MoneyXcountries_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[OperationsTypes] ADD  CONSTRAINT [DF_OperationsTypes_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[PickupsCompanies] ADD  CONSTRAINT [DF_PickupsCompanies_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[ProcessPriceXcountryLogs] ADD  CONSTRAINT [DF_ProcessPriceXcountryLogs_endDate]  DEFAULT ('9999-12-31') FOR [endDate]
GO
ALTER TABLE [dbo].[ProcessPriceXcountryLogs] ADD  CONSTRAINT [DF_ProcessPriceXcountryLogs_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Producers] ADD  CONSTRAINT [DF_Producers_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[TelephoneXdrivers] ADD  CONSTRAINT [DF_TelephoneXdrivers_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[WastesTypesXvehicles] ADD  CONSTRAINT [DF_WastesTypesXvehicles_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[WasteXpickingUpCycle] ADD  CONSTRAINT [DF_WasteXpickingUpCycle_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Binnacle]  WITH CHECK ADD  CONSTRAINT [FK_Binnacle_EventType_eventTypeId] FOREIGN KEY([eventTypeId])
REFERENCES [dbo].[EventType] ([eventTypeId])
GO
ALTER TABLE [dbo].[Binnacle] CHECK CONSTRAINT [FK_Binnacle_EventType_eventTypeId]
GO
ALTER TABLE [dbo].[Binnacle]  WITH CHECK ADD  CONSTRAINT [FK_Binnacle_Levels_levelsId] FOREIGN KEY([levelsId])
REFERENCES [dbo].[Levels] ([levelId])
GO
ALTER TABLE [dbo].[Binnacle] CHECK CONSTRAINT [FK_Binnacle_Levels_levelsId]
GO
ALTER TABLE [dbo].[Binnacle]  WITH CHECK ADD  CONSTRAINT [FK_Binnacle_OperationType_operationTypeId] FOREIGN KEY([operationTypeId])
REFERENCES [dbo].[OperationType] ([operationTypeId])
GO
ALTER TABLE [dbo].[Binnacle] CHECK CONSTRAINT [FK_Binnacle_OperationType_operationTypeId]
GO
ALTER TABLE [dbo].[Binnacle]  WITH CHECK ADD  CONSTRAINT [FK_Binnacle_Sources_sourcesId] FOREIGN KEY([sourcesId])
REFERENCES [dbo].[Sources] ([sourcesId])
GO
ALTER TABLE [dbo].[Binnacle] CHECK CONSTRAINT [FK_Binnacle_Sources_sourcesId]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_States_stateId] FOREIGN KEY([stateId])
REFERENCES [dbo].[States] ([stateId])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_States_stateId]
GO
ALTER TABLE [dbo].[CollectionDaysXpickingUpCycle]  WITH CHECK ADD  CONSTRAINT [FK_CollectionDaysXpickingUpCycle_CollectionDays_collectionDayId] FOREIGN KEY([collectionDayId])
REFERENCES [dbo].[CollectionDays] ([collectionDayId])
GO
ALTER TABLE [dbo].[CollectionDaysXpickingUpCycle] CHECK CONSTRAINT [FK_CollectionDaysXpickingUpCycle_CollectionDays_collectionDayId]
GO
ALTER TABLE [dbo].[CollectionDaysXpickingUpCycle]  WITH CHECK ADD  CONSTRAINT [FK_CollectionDaysXpickingUpCycle_PickingUpCycle_pickingUpCycleId] FOREIGN KEY([pickingUpCycleId])
REFERENCES [dbo].[PickingUpCycle] ([pickingUpCycleId])
GO
ALTER TABLE [dbo].[CollectionDaysXpickingUpCycle] CHECK CONSTRAINT [FK_CollectionDaysXpickingUpCycle_PickingUpCycle_pickingUpCycleId]
GO
ALTER TABLE [dbo].[Collections]  WITH CHECK ADD  CONSTRAINT [FK_Collections_OperationsTypes] FOREIGN KEY([operationType])
REFERENCES [dbo].[OperationsTypes] ([operationType])
GO
ALTER TABLE [dbo].[Collections] CHECK CONSTRAINT [FK_Collections_OperationsTypes]
GO
ALTER TABLE [dbo].[Collections]  WITH CHECK ADD  CONSTRAINT [FK_Collections_ProducersHeadquarters_producerHeadquarterId] FOREIGN KEY([producerHeadquarterId])
REFERENCES [dbo].[ProducersHeadquarters] ([producerHeadquarterId])
GO
ALTER TABLE [dbo].[Collections] CHECK CONSTRAINT [FK_Collections_ProducersHeadquarters_producerHeadquarterId]
GO
ALTER TABLE [dbo].[Collections]  WITH CHECK ADD  CONSTRAINT [FK_Collections_Vehicles_vehicleId] FOREIGN KEY([vehicleId])
REFERENCES [dbo].[Vehicles] ([vehicleId])
GO
ALTER TABLE [dbo].[Collections] CHECK CONSTRAINT [FK_Collections_Vehicles_vehicleId]
GO
ALTER TABLE [dbo].[Collections]  WITH CHECK ADD  CONSTRAINT [FK_Collections_Waste_wasteId] FOREIGN KEY([wasteId])
REFERENCES [dbo].[Waste] ([wasteId])
GO
ALTER TABLE [dbo].[Collections] CHECK CONSTRAINT [FK_Collections_Waste_wasteId]
GO
ALTER TABLE [dbo].[Collections]  WITH CHECK ADD  CONSTRAINT [FK_ContainerInventoryLogs_ContainersTypes_containerTypeId] FOREIGN KEY([containerTypeId])
REFERENCES [dbo].[ContainersTypes] ([containerTypeId])
GO
ALTER TABLE [dbo].[Collections] CHECK CONSTRAINT [FK_ContainerInventoryLogs_ContainersTypes_containerTypeId]
GO
ALTER TABLE [dbo].[ContainersTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContainersTypes_Brands_brandId] FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([brandId])
GO
ALTER TABLE [dbo].[ContainersTypes] CHECK CONSTRAINT [FK_ContainersTypes_Brands_brandId]
GO
ALTER TABLE [dbo].[ContainersTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContainersTypes_Models_modelId] FOREIGN KEY([modelId])
REFERENCES [dbo].[Models] ([modelId])
GO
ALTER TABLE [dbo].[ContainersTypes] CHECK CONSTRAINT [FK_ContainersTypes_Models_modelId]
GO
ALTER TABLE [dbo].[ContainersTypesReceivedXReception]  WITH CHECK ADD  CONSTRAINT [FK_ContainersTypesReceivedXReception_ReceptionsOfWastes_receptionOfWasteId] FOREIGN KEY([receptionOfWasteId])
REFERENCES [dbo].[ReceptionsOfWastes] ([receptionOfWasteId])
GO
ALTER TABLE [dbo].[ContainersTypesReceivedXReception] CHECK CONSTRAINT [FK_ContainersTypesReceivedXReception_ReceptionsOfWastes_receptionOfWasteId]
GO
ALTER TABLE [dbo].[ContainersTypesXvehicles]  WITH CHECK ADD  CONSTRAINT [FK_ContainersTypesXvehicles_ContainersTypes_containerTypeId] FOREIGN KEY([containerTypeId])
REFERENCES [dbo].[ContainersTypes] ([containerTypeId])
GO
ALTER TABLE [dbo].[ContainersTypesXvehicles] CHECK CONSTRAINT [FK_ContainersTypesXvehicles_ContainersTypes_containerTypeId]
GO
ALTER TABLE [dbo].[ContainersTypesXvehicles]  WITH CHECK ADD  CONSTRAINT [FK_ContainersTypesXvehicles_Vehicles_vehicleId] FOREIGN KEY([vehicleId])
REFERENCES [dbo].[Vehicles] ([vehicleId])
GO
ALTER TABLE [dbo].[ContainersTypesXvehicles] CHECK CONSTRAINT [FK_ContainersTypesXvehicles_Vehicles_vehicleId]
GO
ALTER TABLE [dbo].[ContainersTypeXwaste]  WITH CHECK ADD  CONSTRAINT [FK_ContainersTypeXwaste_ContainersTypes_containerTypeId] FOREIGN KEY([containerTypeId])
REFERENCES [dbo].[ContainersTypes] ([containerTypeId])
GO
ALTER TABLE [dbo].[ContainersTypeXwaste] CHECK CONSTRAINT [FK_ContainersTypeXwaste_ContainersTypes_containerTypeId]
GO
ALTER TABLE [dbo].[ContainersTypeXwaste]  WITH CHECK ADD  CONSTRAINT [FK_ContainersTypeXwaste_Waste_wasteId] FOREIGN KEY([wasteId])
REFERENCES [dbo].[Waste] ([wasteId])
GO
ALTER TABLE [dbo].[ContainersTypeXwaste] CHECK CONSTRAINT [FK_ContainersTypeXwaste_Waste_wasteId]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_PickingUpCycle_pickingUpCycleId] FOREIGN KEY([pickingUpCycleId])
REFERENCES [dbo].[PickingUpCycle] ([pickingUpCycleId])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_PickingUpCycle_pickingUpCycleId]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Producers_producerId] FOREIGN KEY([producerId])
REFERENCES [dbo].[Producers] ([producerId])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Producers_producerId]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Waste_wasteId] FOREIGN KEY([wasteId])
REFERENCES [dbo].[Waste] ([wasteId])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Waste_wasteId]
GO
ALTER TABLE [dbo].[Drivers]  WITH CHECK ADD  CONSTRAINT [FK_Drivers_Countries_countryId] FOREIGN KEY([countryId])
REFERENCES [dbo].[Countries] ([countryId])
GO
ALTER TABLE [dbo].[Drivers] CHECK CONSTRAINT [FK_Drivers_Countries_countryId]
GO
ALTER TABLE [dbo].[DriverXvehicle]  WITH CHECK ADD  CONSTRAINT [FK_DriverXvehicle_Drivers_driverId] FOREIGN KEY([driverId])
REFERENCES [dbo].[Drivers] ([driverId])
GO
ALTER TABLE [dbo].[DriverXvehicle] CHECK CONSTRAINT [FK_DriverXvehicle_Drivers_driverId]
GO
ALTER TABLE [dbo].[DriverXvehicle]  WITH CHECK ADD  CONSTRAINT [FK_DriverXvehicle_Vehicles_vehicleId] FOREIGN KEY([vehicleId])
REFERENCES [dbo].[Vehicles] ([vehicleId])
GO
ALTER TABLE [dbo].[DriverXvehicle] CHECK CONSTRAINT [FK_DriverXvehicle_Vehicles_vehicleId]
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquarters]  WITH CHECK ADD  CONSTRAINT [FK_EsencialVerdeHeadquarters_ContacInfo_contacInfoId] FOREIGN KEY([contacInfoId])
REFERENCES [dbo].[ContacInfo] ([contacInfoId])
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquarters] CHECK CONSTRAINT [FK_EsencialVerdeHeadquarters_ContacInfo_contacInfoId]
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquarters]  WITH CHECK ADD  CONSTRAINT [FK_EsencialVerdeHeadquarters_Locations_locationId] FOREIGN KEY([locationId])
REFERENCES [dbo].[Locations] ([locationId])
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquarters] CHECK CONSTRAINT [FK_EsencialVerdeHeadquarters_Locations_locationId]
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquartersXdrivers]  WITH CHECK ADD  CONSTRAINT [FK_EsencialVerdeHeadquartersXdrivers_Drivers_driverId] FOREIGN KEY([driverId])
REFERENCES [dbo].[Drivers] ([driverId])
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquartersXdrivers] CHECK CONSTRAINT [FK_EsencialVerdeHeadquartersXdrivers_Drivers_driverId]
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquartersXdrivers]  WITH CHECK ADD  CONSTRAINT [FK_EsencialVerdeHeadquartersXdrivers_EsencialVerdeHeadquarters_esencialVerdeHeadquarterId] FOREIGN KEY([esencialVerdeHeadquarterId])
REFERENCES [dbo].[EsencialVerdeHeadquarters] ([esencialVerdeHeadquarterId])
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquartersXdrivers] CHECK CONSTRAINT [FK_EsencialVerdeHeadquartersXdrivers_EsencialVerdeHeadquarters_esencialVerdeHeadquarterId]
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquartersXtelephones]  WITH CHECK ADD  CONSTRAINT [FK_EsencialVerdeHeadquartersXtelephones_EsencialVerdeHeadquarters_esencialVerdeHeadquarterId] FOREIGN KEY([esencialVerdeHeadquarterId])
REFERENCES [dbo].[EsencialVerdeHeadquarters] ([esencialVerdeHeadquarterId])
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquartersXtelephones] CHECK CONSTRAINT [FK_EsencialVerdeHeadquartersXtelephones_EsencialVerdeHeadquarters_esencialVerdeHeadquarterId]
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquartersXtelephones]  WITH CHECK ADD  CONSTRAINT [FK_EsencialVerdeHeadquartersXtelephones_Telephones_telephoneId] FOREIGN KEY([telephoneId])
REFERENCES [dbo].[Telephones] ([telephoneId])
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquartersXtelephones] CHECK CONSTRAINT [FK_EsencialVerdeHeadquartersXtelephones_Telephones_telephoneId]
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquartersXvehicles]  WITH CHECK ADD  CONSTRAINT [FK_EsencialVerdeHeadquartersXvehicles_EsencialVerdeHeadquarters_esencialVerdeHeadquarterId] FOREIGN KEY([esencialVerdeHeadquarterId])
REFERENCES [dbo].[EsencialVerdeHeadquarters] ([esencialVerdeHeadquarterId])
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquartersXvehicles] CHECK CONSTRAINT [FK_EsencialVerdeHeadquartersXvehicles_EsencialVerdeHeadquarters_esencialVerdeHeadquarterId]
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquartersXvehicles]  WITH CHECK ADD  CONSTRAINT [FK_EsencialVerdeHeadquartersXvehicles_Vehicles_vehicleId] FOREIGN KEY([vehicleId])
REFERENCES [dbo].[Vehicles] ([vehicleId])
GO
ALTER TABLE [dbo].[EsencialVerdeHeadquartersXvehicles] CHECK CONSTRAINT [FK_EsencialVerdeHeadquartersXvehicles_Vehicles_vehicleId]
GO
ALTER TABLE [dbo].[Languages]  WITH CHECK ADD  CONSTRAINT [FK_Languages_Countries_countryId] FOREIGN KEY([countryId])
REFERENCES [dbo].[Countries] ([countryId])
GO
ALTER TABLE [dbo].[Languages] CHECK CONSTRAINT [FK_Languages_Countries_countryId]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Cities_cityId] FOREIGN KEY([cityId])
REFERENCES [dbo].[Cities] ([cityId])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Cities_cityId]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_VehiclesModels_VehiclesBrands_vehicleBrandId] FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([brandId])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_VehiclesModels_VehiclesBrands_vehicleBrandId]
GO
ALTER TABLE [dbo].[Money]  WITH CHECK ADD  CONSTRAINT [FK_Money_Countries_countryId] FOREIGN KEY([countryId])
REFERENCES [dbo].[Countries] ([countryId])
GO
ALTER TABLE [dbo].[Money] CHECK CONSTRAINT [FK_Money_Countries_countryId]
GO
ALTER TABLE [dbo].[MoneyExchange]  WITH CHECK ADD  CONSTRAINT [FK_MoneyExchange_Money_moneyId] FOREIGN KEY([moneyId])
REFERENCES [dbo].[Money] ([moneyId])
GO
ALTER TABLE [dbo].[MoneyExchange] CHECK CONSTRAINT [FK_MoneyExchange_Money_moneyId]
GO
ALTER TABLE [dbo].[MoneyXcountries]  WITH CHECK ADD  CONSTRAINT [FK_MoneyXcountries_Countries_countryId] FOREIGN KEY([countryId])
REFERENCES [dbo].[Countries] ([countryId])
GO
ALTER TABLE [dbo].[MoneyXcountries] CHECK CONSTRAINT [FK_MoneyXcountries_Countries_countryId]
GO
ALTER TABLE [dbo].[MoneyXcountries]  WITH CHECK ADD  CONSTRAINT [FK_MoneyXcountries_Money_moneyId] FOREIGN KEY([moneyId])
REFERENCES [dbo].[Money] ([moneyId])
GO
ALTER TABLE [dbo].[MoneyXcountries] CHECK CONSTRAINT [FK_MoneyXcountries_Money_moneyId]
GO
ALTER TABLE [dbo].[PickingUpCycle]  WITH CHECK ADD  CONSTRAINT [FK_PickingUpCycle_ProducersHeadquarters_producerHeadquarterId] FOREIGN KEY([producerHeadquarterId])
REFERENCES [dbo].[ProducersHeadquarters] ([producerHeadquarterId])
GO
ALTER TABLE [dbo].[PickingUpCycle] CHECK CONSTRAINT [FK_PickingUpCycle_ProducersHeadquarters_producerHeadquarterId]
GO
ALTER TABLE [dbo].[Processes]  WITH CHECK ADD  CONSTRAINT [FK_Processes_WasteTypes_wasteTypeId] FOREIGN KEY([wasteTypeId])
REFERENCES [dbo].[WasteTypes] ([wasteTypeId])
GO
ALTER TABLE [dbo].[Processes] CHECK CONSTRAINT [FK_Processes_WasteTypes_wasteTypeId]
GO
ALTER TABLE [dbo].[ProcessPriceXcountryLogs]  WITH CHECK ADD  CONSTRAINT [FK_ProcessPriceXcountryLogs_Countries] FOREIGN KEY([countryId])
REFERENCES [dbo].[Countries] ([countryId])
GO
ALTER TABLE [dbo].[ProcessPriceXcountryLogs] CHECK CONSTRAINT [FK_ProcessPriceXcountryLogs_Countries]
GO
ALTER TABLE [dbo].[ProcessPriceXcountryLogs]  WITH CHECK ADD  CONSTRAINT [FK_ProcessPriceXcountryLogs_Processes] FOREIGN KEY([processId])
REFERENCES [dbo].[Processes] ([processId])
GO
ALTER TABLE [dbo].[ProcessPriceXcountryLogs] CHECK CONSTRAINT [FK_ProcessPriceXcountryLogs_Processes]
GO
ALTER TABLE [dbo].[ProcessPriceXcountryLogs]  WITH CHECK ADD  CONSTRAINT [FK_ProcessPriceXcountryLogs_States_stateId] FOREIGN KEY([stateId])
REFERENCES [dbo].[States] ([stateId])
GO
ALTER TABLE [dbo].[ProcessPriceXcountryLogs] CHECK CONSTRAINT [FK_ProcessPriceXcountryLogs_States_stateId]
GO
ALTER TABLE [dbo].[ProducersHeadquarters]  WITH CHECK ADD  CONSTRAINT [FK_Headquarters_Locations_locationId] FOREIGN KEY([locationId])
REFERENCES [dbo].[Locations] ([locationId])
GO
ALTER TABLE [dbo].[ProducersHeadquarters] CHECK CONSTRAINT [FK_Headquarters_Locations_locationId]
GO
ALTER TABLE [dbo].[ProducersHeadquarters]  WITH CHECK ADD  CONSTRAINT [FK_ProducersHeadquarters_ContacInfo_contacInfoId] FOREIGN KEY([contacInfoId])
REFERENCES [dbo].[ContacInfo] ([contacInfoId])
GO
ALTER TABLE [dbo].[ProducersHeadquarters] CHECK CONSTRAINT [FK_ProducersHeadquarters_ContacInfo_contacInfoId]
GO
ALTER TABLE [dbo].[ProducersHeadquarters]  WITH CHECK ADD  CONSTRAINT [FK_ProducersHeadquarters_Producers] FOREIGN KEY([producerId])
REFERENCES [dbo].[Producers] ([producerId])
GO
ALTER TABLE [dbo].[ProducersHeadquarters] CHECK CONSTRAINT [FK_ProducersHeadquarters_Producers]
GO
ALTER TABLE [dbo].[RegionsAreas]  WITH CHECK ADD  CONSTRAINT [FK_RegionsAreas_Cities_cityId] FOREIGN KEY([cityId])
REFERENCES [dbo].[Cities] ([cityId])
GO
ALTER TABLE [dbo].[RegionsAreas] CHECK CONSTRAINT [FK_RegionsAreas_Cities_cityId]
GO
ALTER TABLE [dbo].[RegionsAreas]  WITH CHECK ADD  CONSTRAINT [FK_RegionsAreas_Countries_countryId] FOREIGN KEY([countryId])
REFERENCES [dbo].[Countries] ([countryId])
GO
ALTER TABLE [dbo].[RegionsAreas] CHECK CONSTRAINT [FK_RegionsAreas_Countries_countryId]
GO
ALTER TABLE [dbo].[RegionsAreas]  WITH CHECK ADD  CONSTRAINT [FK_RegionsAreas_Regions_regionId] FOREIGN KEY([regionId])
REFERENCES [dbo].[Regions] ([regionId])
GO
ALTER TABLE [dbo].[RegionsAreas] CHECK CONSTRAINT [FK_RegionsAreas_Regions_regionId]
GO
ALTER TABLE [dbo].[RegionsAreas]  WITH CHECK ADD  CONSTRAINT [FK_RegionsAreas_States_stateId] FOREIGN KEY([stateId])
REFERENCES [dbo].[States] ([stateId])
GO
ALTER TABLE [dbo].[RegionsAreas] CHECK CONSTRAINT [FK_RegionsAreas_States_stateId]
GO
ALTER TABLE [dbo].[States]  WITH CHECK ADD  CONSTRAINT [FK_Regions_Countries_countryId] FOREIGN KEY([countryId])
REFERENCES [dbo].[Countries] ([countryId])
GO
ALTER TABLE [dbo].[States] CHECK CONSTRAINT [FK_Regions_Countries_countryId]
GO
ALTER TABLE [dbo].[TelephoneXdrivers]  WITH CHECK ADD  CONSTRAINT [FK_TelephoneXdrivers_Drivers_driverId] FOREIGN KEY([driverId])
REFERENCES [dbo].[Drivers] ([driverId])
GO
ALTER TABLE [dbo].[TelephoneXdrivers] CHECK CONSTRAINT [FK_TelephoneXdrivers_Drivers_driverId]
GO
ALTER TABLE [dbo].[TelephoneXdrivers]  WITH CHECK ADD  CONSTRAINT [FK_TelephoneXdrivers_Telephones_telephoneId] FOREIGN KEY([telephoneId])
REFERENCES [dbo].[Telephones] ([telephoneId])
GO
ALTER TABLE [dbo].[TelephoneXdrivers] CHECK CONSTRAINT [FK_TelephoneXdrivers_Telephones_telephoneId]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Contracts_contractId] FOREIGN KEY([contractId])
REFERENCES [dbo].[Contracts] ([contractId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Contracts_contractId]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Money] FOREIGN KEY([moneyId])
REFERENCES [dbo].[Money] ([moneyId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Money]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_MoneyExchange] FOREIGN KEY([moneyExchangeId])
REFERENCES [dbo].[MoneyExchange] ([moneyExchangeId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_MoneyExchange]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Producers_producerId] FOREIGN KEY([producerId])
REFERENCES [dbo].[Producers] ([producerId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Producers_producerId]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_VehiclesModels_vehicleModelId] FOREIGN KEY([modelId])
REFERENCES [dbo].[Models] ([modelId])
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Vehicles_VehiclesModels_vehicleModelId]
GO
ALTER TABLE [dbo].[Waste]  WITH CHECK ADD  CONSTRAINT [FK_Waste_NewProducts_newProductId] FOREIGN KEY([newProductId])
REFERENCES [dbo].[NewProducts] ([newProductId])
GO
ALTER TABLE [dbo].[Waste] CHECK CONSTRAINT [FK_Waste_NewProducts_newProductId]
GO
ALTER TABLE [dbo].[Waste]  WITH CHECK ADD  CONSTRAINT [FK_Waste_WasteTypes_wasteTypeId] FOREIGN KEY([wasteTypeId])
REFERENCES [dbo].[WasteTypes] ([wasteTypeId])
GO
ALTER TABLE [dbo].[Waste] CHECK CONSTRAINT [FK_Waste_WasteTypes_wasteTypeId]
GO
ALTER TABLE [dbo].[WastesTypesXvehicles]  WITH CHECK ADD  CONSTRAINT [FK_WastesTypesXvehicles_Vehicles_vehicleId] FOREIGN KEY([vehicleId])
REFERENCES [dbo].[Vehicles] ([vehicleId])
GO
ALTER TABLE [dbo].[WastesTypesXvehicles] CHECK CONSTRAINT [FK_WastesTypesXvehicles_Vehicles_vehicleId]
GO
ALTER TABLE [dbo].[WastesTypesXvehicles]  WITH CHECK ADD  CONSTRAINT [FK_WastesTypesXvehicles_WasteTypes_wasteType] FOREIGN KEY([wasteType])
REFERENCES [dbo].[WasteTypes] ([wasteTypeId])
GO
ALTER TABLE [dbo].[WastesTypesXvehicles] CHECK CONSTRAINT [FK_WastesTypesXvehicles_WasteTypes_wasteType]
GO
ALTER TABLE [dbo].[WasteXpickingUpCycle]  WITH CHECK ADD  CONSTRAINT [FK_WasteXpickingUpCycle_PickingUpCycle_pickingUpCycleId] FOREIGN KEY([pickingUpCycleId])
REFERENCES [dbo].[PickingUpCycle] ([pickingUpCycleId])
GO
ALTER TABLE [dbo].[WasteXpickingUpCycle] CHECK CONSTRAINT [FK_WasteXpickingUpCycle_PickingUpCycle_pickingUpCycleId]
GO
ALTER TABLE [dbo].[WasteXpickingUpCycle]  WITH CHECK ADD  CONSTRAINT [FK_WasteXpickingUpCycle_Waste_wasteId] FOREIGN KEY([wasteId])
REFERENCES [dbo].[Waste] ([wasteId])
GO
ALTER TABLE [dbo].[WasteXpickingUpCycle] CHECK CONSTRAINT [FK_WasteXpickingUpCycle_Waste_wasteId]
GO
/****** Object:  StoredProcedure [dbo].[SP_IngresarMoney]    Script Date: 02/05/2023 08:45:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SP_IngresarMoney]
	@pMoney TMoneyData READONLY

AS
BEGIN
	
	SET NOCOUNT ON 
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

		-- declaracion de otras variables
	 -- operaciones de select que no tengan que ser bloqueadas -- tratar de hacer todo lo posible antes de q inice la transaccion

	  SET @InicieTransaccion = 0
	 IF @@TRANCOUNT=0 BEGIN  SET @InicieTransaccion = 1
	  SET TRANSACTION ISOLATION LEVEL READ COMMITTED  BEGIN TRANSACTION  
	 END 
	 BEGIN TRY  SET @CustomError = 45000

	  INSERT INTO Money (name,symbol, deleted, defaultMoney )
	  SELECT name,symbol, deleted, defaultMoney 
	  FROM @pMoney 


		IF @InicieTransaccion=1 BEGIN
	   COMMIT
	  END 
	END TRY
	BEGIN CATCH  SET @ErrorNumber = ERROR_NUMBER()
	  SET @ErrorSeverity = ERROR_SEVERITY()  SET @ErrorState = ERROR_STATE()
	  SET @Message = ERROR_MESSAGE()  
	  IF @InicieTransaccion=1 BEGIN   ROLLBACK
	  END  RAISERROR('%s - Error Number: %i', 
	   @ErrorSeverity, @ErrorState, @Message, @CustomError) END CATCH 
END
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[SPIngresarMoney]    Script Date: 02/05/2023 08:45:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SPIngresarMoney]
	@pMoney TMoneyData READONLY

AS
BEGIN
	
	SET NOCOUNT ON 
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

		-- declaracion de otras variables
	 -- operaciones de select que no tengan que ser bloqueadas -- tratar de hacer todo lo posible antes de q inice la transaccion

	  SET @InicieTransaccion = 0
	 IF @@TRANCOUNT=0 BEGIN  SET @InicieTransaccion = 1
	  SET TRANSACTION ISOLATION LEVEL READ COMMITTED  BEGIN TRANSACTION  
	 END 
	 BEGIN TRY  SET @CustomError = 50000

	  INSERT INTO Money (name,symbol, deleted, defaultMoney )
	  SELECT name,symbol, deleted, defaultMoney 
	  FROM @pMoney 


		IF @InicieTransaccion=1 BEGIN
	   COMMIT
	  END 
	END TRY
	BEGIN CATCH  SET @ErrorNumber = ERROR_NUMBER()
	  SET @ErrorSeverity = ERROR_SEVERITY()  SET @ErrorState = ERROR_STATE()
	  SET @Message = ERROR_MESSAGE()  
	  IF @InicieTransaccion=1 BEGIN   ROLLBACK
	  END  RAISERROR('%s - Error Number: %i', 
	   @ErrorSeverity, @ErrorState, @Message, @CustomError) END CATCH 
END
RETURN 0
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Donde 0 entrada y 1 Salida' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Collections', @level2type=N'COLUMN',@level2name=N'operationType'
GO
USE [master]
GO
ALTER DATABASE [EsencialVerde] SET  READ_WRITE 
GO
