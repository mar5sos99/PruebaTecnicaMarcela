USE [productosBD]
GO
/****** Object:  Table [dbo].[tabArticulos]    Script Date: 15/3/2021 16:53:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabArticulos](
	[IdArticulo] [int] IDENTITY(1000,1) NOT NULL,
	[Descripcion] [char](30) NULL,
	[Precio] [decimal](5, 2) NULL,
	[Costo] [decimal](5, 2) NULL,
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabDetalleFactura]    Script Date: 15/3/2021 16:53:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabDetalleFactura](
	[IdDetalleFactura] [int] IDENTITY(4000,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdArticulo] [numeric](5, 0) NOT NULL,
	[Precio] [decimal](5, 2) NULL,
	[Cantidad] [int] NULL,
	[Subtotal] [decimal](5, 2) NULL,
	[IdImpuesto] [int] NOT NULL,
	[Total] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleFactura] ASC,
	[IdFactura] ASC,
	[IdArticulo] ASC,
	[IdImpuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabFactura]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabFactura](
	[IdFactura] [int] IDENTITY(3000,1) NOT NULL,
	[FechaFacturacion] [datetime] NULL,
	[NombreFactura] [char](40) NULL,
	[Subtotal] [decimal](5, 2) NULL,
	[Impuestos] [decimal](5, 2) NULL,
	[Total] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabImpuesto]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabImpuesto](
	[IdImpuesto] [int] IDENTITY(2000,1) NOT NULL,
	[Porcentaje] [decimal](5, 2) NULL,
	[Fecha] [datetime] NULL,
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdImpuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spInsertDetalleFactura]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertDetalleFactura]
	@IdFactura int,
	@IdArticulo int,
	@Precio decimal(5,2),
	@Cantidad int,
	@Subtotal decimal(5,2),
	@IdImpuesto int,
	@Total decimal(5,2)

AS   
	INSERT INTO tabDetalleFactura
	VALUES ( @IdFactura, @IdArticulo,@Precio,@Cantidad,@Subtotal,@IdImpuesto,@Total)
GO
/****** Object:  StoredProcedure [dbo].[spInsertFactura]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertFactura]
	@Fecha datetime,
	@Nombre char(40),
	@Subtotal decimal(5,2),
	@Impuesto decimal(5,2),
	@Total decimal(5,2)

AS   
	INSERT INTO tabFactura
	VALUES ( @Fecha, @Nombre,@Subtotal,@Impuesto,@Total)
GO
/****** Object:  StoredProcedure [dbo].[spInsertImpuesto]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertImpuesto]
	@Porcentaje char(30),
	@Fecha datetime,
	@Estado bit
AS   
	INSERT INTO tabImpuesto
	VALUES ( @Porcentaje, @Fecha,@Estado)
GO
/****** Object:  StoredProcedure [dbo].[spInsertProducto]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertProducto]
	@Descripcion char(30),
	@Precio decimal(5,2),
	@Costo decimal(5,2),
	@Estado bit
AS   
	INSERT INTO tabArticulos
	VALUES ( @Descripcion, @Precio,@Costo,@Estado)
GO
/****** Object:  StoredProcedure [dbo].[spSelectAgregarProducto]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectAgregarProducto]
	@codigo int
AS   
	select IdArticulo, Descripcion, Precio from [dbo].[tabArticulos]
	where IdArticulo = @codigo;
GO
/****** Object:  StoredProcedure [dbo].[spSelectBuscador]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectBuscador]
AS   
  select Descripcion, Precio from [dbo].[tabArticulos]
  
GO
/****** Object:  StoredProcedure [dbo].[spSelectBuscador2]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectBuscador2]
AS   
  select Descripcion, Precio from [dbo].[tabArticulos]
  where activo=1;
GO
/****** Object:  StoredProcedure [dbo].[spSelectImpuesto]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectImpuesto]
	@Estado bit
AS   
	

  select Porcentaje from [dbo].[tabImpuesto]
  where Activo = 1;
GO
/****** Object:  StoredProcedure [dbo].[spSelectNumFactura]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectNumFactura]
	

AS   
	select MAX(IdFactura) as UltimoId from [dbo].[tabFactura]
GO
/****** Object:  StoredProcedure [dbo].[spSelectProducto]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectProducto]
	@Codigo int
AS   
  select * from [dbo].[tabArticulos]
  where IdArticulo = @Codigo;
GO
/****** Object:  StoredProcedure [dbo].[spUpdateImpuesto]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateImpuesto]

AS   
	update tabImpuesto
	set Activo = 0 
	where Activo = 1;
GO
/****** Object:  StoredProcedure [dbo].[spUpdateProducto]    Script Date: 15/3/2021 16:53:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateProducto]
	@codigo int,
	@Descripcion char(30),
	@Precio dec(5,2),
	@Costo dec(5,2),
	@Estado bit

AS   
	update tabArticulos
	set Descripcion = @Descripcion, Precio = @Precio, Costo = @Costo, Activo = @Estado 
	where IdArticulo = @codigo;
GO
