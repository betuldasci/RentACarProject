USE [CarRental22]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26.01.2024 23:02:52 ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 26.01.2024 23:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 26.01.2024 23:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 26.01.2024 23:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 26.01.2024 23:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 26.01.2024 23:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 26.01.2024 23:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Surname] [nvarchar](max) NULL,
	[Age] [int] NULL,
	[Balance] [float] NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 26.01.2024 23:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 26.01.2024 23:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[IsStatus] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 26.01.2024 23:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Model] [nvarchar](max) NULL,
	[Year] [nvarchar](max) NULL,
	[DoorNumber] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[IsStatus] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[BrandId] [int] NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 26.01.2024 23:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RentalId] [int] NOT NULL,
	[PaymentTotal] [float] NOT NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[IsStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rental]    Script Date: 26.01.2024 23:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationUserId] [nvarchar](450) NULL,
	[CarId] [int] NOT NULL,
	[RentalStartDate] [datetime2](7) NOT NULL,
	[RentalEndDate] [datetime2](7) NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[IsStatus] [bit] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[Surname] [nvarchar](max) NULL,
 CONSTRAINT [PK_Rental] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240121221556_createdb', N'6.0.24')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240122141529_BrandAdded', N'6.0.24')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240122141705_BrandAdded2', N'6.0.24')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240122234354_birsurusey', N'6.0.24')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240125072950_deneme', N'6.0.24')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1376f02d-2fbd-45f5-9686-3b6d600290c3', N'Customer', N'CUSTOMER', N'108ea5ff-74a4-4d1d-833e-2130a58390ec')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'49d1de43-1d27-4f2c-a857-26f10bfd59c8', N'Admin', N'ADMIN', N'f26ceec9-ca34-499a-8573-a605cedb014e')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'24c0375b-24ea-4352-9f0c-a7db76d44f2e', N'1376f02d-2fbd-45f5-9686-3b6d600290c3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'33aaa30c-4a2a-4089-b92f-edbd1c36711c', N'1376f02d-2fbd-45f5-9686-3b6d600290c3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f5d918e1-2dee-4c49-b00d-7374c5124103', N'1376f02d-2fbd-45f5-9686-3b6d600290c3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'dc985989-5cc7-4ba2-8a88-8620be5eb993', N'49d1de43-1d27-4f2c-a857-26f10bfd59c8')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [Surname], [Age], [Balance], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'24c0375b-24ea-4352-9f0c-a7db76d44f2e', N'ApplicationUser', N'İrem', N'Gündoğdu', 0, 10, N'iremnisa@gmail.com', N'IREMNISA@GMAIL.COM', N'iremnisa@gmail.com', N'IREMNISA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBCi9YNUUDwvK1NWGZb1gOrKpfl/pS9S0OgswSoZfgXPEXaS95/msCCn9+csllQWIA==', N'SUSZUDL3X5OUG3L2A4RTGD52LBDL2YE2', N'c8844960-4821-442b-8d3a-baa41315392e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [Surname], [Age], [Balance], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'33aaa30c-4a2a-4089-b92f-edbd1c36711c', N'ApplicationUser', N'ceren', N'kurnaz', 0, 10, N'ceren@gmail.com', N'CEREN@GMAIL.COM', N'ceren@gmail.com', N'CEREN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFe3D8E3y4omclnf1k1fJ+Z75pPQTcqes2XlzxcuSntxD/m0TIQCXYGgO/hOAvkMWQ==', N'ATGR26IKLD46CLT55K2VBZCIABBD4V5O', N'e7ea794d-ffde-468a-9d59-3ae0f5361bb2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [Surname], [Age], [Balance], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'dc985989-5cc7-4ba2-8a88-8620be5eb993', N'ApplicationUser', N'admin', N'admin', 0, 10, N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMNWk1gux+Wk/C4xOLplCmrbtDnVczEk51XqrIkR8Y+gUBEEYSlUe/2gPgI4122vXg==', N'VYCIFZVQ23U7QOPHB66UTBNVNNUD63IK', N'dd422df7-c533-49fc-99d9-1f252a32cbc8', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [Surname], [Age], [Balance], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f5d918e1-2dee-4c49-b00d-7374c5124103', N'ApplicationUser', N'ceren', N'kurnaz', 0, 10, N'ceren2@gmail.com', N'CEREN2@GMAIL.COM', N'ceren2@gmail.com', N'CEREN2@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOJN+Q90IQddoZtVwjs4sjdzYwBOWsWYU+lJnod1uxSsCl4NZzvS0gjwemJaWLg7eQ==', N'X64FTAYTHUARIKXR7BKX6TGOZZSBQZK7', N'a5459362-cdd0-474d-b9c0-eadbf4c4302e', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Image], [IsStatus], [IsDelete]) VALUES (1, N'Mercedes', N'fbef19f7-8cc3-48f5-93be-7cbd2121a09d.jpeg', 1, 1)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [IsStatus], [IsDelete]) VALUES (2, N'BMW', N'6d4e5ac9-9c61-478e-9d68-41f109c57dfa.jpg', 1, 1)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [IsStatus], [IsDelete]) VALUES (3, N'Ford', N'43762126-3c45-4191-86e0-983c4b0a945f.jpg', 1, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [IsStatus], [IsDelete]) VALUES (4, N'Toyota', N'6d0657e3-75f1-4a37-a2af-0a29400cd9bd.jpg', 1, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [IsStatus], [IsDelete]) VALUES (5, N'BMW', N'157ee016-a44e-4aed-b556-d3bb59eb2295.jpg', 1, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [IsStatus], [IsDelete]) VALUES (6, N'Mercedes-Benz', N'9b9ff3c1-5a41-42a9-98e3-9dfde8690b39.jpg', 1, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [IsStatus], [IsDelete]) VALUES (7, N'Audi', N'b645f102-03a3-4431-bfc5-598599427021.jpg', 1, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Image], [IsStatus], [IsDelete]) VALUES (8, N'Volkswagen', N'6fdd92fb-1464-408e-b4c7-e0071a90d381.png', 1, 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([Id], [Image], [Description], [Model], [Year], [DoorNumber], [Price], [IsStatus], [IsDelete], [BrandId]) VALUES (5, N'796d4c5a-aa8d-4a6d-bc2b-02dc210ac80e.jpeg', N'Compact and efficient, perfect for city driving.', N'Fiesta', N'2019', 4, 2000, 1, 0, 3)
INSERT [dbo].[Car] ([Id], [Image], [Description], [Model], [Year], [DoorNumber], [Price], [IsStatus], [IsDelete], [BrandId]) VALUES (6, N'3525dc09-bac8-458a-89f4-4e1c72e0bbed.jpg', N'A classic American muscle car for the ultimate driving experience.', N'Mustang', N'2021', 2, 3500, 1, 0, 3)
INSERT [dbo].[Car] ([Id], [Image], [Description], [Model], [Year], [DoorNumber], [Price], [IsStatus], [IsDelete], [BrandId]) VALUES (7, N'a0b03b0a-57cb-4f71-b3c9-f63409fe29e4.jpeg', N'Reliable and fuel-efficient, great for everyday use', N'Corolla', N'2020', 4, 2200, 1, 0, 4)
INSERT [dbo].[Car] ([Id], [Image], [Description], [Model], [Year], [DoorNumber], [Price], [IsStatus], [IsDelete], [BrandId]) VALUES (8, N'ac38ea82-fb9c-492c-bfba-68cd248f20e1.png', N'Comfortable interior and smooth ride, perfect for long drives.', N'Camry', N'2021', 4, 2500, 1, 0, 4)
INSERT [dbo].[Car] ([Id], [Image], [Description], [Model], [Year], [DoorNumber], [Price], [IsStatus], [IsDelete], [BrandId]) VALUES (9, N'1d514f16-c9a7-4611-8d30-96f231a53027.jpg', N'Sporty and stylish, with top performance and luxury.', N'3 Series', N'2020', 4, 3000, 1, 0, 5)
INSERT [dbo].[Car] ([Id], [Image], [Description], [Model], [Year], [DoorNumber], [Price], [IsStatus], [IsDelete], [BrandId]) VALUES (10, N'b87abbff-6fd8-43ad-bd55-98c16e06cecc.jpg', N'A luxury SUV with powerful performance and spacious interior.', N'X5', N'2021', 4, 4500, 1, 0, 5)
INSERT [dbo].[Car] ([Id], [Image], [Description], [Model], [Year], [DoorNumber], [Price], [IsStatus], [IsDelete], [BrandId]) VALUES (11, N'eb8e0a21-70f9-405c-9dd5-99822ad7d372.jpg', N'Elegant and sophisticated, with advanced technology.', N'C Class', N'2020', 4, 4500, 1, 0, 6)
INSERT [dbo].[Car] ([Id], [Image], [Description], [Model], [Year], [DoorNumber], [Price], [IsStatus], [IsDelete], [BrandId]) VALUES (12, N'82b64beb-1419-4cfd-89ed-9b6a77f2eb35.jpg', N'A versatile SUV combining luxury and off-road capability.', N'GLE', N'2021', 4, 4800, 1, 0, 6)
INSERT [dbo].[Car] ([Id], [Image], [Description], [Model], [Year], [DoorNumber], [Price], [IsStatus], [IsDelete], [BrandId]) VALUES (13, N'7faade89-e2b1-48bd-a5d7-a5d88943cf1d.jpg', N'Stylish design with a comfortable and high-tech interior.', N'A4', N'2020', 4, 2800, 1, 0, 7)
INSERT [dbo].[Car] ([Id], [Image], [Description], [Model], [Year], [DoorNumber], [Price], [IsStatus], [IsDelete], [BrandId]) VALUES (14, N'8b0fe2ef-fcd7-4b16-a663-2f83e452d10d.jpg', N'A luxury SUV with impressive performance and state of the art features.', N'Q7', N'2021', 4, 5000, 1, 0, 7)
INSERT [dbo].[Car] ([Id], [Image], [Description], [Model], [Year], [DoorNumber], [Price], [IsStatus], [IsDelete], [BrandId]) VALUES (15, N'3f1b7723-89af-48b7-84a7-58498153ca93.jpg', N'A versatile and reliable compact car.', N'Golf', N'2020', 4, 1800, 1, 0, 8)
INSERT [dbo].[Car] ([Id], [Image], [Description], [Model], [Year], [DoorNumber], [Price], [IsStatus], [IsDelete], [BrandId]) VALUES (16, N'646e7b5c-0320-4fd5-b2d2-72348b4d40c2.jpeg', N'Spacious and comfortable, a great family SUV.', N'Tiguan', N'2021', 4, 2700, 1, 0, 8)
SET IDENTITY_INSERT [dbo].[Car] OFF
GO
SET IDENTITY_INSERT [dbo].[Rental] ON 

INSERT [dbo].[Rental] ([Id], [ApplicationUserId], [CarId], [RentalStartDate], [RentalEndDate], [TotalPrice], [IsStatus], [Address], [City], [Country], [Name], [PostalCode], [Surname]) VALUES (122, N'33aaa30c-4a2a-4089-b92f-edbd1c36711c', 5, CAST(N'2024-01-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-01-28T00:00:00.0000000' AS DateTime2), 6000, 0, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Rental] OFF
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Brand_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Brand_BrandId]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Rental_RentalId] FOREIGN KEY([RentalId])
REFERENCES [dbo].[Rental] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Rental_RentalId]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Car_CarId] FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Car_CarId]
GO
