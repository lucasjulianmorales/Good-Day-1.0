USE [master]
GO
/****** Object:  Database [Good Day]    Script Date: 30/03/2017 17:57:29 ******/
CREATE DATABASE [Good Day]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Good Day', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Good Day.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Good Day_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Good Day_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Good Day] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Good Day].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Good Day] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Good Day] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Good Day] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Good Day] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Good Day] SET ARITHABORT OFF 
GO
ALTER DATABASE [Good Day] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Good Day] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Good Day] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Good Day] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Good Day] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Good Day] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Good Day] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Good Day] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Good Day] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Good Day] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Good Day] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Good Day] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Good Day] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Good Day] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Good Day] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Good Day] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Good Day] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Good Day] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Good Day] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Good Day] SET  MULTI_USER 
GO
ALTER DATABASE [Good Day] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Good Day] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Good Day] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Good Day] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Good Day', N'ON'
GO
USE [Good Day]
GO
/****** Object:  Table [dbo].[Calendario]    Script Date: 30/03/2017 17:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendario](
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Calendario] PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Color]    Script Date: 30/03/2017 17:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ID_color] [int] NOT NULL,
	[NameColor] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[ID_color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Libreta]    Script Date: 30/03/2017 17:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libreta](
	[ID_libreta] [int] IDENTITY(1,1) NOT NULL,
	[NameLibreta] [nvarchar](50) NOT NULL,
	[ID_color] [int] NULL,
 CONSTRAINT [PK_Libreta] PRIMARY KEY CLUSTERED 
(
	[ID_libreta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Libreta_Tag]    Script Date: 30/03/2017 17:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libreta_Tag](
	[ID_libreta] [int] NOT NULL,
	[ID_tag] [int] NOT NULL,
 CONSTRAINT [PK_Libreta_Tag] PRIMARY KEY CLUSTERED 
(
	[ID_tag] ASC,
	[ID_libreta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Libreta_Usuario]    Script Date: 30/03/2017 17:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libreta_Usuario](
	[ID_usuario] [int] NOT NULL,
	[ID_libreta] [int] NOT NULL,
 CONSTRAINT [PK_Libreta_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID_usuario] ASC,
	[ID_libreta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mensaje_Bienvenida]    Script Date: 30/03/2017 17:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensaje_Bienvenida](
	[ID_mensaje] [int] NOT NULL,
	[Mensaje_desc] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Mensaje_Bienvenida] PRIMARY KEY CLUSTERED 
(
	[ID_mensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nota]    Script Date: 30/03/2017 17:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nota](
	[ID_nota] [int] IDENTITY(1,1) NOT NULL,
	[Nota] [nvarchar](50) NOT NULL,
	[Fecha] [datetime] NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[ID_nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Papelera]    Script Date: 30/03/2017 17:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Papelera](
	[ID_trash] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 30/03/2017 17:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID_tag] [int] IDENTITY(1,1) NOT NULL,
	[NameTag] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID_tag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag_Nota]    Script Date: 30/03/2017 17:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag_Nota](
	[ID_tag] [int] NOT NULL,
	[ID_nota] [int] NOT NULL,
 CONSTRAINT [PK_Tag_Notas] PRIMARY KEY CLUSTERED 
(
	[ID_tag] ASC,
	[ID_nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/03/2017 17:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID_usuario] [int] IDENTITY(1,1) NOT NULL,
	[NameUsuario] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Color] ([ID_color], [NameColor]) VALUES (1, N'azul')
INSERT [dbo].[Color] ([ID_color], [NameColor]) VALUES (2, N'rojo')
INSERT [dbo].[Color] ([ID_color], [NameColor]) VALUES (3, N'amarillo')
SET IDENTITY_INSERT [dbo].[Libreta] ON 

INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (1, N'sfsdf', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (2, N'asdasd', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (3, N'Libreta 1', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (4, N'hola', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (5, N'libreta prueba', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (6, N'adasdas', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (7, N'test', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (8, N'test', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (9, N'lucas', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (10, N'lucas2', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (11, N'lucas 3', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (12, N'asd,dasd', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (13, N'fasdasdasd', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (14, N'dasdasdasdas', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (15, N'dasdasdasdfagasdgsd', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (16, N'lucas 4', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (17, N'Test', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (18, N'Test', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (19, N'test', NULL)
INSERT [dbo].[Libreta] ([ID_libreta], [NameLibreta], [ID_color]) VALUES (20, N'prueba12', NULL)
SET IDENTITY_INSERT [dbo].[Libreta] OFF
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (1, 1)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (1, 2)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (2, 3)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (2, 4)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (3, 5)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (3, 6)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (4, 7)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (4, 8)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (5, 9)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (5, 10)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (6, 11)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (7, 12)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (8, 13)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (9, 14)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (10, 15)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (11, 16)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (11, 17)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (12, 18)
INSERT [dbo].[Libreta_Tag] ([ID_libreta], [ID_tag]) VALUES (13, 20)
INSERT [dbo].[Libreta_Usuario] ([ID_usuario], [ID_libreta]) VALUES (1, 1)
INSERT [dbo].[Libreta_Usuario] ([ID_usuario], [ID_libreta]) VALUES (1, 2)
INSERT [dbo].[Libreta_Usuario] ([ID_usuario], [ID_libreta]) VALUES (1, 3)
INSERT [dbo].[Libreta_Usuario] ([ID_usuario], [ID_libreta]) VALUES (1, 4)
INSERT [dbo].[Libreta_Usuario] ([ID_usuario], [ID_libreta]) VALUES (2, 5)
INSERT [dbo].[Libreta_Usuario] ([ID_usuario], [ID_libreta]) VALUES (2, 6)
INSERT [dbo].[Libreta_Usuario] ([ID_usuario], [ID_libreta]) VALUES (2, 7)
INSERT [dbo].[Libreta_Usuario] ([ID_usuario], [ID_libreta]) VALUES (3, 8)
INSERT [dbo].[Libreta_Usuario] ([ID_usuario], [ID_libreta]) VALUES (3, 9)
INSERT [dbo].[Libreta_Usuario] ([ID_usuario], [ID_libreta]) VALUES (4, 10)
INSERT [dbo].[Libreta_Usuario] ([ID_usuario], [ID_libreta]) VALUES (4, 11)
INSERT [dbo].[Libreta_Usuario] ([ID_usuario], [ID_libreta]) VALUES (4, 12)
INSERT [dbo].[Libreta_Usuario] ([ID_usuario], [ID_libreta]) VALUES (4, 13)
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (1, N'tag1')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (2, N'tag2')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (3, N'tag3')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (4, N'tag4')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (5, N'tag5')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (6, N'tag6')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (7, N'tag7')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (8, N'tag8')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (9, N'tag9')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (10, N'tag10')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (11, N'tag11')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (12, N'tag12')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (13, N'tag13')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (14, N'tag14')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (15, N'tag15')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (16, N'tag16')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (17, N'tag17')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (18, N'tag18')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (19, N'tag19')
INSERT [dbo].[Tag] ([ID_tag], [NameTag]) VALUES (20, N'tag20')
SET IDENTITY_INSERT [dbo].[Tag] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([ID_usuario], [NameUsuario], [Mail], [Password]) VALUES (1, N'lucas', N'lucas@gmail.com', N'123')
INSERT [dbo].[Usuario] ([ID_usuario], [NameUsuario], [Mail], [Password]) VALUES (2, N'marcelo', N'marcelo@gmail.com', N'123')
INSERT [dbo].[Usuario] ([ID_usuario], [NameUsuario], [Mail], [Password]) VALUES (3, N'pedro', N'pedro@gmail.com', N'123')
INSERT [dbo].[Usuario] ([ID_usuario], [NameUsuario], [Mail], [Password]) VALUES (4, N'jesica', N'jesica@gmail.com', N'123')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Libreta]  WITH CHECK ADD  CONSTRAINT [FK_Libreta_Color] FOREIGN KEY([ID_color])
REFERENCES [dbo].[Color] ([ID_color])
GO
ALTER TABLE [dbo].[Libreta] CHECK CONSTRAINT [FK_Libreta_Color]
GO
ALTER TABLE [dbo].[Libreta_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Libreta_Tag_Libreta] FOREIGN KEY([ID_libreta])
REFERENCES [dbo].[Libreta] ([ID_libreta])
GO
ALTER TABLE [dbo].[Libreta_Tag] CHECK CONSTRAINT [FK_Libreta_Tag_Libreta]
GO
ALTER TABLE [dbo].[Libreta_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Libreta_Tag_Tag] FOREIGN KEY([ID_tag])
REFERENCES [dbo].[Tag] ([ID_tag])
GO
ALTER TABLE [dbo].[Libreta_Tag] CHECK CONSTRAINT [FK_Libreta_Tag_Tag]
GO
ALTER TABLE [dbo].[Libreta_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Libreta_Usuario_Libreta] FOREIGN KEY([ID_libreta])
REFERENCES [dbo].[Libreta] ([ID_libreta])
GO
ALTER TABLE [dbo].[Libreta_Usuario] CHECK CONSTRAINT [FK_Libreta_Usuario_Libreta]
GO
ALTER TABLE [dbo].[Libreta_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Libreta_Usuario_Usuario] FOREIGN KEY([ID_usuario])
REFERENCES [dbo].[Usuario] ([ID_usuario])
GO
ALTER TABLE [dbo].[Libreta_Usuario] CHECK CONSTRAINT [FK_Libreta_Usuario_Usuario]
GO
ALTER TABLE [dbo].[Tag_Nota]  WITH CHECK ADD  CONSTRAINT [FK_Tag_Notas_Notas] FOREIGN KEY([ID_nota])
REFERENCES [dbo].[Nota] ([ID_nota])
GO
ALTER TABLE [dbo].[Tag_Nota] CHECK CONSTRAINT [FK_Tag_Notas_Notas]
GO
ALTER TABLE [dbo].[Tag_Nota]  WITH CHECK ADD  CONSTRAINT [FK_Tag_Notas_Tag] FOREIGN KEY([ID_tag])
REFERENCES [dbo].[Tag] ([ID_tag])
GO
ALTER TABLE [dbo].[Tag_Nota] CHECK CONSTRAINT [FK_Tag_Notas_Tag]
GO
USE [master]
GO
ALTER DATABASE [Good Day] SET  READ_WRITE 
GO
