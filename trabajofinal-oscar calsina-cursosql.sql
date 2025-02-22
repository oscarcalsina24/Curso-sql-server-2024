USE [master]
GO
/****** Object:  Database [proyectosql]    Script Date: 19/12/2024 23:08:57 ******/
CREATE DATABASE [proyectosql]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proyectosql', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\proyectosql.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proyectosql_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\proyectosql_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [proyectosql] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proyectosql].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proyectosql] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proyectosql] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proyectosql] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proyectosql] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proyectosql] SET ARITHABORT OFF 
GO
ALTER DATABASE [proyectosql] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [proyectosql] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proyectosql] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proyectosql] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proyectosql] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proyectosql] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proyectosql] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proyectosql] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proyectosql] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proyectosql] SET  ENABLE_BROKER 
GO
ALTER DATABASE [proyectosql] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proyectosql] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proyectosql] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proyectosql] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proyectosql] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proyectosql] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proyectosql] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proyectosql] SET RECOVERY FULL 
GO
ALTER DATABASE [proyectosql] SET  MULTI_USER 
GO
ALTER DATABASE [proyectosql] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proyectosql] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proyectosql] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proyectosql] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [proyectosql] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [proyectosql] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'proyectosql', N'ON'
GO
ALTER DATABASE [proyectosql] SET QUERY_STORE = OFF
GO
USE [proyectosql]
GO
/****** Object:  Table [dbo].[Categorías]    Script Date: 19/12/2024 23:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorías](
	[ID_categoría] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_categoría] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 19/12/2024 23:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ID_cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Correo_electronico] [varchar](100) NULL,
	[Tipo_cliente_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_pedido]    Script Date: 19/12/2024 23:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_pedido](
	[ID_detalle_pedido] [int] IDENTITY(1,1) NOT NULL,
	[Pedido_id] [int] NULL,
	[Producto_id] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio_unitario] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_detalle_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 19/12/2024 23:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direcciones](
	[ID_dirección] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_id] [int] NULL,
	[Tipo_dirección] [varchar](50) NULL,
	[Calle] [varchar](100) NULL,
	[Número] [varchar](20) NULL,
	[Ciudad] [varchar](50) NULL,
	[Código_postal] [varchar](20) NULL,
	[País] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_dirección] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Envíos]    Script Date: 19/12/2024 23:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Envíos](
	[ID_envío] [int] IDENTITY(1,1) NOT NULL,
	[Pedido_id] [int] NULL,
	[Fecha_envío] [datetime] NULL,
	[Compañía_envío] [varchar](50) NULL,
	[Número_seguimiento] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_envío] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 19/12/2024 23:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[ID_marca] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Métodos_pago]    Script Date: 19/12/2024 23:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Métodos_pago](
	[ID_método_pago] [int] IDENTITY(1,1) NOT NULL,
	[Descripción] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_método_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 19/12/2024 23:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[ID_pago] [int] IDENTITY(1,1) NOT NULL,
	[Pedido_id] [int] NULL,
	[Método_pago_id] [int] NULL,
	[Monto] [decimal](10, 2) NULL,
	[Fecha_pago] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 19/12/2024 23:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[ID_pedido] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_id] [int] NULL,
	[Fecha_pedido] [datetime] NULL,
	[Estado] [varchar](50) NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 19/12/2024 23:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ID_producto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripción] [text] NULL,
	[Precio] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[Categoría_id] [int] NULL,
	[Marca_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_clientes]    Script Date: 19/12/2024 23:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_clientes](
	[ID_tipo_cliente] [int] IDENTITY(1,1) NOT NULL,
	[Descripción] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_tipo_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD FOREIGN KEY([Tipo_cliente_id])
REFERENCES [dbo].[Tipos_clientes] ([ID_tipo_cliente])
GO
ALTER TABLE [dbo].[Detalles_pedido]  WITH CHECK ADD FOREIGN KEY([Pedido_id])
REFERENCES [dbo].[Pedidos] ([ID_pedido])
GO
ALTER TABLE [dbo].[Detalles_pedido]  WITH CHECK ADD FOREIGN KEY([Producto_id])
REFERENCES [dbo].[Productos] ([ID_producto])
GO
ALTER TABLE [dbo].[Direcciones]  WITH CHECK ADD FOREIGN KEY([Cliente_id])
REFERENCES [dbo].[Clientes] ([ID_cliente])
GO
ALTER TABLE [dbo].[Envíos]  WITH CHECK ADD FOREIGN KEY([Pedido_id])
REFERENCES [dbo].[Pedidos] ([ID_pedido])
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD FOREIGN KEY([Método_pago_id])
REFERENCES [dbo].[Métodos_pago] ([ID_método_pago])
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD FOREIGN KEY([Pedido_id])
REFERENCES [dbo].[Pedidos] ([ID_pedido])
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([Cliente_id])
REFERENCES [dbo].[Clientes] ([ID_cliente])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([Categoría_id])
REFERENCES [dbo].[Categorías] ([ID_categoría])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([Marca_id])
REFERENCES [dbo].[Marcas] ([ID_marca])
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoPedido]    Script Date: 19/12/2024 23:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarEstadoPedido]
    @PedidoID INT,
    @NuevoEstado VARCHAR(50)
AS
BEGIN
    UPDATE Pedidos
    SET Estado = @NuevoEstado
    WHERE ID_pedido = @PedidoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPedidosPorEstado]    Script Date: 19/12/2024 23:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerPedidosPorEstado]
    @EstadoPedido VARCHAR(50)
AS
BEGIN
    SELECT 
        P.ID_pedido AS Pedido_ID,
        P.Fecha_pedido AS Fecha_Pedido,
        P.Estado AS Estado_Pedido,
        P.Total AS Total_Pedido,
        C.Nombre AS Cliente_Nombre,
        C.Apellido AS Cliente_Apellido
    FROM 
        Pedidos P
    INNER JOIN 
        Clientes C ON P.Cliente_id = C.ID_cliente
    WHERE 
        P.Estado = @EstadoPedido;
END;
GO
USE [master]
GO
ALTER DATABASE [proyectosql] SET  READ_WRITE 
GO
