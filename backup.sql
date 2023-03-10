USE [master]
GO
/****** Object:  Database [PTJulianPerezBPBA]    Script Date: 11/1/2023 20:49:25 ******/
CREATE DATABASE [PTJulianPerezBPBA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PTJulianPerezBPBA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PTJulianPerezBPBA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PTJulianPerezBPBA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PTJulianPerezBPBA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PTJulianPerezBPBA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PTJulianPerezBPBA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PTJulianPerezBPBA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET ARITHABORT OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET RECOVERY FULL 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET  MULTI_USER 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PTJulianPerezBPBA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PTJulianPerezBPBA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PTJulianPerezBPBA', N'ON'
GO
ALTER DATABASE [PTJulianPerezBPBA] SET QUERY_STORE = OFF
GO
USE [PTJulianPerezBPBA]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 11/1/2023 20:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nchar](5) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[FechaAlta] [date] NULL,
	[IdTipoDto] [int] NULL,
	[NumDocumento] [int] NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDocumento]    Script Date: 11/1/2023 20:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDocumento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposDocumento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([Id], [Codigo], [Apellido], [Nombre], [FechaAlta], [IdTipoDto], [NumDocumento]) VALUES (1, N'23456', N'Perez', N'Julian', CAST(N'2023-01-11' AS Date), 1, 42679056)
INSERT [dbo].[Empleados] ([Id], [Codigo], [Apellido], [Nombre], [FechaAlta], [IdTipoDto], [NumDocumento]) VALUES (2, N'43234', N'Donadio', N'Martina', CAST(N'2023-02-24' AS Date), 1, 42657683)
INSERT [dbo].[Empleados] ([Id], [Codigo], [Apellido], [Nombre], [FechaAlta], [IdTipoDto], [NumDocumento]) VALUES (3, N'42342', N'Pereyra', N'Fernando', CAST(N'2022-12-25' AS Date), 2, 23423423)
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDocumento] ON 

INSERT [dbo].[TiposDocumento] ([Id], [Descripcion]) VALUES (1, N'DNI')
INSERT [dbo].[TiposDocumento] ([Id], [Descripcion]) VALUES (2, N'PASAPORTE')
SET IDENTITY_INSERT [dbo].[TiposDocumento] OFF
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_TiposDocumento] FOREIGN KEY([IdTipoDto])
REFERENCES [dbo].[TiposDocumento] ([Id])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_TiposDocumento]
GO
/****** Object:  StoredProcedure [dbo].[EditarEmpleado]    Script Date: 11/1/2023 20:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[EditarEmpleado]
@Id int, @Codigo nchar(5), @Apellido nvarchar(50), @Nombre nvarchar(50), @FechaAlta date = null, @IdTipoDto int, @NumDocumento int
as begin
update Empleados set Codigo = @Codigo, Apellido = @Apellido, Nombre= @Nombre ,FechaAlta= @FechaAlta ,
IdTipoDto = @IdTipoDto, NumDocumento = @NumDocumento where Id = @Id
end

GO
/****** Object:  StoredProcedure [dbo].[EliminarEmpleado]    Script Date: 11/1/2023 20:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[EliminarEmpleado]
@Id int
as begin
delete Empleados where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[GetDocumentoByID]    Script Date: 11/1/2023 20:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetDocumentoByID]
@IdDocumento int
as begin
Select * from TiposDocumento where Id = @IdDocumento
end
GO
/****** Object:  StoredProcedure [dbo].[GetDocumentos]    Script Date: 11/1/2023 20:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetDocumentos]
as begin
Select * from TiposDocumento
end
GO
/****** Object:  StoredProcedure [dbo].[GetEmpleados]    Script Date: 11/1/2023 20:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetEmpleados]
as begin
Select * from Empleados
end
GO
/****** Object:  StoredProcedure [dbo].[GetEmpleadosByApellido]    Script Date: 11/1/2023 20:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[GetEmpleadosByApellido]
@Apellido nvarchar(50)
as begin
Select * from Empleados where Apellido like @Apellido + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[RegistrarEmpleado]    Script Date: 11/1/2023 20:49:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[RegistrarEmpleado]
@Codigo nchar(5), @Apellido nvarchar(50), @Nombre nvarchar(50), @FechaAlta date = null, @IdTipoDto int, @NumDocumento int = null
as begin
insert into Empleados(Codigo,Apellido,Nombre,FechaAlta,IdTipoDto,NumDocumento)
values (@Codigo, @Apellido, @Nombre, @FechaAlta, @IdTipoDto, @NumDocumento)
end
GO
USE [master]
GO
ALTER DATABASE [PTJulianPerezBPBA] SET  READ_WRITE 
GO
