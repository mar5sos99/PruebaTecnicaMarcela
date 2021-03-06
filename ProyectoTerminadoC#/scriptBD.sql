USE [master]
GO
/****** Object:  Database [productosBD]    Script Date: 16/3/2021 17:32:44 ******/
CREATE DATABASE [productosBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'productosBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\productosBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'productosBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\productosBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [productosBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [productosBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [productosBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [productosBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [productosBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [productosBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [productosBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [productosBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [productosBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [productosBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [productosBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [productosBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [productosBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [productosBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [productosBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [productosBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [productosBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [productosBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [productosBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [productosBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [productosBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [productosBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [productosBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [productosBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [productosBD] SET RECOVERY FULL 
GO
ALTER DATABASE [productosBD] SET  MULTI_USER 
GO
ALTER DATABASE [productosBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [productosBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [productosBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [productosBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [productosBD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'productosBD', N'ON'
GO
ALTER DATABASE [productosBD] SET QUERY_STORE = OFF
GO
USE [productosBD]
GO
/****** Object:  Table [dbo].[tabArticulos]    Script Date: 16/3/2021 17:32:45 ******/
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
/****** Object:  Table [dbo].[tabDetalleFactura]    Script Date: 16/3/2021 17:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabDetalleFactura](
	[IdDetalleFactura] [int] IDENTITY(4000,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdArticulo] [numeric](5, 0) NOT NULL,
	[Precio] [decimal](15, 2) NULL,
	[Cantidad] [int] NULL,
	[Subtotal] [decimal](15, 2) NULL,
	[IdImpuesto] [int] NOT NULL,
	[Total] [decimal](15, 2) NULL,
 CONSTRAINT [PK__tabDetal__1F33594B9C390C4D] PRIMARY KEY CLUSTERED 
(
	[IdDetalleFactura] ASC,
	[IdFactura] ASC,
	[IdArticulo] ASC,
	[IdImpuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabFactura]    Script Date: 16/3/2021 17:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabFactura](
	[IdFactura] [int] IDENTITY(3000,1) NOT NULL,
	[FechaFacturacion] [datetime] NOT NULL,
	[NombreFactura] [char](40) NULL,
	[Subtotal] [decimal](15, 2) NULL,
	[Impuestos] [decimal](15, 2) NULL,
	[Total] [decimal](15, 2) NULL,
 CONSTRAINT [PK__TabFactu__50E7BAF1F98738A0] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabImpuesto]    Script Date: 16/3/2021 17:32:46 ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertDetalleFactura]    Script Date: 16/3/2021 17:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertDetalleFactura]
	@IdFactura int,
	@IdArticulo int,
	@Precio decimal(15,2),
	@Cantidad int,
	@Subtotal decimal(15,2),
	@IdImpuesto int,
	@Total decimal(15,2)

AS   
	INSERT INTO tabDetalleFactura
	VALUES ( @IdFactura, @IdArticulo,@Precio,@Cantidad,@Subtotal,@IdImpuesto,@Total)
GO
/****** Object:  StoredProcedure [dbo].[spInsertFactura]    Script Date: 16/3/2021 17:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertFactura]
	@Fecha datetime,
	@Nombre char(40),
	@Subtotal decimal(15,2),
	@Impuesto decimal(15,2),
	@Total decimal(15,2)

AS   
	INSERT INTO tabFactura
	VALUES ( @Fecha, @Nombre,@Subtotal,@Impuesto,@Total)
GO
/****** Object:  StoredProcedure [dbo].[spInsertImpuesto]    Script Date: 16/3/2021 17:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertImpuesto]
	@Porcentaje decimal(5,2),
	@Fecha datetime,
	@Estado bit
AS   
	INSERT INTO tabImpuesto
	VALUES ( @Porcentaje, @Fecha,@Estado)
GO
/****** Object:  StoredProcedure [dbo].[spInsertProducto]    Script Date: 16/3/2021 17:32:46 ******/
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
/****** Object:  StoredProcedure [dbo].[spSelectAgregarProducto]    Script Date: 16/3/2021 17:32:46 ******/
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
/****** Object:  StoredProcedure [dbo].[spSelectBuscador]    Script Date: 16/3/2021 17:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectBuscador]
AS   
  select Descripcion, IdArticulo from [dbo].[tabArticulos]
  
GO
/****** Object:  StoredProcedure [dbo].[spSelectBuscador2]    Script Date: 16/3/2021 17:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectBuscador2]
AS   
  select Descripcion, Precio from [dbo].[tabArticulos]
  where activo=1;
GO
/****** Object:  StoredProcedure [dbo].[spSelectImpuesto]    Script Date: 16/3/2021 17:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectImpuesto]
	
AS   
	
  select Porcentaje from [dbo].[tabImpuesto]
  where Activo = 1;
GO
/****** Object:  StoredProcedure [dbo].[spSelectNumFactura]    Script Date: 16/3/2021 17:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectNumFactura]
	

AS   
	select MAX(IdFactura) + 1 as UltimoId from [dbo].[tabFactura]
GO
/****** Object:  StoredProcedure [dbo].[spSelectProducto]    Script Date: 16/3/2021 17:32:46 ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateImpuesto]    Script Date: 16/3/2021 17:32:46 ******/
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
/****** Object:  StoredProcedure [dbo].[spUpdateProducto]    Script Date: 16/3/2021 17:32:46 ******/
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
USE [master]
GO
ALTER DATABASE [productosBD] SET  READ_WRITE 
GO
