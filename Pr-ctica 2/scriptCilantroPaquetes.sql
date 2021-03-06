USE [master]
GO
/****** Object:  Database [Cilantro]    Script Date: 24/02/2018 02:34:57 p.m. ******/
CREATE DATABASE [Cilantro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cilantro', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Cilantro.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Cilantro_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Cilantro_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Cilantro] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cilantro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cilantro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cilantro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cilantro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cilantro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cilantro] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cilantro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cilantro] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Cilantro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cilantro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cilantro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cilantro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cilantro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cilantro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cilantro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cilantro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cilantro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cilantro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cilantro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cilantro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cilantro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cilantro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cilantro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cilantro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cilantro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cilantro] SET  MULTI_USER 
GO
ALTER DATABASE [Cilantro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cilantro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cilantro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cilantro] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Cilantro]
GO
/****** Object:  Table [dbo].[Area de entrega]    Script Date: 24/02/2018 02:34:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area de entrega](
	[Area de entrega] [text] NOT NULL,
	[Numero de paquetes] [numeric](18, 0) NULL,
	[Id de paquete] [float] NOT NULL,
 CONSTRAINT [PK_Area de entrega] PRIMARY KEY CLUSTERED 
(
	[Id de paquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 24/02/2018 02:34:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[Nombre] [text] NOT NULL,
	[Dirección] [char](10) NOT NULL,
	[Telefono] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Dirección] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Destinatario]    Script Date: 24/02/2018 02:34:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Destinatario](
	[Destinatario] [char](10) NOT NULL,
	[Dirección destinatario] [text] NOT NULL,
	[Id del Paquete] [float] NOT NULL,
 CONSTRAINT [PK_Destinatario] PRIMARY KEY CLUSTERED 
(
	[Id del Paquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado del paquete]    Script Date: 24/02/2018 02:34:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado del paquete](
	[ID del paquete] [float] NOT NULL,
	[Entregado] [tinyint] NOT NULL,
 CONSTRAINT [PK_Estado del paquete] PRIMARY KEY CLUSTERED 
(
	[ID del paquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Paquetes]    Script Date: 24/02/2018 02:34:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paquetes](
	[Paquetes entrantes] [numeric](18, 0) NOT NULL,
	[Paquetes salientes] [numeric](18, 0) NOT NULL,
	[Paquetes en bodega] [numeric](18, 0) NOT NULL,
	[Id de paquetes] [float] NOT NULL,
	[Dirección de paquetes] [text] NOT NULL,
	[Dias desde recivido en bodega] [date] NOT NULL,
 CONSTRAINT [PK_Paquetes] PRIMARY KEY CLUSTERED 
(
	[Id de paquetes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Remitente]    Script Date: 24/02/2018 02:34:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Remitente](
	[Nombre Remitente] [char](10) NOT NULL,
	[Dirección de remitente] [text] NOT NULL,
	[Id del paquete] [float] NOT NULL,
 CONSTRAINT [PK_Remitente] PRIMARY KEY CLUSTERED 
(
	[Id del paquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [NonClusteredIndex-20180224-141757]    Script Date: 24/02/2018 02:34:57 p.m. ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20180224-141757] ON [dbo].[Area de entrega]
(
	[Id de paquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NonClusteredIndex-20180224-141853]    Script Date: 24/02/2018 02:34:57 p.m. ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20180224-141853] ON [dbo].[Cliente]
(
	[Dirección] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20180224-141913]    Script Date: 24/02/2018 02:34:57 p.m. ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20180224-141913] ON [dbo].[Destinatario]
(
	[Id del Paquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20180224-141927]    Script Date: 24/02/2018 02:34:57 p.m. ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20180224-141927] ON [dbo].[Estado del paquete]
(
	[ID del paquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20180224-141946]    Script Date: 24/02/2018 02:34:57 p.m. ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20180224-141946] ON [dbo].[Remitente]
(
	[Id del paquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Area de entrega]  WITH CHECK ADD  CONSTRAINT [FK_Area de entrega_Paquetes] FOREIGN KEY([Id de paquete])
REFERENCES [dbo].[Paquetes] ([Id de paquetes])
GO
ALTER TABLE [dbo].[Area de entrega] CHECK CONSTRAINT [FK_Area de entrega_Paquetes]
GO
ALTER TABLE [dbo].[Destinatario]  WITH CHECK ADD  CONSTRAINT [FK_Destinatario_Paquetes] FOREIGN KEY([Id del Paquete])
REFERENCES [dbo].[Paquetes] ([Id de paquetes])
GO
ALTER TABLE [dbo].[Destinatario] CHECK CONSTRAINT [FK_Destinatario_Paquetes]
GO
ALTER TABLE [dbo].[Estado del paquete]  WITH CHECK ADD  CONSTRAINT [FK_Estado del paquete_Paquetes] FOREIGN KEY([ID del paquete])
REFERENCES [dbo].[Paquetes] ([Id de paquetes])
GO
ALTER TABLE [dbo].[Estado del paquete] CHECK CONSTRAINT [FK_Estado del paquete_Paquetes]
GO
ALTER TABLE [dbo].[Remitente]  WITH CHECK ADD  CONSTRAINT [FK_Remitente_Remitente] FOREIGN KEY([Id del paquete])
REFERENCES [dbo].[Remitente] ([Id del paquete])
GO
ALTER TABLE [dbo].[Remitente] CHECK CONSTRAINT [FK_Remitente_Remitente]
GO
USE [master]
GO
ALTER DATABASE [Cilantro] SET  READ_WRITE 
GO
