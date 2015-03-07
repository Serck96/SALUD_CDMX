USE [master]
GO
/****** Object:  Database [SALUD-CDMX]    Script Date: 07/03/2015 12:59:01 p. m. ******/
CREATE DATABASE [SALUD-CDMX] 
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SALUD-CDMX].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SALUD-CDMX] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET ARITHABORT OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SALUD-CDMX] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SALUD-CDMX] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SALUD-CDMX] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SALUD-CDMX] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SALUD-CDMX] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SALUD-CDMX] SET  MULTI_USER 
GO
ALTER DATABASE [SALUD-CDMX] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SALUD-CDMX] SET DB_CHAINING OFF 
GO
USE [SALUD-CDMX]
GO
/****** Object:  StoredProcedure [dbo].[sp_IniciaSesion]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_IniciaSesion]
@user nvarchar(100),
@pass nvarchar(100)
AS
BEGIN
	declare @id int
	set @id = (select idUsuario from tblUsuario where usuario = @user and contrasenia = @pass)
	if(@id IS NOT NULL)
	begin
	select ctgRol.idRol,ctgRol.Rol from relUsuarioRol
	inner join ctgRol
	on ctgRol.idRol = relUsuarioRol.idRol
	and relUsuarioRol.idUsuario = @id
	end
	else
	begin
	select '' as idRol, 'Usuario y/o contraseña incorrectos' as Rol
	end

END

GO
/****** Object:  Table [dbo].[ctgRol]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ctgRol](
	[idRol] [int] NOT NULL,
	[Rol] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[relCentroSaludServicio]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relCentroSaludServicio](
	[idCentroSalud] [int] NOT NULL,
	[idServicio] [int] NOT NULL,
 CONSTRAINT [PK_relCentroSaludServicio] PRIMARY KEY CLUSTERED 
(
	[idCentroSalud] ASC,
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[relMedicoCentroServicio]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relMedicoCentroServicio](
	[idMedico] [int] NOT NULL,
	[idCentroSalud] [int] NOT NULL,
	[idServicio] [int] NOT NULL,
	[fecReg] [datetime] NULL,
 CONSTRAINT [PK_relMedicoCentroServicio] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC,
	[idCentroSalud] ASC,
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[relUsuarioRol]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relUsuarioRol](
	[idRelPersonaRol] [int] NOT NULL,
	[idRol] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_relPersonaRol_1] PRIMARY KEY CLUSTERED 
(
	[idRelPersonaRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCentroSalud]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCentroSalud](
	[idCentroSalud] [int] NOT NULL,
	[CentroSalud] [nvarchar](500) NULL,
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[Calle] [nvarchar](100) NULL,
	[Exterior] [nvarchar](100) NULL,
	[Interior] [nvarchar](100) NULL,
	[CP] [int] NULL,
	[Lat] [nvarchar](50) NULL,
	[Long] [nvarchar](50) NULL,
	[FecReg] [datetime] NULL,
 CONSTRAINT [PK_tblCentroSalud] PRIMARY KEY CLUSTERED 
(
	[idCentroSalud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCita]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCita](
	[idCita] [int] NOT NULL,
	[idHorario] [int] NULL,
	[idPersona] [int] NULL,
	[idMedico] [int] NULL,
	[idEstatus] [int] NULL,
	[Fecha] [datetime] NULL,
	[FecReg] [datetime] NULL,
 CONSTRAINT [PK_tblCita] PRIMARY KEY CLUSTERED 
(
	[idCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDatosContacto]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDatosContacto](
	[idDatosContacto] [int] NOT NULL,
	[idPersona] [int] NULL,
	[idTipoContacto] [int] NULL,
	[Contacto] [nvarchar](500) NULL,
	[fecReg] [datetime] NULL,
 CONSTRAINT [PK_tblDatosContacto] PRIMARY KEY CLUSTERED 
(
	[idDatosContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDia]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDia](
	[idDia] [int] NOT NULL,
	[Dia] [char](5) NULL,
 CONSTRAINT [PK_tblDia] PRIMARY KEY CLUSTERED 
(
	[idDia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDireccion]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDireccion](
	[idDireccion] [int] NOT NULL,
	[idPersona] [int] NULL,
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[Calle] [nvarchar](500) NULL,
	[Exterior] [nvarchar](300) NULL,
	[Interior] [nvarchar](100) NULL,
	[Colonia] [nvarchar](100) NULL,
	[CP] [int] NULL,
	[FecReg] [datetime] NULL,
 CONSTRAINT [PK_tblDireccion] PRIMARY KEY CLUSTERED 
(
	[idDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHora]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHora](
	[idHora] [int] NOT NULL,
	[Hora] [nvarchar](5) NULL,
 CONSTRAINT [PK_tblHora] PRIMARY KEY CLUSTERED 
(
	[idHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHorarioCentroSalud]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHorarioCentroSalud](
	[idHorario] [int] NOT NULL,
	[idCentroSalud] [int] NOT NULL,
	[idDia] [int] NOT NULL,
	[idHora] [int] NOT NULL,
	[fecReg] [datetime] NULL,
 CONSTRAINT [PK_tblHorarioCentroSalud] PRIMARY KEY CLUSTERED 
(
	[idHorario] ASC,
	[idCentroSalud] ASC,
	[idDia] ASC,
	[idHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMedico]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMedico](
	[idMedico] [int] NOT NULL,
	[idPersona] [int] NULL,
	[Cedula] [nvarchar](50) NULL,
	[Universidad] [nvarchar](100) NULL,
	[FecReg] [datetime] NULL,
 CONSTRAINT [PK_tblMedico] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNivelAtencion]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNivelAtencion](
	[idNivelAtencion] [int] NOT NULL,
	[NivelAtencion] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblNivelAtencion] PRIMARY KEY CLUSTERED 
(
	[idNivelAtencion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPersona]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPersona](
	[idPersona] [int] NOT NULL,
	[Nombre] [nchar](10) NULL,
	[Paterno] [nchar](10) NULL,
	[Materno] [nchar](10) NULL,
	[Genero] [nchar](10) NULL,
	[FecNac] [nchar](10) NULL,
	[Curp] [nchar](10) NULL,
	[FecReg] [datetime] NULL,
 CONSTRAINT [PK_tblPersona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblServicio]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServicio](
	[idServicio] [int] NOT NULL,
	[idNivelAtencion] [int] NULL,
	[Servicio] [nvarchar](200) NULL,
	[Descripcion] [nvarchar](500) NULL,
	[FecReg] [datetime] NULL,
 CONSTRAINT [PK_tblServicio] PRIMARY KEY CLUSTERED 
(
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTipoContacto]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTipoContacto](
	[idTipoContacto] [int] NOT NULL,
	[TipoContacto] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblTipoContacto] PRIMARY KEY CLUSTERED 
(
	[idTipoContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTutor]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTutor](
	[idTutor] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[fecRecg] [datetime] NULL,
 CONSTRAINT [PK_tblTutor] PRIMARY KEY CLUSTERED 
(
	[idTutor] ASC,
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 07/03/2015 12:59:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuario](
	[idUsuario] [int] NOT NULL,
	[idPersona] [int] NULL,
	[usuario] [nvarchar](50) NULL,
	[contrasenia] [nvarchar](50) NULL,
	[FecReg] [datetime] NULL CONSTRAINT [DF_tblUsuario_FecReg]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblUsuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ctgRol] ([idRol], [Rol]) VALUES (1, N'Paciente')
INSERT [dbo].[ctgRol] ([idRol], [Rol]) VALUES (2, N'Doctor')
INSERT [dbo].[ctgRol] ([idRol], [Rol]) VALUES (3, N'Administrador Hospital')
INSERT [dbo].[ctgRol] ([idRol], [Rol]) VALUES (4, N'Administrador')
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario]) VALUES (1, 4, 1)
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (1, NULL, N'test', N'123', CAST(N'2015-03-07 10:15:36.063' AS DateTime))
ALTER TABLE [dbo].[relMedicoCentroServicio] ADD  CONSTRAINT [DF_relMedicoCentroServicio_fecReg]  DEFAULT (getdate()) FOR [fecReg]
GO
ALTER TABLE [dbo].[tblCita] ADD  CONSTRAINT [DF_tblCita_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
ALTER TABLE [dbo].[tblDatosContacto] ADD  CONSTRAINT [DF_tblDatosContacto_fecReg]  DEFAULT (getdate()) FOR [fecReg]
GO
ALTER TABLE [dbo].[tblDireccion] ADD  CONSTRAINT [DF_tblDireccion_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
ALTER TABLE [dbo].[tblHorarioCentroSalud] ADD  CONSTRAINT [DF_tblHorarioCentroSalud_fecReg]  DEFAULT (getdate()) FOR [fecReg]
GO
ALTER TABLE [dbo].[tblMedico] ADD  CONSTRAINT [DF_tblMedico_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
ALTER TABLE [dbo].[tblPersona] ADD  CONSTRAINT [DF_tblPersona_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
ALTER TABLE [dbo].[tblServicio] ADD  CONSTRAINT [DF_tblServicio_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
ALTER TABLE [dbo].[tblTutor] ADD  CONSTRAINT [DF_tblTutor_fecRecg]  DEFAULT (getdate()) FOR [fecRecg]
GO
USE [master]
GO
ALTER DATABASE [SALUD-CDMX] SET  READ_WRITE 
GO
