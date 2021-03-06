use master;
go
drop database [SunshineStore]
go
create database [SunshineStore]
go
USE [SunshineStore]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 2/23/2022 6:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[BirthDay] [date] NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Email] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[Gender] [bit] NOT NULL,
	[CreateDate] [date] NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 2/23/2022 6:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/23/2022 6:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 2/23/2022 6:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](2000) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Content] [nvarchar](2000) NOT NULL,
	[CreateDate] [date] NULL,
	[AccountId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/23/2022 6:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Sale] [int] NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/23/2022 6:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
	[CustomerId] [int] NULL,
	[PaymentmethodId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paymentmethods]    Script Date: 2/23/2022 6:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paymentmethods](
	[PaymentmethodId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentmethodName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentmethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/23/2022 6:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NULL,
	[Size] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Sale] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[BrandId] [int] NULL,
	[Image] [nchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 
GO
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Address], [BirthDay], [PhoneNumber], [Email], [Active], [Gender], [CreateDate], [UserName], [Password], [Role]) VALUES (1, N'Dương Tấn Lực', N'Hồ Chí Minh', CAST(N'2000-01-01' AS Date), N'0394568769', N'lucdtps17380@fpt.edu.vn', 1, 0, CAST(N'2000-01-01' AS Date), N'Admin', N'123', 0)
GO
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Address], [BirthDay], [PhoneNumber], [Email], [Active], [Gender], [CreateDate], [UserName], [Password], [Role]) VALUES (2, N'User1', N'Bình Dương', CAST(N'1999-02-02' AS Date), N'0111111111', N'User1@fpt.edu.vn', 1, 0, CAST(N'2000-01-01' AS Date), N'User1', N'123', 1)
GO
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Address], [BirthDay], [PhoneNumber], [Email], [Active], [Gender], [CreateDate], [UserName], [Password], [Role]) VALUES (3, N'User2', N'Vũng Tàu', CAST(N'2000-03-03' AS Date), N'0222222222', N'User2@fpt.edu.vn', 1, 0, CAST(N'2000-01-01' AS Date), N'User2', N'123', 1)
GO
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Address], [BirthDay], [PhoneNumber], [Email], [Active], [Gender], [CreateDate], [UserName], [Password], [Role]) VALUES (4, N'User3', N'Đắk Lắk', CAST(N'2000-04-04' AS Date), N'0333333333', N'User3@fpt.edu.vn', 1, 0, CAST(N'2000-01-01' AS Date), N'User3', N'123', 1)
GO
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Address], [BirthDay], [PhoneNumber], [Email], [Active], [Gender], [CreateDate], [UserName], [Password], [Role]) VALUES (5, N'User4', N'Bình Thuận', CAST(N'2000-05-06' AS Date), N'0444444444', N'User4@fpt.edu.vn', 1, 0, CAST(N'2000-01-01' AS Date), N'User4', N'123', 1)
GO
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Address], [BirthDay], [PhoneNumber], [Email], [Active], [Gender], [CreateDate], [UserName], [Password], [Role]) VALUES (6, N'User5', N'Đồng Nai', CAST(N'2000-06-06' AS Date), N'0555555555', N'User5@fpt.edu.vn', 1, 0, CAST(N'2000-01-01' AS Date), N'User5', N'123', 1)
GO
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Address], [BirthDay], [PhoneNumber], [Email], [Active], [Gender], [CreateDate], [UserName], [Password], [Role]) VALUES (7, N'User6', N'Cần Thơ', CAST(N'2000-07-07' AS Date), N'0666666666', N'User6@fpt.edu.vn', 1, 0, CAST(N'2000-01-01' AS Date), N'User6', N'123', 1)
GO
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Address], [BirthDay], [PhoneNumber], [Email], [Active], [Gender], [CreateDate], [UserName], [Password], [Role]) VALUES (8, N'User7', N'Tiền Giang', CAST(N'2000-08-08' AS Date), N'0777777777', N'User7@fpt.edu.vn', 1, 0, CAST(N'2000-01-01' AS Date), N'User7', N'123', 1)
GO
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Address], [BirthDay], [PhoneNumber], [Email], [Active], [Gender], [CreateDate], [UserName], [Password], [Role]) VALUES (9, N'User8', N'Đà Lạt', CAST(N'2000-09-09' AS Date), N'0888888888', N'User8@fpt.edu.vn', 1, 0, CAST(N'2000-01-01' AS Date), N'User8', N'123', 1)
GO
INSERT [dbo].[Accounts] ([AccountId], [AccountName], [Address], [BirthDay], [PhoneNumber], [Email], [Active], [Gender], [CreateDate], [UserName], [Password], [Role]) VALUES (10, N'User9', N'Hà Nội', CAST(N'2000-10-10' AS Date), N'0999999999', N'User9@fpt.edu.vn', 1, 0, CAST(N'2000-01-01' AS Date), N'User9', N'123', 1)
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (1, N'Nike')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (2, N'Adidas')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (3, N'Puma')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (4, N'Chanel')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (5, N'Louis Vuitton')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (6, N'Hermes')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (7, N'Gucci')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (8, N'H&M')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (9, N'Zalando')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (10, N'Tiffany & Co.')
GO
INSERT [dbo].[Brands] ([BrandId], [BrandName]) VALUES (11, N'Zara')
GO
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Accessories')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Bag & Hats')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Polo Shirts')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'Shirts')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'Shoes , Boots & Trainers')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (6, N'Short')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (7, N'Sunglasses')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (8, N'Swimwear')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (9, N'Trousers & Chinos')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (10, N'T-Shirt & Vests')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (11, N'Bag')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (12, N'Underwear & Socks')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 
GO
INSERT [dbo].[News] ([NewId], [Title], [Description], [Content], [CreateDate], [AccountId]) VALUES (1, N'Battlefield 2042 players are joining XP farming servers only to discover that they''re the crops', N'DICE temporarily disabled XP in custom Battlefield Portal servers before the weekend, so the XP farms have mostly disappeared for now. (I did see one still going, even though no one''s getting any XP from it.)', N'Original story: Battlefield Portal is a tool for creating, hosting, and discovering custom game modes in Battlefield 2042. You can make silly stuff, like 1v64 or knives-only modes, or complex deathmatch variants, or classic Battlefield throwbacks—or you can do what everyone who''s currently hogging all the Portal server capacity is doing and make XP farming modes. It''s frustrating to see a potentially cool custom server tool dominated by bot matches designed for grinding XP, but while investigating the issue, I discovered that a beautiful thing is happening: Players are joining XP farming servers hoping to rack up attachment unlocks, but are instead discovering that they''re the XP being farmed.', CAST(N'2021-03-26' AS Date), 1)
GO
INSERT [dbo].[News] ([NewId], [Title], [Description], [Content], [CreateDate], [AccountId]) VALUES (2, N'Skyrim Anniversary Edition is causing crashes by running too efficiently . Watch it now .', N'If you''re getting a black screen after loading a modded save in Skyrim Anniversary Edition, here''s a fix for that.', N'In preparation for Skyrim Anniversary Edition, and the modpocalypse expected to follow its release, I trimmed my mod load down to a respectable handful. Essentials like Alternate Start - Live Another Life and some additional followers, including Inigo and Lucien. I started a new game and everything was fine, until I quit to do some actual work and then tried to reload that game on my lunch break. A black screen, with the music still playing, was all I got. None of the usual Skyrim tricks—switching to fullscreen borderless mode, running it as an administrator with Windows 7 compatibility on—seemed to help, and then I found a post from modder Joseph Russell, the creator of Lucien, who has figured what''s causing out the issue. Turns out other players are having the same crash, which is caused by the latest build of Skyrim running scripts faster than previous ones did. This causes problems with mods, like Russell''s, that rely on them. Whether you bought the Anniversary Edition or not, your version of Skyrim Special Edition has automatically updated to one built with a new compiler, Visual Studio 2019 rather than Visual Studio 2015. And that seems to have made it slightly too efficient for its own good.', CAST(N'2021-04-24' AS Date), 1)
GO
INSERT [dbo].[News] ([NewId], [Title], [Description], [Content], [CreateDate], [AccountId]) VALUES (3, N'Dataminers are finding developer comments and unlicensed songs in GTA Trilogy', N'The Rockstar Games Launcher on PC went down yesterday, shortly after the release of Grand Theft Auto . Watch it now .', N'The Rockstar Games Launcher on PC went down yesterday, shortly after the release of Grand Theft Auto: The Trilogy, and most Rockstar titles are currently still unplayable on PC (Update 4:00 pm PST: the launcher and games are back online, but GTA Trilogy remains unavailable, while Rockstar says it needs to "remove files unintentionally included in these versions"). Whether the launch of the GTA Trilogy had anything to do with it is unknown, but several GTA dataminers have turned up material that may suggest why Rockstar''s remasters have run into problems. Firstly, the Trilogy has shipped with internal developer comments visible on the code, such as the below. "This shit doesn''t work the way they wrote it below so we''ll just show the text and place the blip at the beginning of the mission," reads one of the in-code comments. Life at the coalface. PC Gamer asked Vadim M., who shared the above and is something of an expert at data-diving in Rockstar games and finding obscurities, what exactly''s been left in GTA: The Trilogy''s files. "The developers left in the files uncompiled mission/script sources. This is an internal file where they coded scripts in the ''native language'' and made notes. Of course, these sources were never meant for the public, but, in my opinion, it isn''t something that worth a take down [of the Trilogy]."', CAST(N'2021-06-25' AS Date), 1)
GO
INSERT [dbo].[News] ([NewId], [Title], [Description], [Content], [CreateDate], [AccountId]) VALUES (4, N'Escape into a beautiful world of gardening, village-building, and giving belly rubs to bugs', N'Grow: Song of the Evertree is a bit of Animal Crossing and My Time at Portia, with a smidge of The Legend of Zelda.', N'I know everyone is busy blasting each other in Halo Infinite and Battlefield 2042, but I''m a little tied up right now catching fish, singing to plants, building libraries, and giving belly rubs to adorable bugs. That''s exactly the kind of escapism I need right now, and I''ve found it in the surprisingly beautiful and stress-free sandbox Grow: Song of the Evertree. It''s a healthy dose of Animal Crossing and My Time at Portia, with a tiny sprinkle of Zelda thrown in. There''s village building and decorating, goofy people to meet and make happy, loads of little quests and activities, plus lots of gardening, fishing, dress-up, and even some light dungeon platforming and puzzle solving. You even get to mix a bunch of ingredients in a talking cauldron and make your own little worlds. I''ll make the short story shorter: A bunch of nice people lived in a giant magical peaceful world-tree. Then the tree got sick and a bunch of thorny vines squeezed all the life out of it, and everyone left. But you''re here now, a helpful apprentice tree-tender, and you need to rebuild the town, dispel the thorns, and slowly bring life back to the world, which will encourage people to move back.', CAST(N'2021-10-14' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (2, 50, 3, 0, 2, 32)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (3, 32, 2, 0, 20, 1)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (4, 127, 2, 0, 20, 20)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (5, 57, 1, 0, 3, 13)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (6, 58, 2, 0, 21, 26)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (7, 73, 1, 0, 21, 26)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (8, 132, 1, 0, 19, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (9, 87, 4, 0, 21, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (10, 83, 3, 0, 19, 22)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (11, 114, 1, 0, 21, 15)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (12, 130, 3, 0, 4, 16)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (13, 58, 1, 0, 21, 22)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (14, 90, 4, 0, 17, 13)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (15, 74, 1, 0, 12, 35)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (16, 117, 4, 0, 5, 21)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (17, 60, 2, 0, 14, 23)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (18, 65, 4, 0, 7, 19)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (19, 108, 4, 0, 11, 1)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (20, 5, 4, 0, 11, 5)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (21, 113, 4, 0, 6, 21)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (22, 28, 1, 48, 17, 24)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (23, 54, 1, 53, 12, 17)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (24, 48, 4, 48, 6, 12)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (25, 36, 4, 16, 13, 9)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (26, 125, 3, 36, 13, 8)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (27, 73, 2, 13, 3, 25)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (28, 22, 4, 39, 3, 2)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (29, 99, 4, 54, 3, 10)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (30, 29, 3, 29, 17, 1)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [Price], [Quantity], [Sale], [OrderId], [ProductId]) VALUES (31, 99, 4, 20, 12, 4)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (2, CAST(N'2021-01-15T00:00:00.000' AS DateTime), N'Hồ Chí Minh', 1, 5, 3)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (3, CAST(N'2021-01-19T00:00:00.000' AS DateTime), N'BÌnh Dương', 1, 9, 1)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (4, CAST(N'2021-02-18T00:00:00.000' AS DateTime), N'Vũng Tàu', 1, 7, 1)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (5, CAST(N'2021-03-19T00:00:00.000' AS DateTime), N'Cần Thơ', 1, 10, 2)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (6, CAST(N'2021-03-29T00:00:00.000' AS DateTime), N'Hồ Chí Minh', 1, 3, 4)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (7, CAST(N'2021-04-13T00:00:00.000' AS DateTime), N'BÌnh Dương', 1, 6, 1)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (8, CAST(N'2021-05-12T00:00:00.000' AS DateTime), N'Vũng Tàu', 1, 9, 2)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (9, CAST(N'2021-06-01T00:00:00.000' AS DateTime), N'Cần Thơ', 1, 3, 2)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (10, CAST(N'2021-06-24T00:00:00.000' AS DateTime), N'Hồ Chí Minh', 1, 6, 3)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (11, CAST(N'2021-07-06T00:00:00.000' AS DateTime), N'BÌnh Dương', 1, 5, 1)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (12, CAST(N'2021-07-31T00:00:00.000' AS DateTime), N'Vũng Tàu', 1, 9, 1)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (13, CAST(N'2021-08-21T00:00:00.000' AS DateTime), N'Cần Thơ', 1, 10, 3)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (14, CAST(N'2021-08-31T00:00:00.000' AS DateTime), N'Hồ Chí Minh', 1, 2, 1)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (15, CAST(N'2021-09-02T00:00:00.000' AS DateTime), N'BÌnh Dương', 1, 5, 2)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (16, CAST(N'2021-09-17T00:00:00.000' AS DateTime), N'Vũng Tàu', 1, 6, 2)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (17, CAST(N'2021-09-20T00:00:00.000' AS DateTime), N'Cần Thơ', 1, 4, 4)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (18, CAST(N'2021-09-26T00:00:00.000' AS DateTime), N'Hồ Chí Minh', 1, 3, 3)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (19, CAST(N'2021-09-26T00:00:00.000' AS DateTime), N'BÌnh Dương', 1, 2, 1)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (20, CAST(N'2021-09-27T00:00:00.000' AS DateTime), N'Vũng Tàu', 1, 9, 2)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Address], [Status], [CustomerId], [PaymentmethodId]) VALUES (21, CAST(N'2021-10-07T00:00:00.000' AS DateTime), N'Cần Thơ', 1, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Paymentmethods] ON 
GO
INSERT [dbo].[Paymentmethods] ([PaymentmethodId], [PaymentmethodName]) VALUES (1, N'Cash')
GO
INSERT [dbo].[Paymentmethods] ([PaymentmethodId], [PaymentmethodName]) VALUES (2, N'ATM')
GO
INSERT [dbo].[Paymentmethods] ([PaymentmethodId], [PaymentmethodName]) VALUES (3, N'Banking')
GO
INSERT [dbo].[Paymentmethods] ([PaymentmethodId], [PaymentmethodName]) VALUES (4, N'Visa')
GO
SET IDENTITY_INSERT [dbo].[Paymentmethods] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (1, N'Polo Shirt 1', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Black,Blue', N'A polo shirt, tennis shirt, golf shirt, chukker shirt[1] or chukka shirt[citation needed] is a form of shirt with a collar, a placket neckline with two or three buttons, and an optional pocket. Polo shirts are usually short sleeved; they were used by polo players originally in India in 1859 and in Great Britain during the 1920s.[2]', 24.61, 36, 0, 3, 1, N'product-1.jpg                                     ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (2, N'Polo Shirt 2', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Yellow', N'A polo shirt, tennis shirt, golf shirt, chukker shirt[1] or chukka shirt[citation needed] is a form of shirt with a collar, a placket neckline with two or three buttons, and an optional pocket. Polo shirts are usually short sleeved; they were used by polo players originally in India in 1859 and in Great Britain during the 1920s.[2]', 96.24, 31, 10, 3, 7, N'product-2.jpg                                     ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (3, N'Polo Shirt 3', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'Pink', N'A polo shirt, tennis shirt, golf shirt, chukker shirt[1] or chukka shirt[citation needed] is a form of shirt with a collar, a placket neckline with two or three buttons, and an optional pocket. Polo shirts are usually short sleeved; they were used by polo players originally in India in 1859 and in Great Britain during the 1920s.[2]', 96.77, 75, 20, 3, 8, N'product-3.jpg                                     ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (4, N'Polo Shirt 4', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Yellow', N'A polo shirt, tennis shirt, golf shirt, chukker shirt[1] or chukka shirt[citation needed] is a form of shirt with a collar, a placket neckline with two or three buttons, and an optional pocket. Polo shirts are usually short sleeved; they were used by polo players originally in India in 1859 and in Great Britain during the 1920s.[2]', 81.57, 79, 0, 3, 8, N'product-4.jpg                                     ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (5, N'Polo Shirt 5', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'Pink', N'A polo shirt, tennis shirt, golf shirt, chukker shirt[1] or chukka shirt[citation needed] is a form of shirt with a collar, a placket neckline with two or three buttons, and an optional pocket. Polo shirts are usually short sleeved; they were used by polo players originally in India in 1859 and in Great Britain during the 1920s.[2]', 92.68, 31, 0, 3, 9, N'product-5.jpg                                     ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (6, N'Shirt 6', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Black,Blue', N'Originally an undergarment worn exclusively by men, it has become, in American English, a catch-all term for a broad variety of upper-body garments and undergarments. In British English, a shirt is more specifically a garment with a collar, sleeves with cuffs, and a full vertical opening with buttons or snaps (North Americans would call that a "dress shirt", a specific type of collared shirt). A shirt can also be worn with a necktie under the shirt collar.', 64.05, 96, 30, 4, 6, N'product-6.jpg                                     ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (7, N'Shirt 7', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Yellow', N'Originally an undergarment worn exclusively by men, it has become, in American English, a catch-all term for a broad variety of upper-body garments and undergarments. In British English, a shirt is more specifically a garment with a collar, sleeves with cuffs, and a full vertical opening with buttons or snaps (North Americans would call that a "dress shirt", a specific type of collared shirt). A shirt can also be worn with a necktie under the shirt collar.', 92.17, 0, 0, 4, 6, N'product-7.jpg                                     ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (8, N'Shirt 8', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'Pink', N'Originally an undergarment worn exclusively by men, it has become, in American English, a catch-all term for a broad variety of upper-body garments and undergarments. In British English, a shirt is more specifically a garment with a collar, sleeves with cuffs, and a full vertical opening with buttons or snaps (North Americans would call that a "dress shirt", a specific type of collared shirt). A shirt can also be worn with a necktie under the shirt collar.', 9.67, 84, 10, 4, 9, N'product-8.jpg                                     ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (9, N'Trousers 9', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Black,Blue', N'In the United Kingdom, the word pants generally means underwear and not trousers.[1] Shorts are similar to trousers, but with legs that come down only to around the area of the knee, higher or lower depending on the style of the garment. To distinguish them from shorts, trousers may be called "long trousers" in certain contexts such as school uniform, where tailored shorts may be called "short trousers" in the UK.', 69.09, 37, 20, 9, 6, N'product-9.jpg                                     ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (10, N'Trousers 10', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Yellow', N'In the United Kingdom, the word pants generally means underwear and not trousers.[1] Shorts are similar to trousers, but with legs that come down only to around the area of the knee, higher or lower depending on the style of the garment. To distinguish them from shorts, trousers may be called "long trousers" in certain contexts such as school uniform, where tailored shorts may be called "short trousers" in the UK.', 27.47, 49, 30, 9, 3, N'product-10.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (11, N'Trousers 11', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'Pink', N'In the United Kingdom, the word pants generally means underwear and not trousers.[1] Shorts are similar to trousers, but with legs that come down only to around the area of the knee, higher or lower depending on the style of the garment. To distinguish them from shorts, trousers may be called "long trousers" in certain contexts such as school uniform, where tailored shorts may be called "short trousers" in the UK.', 62.03, 0, 0, 9, 6, N'product-11.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (12, N'Shoes 12', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Black,Blue', N'A shoe is an item of footwear intended to protect and comfort the human foot. Shoes are also used as an item of decoration and fashion. The design of shoes has varied enormously through time and from culture to culture, with form originally being tied to function. Though the human foot can adapt to varied terrains and climate conditions, it is still vulnerable to environmental hazards such as sharp rocks and temperature extremes, which shoes protect against. Some shoes are worn as safety equipment, such as steel-toe boots which are required footwear at industrial worksites.', 62.77, 37, 0, 5, 6, N'product-12.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (13, N'Hat 13', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Yellow', N'A hat is a head covering which is worn for various reasons, including protection against weather conditions, ceremonial reasons such as university graduation, religious reasons, safety, or as a fashion accessory.[1]
In the past, hats were an indicator of social status.[2] In the military, hats may denote nationality, branch of service, rank or regiment.[3] Police typically wear distinctive hats such as peaked caps or brimmed hats, such as those worn by the Royal Canadian Mounted Police.', 27.49, 32, 0, 2, 8, N'product-13.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (14, N'Hat 14', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'Pink', N'A hat is a head covering which is worn for various reasons, including protection against weather conditions, ceremonial reasons such as university graduation, religious reasons, safety, or as a fashion accessory.[1]

In the past, hats were an indicator of social status.[2] In the military, hats may denote nationality, branch of service, rank or regiment.[3] Police typically wear distinctive hats such as peaked caps or brimmed hats, such as those worn by the Royal Canadian Mounted Police.', 42.93, 75, 20, 2, 7, N'product-14.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (15, N'Hat 15', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Black,Blue', N'A hat is a head covering which is worn for various reasons, including protection against weather conditions, ceremonial reasons such as university graduation, religious reasons, safety, or as a fashion accessory.[1]

In the past, hats were an indicator of social status.[2] In the military, hats may denote nationality, branch of service, rank or regiment.[3] Police typically wear distinctive hats such as peaked caps or brimmed hats, such as those worn by the Royal Canadian Mounted Police.', 40.18, 28, 0, 2, 7, N'product-15.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (16, N'Hat 16', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Yellow', N'A hat is a head covering which is worn for various reasons, including protection against weather conditions, ceremonial reasons such as university graduation, religious reasons, safety, or as a fashion accessory.[1]

In the past, hats were an indicator of social status.[2] In the military, hats may denote nationality, branch of service, rank or regiment.[3] Police typically wear distinctive hats such as peaked caps or brimmed hats, such as those worn by the Royal Canadian Mounted Police.', 35.68, 27, 0, 2, 5, N'product-16.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (17, N'Hat 17', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'Pink', N'A hat is a head covering which is worn for various reasons, including protection against weather conditions, ceremonial reasons such as university graduation, religious reasons, safety, or as a fashion accessory.[1]

In the past, hats were an indicator of social status.[2] In the military, hats may denote nationality, branch of service, rank or regiment.[3] Police typically wear distinctive hats such as peaked caps or brimmed hats, such as those worn by the Royal Canadian Mounted Police.', 6.48, 8, 30, 2, 10, N'product-17.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (18, N'Hat 18', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Black,Blue', N'A hat is a head covering which is worn for various reasons, including protection against weather conditions, ceremonial reasons such as university graduation, religious reasons, safety, or as a fashion accessory.[1]

In the past, hats were an indicator of social status.[2] In the military, hats may denote nationality, branch of service, rank or regiment.[3] Police typically wear distinctive hats such as peaked caps or brimmed hats, such as those worn by the Royal Canadian Mounted Police.', 1.8, 0, 0, 2, 4, N'product-18.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (19, N'Bag 19', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Yellow', N'A bag (also known regionally as a sack) is a common tool in the form of a non-rigid container. The use of bags predates recorded history, with the earliest bags being no more than lengths of animal skin, cotton, or woven plant fibers, folded up at the edges and secured in that shape with strings of the same material.', 86.18, 45, 10, 11, 9, N'product-19.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (20, N'Bag 20', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'Pink', N'A bag (also known regionally as a sack) is a common tool in the form of a non-rigid container. The use of bags predates recorded history, with the earliest bags being no more than lengths of animal skin, cotton, or woven plant fibers, folded up at the edges and secured in that shape with strings of the same material.', 47.43, 26, 0, 11, 10, N'product-20.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (21, N'Belt 21', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Black,Blue', N'A belt is a flexible band or strap, typically made of leather, plastic, or heavy cloth, worn around the natural waist or near it (as far down as the hips). The ends of a belt are free; and a buckle forms the belt into a loop by securing one end to another part of the belt, at or near the other end. Often, the resulting loop is smaller than the hips. Belts come in many lengths because of the variety in waist sizes, and most belts can be adjusted at the buckle to suit the wearer''s waist.', 72.52, 24, 0, 1, 4, N'product-21.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (22, N'Belt 22', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Yellow', N'A belt is a flexible band or strap, typically made of leather, plastic, or heavy cloth, worn around the natural waist or near it (as far down as the hips). The ends of a belt are free; and a buckle forms the belt into a loop by securing one end to another part of the belt, at or near the other end. Often, the resulting loop is smaller than the hips. Belts come in many lengths because of the variety in waist sizes, and most belts can be adjusted at the buckle to suit the wearer''s waist.', 53.95, 6, 30, 1, 2, N'product-22.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (23, N'Wallet 23', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'Pink', N'A wallet is a flat case or pouch that can be used to carry such small personal items as paper currency, credit cards, and identification documents (driver''s license, identification card, club card, etc.), photographs, transit pass, business cards and other paper or laminated cards. Wallets are generally made of leather or fabrics, and they are usually pocket-sized and foldable.', 39.7, 12, 0, 1, 9, N'product-23.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (24, N'Wallet 24', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Black,Blue', N'A wallet is a flat case or pouch that can be used to carry such small personal items as paper currency, credit cards, and identification documents (driver''s license, identification card, club card, etc.), photographs, transit pass, business cards and other paper or laminated cards. Wallets are generally made of leather or fabrics, and they are usually pocket-sized and foldable.', 95.48, 0, 20, 1, 7, N'product-24.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (25, N'Bag 25', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Yellow', N'A bag (also known regionally as a sack) is a common tool in the form of a non-rigid container. The use of bags predates recorded history, with the earliest bags being no more than lengths of animal skin, cotton, or woven plant fibers, folded up at the edges and secured in that shape with strings of the same material.', 51.48, 53, 0, 11, 7, N'product-25.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (26, N'Bag 26', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'Pink', N'A bag (also known regionally as a sack) is a common tool in the form of a non-rigid container. The use of bags predates recorded history, with the earliest bags being no more than lengths of animal skin, cotton, or woven plant fibers, folded up at the edges and secured in that shape with strings of the same material.', 49.62, 63, 0, 11, 7, N'product-26.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (27, N'Shirt 27', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Black,Blue', N'Originally an undergarment worn exclusively by men, it has become, in American English, a catch-all term for a broad variety of upper-body garments and undergarments. In British English, a shirt is more specifically a garment with a collar, sleeves with cuffs, and a full vertical opening with buttons or snaps (North Americans would call that a "dress shirt", a specific type of collared shirt). A shirt can also be worn with a necktie under the shirt collar.', 47.16, 42, 30, 4, 5, N'product-27.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (28, N'Shirt 28', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Yellow', N'Originally an undergarment worn exclusively by men, it has become, in American English, a catch-all term for a broad variety of upper-body garments and undergarments. In British English, a shirt is more specifically a garment with a collar, sleeves with cuffs, and a full vertical opening with buttons or snaps (North Americans would call that a "dress shirt", a specific type of collared shirt). A shirt can also be worn with a necktie under the shirt collar.', 65.67, 82, 10, 4, 7, N'product-28.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (29, N'Shirt 29', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'Pink', N'Originally an undergarment worn exclusively by men, it has become, in American English, a catch-all term for a broad variety of upper-body garments and undergarments. In British English, a shirt is more specifically a garment with a collar, sleeves with cuffs, and a full vertical opening with buttons or snaps (North Americans would call that a "dress shirt", a specific type of collared shirt). A shirt can also be worn with a necktie under the shirt collar.', 91.95, 1, 0, 4, 4, N'product-29.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (30, N'Sock 30', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Black,Blue', N'A sock is a piece of clothing worn on the feet and often covering the ankle or some part of the calf. Some types of shoes or boots are typically worn over socks. In ancient times, socks were made from leather or matted animal hair. In the late 16th century, machine-knit socks were first produced. Until 1800 both hand knitting and machine knitting were used to produce socks, but after 1800, machine knitting became the predominant method.', 77.29, 41, 0, 12, 7, N'product-30.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (31, N'Accessory 31', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Yellow', N'In fashion, an accessory is an item used to contribute, in a secondary manner, to an individual''s outfit. Accessories are often chosen to complete an outfit and complement the wearer''s look.[1] They have the capacity to further express an individual''s identity and personality. Accessories come in different shapes, sizes, hues, etc. The term came into use in the 20th century.', 25.48, 0, 0, 1, 9, N'product-31.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (32, N'Accessory 32', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'Pink', N'In fashion, an accessory is an item used to contribute, in a secondary manner, to an individual''s outfit. Accessories are often chosen to complete an outfit and complement the wearer''s look.[1] They have the capacity to further express an individual''s identity and personality. Accessories come in different shapes, sizes, hues, etc. The term came into use in the 20th century.', 66.5, 1, 20, 1, 3, N'product-32.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (33, N'Bag 33', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Black,Blue', N'A bag (also known regionally as a sack) is a common tool in the form of a non-rigid container. The use of bags predates recorded history, with the earliest bags being no more than lengths of animal skin, cotton, or woven plant fibers, folded up at the edges and secured in that shape with strings of the same material.', 7.66, 72, 0, 11, 7, N'product-33.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (34, N'Shirt 34', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'White,Yellow', N'Originally an undergarment worn exclusively by men, it has become, in American English, a catch-all term for a broad variety of upper-body garments and undergarments. In British English, a shirt is more specifically a garment with a collar, sleeves with cuffs, and a full vertical opening with buttons or snaps (North Americans would call that a "dress shirt", a specific type of collared shirt). A shirt can also be worn with a necktie under the shirt collar.', 36.38, 0, 10, 4, 3, N'product-34.jpg                                    ')
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CreateDate], [Size], [Color], [Description], [Price], [Quantity], [Sale], [CategoryID], [BrandId], [Image]) VALUES (35, N'Hat 35', CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'S,M,L', N'Pink', N'A hat is a head covering which is worn for various reasons, including protection against weather conditions, ceremonial reasons such as university graduation, religious reasons, safety, or as a fashion accessory.[1]

In the past, hats were an indicator of social status.[2] In the military, hats may denote nationality, branch of service, rank or regiment.[3] Police typically wear distinctive hats such as peaked caps or brimmed hats, such as those worn by the Royal Canadian Mounted Police.', 98.56, 72, 0, 2, 9, N'product-35.jpg                                    ')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__C9F284563D9E303F]    Script Date: 2/23/2022 6:47:45 PM ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([PaymentmethodId])
REFERENCES [dbo].[Paymentmethods] ([PaymentmethodId])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([Quantity]>(0)))
GO
