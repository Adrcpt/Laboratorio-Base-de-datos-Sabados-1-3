USE [Cilantro]
GO

/****** Object:  Table [dbo].[Paquetes]    Script Date: 24/02/2018 02:22:09 p.m. ******/
DROP TABLE [dbo].[Paquetes]
GO

/****** Object:  Table [dbo].[Paquetes]    Script Date: 24/02/2018 02:22:09 p.m. ******/
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
	SELECT DATEDIFF(day, '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
 CONSTRAINT [PK_Paquetes] PRIMARY KEY CLUSTERED 
(
	[Id de paquetes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


