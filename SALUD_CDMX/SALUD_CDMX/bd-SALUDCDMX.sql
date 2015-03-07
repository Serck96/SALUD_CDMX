USE [SALUD-CDMX]
GO
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 03/07/2015 03:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuario](
	[idUsuario] [int] NOT NULL,
	[idPersona] [int] NULL,
	[usuario] [nvarchar](50) NULL,
	[contrasenia] [nvarchar](50) NULL,
	[FecReg] [datetime] NULL,
 CONSTRAINT [PK_tblUsuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTutor]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTipoContacto]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblServicio]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRol]    Script Date: 03/07/2015 03:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRol](
	[idRol] [int] NOT NULL,
	[Rol] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPersona]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNivelAtencion]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMedico]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHorarioCentroSalud]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHora]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDireccion]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDia]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDatosContacto]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCita]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCentroSalud]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[relPersonaRol]    Script Date: 03/07/2015 03:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relPersonaRol](
	[idRol] [money] NOT NULL,
	[idPersona] [int] NOT NULL,
 CONSTRAINT [PK_relPersonaRol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC,
	[idPersona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[relMedicoCentroServicio]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[relCentroSaludServicio]    Script Date: 03/07/2015 03:41:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_relMedicoCentroServicio_fecReg]    Script Date: 03/07/2015 03:41:52 ******/
ALTER TABLE [dbo].[relMedicoCentroServicio] ADD  CONSTRAINT [DF_relMedicoCentroServicio_fecReg]  DEFAULT (getdate()) FOR [fecReg]
GO
/****** Object:  Default [DF_tblCita_FecReg]    Script Date: 03/07/2015 03:41:52 ******/
ALTER TABLE [dbo].[tblCita] ADD  CONSTRAINT [DF_tblCita_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
/****** Object:  Default [DF_tblDatosContacto_fecReg]    Script Date: 03/07/2015 03:41:52 ******/
ALTER TABLE [dbo].[tblDatosContacto] ADD  CONSTRAINT [DF_tblDatosContacto_fecReg]  DEFAULT (getdate()) FOR [fecReg]
GO
/****** Object:  Default [DF_tblDireccion_FecReg]    Script Date: 03/07/2015 03:41:52 ******/
ALTER TABLE [dbo].[tblDireccion] ADD  CONSTRAINT [DF_tblDireccion_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
/****** Object:  Default [DF_tblHorarioCentroSalud_fecReg]    Script Date: 03/07/2015 03:41:52 ******/
ALTER TABLE [dbo].[tblHorarioCentroSalud] ADD  CONSTRAINT [DF_tblHorarioCentroSalud_fecReg]  DEFAULT (getdate()) FOR [fecReg]
GO
/****** Object:  Default [DF_tblMedico_FecReg]    Script Date: 03/07/2015 03:41:52 ******/
ALTER TABLE [dbo].[tblMedico] ADD  CONSTRAINT [DF_tblMedico_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
/****** Object:  Default [DF_tblPersona_FecReg]    Script Date: 03/07/2015 03:41:52 ******/
ALTER TABLE [dbo].[tblPersona] ADD  CONSTRAINT [DF_tblPersona_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
/****** Object:  Default [DF_tblServicio_FecReg]    Script Date: 03/07/2015 03:41:52 ******/
ALTER TABLE [dbo].[tblServicio] ADD  CONSTRAINT [DF_tblServicio_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
/****** Object:  Default [DF_tblTutor_fecRecg]    Script Date: 03/07/2015 03:41:52 ******/
ALTER TABLE [dbo].[tblTutor] ADD  CONSTRAINT [DF_tblTutor_fecRecg]  DEFAULT (getdate()) FOR [fecRecg]
GO
/****** Object:  Default [DF_tblUsuario_FecReg]    Script Date: 03/07/2015 03:41:52 ******/
ALTER TABLE [dbo].[tblUsuario] ADD  CONSTRAINT [DF_tblUsuario_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
