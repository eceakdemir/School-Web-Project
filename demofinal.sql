USE [master]
GO
/****** Object:  Database [demofinal]    Script Date: 16.06.2020 17:27:54 ******/
CREATE DATABASE [demofinal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'demofinal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\demofinal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'demofinal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\demofinal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [demofinal] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [demofinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [demofinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [demofinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [demofinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [demofinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [demofinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [demofinal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [demofinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [demofinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [demofinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [demofinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [demofinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [demofinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [demofinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [demofinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [demofinal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [demofinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [demofinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [demofinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [demofinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [demofinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [demofinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [demofinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [demofinal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [demofinal] SET  MULTI_USER 
GO
ALTER DATABASE [demofinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [demofinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [demofinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [demofinal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [demofinal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [demofinal] SET QUERY_STORE = OFF
GO
USE [demofinal]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 16.06.2020 17:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[Department] [nvarchar](50) NOT NULL,
	[Course] [nvarchar](50) NULL,
	[Grae] [nchar](10) NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[Department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ID]    Script Date: 16.06.2020 17:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ID](
	[ID] [int] NULL,
	[Semester] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 16.06.2020 17:27:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[student id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[surename] [nvarchar](50) NULL,
	[department] [nvarchar](50) NULL,
	[GPA] [int] NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[student id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Grade] ([Department], [Course], [Grae]) VALUES (N'CENG', N'CENG218', N'BA        ')
INSERT [dbo].[Grade] ([Department], [Course], [Grae]) VALUES (N'ME', N'ME114', N'CC        ')
INSERT [dbo].[Grade] ([Department], [Course], [Grae]) VALUES (N'MECE', N'MECE218', N'AA        ')
INSERT [dbo].[student] ([student id], [name], [surename], [department], [GPA]) VALUES (201716089, N'Mahmut', N'Yılmaz', N'ME', 3)
INSERT [dbo].[student] ([student id], [name], [surename], [department], [GPA]) VALUES (201717032, N'Emre', N'Kılıç', N'MECE', 3)
INSERT [dbo].[student] ([student id], [name], [surename], [department], [GPA]) VALUES (201811002, N'Ece', N'Akdemir', N'CENG', 3)
ALTER TABLE [dbo].[ID]  WITH CHECK ADD  CONSTRAINT [FK_ID_student] FOREIGN KEY([ID])
REFERENCES [dbo].[student] ([student id])
GO
ALTER TABLE [dbo].[ID] CHECK CONSTRAINT [FK_ID_student]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_Grade] FOREIGN KEY([department])
REFERENCES [dbo].[Grade] ([Department])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_Grade]
GO
USE [master]
GO
ALTER DATABASE [demofinal] SET  READ_WRITE 
GO
