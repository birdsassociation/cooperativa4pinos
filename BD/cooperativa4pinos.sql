USE [master]
GO
/****** Object:  Database [Cooperativa4Pinos]    Script Date: 2/28/2020 9:53:30 PM ******/
CREATE DATABASE [Cooperativa4Pinos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cooperativa4Pinos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Cooperativa4Pinos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cooperativa4Pinos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Cooperativa4Pinos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Cooperativa4Pinos] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cooperativa4Pinos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cooperativa4Pinos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cooperativa4Pinos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cooperativa4Pinos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Cooperativa4Pinos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cooperativa4Pinos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET RECOVERY FULL 
GO
ALTER DATABASE [Cooperativa4Pinos] SET  MULTI_USER 
GO
ALTER DATABASE [Cooperativa4Pinos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cooperativa4Pinos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cooperativa4Pinos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cooperativa4Pinos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cooperativa4Pinos] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cooperativa4Pinos', N'ON'
GO
ALTER DATABASE [Cooperativa4Pinos] SET QUERY_STORE = OFF
GO
USE [Cooperativa4Pinos]
GO
/****** Object:  Table [dbo].[Afiliado]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Afiliado](
	[IdEmpresa] [varchar](16) NOT NULL,
	[IdAfiliado] [varchar](16) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[Direccion] [varchar](256) NOT NULL,
	[DPI] [varchar](16) NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[Nit] [varchar](16) NOT NULL,
	[IdComunidad] [varchar](16) NOT NULL,
	[IdTipoAfiliado] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC,
	[IdAfiliado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[IdBitacora] [int] IDENTITY(1,1) NOT NULL,
	[IdMenu] [varchar](16) NOT NULL,
	[IdUsuario] [varchar](16) NOT NULL,
	[BitacoraTS] [datetime] NOT NULL,
	[Mensaje] [varchar](512) NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[IdBitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boleta]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boleta](
	[CodigoComprobante] [varchar](16) NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[FechaPago] [datetime] NOT NULL,
	[IdProducto] [varchar](16) NOT NULL,
	[LibrasBrutas] [int] NOT NULL,
	[LibrasRechazo] [int] NOT NULL,
	[PorcentajeRechazo] [numeric](7, 2) NOT NULL,
	[PorcentajeTolerancia] [numeric](7, 2) NOT NULL,
	[Estado] [varchar](8) NOT NULL,
	[IdAfiliado] [varchar](16) NOT NULL,
	[IdEmpresa] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Boleta] PRIMARY KEY CLUSTERED 
(
	[CodigoComprobante] ASC,
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comunidad]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comunidad](
	[IdEmpresa] [varchar](16) NOT NULL,
	[IdComunidad] [varchar](16) NOT NULL,
	[Descripcion] [varchar](64) NOT NULL,
	[Estado] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Comunidad] PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC,
	[IdComunidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditoAfiliado]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditoAfiliado](
	[IdCreditoAfiliado] [int] NOT NULL,
	[IdAfiliado] [varchar](16) NOT NULL,
	[IdEmpresa] [varchar](16) NOT NULL,
	[NumeroSolicitud] [varchar](16) NOT NULL,
	[FechaDocuento] [datetime] NOT NULL,
	[IdTipoCredito] [varchar](16) NOT NULL,
	[CantidadCapital] [numeric](9, 2) NOT NULL,
	[Estado] [varchar](8) NOT NULL,
	[CantidadInteres] [numeric](7, 2) NOT NULL,
 CONSTRAINT [PK_CreditoAfiliado] PRIMARY KEY CLUSTERED 
(
	[IdCreditoAfiliado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[IdEmpresa] [varchar](16) NOT NULL,
	[Descripcion] [varchar](64) NOT NULL,
	[Estado] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoCuenta]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoCuenta](
	[IdEmpresa] [varchar](16) NOT NULL,
	[IdAfiliado] [varchar](16) NOT NULL,
	[IdTransaccion] [int] NOT NULL,
	[TransaccionTS] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [varchar](16) NOT NULL,
	[IdMenuPadre] [varchar](16) NULL,
	[Descripcion] [varchar](64) NOT NULL,
	[Estado] [varchar](8) NOT NULL,
	[Url] [varchar](256) NOT NULL,
	[Posicion] [int] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParametroAplicacion]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParametroAplicacion](
	[IdParametro] [varchar](16) NOT NULL,
	[Valor] [varchar](512) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
	[IdEmpresa] [varchar](16) NOT NULL,
 CONSTRAINT [PK_ParametroAplicacion] PRIMARY KEY CLUSTERED 
(
	[IdParametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermisoUsuario]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermisoUsuario](
	[IdRol] [varchar](16) NOT NULL,
	[IdMenu] [varchar](16) NOT NULL,
	[Estado] [varchar](8) NOT NULL,
	[IdPermiso] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PermisoUsuario] PRIMARY KEY CLUSTERED 
(
	[IdPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PorcentajeRechazo]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PorcentajeRechazo](
	[IdPorcentajeRechazo] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpresa] [varchar](16) NOT NULL,
	[IdProducto] [varchar](16) NOT NULL,
	[Descripcion] [varchar](64) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFin] [datetime] NOT NULL,
	[Porcentaje] [numeric](7, 2) NOT NULL,
 CONSTRAINT [PK__Porcenta__2217619D9B845860] PRIMARY KEY CLUSTERED 
(
	[IdPorcentajeRechazo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdEmpresa] [varchar](16) NOT NULL,
	[IdProducto] [varchar](16) NOT NULL,
	[Descripcion] [varchar](64) NOT NULL,
	[Precio] [numeric](7, 2) NOT NULL,
	[Estado] [varchar](8) NOT NULL,
 CONSTRAINT [PK__Producto__4E6C8A1F1C20C6E6] PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC,
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [varchar](16) NOT NULL,
	[Descripcion] [varchar](64) NOT NULL,
	[Estado] [varchar](8) NOT NULL,
	[IdEmpresa] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarifa]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarifa](
	[IdTarifa] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](64) NOT NULL,
	[TipoTarifa] [varchar](16) NOT NULL,
	[Tarifa] [varchar](16) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFin] [datetime] NOT NULL,
	[Estado] [varchar](8) NOT NULL,
	[IdEmpresa] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Tarifa] PRIMARY KEY CLUSTERED 
(
	[IdTarifa] ASC,
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TarifaAfiliado]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarifaAfiliado](
	[IdEmpresa] [varchar](16) NOT NULL,
	[IdAfiliado] [varchar](16) NOT NULL,
	[IdTarifa] [int] NOT NULL,
	[Estado] [varchar](8) NOT NULL,
 CONSTRAINT [PK_TarifaAfiliado] PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC,
	[IdAfiliado] ASC,
	[IdTarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TarifaComunidad]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarifaComunidad](
	[IdEmpresa] [varchar](16) NOT NULL,
	[IdComunidad] [varchar](16) NOT NULL,
	[IdTarifa] [int] NOT NULL,
	[Estado] [varchar](8) NOT NULL,
 CONSTRAINT [PK_TarifaComunidad] PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC,
	[IdComunidad] ASC,
	[IdTarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TarifaProducto]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarifaProducto](
	[IdEmpresa] [varchar](16) NOT NULL,
	[IdTarifa] [int] NOT NULL,
	[IdProducto] [varchar](16) NOT NULL,
	[Estado] [varchar](8) NOT NULL,
 CONSTRAINT [PK_TarifaProducto] PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC,
	[IdTarifa] ASC,
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TarifaTipoAfiliado]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarifaTipoAfiliado](
	[IdEmpresa] [varchar](16) NOT NULL,
	[IdTipoAfiliado] [varchar](16) NOT NULL,
	[IdTarifa] [int] NOT NULL,
	[Estado] [varchar](8) NOT NULL,
 CONSTRAINT [PK_TarifaTipoAfiliado] PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC,
	[IdTipoAfiliado] ASC,
	[IdTarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoAfiliado]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoAfiliado](
	[IdTipoAfiliado] [varchar](16) NOT NULL,
	[Descripcion] [varchar](64) NOT NULL,
	[Estado] [varchar](8) NOT NULL,
	[IdEmpresa] [varchar](16) NOT NULL,
 CONSTRAINT [PK__TipoAfil__16FDDAEB90AD3BFD] PRIMARY KEY CLUSTERED 
(
	[IdTipoAfiliado] ASC,
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCredito]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCredito](
	[IdTipoCredito] [varchar](16) NOT NULL,
	[Descripcion] [varchar](64) NOT NULL,
	[Estado] [varchar](8) NOT NULL,
	[Interes] [numeric](7, 2) NOT NULL,
 CONSTRAINT [PK_TipoCredito] PRIMARY KEY CLUSTERED 
(
	[IdTipoCredito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 2/28/2020 9:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [varchar](16) NOT NULL,
	[Password] [varchar](16) NOT NULL,
	[IdRol] [varchar](16) NOT NULL,
	[Estado] [varchar](8) NOT NULL,
	[Descripcion] [varchar](32) NOT NULL,
	[IdEmpresa] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Afiliado]  WITH CHECK ADD FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Afiliado]  WITH CHECK ADD  CONSTRAINT [FK_Afiliado_Comunidad] FOREIGN KEY([IdEmpresa], [IdComunidad])
REFERENCES [dbo].[Comunidad] ([IdEmpresa], [IdComunidad])
GO
ALTER TABLE [dbo].[Afiliado] CHECK CONSTRAINT [FK_Afiliado_Comunidad]
GO
ALTER TABLE [dbo].[Afiliado]  WITH CHECK ADD  CONSTRAINT [FK_Afiliado_TipoAfiliado] FOREIGN KEY([IdTipoAfiliado], [IdEmpresa])
REFERENCES [dbo].[TipoAfiliado] ([IdTipoAfiliado], [IdEmpresa])
GO
ALTER TABLE [dbo].[Afiliado] CHECK CONSTRAINT [FK_Afiliado_TipoAfiliado]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Menu] FOREIGN KEY([IdMenu])
REFERENCES [dbo].[Menu] ([IdMenu])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Menu]
GO
ALTER TABLE [dbo].[Boleta]  WITH CHECK ADD  CONSTRAINT [FK_Boleta_Afiliado] FOREIGN KEY([IdEmpresa], [IdAfiliado])
REFERENCES [dbo].[Afiliado] ([IdEmpresa], [IdAfiliado])
GO
ALTER TABLE [dbo].[Boleta] CHECK CONSTRAINT [FK_Boleta_Afiliado]
GO
ALTER TABLE [dbo].[Boleta]  WITH CHECK ADD  CONSTRAINT [FK_Boleta_Producto] FOREIGN KEY([IdEmpresa], [IdProducto])
REFERENCES [dbo].[Producto] ([IdEmpresa], [IdProducto])
GO
ALTER TABLE [dbo].[Boleta] CHECK CONSTRAINT [FK_Boleta_Producto]
GO
ALTER TABLE [dbo].[CreditoAfiliado]  WITH CHECK ADD  CONSTRAINT [FK_CreditoAfiliado_Afiliado] FOREIGN KEY([IdEmpresa], [IdAfiliado])
REFERENCES [dbo].[Afiliado] ([IdEmpresa], [IdAfiliado])
GO
ALTER TABLE [dbo].[CreditoAfiliado] CHECK CONSTRAINT [FK_CreditoAfiliado_Afiliado]
GO
ALTER TABLE [dbo].[CreditoAfiliado]  WITH CHECK ADD  CONSTRAINT [FK_CreditoAfiliado_TipoCredito] FOREIGN KEY([IdTipoCredito])
REFERENCES [dbo].[TipoCredito] ([IdTipoCredito])
GO
ALTER TABLE [dbo].[CreditoAfiliado] CHECK CONSTRAINT [FK_CreditoAfiliado_TipoCredito]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Menu] FOREIGN KEY([IdMenuPadre])
REFERENCES [dbo].[Menu] ([IdMenu])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Menu]
GO
ALTER TABLE [dbo].[ParametroAplicacion]  WITH CHECK ADD  CONSTRAINT [FK_ParametroAplicacion_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[ParametroAplicacion] CHECK CONSTRAINT [FK_ParametroAplicacion_Empresa]
GO
ALTER TABLE [dbo].[PermisoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PermisoUsuario_Menu1] FOREIGN KEY([IdMenu])
REFERENCES [dbo].[Menu] ([IdMenu])
GO
ALTER TABLE [dbo].[PermisoUsuario] CHECK CONSTRAINT [FK_PermisoUsuario_Menu1]
GO
ALTER TABLE [dbo].[PermisoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PermisoUsuario_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[PermisoUsuario] CHECK CONSTRAINT [FK_PermisoUsuario_Rol]
GO
ALTER TABLE [dbo].[PorcentajeRechazo]  WITH CHECK ADD  CONSTRAINT [FK__PorcentajeRechaz__46E78A0C] FOREIGN KEY([IdEmpresa], [IdProducto])
REFERENCES [dbo].[Producto] ([IdEmpresa], [IdProducto])
GO
ALTER TABLE [dbo].[PorcentajeRechazo] CHECK CONSTRAINT [FK__PorcentajeRechaz__46E78A0C]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK__Producto__IdEmpr__440B1D61] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK__Producto__IdEmpr__440B1D61]
GO
ALTER TABLE [dbo].[Rol]  WITH CHECK ADD  CONSTRAINT [FK_Rol_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Rol] CHECK CONSTRAINT [FK_Rol_Empresa]
GO
ALTER TABLE [dbo].[TarifaAfiliado]  WITH CHECK ADD  CONSTRAINT [FK_TarifaAfiliado_Afiliado1] FOREIGN KEY([IdEmpresa], [IdAfiliado])
REFERENCES [dbo].[Afiliado] ([IdEmpresa], [IdAfiliado])
GO
ALTER TABLE [dbo].[TarifaAfiliado] CHECK CONSTRAINT [FK_TarifaAfiliado_Afiliado1]
GO
ALTER TABLE [dbo].[TarifaAfiliado]  WITH CHECK ADD  CONSTRAINT [FK_TarifaAfiliado_Tarifa] FOREIGN KEY([IdTarifa], [IdEmpresa])
REFERENCES [dbo].[Tarifa] ([IdTarifa], [IdEmpresa])
GO
ALTER TABLE [dbo].[TarifaAfiliado] CHECK CONSTRAINT [FK_TarifaAfiliado_Tarifa]
GO
ALTER TABLE [dbo].[TarifaComunidad]  WITH CHECK ADD  CONSTRAINT [FK_TarifaComunidad_Comunidad] FOREIGN KEY([IdEmpresa], [IdComunidad])
REFERENCES [dbo].[Comunidad] ([IdEmpresa], [IdComunidad])
GO
ALTER TABLE [dbo].[TarifaComunidad] CHECK CONSTRAINT [FK_TarifaComunidad_Comunidad]
GO
ALTER TABLE [dbo].[TarifaComunidad]  WITH CHECK ADD  CONSTRAINT [FK_TarifaComunidad_Tarifa] FOREIGN KEY([IdTarifa], [IdEmpresa])
REFERENCES [dbo].[Tarifa] ([IdTarifa], [IdEmpresa])
GO
ALTER TABLE [dbo].[TarifaComunidad] CHECK CONSTRAINT [FK_TarifaComunidad_Tarifa]
GO
ALTER TABLE [dbo].[TarifaProducto]  WITH CHECK ADD  CONSTRAINT [FK_TarifaProducto_Producto] FOREIGN KEY([IdEmpresa], [IdProducto])
REFERENCES [dbo].[Producto] ([IdEmpresa], [IdProducto])
GO
ALTER TABLE [dbo].[TarifaProducto] CHECK CONSTRAINT [FK_TarifaProducto_Producto]
GO
ALTER TABLE [dbo].[TarifaProducto]  WITH CHECK ADD  CONSTRAINT [FK_TarifaProducto_Tarifa] FOREIGN KEY([IdTarifa], [IdEmpresa])
REFERENCES [dbo].[Tarifa] ([IdTarifa], [IdEmpresa])
GO
ALTER TABLE [dbo].[TarifaProducto] CHECK CONSTRAINT [FK_TarifaProducto_Tarifa]
GO
ALTER TABLE [dbo].[TarifaTipoAfiliado]  WITH CHECK ADD  CONSTRAINT [FK_TarifaTipoAfiliado_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[TarifaTipoAfiliado] CHECK CONSTRAINT [FK_TarifaTipoAfiliado_Empresa]
GO
ALTER TABLE [dbo].[TarifaTipoAfiliado]  WITH CHECK ADD  CONSTRAINT [FK_TarifaTipoAfiliado_TipoAfiliado] FOREIGN KEY([IdTipoAfiliado], [IdEmpresa])
REFERENCES [dbo].[TipoAfiliado] ([IdTipoAfiliado], [IdEmpresa])
GO
ALTER TABLE [dbo].[TarifaTipoAfiliado] CHECK CONSTRAINT [FK_TarifaTipoAfiliado_TipoAfiliado]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Empresa]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
USE [master]
GO
ALTER DATABASE [Cooperativa4Pinos] SET  READ_WRITE 
GO
