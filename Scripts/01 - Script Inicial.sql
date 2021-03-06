USE [master]
GO
/****** Object:  Database [BeBlueSpotify]    Script Date: 20/08/2020 23:26:06 ******/
CREATE DATABASE [BeBlueSpotify]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BeBlueSpotify', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BeBlueSpotify.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BeBlueSpotify_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BeBlueSpotify_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BeBlueSpotify] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeBlueSpotify].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BeBlueSpotify] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET ARITHABORT OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BeBlueSpotify] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BeBlueSpotify] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BeBlueSpotify] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BeBlueSpotify] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BeBlueSpotify] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BeBlueSpotify] SET  MULTI_USER 
GO
ALTER DATABASE [BeBlueSpotify] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BeBlueSpotify] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BeBlueSpotify] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BeBlueSpotify] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BeBlueSpotify] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BeBlueSpotify] SET QUERY_STORE = OFF
GO
USE [BeBlueSpotify]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 20/08/2020 23:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[IDAlbum] [int] IDENTITY(1,1) NOT NULL,
	[IDGenero] [int] NOT NULL,
	[Nome] [varchar](200) NOT NULL,
	[Artista] [varchar](200) NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[IDAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashSemanal]    Script Date: 20/08/2020 23:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashSemanal](
	[IDCashSemanal] [int] IDENTITY(1,1) NOT NULL,
	[IDGenero] [int] NOT NULL,
	[DiaSemana] [int] NOT NULL,
	[Cash] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_CashSemanal] PRIMARY KEY CLUSTERED 
(
	[IDCashSemanal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 20/08/2020 23:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[IDGenero] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[IDGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 20/08/2020 23:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IDUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Email] [varchar](300) NOT NULL,
	[Senha] [varchar](50) NOT NULL,
	[CashAcumulado] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venda]    Script Date: 20/08/2020 23:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venda](
	[IDVenda] [int] IDENTITY(1,1) NOT NULL,
	[IDUsuario] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
 CONSTRAINT [PK_Venda] PRIMARY KEY CLUSTERED 
(
	[IDVenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendaItem]    Script Date: 20/08/2020 23:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendaItem](
	[IDVendaItem] [int] IDENTITY(1,1) NOT NULL,
	[IDVenda] [int] NOT NULL,
	[IDAlbum] [int] NOT NULL,
	[Qtd] [int] NOT NULL,
	[ValorUnitario] [int] NOT NULL,
	[Cash] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_VendaItem] PRIMARY KEY CLUSTERED 
(
	[IDVendaItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album_Genero] FOREIGN KEY([IDGenero])
REFERENCES [dbo].[Genero] ([IDGenero])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album_Genero]
GO
ALTER TABLE [dbo].[CashSemanal]  WITH CHECK ADD  CONSTRAINT [FK_CashSemanal_Genero] FOREIGN KEY([IDGenero])
REFERENCES [dbo].[Genero] ([IDGenero])
GO
ALTER TABLE [dbo].[CashSemanal] CHECK CONSTRAINT [FK_CashSemanal_Genero]
GO
ALTER TABLE [dbo].[Venda]  WITH CHECK ADD  CONSTRAINT [FK_Venda_Usuario] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuario] ([IDUsuario])
GO
ALTER TABLE [dbo].[Venda] CHECK CONSTRAINT [FK_Venda_Usuario]
GO
ALTER TABLE [dbo].[VendaItem]  WITH CHECK ADD  CONSTRAINT [FK_VendaItem_Album] FOREIGN KEY([IDAlbum])
REFERENCES [dbo].[Album] ([IDAlbum])
GO
ALTER TABLE [dbo].[VendaItem] CHECK CONSTRAINT [FK_VendaItem_Album]
GO
ALTER TABLE [dbo].[VendaItem]  WITH CHECK ADD  CONSTRAINT [FK_VendaItem_Venda] FOREIGN KEY([IDVenda])
REFERENCES [dbo].[Venda] ([IDVenda])
GO
ALTER TABLE [dbo].[VendaItem] CHECK CONSTRAINT [FK_VendaItem_Venda]
GO
USE [master]
GO
ALTER DATABASE [BeBlueSpotify] SET  READ_WRITE 
GO
