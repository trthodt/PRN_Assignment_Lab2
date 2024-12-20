USE [master]
GO
/****** Object:  Database [PRN221_ASSIGNMENT]    Script Date: 10/30/2024 8:36:52 PM ******/
CREATE DATABASE [PRN221_ASSIGNMENT]
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN221_ASSIGNMENT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET  MULTI_USER 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET QUERY_STORE = OFF
GO
USE [PRN221_ASSIGNMENT]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/30/2024 8:36:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 10/30/2024 8:36:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](100) NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 10/30/2024 8:36:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[total]  AS ([quantity]*[price]) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 10/30/2024 8:36:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[total_amount] [decimal](10, 2) NOT NULL,
	[order_date] [datetime] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 10/30/2024 8:36:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[category_id] [int] NULL,
	[created_at] [datetime] NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/30/2024 8:36:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[role] [nvarchar](20) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241028144154_AddQuantityToProduct', N'6.0.0')
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [category_name], [created_at]) VALUES (1, N'Electronics', CAST(N'2024-10-16T13:53:27.260' AS DateTime))
INSERT [dbo].[categories] ([id], [category_name], [created_at]) VALUES (2, N'Home Appliances', CAST(N'2024-10-16T13:53:27.260' AS DateTime))
INSERT [dbo].[categories] ([id], [category_name], [created_at]) VALUES (3, N'Computers & Accessories', CAST(N'2024-10-16T13:53:27.260' AS DateTime))
INSERT [dbo].[categories] ([id], [category_name], [created_at]) VALUES (4, N'Smart Devices', CAST(N'2024-10-16T13:53:27.260' AS DateTime))
INSERT [dbo].[categories] ([id], [category_name], [created_at]) VALUES (5, N'Gaming', CAST(N'2024-10-16T13:53:27.260' AS DateTime))
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[order_details] ON 

INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (1, 1, 7, 1, CAST(799.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (2, 1, 8, 1, CAST(999.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (3, 2, 4, 2, CAST(199.90 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (4, 3, 9, 1, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (5, 3, 1, 1, CAST(699.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (6, 4, 7, 1, CAST(799.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (7, 5, 8, 1, CAST(999.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (8, 6, 10, 1, CAST(249.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (9, 6, 3, 1, CAST(299.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (10, 7, 9, 1, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (11, 7, 4, 3, CAST(199.90 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (12, 8, 8, 1, CAST(999.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (13, 8, 10, 1, CAST(249.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (14, 9, 7, 1, CAST(799.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (15, 9, 1, 1, CAST(699.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (16, 10, 9, 1, CAST(1200.00 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (17, 10, 3, 1, CAST(299.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (18, 11, 10, 1, CAST(249.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (19, 12, 8, 1, CAST(999.99 AS Decimal(10, 2)))
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity], [price]) VALUES (20, 12, 7, 1, CAST(799.99 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [user_id], [total_amount], [order_date], [status]) VALUES (1, 1, CAST(1499.98 AS Decimal(10, 2)), CAST(N'2024-10-30T21:00:00.000' AS DateTime), N'pending')
INSERT [dbo].[orders] ([id], [user_id], [total_amount], [order_date], [status]) VALUES (2, 2, CAST(549.89 AS Decimal(10, 2)), CAST(N'2024-10-30T22:00:00.000' AS DateTime), N'pending')
INSERT [dbo].[orders] ([id], [user_id], [total_amount], [order_date], [status]) VALUES (3, 3, CAST(1899.98 AS Decimal(10, 2)), CAST(N'2024-10-31T10:00:00.000' AS DateTime), N'pending')
INSERT [dbo].[orders] ([id], [user_id], [total_amount], [order_date], [status]) VALUES (4, 4, CAST(1299.99 AS Decimal(10, 2)), CAST(N'2024-10-31T11:30:00.000' AS DateTime), N'pending')
INSERT [dbo].[orders] ([id], [user_id], [total_amount], [order_date], [status]) VALUES (5, 5, CAST(999.99 AS Decimal(10, 2)), CAST(N'2024-10-31T13:00:00.000' AS DateTime), N'pending')
INSERT [dbo].[orders] ([id], [user_id], [total_amount], [order_date], [status]) VALUES (6, 6, CAST(599.99 AS Decimal(10, 2)), CAST(N'2024-10-31T14:00:00.000' AS DateTime), N'pending')
INSERT [dbo].[orders] ([id], [user_id], [total_amount], [order_date], [status]) VALUES (7, 7, CAST(1799.98 AS Decimal(10, 2)), CAST(N'2024-10-31T15:30:00.000' AS DateTime), N'pending')
INSERT [dbo].[orders] ([id], [user_id], [total_amount], [order_date], [status]) VALUES (8, 8, CAST(549.89 AS Decimal(10, 2)), CAST(N'2024-10-31T16:00:00.000' AS DateTime), N'pending')
INSERT [dbo].[orders] ([id], [user_id], [total_amount], [order_date], [status]) VALUES (9, 1, CAST(949.98 AS Decimal(10, 2)), CAST(N'2024-10-31T17:00:00.000' AS DateTime), N'pending')
INSERT [dbo].[orders] ([id], [user_id], [total_amount], [order_date], [status]) VALUES (10, 2, CAST(1299.98 AS Decimal(10, 2)), CAST(N'2024-10-31T18:30:00.000' AS DateTime), N'pending')
INSERT [dbo].[orders] ([id], [user_id], [total_amount], [order_date], [status]) VALUES (11, 3, CAST(249.99 AS Decimal(10, 2)), CAST(N'2024-11-01T09:00:00.000' AS DateTime), N'pending')
INSERT [dbo].[orders] ([id], [user_id], [total_amount], [order_date], [status]) VALUES (12, 4, CAST(1449.98 AS Decimal(10, 2)), CAST(N'2024-11-01T10:30:00.000' AS DateTime), N'pending')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (1, N'Smartphone', N'Latest model smartphone with 5G support', CAST(699.99 AS Decimal(10, 2)), 1, CAST(N'2024-10-16T13:53:27.260' AS DateTime), 10)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (2, N'Laptop', N'High-performance laptop with dfgdfg16GB RAM', CAST(100.00 AS Decimal(10, 2)), 1, CAST(N'2024-10-16T13:53:27.260' AS DateTime), 10)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (3, N'Tablet', N'10-inch tablet with 64GB storage', CAST(299.99 AS Decimal(10, 2)), 3, CAST(N'2024-10-16T13:53:27.260' AS DateTime), 100)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (4, N'Smartwatch', N'Wearable smartwatch with health tracking', CAST(199.90 AS Decimal(10, 2)), 1, CAST(N'2024-10-16T13:53:27.260' AS DateTime), 100)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (5, N'Smartwatch', N'Wearable smartwatch with health tracking.', CAST(199.90 AS Decimal(10, 2)), 4, CAST(N'2024-10-30T16:01:11.303' AS DateTime), 100)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (6, N'Smartwatch', N'Wearable smartwatch with health tracking', CAST(199.90 AS Decimal(10, 2)), 5, CAST(N'2024-10-30T16:01:37.633' AS DateTime), 100)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (7, N'Samsung Galaxy S21', N'Latest model of Samsung Galaxy with high-end camera', CAST(799.99 AS Decimal(10, 2)), 1, CAST(N'2024-10-30T20:03:33.497' AS DateTime), 50)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (8, N'Apple iPhone 13', N'Newest iPhone with improved battery life', CAST(999.99 AS Decimal(10, 2)), 1, CAST(N'2024-10-30T20:03:33.497' AS DateTime), 30)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (9, N'Dell XPS 13 Laptop', N'Powerful laptop with 16GB RAM and 512GB SSD', CAST(1200.00 AS Decimal(10, 2)), 3, CAST(N'2024-10-30T20:03:33.497' AS DateTime), 25)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (10, N'Apple AirPods Pro', N'Wireless earphones with noise cancellation', CAST(249.99 AS Decimal(10, 2)), 4, CAST(N'2024-10-30T20:03:33.497' AS DateTime), 100)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (11, N'Sony PlayStation 5', N'Next-generation gaming console', CAST(300.00 AS Decimal(10, 2)), 5, CAST(N'2024-10-30T20:03:33.497' AS DateTime), 25)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (12, N'Smartwatch', N'Wearable smartwatch with health tracking.', CAST(199.90 AS Decimal(10, 2)), 4, CAST(N'2024-10-30T16:01:11.303' AS DateTime), 100)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (13, N'Smartwatch', N'Wearable smartwatch with health tracking', CAST(199.90 AS Decimal(10, 2)), 5, CAST(N'2024-10-30T16:01:37.633' AS DateTime), 100)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (14, N'Samsung Galaxy S21', N'Latest model of Samsung Galaxy with high-end camera', CAST(799.99 AS Decimal(10, 2)), 1, CAST(N'2024-10-30T20:03:33.497' AS DateTime), 50)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (15, N'Apple iPhone 13', N'Newest iPhone with improved battery life', CAST(999.99 AS Decimal(10, 2)), 1, CAST(N'2024-10-30T20:03:33.497' AS DateTime), 30)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (16, N'Dell XPS 13 Laptop', N'Powerful laptop with 16GB RAM and 512GB SSD', CAST(1200.00 AS Decimal(10, 2)), 3, CAST(N'2024-10-30T20:03:33.497' AS DateTime), 25)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (17, N'Apple AirPods Pro', N'Wireless earphones with noise cancellation', CAST(249.99 AS Decimal(10, 2)), 4, CAST(N'2024-10-30T20:03:33.497' AS DateTime), 100)
INSERT [dbo].[products] ([id], [product_name], [description], [price], [category_id], [created_at], [Quantity]) VALUES (18, N'Sony PlayStation 5', N'Next-generation gaming console', CAST(300.00 AS Decimal(10, 2)), 5, CAST(N'2024-10-30T20:03:33.497' AS DateTime), 25)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [fullname], [email], [password], [role], [created_at]) VALUES (1, N'Truong Tho', N'tho@gmail.com', N'123', N'customer', CAST(N'2024-10-16T13:53:27.253' AS DateTime))
INSERT [dbo].[users] ([id], [fullname], [email], [password], [role], [created_at]) VALUES (2, N'Alice', N'alice@gmail.com', N'123', N'customer', CAST(N'2024-10-16T13:53:27.253' AS DateTime))
INSERT [dbo].[users] ([id], [fullname], [email], [password], [role], [created_at]) VALUES (3, N'Admin User', N'admin@gmail.com', N'123', N'admin', CAST(N'2024-10-16T13:53:27.253' AS DateTime))
INSERT [dbo].[users] ([id], [fullname], [email], [password], [role], [created_at]) VALUES (4, N'John Doe', N'johndoe@example.com', N'password123', N'customer', CAST(N'2024-10-30T20:03:26.247' AS DateTime))
INSERT [dbo].[users] ([id], [fullname], [email], [password], [role], [created_at]) VALUES (5, N'Jane Smith', N'janesmith@example.com', N'password123', N'customer', CAST(N'2024-10-30T20:03:26.247' AS DateTime))
INSERT [dbo].[users] ([id], [fullname], [email], [password], [role], [created_at]) VALUES (6, N'Michael Brown', N'michaelbrown@example.com', N'password123', N'customer', CAST(N'2024-10-30T20:03:26.247' AS DateTime))
INSERT [dbo].[users] ([id], [fullname], [email], [password], [role], [created_at]) VALUES (7, N'Emily Davis', N'emilydavis@example.com', N'password123', N'customer', CAST(N'2024-10-30T20:03:26.247' AS DateTime))
INSERT [dbo].[users] ([id], [fullname], [email], [password], [role], [created_at]) VALUES (8, N'Sarah Johnson', N'sarahjohnson@example.com', N'password123', N'customer', CAST(N'2024-10-30T20:03:26.247' AS DateTime))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__categori__5189E255ABB5597E]    Script Date: 10/30/2024 8:36:52 PM ******/
ALTER TABLE [dbo].[categories] ADD UNIQUE NONCLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__categori__5189E255F0CA962D]    Script Date: 10/30/2024 8:36:52 PM ******/
ALTER TABLE [dbo].[categories] ADD UNIQUE NONCLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E61642C32EC9B]    Script Date: 10/30/2024 8:36:52 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E61649720F5B0]    Script Date: 10/30/2024 8:36:52 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[categories] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('pending') FOR [status]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('customer') FOR [role]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([status]='canceled' OR [status]='delivered' OR [status]='shipped' OR [status]='pending'))
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([status]='canceled' OR [status]='delivered' OR [status]='shipped' OR [status]='pending'))
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([role]='admin' OR [role]='customer'))
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([role]='admin' OR [role]='customer'))
GO
USE [master]
GO
ALTER DATABASE [PRN221_ASSIGNMENT] SET  READ_WRITE 
GO
