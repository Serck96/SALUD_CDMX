USE [SALUD-CDMX]
GO
/****** Object:  Table [dbo].[relUsuarioRol]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relUsuarioRol](
	[idRelPersonaRol] [int] NOT NULL,
	[idRol] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idEstatus] [int] NULL,
 CONSTRAINT [PK_relPersonaRol_1] PRIMARY KEY CLUSTERED 
(
	[idRelPersonaRol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (1, 4, 1, NULL)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (2, 1, 2, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (3, 1, 3, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (4, 1, 4, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (5, 1, 5, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (6, 1, 6, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (7, 1, 7, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (8, 1, 8, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (9, 1, 9, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (10, 1, 10, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (11, 1, 11, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (12, 1, 12, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (13, 1, 13, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (14, 1, 14, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (15, 1, 15, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (16, 1, 16, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (17, 1, 17, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (18, 1, 18, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (19, 2, 19, NULL)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (20, 1, 20, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (21, 1, 21, 0)
/****** Object:  Table [dbo].[relMedicoCentroServicio]    Script Date: 03/08/2015 14:09:45 ******/
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
INSERT [dbo].[relMedicoCentroServicio] ([idMedico], [idCentroSalud], [idServicio], [fecReg]) VALUES (18, 129, 1, CAST(0x0000A4E900B2AFC1 AS DateTime))
/****** Object:  Table [dbo].[relCentroSaludServicio]    Script Date: 03/08/2015 14:09:45 ******/
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
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (1, 6)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (1, 7)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (1, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (2, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (2, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (3, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (3, 6)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (3, 7)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (3, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (4, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (4, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (5, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (5, 4)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (5, 5)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (5, 6)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (5, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (6, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (6, 4)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (6, 5)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (6, 7)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (6, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (7, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (7, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (8, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (8, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (9, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (9, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (10, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (10, 6)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (10, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (11, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (11, 6)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (11, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (12, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (12, 4)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (12, 5)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (12, 6)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (12, 7)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (12, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (13, 2)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (13, 6)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (13, 7)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (13, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (14, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (15, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (15, 4)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (15, 5)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (16, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (16, 4)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (17, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (17, 4)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (17, 5)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (17, 7)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (18, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (19, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (19, 4)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (19, 7)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (20, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (20, 4)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (21, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (21, 3)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (21, 4)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (44, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (44, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (44, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (45, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (45, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (45, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (46, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (46, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (46, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (47, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (47, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (47, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (48, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (48, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (48, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (49, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (49, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (49, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (50, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (50, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (50, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (51, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (51, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (51, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (52, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (52, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (52, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (53, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (53, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (53, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (54, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (54, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (54, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (55, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (55, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (55, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (56, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (56, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (56, 10)
GO
print 'Processed 100 total records'
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (57, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (57, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (57, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (58, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (58, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (58, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (59, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (59, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (59, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (60, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (60, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (60, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (61, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (61, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (61, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (62, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (62, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (62, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (63, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (63, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (63, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (64, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (64, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (64, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (65, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (65, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (65, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (66, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (66, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (66, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (67, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (67, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (67, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (68, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (68, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (68, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (69, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (69, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (69, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (70, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (70, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (70, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (71, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (71, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (71, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (72, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (72, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (72, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (73, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (73, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (73, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (74, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (74, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (74, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (75, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (75, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (75, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (76, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (76, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (76, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (77, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (77, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (77, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (78, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (78, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (78, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (79, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (79, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (79, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (80, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (80, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (80, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (81, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (81, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (81, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (82, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (82, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (82, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (83, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (83, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (83, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (84, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (84, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (84, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (85, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (85, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (85, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (86, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (86, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (86, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (87, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (87, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (87, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (88, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (88, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (88, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (89, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (89, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (89, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (90, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (90, 9)
GO
print 'Processed 200 total records'
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (90, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (91, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (91, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (91, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (92, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (92, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (92, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (93, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (93, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (93, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (94, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (94, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (94, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (95, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (95, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (95, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (96, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (96, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (96, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (97, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (97, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (97, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (98, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (98, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (98, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (99, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (99, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (99, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (100, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (100, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (100, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (101, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (101, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (101, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (102, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (102, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (102, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (103, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (103, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (103, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (104, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (104, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (104, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (105, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (105, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (105, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (106, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (106, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (106, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (107, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (107, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (107, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (108, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (108, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (108, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (109, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (109, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (109, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (110, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (110, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (110, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (111, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (111, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (111, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (112, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (112, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (112, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (113, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (113, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (113, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (114, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (114, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (114, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (115, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (115, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (115, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (116, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (116, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (116, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (117, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (117, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (117, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (118, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (118, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (118, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (119, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (119, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (119, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (120, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (120, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (120, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (121, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (121, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (121, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (122, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (122, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (122, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (123, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (123, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (123, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (124, 8)
GO
print 'Processed 300 total records'
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (124, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (124, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (125, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (125, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (125, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (126, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (126, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (126, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (127, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (127, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (127, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (128, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (128, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (128, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (129, 1)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (129, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (129, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (129, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (130, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (130, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (130, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (131, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (131, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (131, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (132, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (132, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (132, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (133, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (133, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (133, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (134, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (134, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (134, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (135, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (135, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (135, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (136, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (136, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (136, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (137, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (137, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (137, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (138, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (138, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (138, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (139, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (139, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (139, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (140, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (140, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (140, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (141, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (141, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (141, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (142, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (142, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (142, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (143, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (143, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (143, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (144, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (144, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (144, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (145, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (145, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (145, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (146, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (146, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (146, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (147, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (147, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (147, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (148, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (148, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (148, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (149, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (149, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (149, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (150, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (150, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (150, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (151, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (151, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (151, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (152, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (152, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (152, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (153, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (153, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (153, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (154, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (154, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (154, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (155, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (155, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (155, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (156, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (156, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (156, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (157, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (157, 9)
GO
print 'Processed 400 total records'
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (157, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (158, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (158, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (158, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (159, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (159, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (159, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (160, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (160, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (160, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (161, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (161, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (161, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (162, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (162, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (162, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (163, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (163, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (163, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (164, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (164, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (164, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (165, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (165, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (165, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (166, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (166, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (166, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (167, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (167, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (167, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (168, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (168, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (168, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (169, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (169, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (169, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (170, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (170, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (170, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (171, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (171, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (171, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (172, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (172, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (172, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (173, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (173, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (173, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (174, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (174, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (174, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (175, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (175, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (175, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (176, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (176, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (176, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (177, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (177, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (177, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (178, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (178, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (178, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (179, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (179, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (179, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (180, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (180, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (180, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (181, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (181, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (181, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (182, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (182, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (182, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (183, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (183, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (183, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (184, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (184, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (184, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (185, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (185, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (185, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (186, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (186, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (186, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (187, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (187, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (187, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (188, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (188, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (188, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (189, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (189, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (189, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (190, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (190, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (190, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (191, 8)
GO
print 'Processed 500 total records'
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (191, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (191, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (192, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (192, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (192, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (193, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (193, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (193, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (194, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (194, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (194, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (195, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (195, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (195, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (196, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (196, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (196, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (197, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (197, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (197, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (198, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (198, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (198, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (199, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (199, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (199, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (200, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (200, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (200, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (201, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (201, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (201, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (202, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (202, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (202, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (203, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (203, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (203, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (204, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (204, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (204, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (205, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (205, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (205, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (206, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (206, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (206, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (207, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (207, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (207, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (208, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (208, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (208, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (209, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (209, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (209, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (210, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (210, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (210, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (211, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (211, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (211, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (212, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (212, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (212, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (213, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (213, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (213, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (214, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (214, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (214, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (215, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (215, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (215, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (216, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (216, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (216, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (217, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (217, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (217, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (218, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (218, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (218, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (219, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (219, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (219, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (220, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (220, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (220, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (221, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (221, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (221, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (222, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (222, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (222, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (223, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (223, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (223, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (224, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (224, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (224, 10)
GO
print 'Processed 600 total records'
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (225, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (225, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (225, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (226, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (226, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (226, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (227, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (227, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (227, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (228, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (228, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (228, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (229, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (229, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (229, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (230, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (230, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (230, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (231, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (231, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (231, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (232, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (232, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (232, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (233, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (233, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (233, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (234, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (234, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (234, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (235, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (235, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (235, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (236, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (236, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (236, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (237, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (237, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (237, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (238, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (238, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (238, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (239, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (239, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (239, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (240, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (240, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (240, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (241, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (241, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (241, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (242, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (242, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (242, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (243, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (243, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (243, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (244, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (244, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (244, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (245, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (245, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (245, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (246, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (246, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (246, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (247, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (247, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (247, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (248, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (248, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (248, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (249, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (249, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (249, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (250, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (250, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (250, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (251, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (251, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (251, 10)
/****** Object:  Table [dbo].[ctgRol]    Script Date: 03/08/2015 14:09:45 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ctgRol] ([idRol], [Rol]) VALUES (1, N'Paciente')
INSERT [dbo].[ctgRol] ([idRol], [Rol]) VALUES (2, N'Doctor')
INSERT [dbo].[ctgRol] ([idRol], [Rol]) VALUES (3, N'Administrador Hospital')
INSERT [dbo].[ctgRol] ([idRol], [Rol]) VALUES (4, N'Administrador')
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 03/08/2015 14:09:45 ******/
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
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (1, NULL, N'test', N'123', CAST(0x0000A4CA00A91473 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (2, NULL, N'Luis', N'123', CAST(0x0000A4E90093B01E AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (3, NULL, N'Luis', N'123', CAST(0x0000A4E90093E996 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (4, NULL, N'Luis', N'123', CAST(0x0000A4E90094835B AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (5, NULL, N'Luis', N'1234', CAST(0x0000A4E900949ED1 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (6, NULL, N'Luis', N'12345', CAST(0x0000A4E900950DF3 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (7, NULL, N'dasds', N'dsad', CAST(0x0000A4E9009A95AC AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (8, NULL, N'dddd', N'1234', CAST(0x0000A4E900A54A51 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (9, NULL, N'dddd', N'', CAST(0x0000A4E900A5B341 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (10, NULL, N'Paps', N'teamo', CAST(0x0000A4E900B217A3 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (11, NULL, N'123', N'abcd', CAST(0x0000A4E900B389E2 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (12, 21, N'12345', N'123', CAST(0x0000A4E900B9719D AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (13, 23, N'abc', N'123', CAST(0x0000A4E900BF6B35 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (14, 24, N'rfuentes', N'123456', CAST(0x0000A45500C6ADE5 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (15, 25, N'test12', N'123', CAST(0x0000A45500C8CA85 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (16, 26, N'abcd123', N'abcd123', CAST(0x0000A45500CCB2C4 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (17, 27, N'prueba', N'123', CAST(0x0000A45500CDB204 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (18, 28, N'pamvilli', N'123456', CAST(0x0000A45500D0A840 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (19, 18, N'gier', N'1234', CAST(0x0000A45500D70CE8 AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (20, 29, N'luis', N'elmeliso', CAST(0x0000A45500E6CDFA AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (21, 30, N'eljon', N'bros', CAST(0x0000A45500E78461 AS DateTime))
/****** Object:  Table [dbo].[tblTutor]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTutor](
	[idTutor] [int] NOT NULL,
	[idPersonaTutor] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[fecRecg] [datetime] NULL,
 CONSTRAINT [PK_tblTutor_1] PRIMARY KEY CLUSTERED 
(
	[idTutor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (1, 1, 1, CAST(0x0000A4E90093B065 AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (2, 2, 1, CAST(0x0000A4E90093B07C AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (3, 3, 3, CAST(0x0000A4E90093E997 AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (4, 5, 4, CAST(0x0000A4E900948361 AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (5, 7, 6, CAST(0x0000A4E900949EF3 AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (6, 9, 8, CAST(0x0000A4E900950E0C AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (7, 11, 10, CAST(0x0000A4E9009A95B5 AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (8, 13, 12, CAST(0x0000A4E900A54A5B AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (9, 15, 14, CAST(0x0000A4E900A5B342 AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (10, 17, 16, CAST(0x0000A4E900B217B8 AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (11, 20, 19, CAST(0x0000A4E900B38A01 AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (12, 22, 21, CAST(0x0000A4E900B971AF AS DateTime))
/****** Object:  Table [dbo].[tblTipoContacto]    Script Date: 03/08/2015 14:09:45 ******/
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
/****** Object:  Table [dbo].[tblServicio]    Script Date: 03/08/2015 14:09:45 ******/
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
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (1, NULL, N'Gineco Obsetetricia', N'Mujeres embarazadas y Mujeres con padecimientos del sistema reproductor', CAST(0x0000A50700000000 AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (2, NULL, N'Oncologia Ginecologia', N'Mujeres con padecimiento maligno del aparato reproductor femenino', CAST(0x0000A4E900000000 AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (3, NULL, N'Clinica De La Mujer', N'Atenciòn integral a la mujer.', CAST(0x0000A4E9001DD171 AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (4, NULL, N'Colposcopia', N'Pacientes con patología cérvico vaginal sospechosa de malignidad

Se utiliza formato de "Referencia y/o Contrarreferencia" requisitado unicamente 

por médico tratante.', CAST(0x0000A4E9001DF883 AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (5, NULL, N'Clinica de Displasia', N'Pacientes con patología cérvico vaginal sospechosa de malignidad

Solicitud por el médico tratante de 2o nivel de atención, sujeto a la valoración del 

médico especialista', CAST(0x0000A4E9001E1FC1 AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (6, NULL, N'Ile', N'Mujeres embarazadas con periodo de gestación NO mayor a 12 semanas

Interrupción legal del embarazo hasta las 12 semanas de gestación en forma 

segura.

INE (credencial para votar) comprobante de domicilio y si es menor de edad 

acompañado de un adulto y comprobante de escuela.

El servicio se brinda inmediatamente con un proceso médico.', CAST(0x0000A4E9001E42C4 AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (7, NULL, N'Mastrografia', N'MASTOGRAFÍA

Mujeres y hombres con factores de riesgo y/o sospecha de patología mamaria', CAST(0x0000A4E9001E67F4 AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (8, NULL, N'CÁNCER DE PRÓSTATA', N'Población masculina mayor de 40 años.

Unidades de salud de detección oportuna en 12 estaciones del Metro y 2 en la 

Central de Abastos, Medibuses y Centros de Salud.', CAST(0x0000A4E9001E9653 AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (9, NULL, N'OBESIDAD', N'Población en general. Prevención y control de sobrepeso y obesidad.

Adopción de una alimentación sana. Gimnasios urbanos fomentan la actividad 

física en la vida cotidiana.', CAST(0x0000A4E9001ECF59 AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (10, NULL, N'ENFERMEDADES CRÓNICO DEGENERATIVAS', N'Población que reside en el Distrito Federal 

Disminuir la morbilidad y mortalidad por enfermedades crónicas servicios óptimos 

en la detección, diagnóstico y tratamiento oportunos y control del padecimiento, 

participación responsable de la población en el autocuidado de su salud.', CAST(0x0000A4E9001EF117 AS DateTime))
/****** Object:  Table [dbo].[tblPersona]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPersona](
	[idPersona] [int] NOT NULL,
	[Nombre] [nvarchar](500) NULL,
	[Paterno] [nvarchar](500) NULL,
	[Materno] [nvarchar](500) NULL,
	[Genero] [nvarchar](500) NULL,
	[FecNac] [nvarchar](500) NULL,
	[Curp] [nvarchar](500) NULL,
	[mail] [nvarchar](500) NULL,
	[FecReg] [datetime] NULL,
	[Peso] [nvarchar](50) NULL,
	[Altura] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblPersona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (1, N'dasda', N'dasda', N'dasdas', N'M', N'dsadas', N'          ', N'masg.shadow@hotmail.es', CAST(0x0000A4E90093B062 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (2, N'          ', N'          ', N'          ', N'          ', N'', N'          ', NULL, CAST(0x0000A4E90093B07B AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ', NULL, CAST(0x0000A4E90093E997 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (4, N'Luis Alberto', N'De la Rosa', N'Muñoz', N'M', N'1976-01-05', N'dasdsaaadsadsadas', NULL, CAST(0x0000A4E90094835D AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (5, N'', N'', N'', N'', N'', N'', NULL, CAST(0x0000A4E900948361 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (6, N'Luis Alberto', N'De la Rosa', N'Muñoz', N'M', N'1976-01-05', N'dasdsaaadsadsadas', NULL, CAST(0x0000A4E900949EDE AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (7, N'', N'', N'', N'', N'', N'', NULL, CAST(0x0000A4E900949EE3 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (8, N'Luis Alberto', N'De la Rosa', N'Muñoz', N'M', N'1976-01-05', N'dasdsaaadsadsadas', NULL, CAST(0x0000A4E900950DF6 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (9, N'', N'', N'', N'', N'', N'', NULL, CAST(0x0000A4E900950E09 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (10, N'Lui', N'sa', N'sadsa', N'M', N'1840-01-28', N'dsadsadsa', NULL, CAST(0x0000A4E9009A95B1 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (11, N'', N'', N'', N'', N'', N'', NULL, CAST(0x0000A4E9009A95B5 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (12, N'yy', N'uyiu', N'yuiy', N'M', N'2015-10-29', N'agcde', NULL, CAST(0x0000A4E900A54A57 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (13, N'ssfsd', N'kjkjklj', N'jkllkj', N'M', N'2015-03-10', N'fsdfsd', NULL, CAST(0x0000A4E900A54A5B AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (14, N'yy', N'uyiu', N'yuiy', N'M', N'2015-10-29', N'agcde', NULL, CAST(0x0000A4E900A5B341 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (15, N'ssfsd', N'kjkjklj', N'jkllkj', N'M', N'2015-03-10', N'fsdfsd', NULL, CAST(0x0000A4E900A5B342 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (16, N'Melisa', N'De la Rosa', N'Tutoriales', N'F', N'1989-01-01', N'dsadsadsadsa', N'masg.shadow@hotmail.es', CAST(0x0000A4E900B217A4 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (17, N'', N'', N'', N'', N'', N'', N'', CAST(0x0000A4E900B217AA AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (18, N'GERARDO', N'PONCE', N'ORTEGA', N'M', NULL, NULL, N'gponce@momtnyum-ti.com', CAST(0x0000A4E900B29D86 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (19, N'dsad', N'asd', N'dsadas', N'M', N'1438-06-05', N'', N'masg.shadow@hotmail.es', CAST(0x0000A4E900B389E9 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (20, N'', N'', N'', N'', N'', N'', N'', CAST(0x0000A4E900B389EA AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (21, N'dsadsa', N'dasdasdas', N'dasdsa', N'', N'', N'', N'masg.shadow@hotmail.es', CAST(0x0000A4E900B971A0 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (22, N'', N'', N'', N'', N'', N'', N'', CAST(0x0000A4E900B971AF AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (23, N'dsadsa', N'dsadsa', N'dsadsa', N'F', N'1879-02-04', N'dasdsadsada', N'masg.shadow@hotmail.es', CAST(0x0000A4E900BF6B39 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (24, N'ROSA ILIANA', N'FUENTES', N'CRUZ', N'F', N'1980-10-10', N'FUC821009HDFNRS08', N'gerardo2002@hotmail.com', CAST(0x0000A45500C6ADE5 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (25, N'test', N'test', N'test', N'M', N'2009-02-17', N'sadasa', N'', CAST(0x0000A45500C8CA85 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (26, N'sdfsdfs', N'sdfsdfsd', N'sdffsdfs', N'F', N'2012-02-16', N'asdasdasdas', N'', CAST(0x0000A45500CCB2C4 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (27, N'dsadsa', N'dasd', N'dsad', N'M', N'1982-02-03', N'dsadsad', N'masg.shadow@hotmail.es', CAST(0x0000A45500CDB204 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (28, N'PAMELA', N'VILLAFUERTE', N'VILLICAÑA', N'F', N'1995-02-06', N'VIVP950206MDFLL07', N'australiapm@hotmail.com', CAST(0x0000A45500D0A840 AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (29, N'LUIS ALBERTO', N'DE LA ROSA', N'MUÑOZ', N'M', N'1996-02-19', N'ELUISMELISO', N'alberto_uzumaki@hotmail.com', CAST(0x0000A45500E6CDFA AS DateTime), NULL, NULL)
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [mail], [FecReg], [Peso], [Altura]) VALUES (30, N'el jon', N'martinez', N'romero', N'M', N'1996-06-30', N'jonasbro', N'ymartinez@momentum-ti.com', CAST(0x0000A45500E78461 AS DateTime), NULL, NULL)
/****** Object:  Table [dbo].[tblNivelAtencion]    Script Date: 03/08/2015 14:09:45 ******/
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
/****** Object:  Table [dbo].[tblMunicipio]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMunicipio](
	[IdMunicipio] [int] NOT NULL,
	[IdEstado] [int] NOT NULL,
	[Municipio] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblMunicipio] PRIMARY KEY CLUSTERED 
(
	[IdMunicipio] ASC,
	[IdEstado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (1, 9, N'Azcapotzalco')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (2, 9, N'Benito Juárez')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (3, 9, N'Coyoacán')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (4, 9, N'Cuajimalpa de Morelos')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (5, 9, N'Cuauhtémoc')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (6, 9, N'Gustavo A. Madero')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (7, 9, N'Iztacalco')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (8, 9, N'Iztapalapa')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (9, 9, N'La Magdalena Contreras')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (10, 9, N'Miguel Hidalgo')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (11, 9, N'Milpa Alta')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (12, 9, N'Tláhuac')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (13, 9, N'Tlalpan')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (14, 9, N'Venustiano Carranza')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (15, 9, N'Xochimilco')
INSERT [dbo].[tblMunicipio] ([IdMunicipio], [IdEstado], [Municipio]) VALUES (16, 9, N'Alvaro Obregón')
/****** Object:  Table [dbo].[tblMedico]    Script Date: 03/08/2015 14:09:45 ******/
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
/****** Object:  Table [dbo].[tblHorarioMedico]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHorarioMedico](
	[idHorarioMedico] [int] NOT NULL,
	[idHorario] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
 CONSTRAINT [PK_tblHorarioMedico] PRIMARY KEY CLUSTERED 
(
	[idHorarioMedico] ASC,
	[idHorario] ASC,
	[idPersona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblHorarioMedico] ([idHorarioMedico], [idHorario], [idPersona]) VALUES (1, 1, 18)
/****** Object:  Table [dbo].[tblHorarioCentroSalud]    Script Date: 03/08/2015 14:09:45 ******/
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
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1, 129, 1, 1, CAST(0x00009FB100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (20, 20, 1, 24, CAST(0x00009E6400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (21, 21, 1, 24, CAST(0x00009E8300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (22, 22, 1, 24, CAST(0x00009E9F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (23, 23, 1, 24, CAST(0x00009EBE00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (24, 24, 1, 24, CAST(0x00009EDC00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (25, 25, 1, 24, CAST(0x00009EFB00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (26, 26, 1, 24, CAST(0x00009F1900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (27, 27, 1, 24, CAST(0x00009F3800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (28, 28, 1, 24, CAST(0x00009F5700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (29, 29, 1, 24, CAST(0x00009F7500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (30, 30, 1, 24, CAST(0x00009F9400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (31, 31, 1, 24, CAST(0x00009FB200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (51, 51, 1, 12, CAST(0x00009E6500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (52, 52, 1, 12, CAST(0x00009E8400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (53, 53, 1, 12, CAST(0x00009EA000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (54, 54, 1, 12, CAST(0x00009EBF00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (55, 55, 1, 12, CAST(0x00009EDD00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (56, 56, 1, 12, CAST(0x00009EFC00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (57, 57, 1, 12, CAST(0x00009F1A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (58, 58, 1, 12, CAST(0x00009F3900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (59, 59, 1, 12, CAST(0x00009F5800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (60, 60, 1, 12, CAST(0x00009F7600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (61, 61, 1, 12, CAST(0x00009F9500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (62, 62, 1, 12, CAST(0x00009FB300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (82, 82, 1, 12, CAST(0x00009E6600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (83, 83, 1, 12, CAST(0x00009E8500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (84, 84, 1, 12, CAST(0x00009EA100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (85, 85, 1, 12, CAST(0x00009EC000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (86, 86, 1, 12, CAST(0x00009EDE00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (87, 87, 1, 12, CAST(0x00009EFD00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (88, 88, 1, 12, CAST(0x00009F1B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (89, 89, 1, 12, CAST(0x00009F3A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (90, 90, 1, 12, CAST(0x00009F5900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (91, 91, 1, 12, CAST(0x00009F7700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (92, 92, 1, 12, CAST(0x00009F9600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (93, 93, 1, 12, CAST(0x00009FB400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (112, 112, 1, 12, CAST(0x00009E6700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (113, 113, 1, 12, CAST(0x00009E8600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (114, 114, 1, 12, CAST(0x00009EA200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (115, 115, 1, 12, CAST(0x00009EC100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (116, 116, 1, 12, CAST(0x00009EDF00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (117, 117, 1, 12, CAST(0x00009EFE00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (118, 118, 1, 12, CAST(0x00009F1C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (119, 119, 1, 12, CAST(0x00009F3B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (120, 120, 1, 12, CAST(0x00009F5A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (121, 121, 1, 12, CAST(0x00009F7800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (122, 122, 1, 12, CAST(0x00009F9700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (123, 123, 1, 12, CAST(0x00009FB500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (143, 143, 1, 12, CAST(0x00009E6800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (144, 144, 1, 12, CAST(0x00009E8700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (145, 145, 1, 12, CAST(0x00009EA300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (146, 146, 1, 12, CAST(0x00009EC200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (147, 147, 1, 12, CAST(0x00009EE000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (148, 148, 1, 12, CAST(0x00009EFF00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (149, 149, 1, 12, CAST(0x00009F1D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (150, 150, 1, 12, CAST(0x00009F3C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (151, 151, 1, 12, CAST(0x00009F5B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (152, 152, 1, 12, CAST(0x00009F7900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (153, 153, 1, 12, CAST(0x00009F9800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (154, 154, 1, 12, CAST(0x00009FB600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (173, 173, 1, 12, CAST(0x00009E6900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (174, 174, 1, 12, CAST(0x00009E8800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (175, 175, 1, 12, CAST(0x00009EA400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (176, 176, 1, 12, CAST(0x00009EC300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (177, 177, 1, 12, CAST(0x00009EE100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (178, 178, 1, 12, CAST(0x00009F0000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (179, 179, 1, 12, CAST(0x00009F1E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (180, 180, 1, 12, CAST(0x00009F3D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (181, 181, 1, 12, CAST(0x00009F5C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (182, 182, 1, 12, CAST(0x00009F7A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (183, 183, 1, 12, CAST(0x00009F9900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (184, 184, 1, 12, CAST(0x00009FB700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (204, 204, 1, 12, CAST(0x00009FCB00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (205, 205, 1, 12, CAST(0x00009FEA00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (206, 206, 1, 12, CAST(0x0000A00700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (207, 207, 1, 12, CAST(0x0000A02600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (208, 208, 1, 12, CAST(0x0000A04400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (209, 209, 1, 12, CAST(0x0000A06300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (210, 210, 1, 12, CAST(0x0000A08100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (211, 211, 1, 12, CAST(0x0000A0A000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (212, 212, 1, 12, CAST(0x0000A0BF00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (213, 213, 1, 12, CAST(0x0000A0DD00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (214, 214, 1, 12, CAST(0x0000A0FC00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (215, 215, 1, 12, CAST(0x0000A11A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (235, 235, 1, 12, CAST(0x00009FCC00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (236, 236, 1, 12, CAST(0x00009FEB00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (237, 237, 1, 12, CAST(0x0000A00800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (238, 238, 1, 12, CAST(0x0000A02700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (239, 239, 1, 12, CAST(0x0000A04500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (240, 240, 1, 12, CAST(0x0000A06400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (241, 241, 1, 12, CAST(0x0000A08200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (242, 242, 1, 12, CAST(0x0000A0A100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (243, 243, 1, 12, CAST(0x0000A0C000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (244, 244, 1, 12, CAST(0x0000A0DE00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (245, 245, 1, 12, CAST(0x0000A0FD00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (246, 246, 1, 12, CAST(0x0000A11B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (264, 5, 2, 24, CAST(0x00009FCD00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (265, 6, 2, 24, CAST(0x00009FEC00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (266, 7, 2, 24, CAST(0x0000A00900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (267, 8, 2, 24, CAST(0x0000A02800000000 AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (268, 9, 2, 24, CAST(0x0000A04600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (269, 10, 2, 24, CAST(0x0000A06500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (270, 11, 2, 24, CAST(0x0000A08300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (271, 12, 2, 24, CAST(0x0000A0A200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (272, 13, 2, 24, CAST(0x0000A0C100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (273, 14, 2, 24, CAST(0x0000A0DF00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (274, 15, 2, 24, CAST(0x0000A0FE00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (275, 16, 2, 24, CAST(0x0000A11C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (295, 36, 2, 12, CAST(0x00009FCE00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (296, 37, 2, 12, CAST(0x00009FED00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (297, 38, 2, 12, CAST(0x0000A00A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (298, 39, 2, 12, CAST(0x0000A02900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (299, 40, 2, 12, CAST(0x0000A04700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (300, 41, 2, 12, CAST(0x0000A06600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (301, 42, 2, 12, CAST(0x0000A08400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (302, 43, 2, 12, CAST(0x0000A0A300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (303, 44, 2, 12, CAST(0x0000A0C200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (304, 45, 2, 12, CAST(0x0000A0E000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (305, 46, 2, 12, CAST(0x0000A0FF00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (306, 47, 2, 12, CAST(0x0000A11D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (325, 66, 2, 12, CAST(0x00009FCF00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (326, 67, 2, 12, CAST(0x00009FEE00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (327, 68, 2, 12, CAST(0x0000A00B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (328, 69, 2, 12, CAST(0x0000A02A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (329, 70, 2, 12, CAST(0x0000A04800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (330, 71, 2, 12, CAST(0x0000A06700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (331, 72, 2, 12, CAST(0x0000A08500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (332, 73, 2, 12, CAST(0x0000A0A400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (333, 74, 2, 12, CAST(0x0000A0C300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (334, 75, 2, 12, CAST(0x0000A0E100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (335, 76, 2, 12, CAST(0x0000A10000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (336, 77, 2, 12, CAST(0x0000A11E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (356, 97, 2, 12, CAST(0x00009FD000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (357, 98, 2, 12, CAST(0x00009FEF00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (358, 99, 2, 12, CAST(0x0000A00C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (359, 100, 2, 12, CAST(0x0000A02B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (360, 101, 2, 12, CAST(0x0000A04900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (361, 102, 2, 12, CAST(0x0000A06800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (362, 103, 2, 12, CAST(0x0000A08600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (363, 104, 2, 12, CAST(0x0000A0A500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (364, 105, 2, 12, CAST(0x0000A0C400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (365, 106, 2, 12, CAST(0x0000A0E200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (366, 107, 2, 12, CAST(0x0000A10100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (367, 108, 2, 12, CAST(0x0000A11F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (386, 127, 2, 12, CAST(0x00009FD100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (387, 128, 2, 12, CAST(0x00009FF000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (388, 129, 2, 12, CAST(0x0000A00D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (389, 130, 2, 12, CAST(0x0000A02C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (390, 131, 2, 12, CAST(0x0000A04A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (391, 132, 2, 12, CAST(0x0000A06900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (392, 133, 2, 12, CAST(0x0000A08700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (393, 134, 2, 12, CAST(0x0000A0A600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (394, 135, 2, 12, CAST(0x0000A0C500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (395, 136, 2, 12, CAST(0x0000A0E300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (396, 137, 2, 12, CAST(0x0000A10200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (397, 138, 2, 12, CAST(0x0000A12000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (417, 158, 2, 12, CAST(0x00009FD200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (418, 159, 2, 12, CAST(0x00009FF100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (419, 160, 2, 12, CAST(0x0000A00E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (420, 161, 2, 12, CAST(0x0000A02D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (421, 162, 2, 12, CAST(0x0000A04B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (422, 163, 2, 12, CAST(0x0000A06A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (423, 164, 2, 12, CAST(0x0000A08800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (424, 165, 2, 12, CAST(0x0000A0A700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (425, 166, 2, 12, CAST(0x0000A0C600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (426, 167, 2, 12, CAST(0x0000A0E400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (427, 168, 2, 12, CAST(0x0000A10300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (428, 169, 2, 12, CAST(0x0000A12100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (448, 189, 2, 12, CAST(0x00009FD300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (449, 190, 2, 12, CAST(0x00009FF200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (450, 191, 2, 12, CAST(0x0000A00F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (451, 192, 2, 12, CAST(0x0000A02E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (452, 193, 2, 12, CAST(0x0000A04C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (453, 194, 2, 12, CAST(0x0000A06B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (454, 195, 2, 12, CAST(0x0000A08900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (455, 196, 2, 12, CAST(0x0000A0A800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (456, 197, 2, 12, CAST(0x0000A0C700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (457, 198, 2, 12, CAST(0x0000A0E500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (458, 199, 2, 12, CAST(0x0000A10400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (459, 200, 2, 12, CAST(0x0000A12200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (478, 219, 2, 12, CAST(0x00009FD400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (479, 220, 2, 12, CAST(0x00009FF300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (480, 221, 2, 12, CAST(0x0000A01000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (481, 222, 2, 12, CAST(0x0000A02F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (482, 223, 2, 12, CAST(0x0000A04D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (483, 224, 2, 12, CAST(0x0000A06C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (484, 225, 2, 12, CAST(0x0000A08A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (485, 226, 2, 12, CAST(0x0000A0A900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (486, 227, 2, 12, CAST(0x0000A0C800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (487, 228, 2, 12, CAST(0x0000A0E600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (488, 229, 2, 12, CAST(0x0000A10500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (489, 230, 2, 12, CAST(0x0000A12300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (509, 250, 2, 12, CAST(0x00009FD500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (510, 251, 2, 12, CAST(0x00009FF400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (511, 252, 2, 12, CAST(0x0000A01100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (512, 253, 2, 12, CAST(0x0000A03000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (513, 254, 2, 12, CAST(0x0000A04E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (514, 255, 2, 12, CAST(0x0000A06D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (515, 256, 2, 12, CAST(0x0000A08B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (516, 257, 2, 12, CAST(0x0000A0AA00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (517, 258, 2, 12, CAST(0x0000A0C900000000 AS DateTime))
GO
print 'Processed 200 total records'
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (518, 259, 2, 12, CAST(0x0000A0E700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (519, 1, 3, 24, CAST(0x0000A10600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (520, 2, 3, 24, CAST(0x0000A12400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (539, 21, 3, 24, CAST(0x00009FD600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (540, 22, 3, 24, CAST(0x00009FF500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (541, 23, 3, 24, CAST(0x0000A01200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (542, 24, 3, 24, CAST(0x0000A03100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (543, 25, 3, 24, CAST(0x0000A04F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (544, 26, 3, 24, CAST(0x0000A06E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (545, 27, 3, 24, CAST(0x0000A08C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (546, 28, 3, 24, CAST(0x0000A0AB00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (547, 29, 3, 24, CAST(0x0000A0CA00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (548, 30, 3, 24, CAST(0x0000A0E800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (549, 31, 3, 24, CAST(0x0000A10700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (550, 32, 3, 24, CAST(0x0000A12500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (570, 52, 3, 12, CAST(0x0000A13900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (571, 53, 3, 12, CAST(0x0000A15800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (572, 54, 3, 12, CAST(0x0000A17400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (573, 55, 3, 12, CAST(0x0000A19300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (574, 56, 3, 12, CAST(0x0000A1B100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (575, 57, 3, 12, CAST(0x0000A1D000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (576, 58, 3, 12, CAST(0x0000A1EE00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (577, 59, 3, 12, CAST(0x0000A20D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (578, 60, 3, 12, CAST(0x0000A22C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (579, 61, 3, 12, CAST(0x0000A24A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (580, 62, 3, 12, CAST(0x0000A26900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (581, 63, 3, 12, CAST(0x0000A28700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (601, 83, 3, 12, CAST(0x0000A13A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (602, 84, 3, 12, CAST(0x0000A15900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (603, 85, 3, 12, CAST(0x0000A17500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (604, 86, 3, 12, CAST(0x0000A19400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (605, 87, 3, 12, CAST(0x0000A1B200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (606, 88, 3, 12, CAST(0x0000A1D100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (607, 89, 3, 12, CAST(0x0000A1EF00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (608, 90, 3, 12, CAST(0x0000A20E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (609, 91, 3, 12, CAST(0x0000A22D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (610, 92, 3, 12, CAST(0x0000A24B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (611, 93, 3, 12, CAST(0x0000A26A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (612, 94, 3, 12, CAST(0x0000A28800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (629, 111, 3, 12, CAST(0x0000A13B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (630, 112, 3, 12, CAST(0x0000A15A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (631, 113, 3, 12, CAST(0x0000A17600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (632, 114, 3, 12, CAST(0x0000A19500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (633, 115, 3, 12, CAST(0x0000A1B300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (634, 116, 3, 12, CAST(0x0000A1D200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (635, 117, 3, 12, CAST(0x0000A1F000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (636, 118, 3, 12, CAST(0x0000A20F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (637, 119, 3, 12, CAST(0x0000A22E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (638, 120, 3, 12, CAST(0x0000A24C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (639, 121, 3, 12, CAST(0x0000A26B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (640, 122, 3, 12, CAST(0x0000A28900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (660, 142, 3, 12, CAST(0x0000A13C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (661, 143, 3, 12, CAST(0x0000A15B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (662, 144, 3, 12, CAST(0x0000A17700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (663, 145, 3, 12, CAST(0x0000A19600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (664, 146, 3, 12, CAST(0x0000A1B400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (665, 147, 3, 12, CAST(0x0000A1D300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (666, 148, 3, 12, CAST(0x0000A1F100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (667, 149, 3, 12, CAST(0x0000A21000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (668, 150, 3, 12, CAST(0x0000A22F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (669, 151, 3, 12, CAST(0x0000A24D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (670, 152, 3, 12, CAST(0x0000A26C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (671, 153, 3, 12, CAST(0x0000A28A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (690, 172, 3, 12, CAST(0x0000A13D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (691, 173, 3, 12, CAST(0x0000A15C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (692, 174, 3, 12, CAST(0x0000A17800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (693, 175, 3, 12, CAST(0x0000A19700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (694, 176, 3, 12, CAST(0x0000A1B500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (695, 177, 3, 12, CAST(0x0000A1D400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (696, 178, 3, 12, CAST(0x0000A1F200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (697, 179, 3, 12, CAST(0x0000A21100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (698, 180, 3, 12, CAST(0x0000A23000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (699, 181, 3, 12, CAST(0x0000A24E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (700, 182, 3, 12, CAST(0x0000A26D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (701, 183, 3, 12, CAST(0x0000A28B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (721, 203, 3, 12, CAST(0x0000A13E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (722, 204, 3, 12, CAST(0x0000A15D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (723, 205, 3, 12, CAST(0x0000A17900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (724, 206, 3, 12, CAST(0x0000A19800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (725, 207, 3, 12, CAST(0x0000A1B600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (726, 208, 3, 12, CAST(0x0000A1D500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (727, 209, 3, 12, CAST(0x0000A1F300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (728, 210, 3, 12, CAST(0x0000A21200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (729, 211, 3, 12, CAST(0x0000A23100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (730, 212, 3, 12, CAST(0x0000A24F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (731, 213, 3, 12, CAST(0x0000A26E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (732, 214, 3, 12, CAST(0x0000A28C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (751, 233, 3, 12, CAST(0x0000A13F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (752, 234, 3, 12, CAST(0x0000A15E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (753, 235, 3, 12, CAST(0x0000A17A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (754, 236, 3, 12, CAST(0x0000A19900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (755, 237, 3, 12, CAST(0x0000A1B700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (756, 238, 3, 12, CAST(0x0000A1D600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (757, 239, 3, 12, CAST(0x0000A1F400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (758, 240, 3, 12, CAST(0x0000A21300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (759, 241, 3, 12, CAST(0x0000A23200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (760, 242, 3, 12, CAST(0x0000A25000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (761, 243, 3, 12, CAST(0x0000A26F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (762, 244, 3, 12, CAST(0x0000A28D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (782, 5, 4, 24, CAST(0x0000A14000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (783, 6, 4, 24, CAST(0x0000A15F00000000 AS DateTime))
GO
print 'Processed 300 total records'
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (784, 7, 4, 24, CAST(0x0000A17B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (785, 8, 4, 24, CAST(0x0000A19A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (786, 9, 4, 24, CAST(0x0000A1B800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (787, 10, 4, 24, CAST(0x0000A1D700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (788, 11, 4, 24, CAST(0x0000A1F500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (789, 12, 4, 24, CAST(0x0000A21400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (790, 13, 4, 24, CAST(0x0000A23300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (791, 14, 4, 24, CAST(0x0000A25100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (792, 15, 4, 24, CAST(0x0000A27000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (793, 16, 4, 24, CAST(0x0000A28E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (813, 36, 4, 12, CAST(0x0000A14100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (814, 37, 4, 12, CAST(0x0000A16000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (815, 38, 4, 12, CAST(0x0000A17C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (816, 39, 4, 12, CAST(0x0000A19B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (817, 40, 4, 12, CAST(0x0000A1B900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (818, 41, 4, 12, CAST(0x0000A1D800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (819, 42, 4, 12, CAST(0x0000A1F600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (820, 43, 4, 12, CAST(0x0000A21500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (821, 44, 4, 12, CAST(0x0000A23400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (822, 45, 4, 12, CAST(0x0000A25200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (823, 46, 4, 12, CAST(0x0000A27100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (824, 47, 4, 12, CAST(0x0000A28F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (843, 66, 4, 12, CAST(0x0000A14200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (844, 67, 4, 12, CAST(0x0000A16100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (845, 68, 4, 12, CAST(0x0000A17D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (846, 69, 4, 12, CAST(0x0000A19C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (847, 70, 4, 12, CAST(0x0000A1BA00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (848, 71, 4, 12, CAST(0x0000A1D900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (849, 72, 4, 12, CAST(0x0000A1F700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (850, 73, 4, 12, CAST(0x0000A21600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (851, 74, 4, 12, CAST(0x0000A23500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (852, 75, 4, 12, CAST(0x0000A25300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (853, 76, 4, 12, CAST(0x0000A27200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (854, 77, 4, 12, CAST(0x0000A29000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (874, 97, 4, 12, CAST(0x0000A14300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (875, 98, 4, 12, CAST(0x0000A16200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (876, 99, 4, 12, CAST(0x0000A17E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (877, 100, 4, 12, CAST(0x0000A19D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (878, 101, 4, 12, CAST(0x0000A1BB00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (879, 102, 4, 12, CAST(0x0000A1DA00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (880, 103, 4, 12, CAST(0x0000A1F800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (881, 104, 4, 12, CAST(0x0000A21700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (882, 105, 4, 12, CAST(0x0000A23600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (883, 106, 4, 12, CAST(0x0000A25400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (884, 107, 4, 12, CAST(0x0000A27300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (885, 108, 4, 12, CAST(0x0000A29100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (904, 127, 4, 12, CAST(0x0000A14400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (905, 128, 4, 12, CAST(0x0000A16300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (906, 129, 4, 12, CAST(0x0000A17F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (907, 130, 4, 12, CAST(0x0000A19E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (908, 131, 4, 12, CAST(0x0000A1BC00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (909, 132, 4, 12, CAST(0x0000A1DB00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (910, 133, 4, 12, CAST(0x0000A1F900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (911, 134, 4, 12, CAST(0x0000A21800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (912, 135, 4, 12, CAST(0x0000A23700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (913, 136, 4, 12, CAST(0x0000A25500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (914, 137, 4, 12, CAST(0x0000A27400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (915, 138, 4, 12, CAST(0x0000A29200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (935, 158, 4, 12, CAST(0x0000A2A600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (936, 159, 4, 12, CAST(0x0000A2C500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (937, 160, 4, 12, CAST(0x0000A2E100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (938, 161, 4, 12, CAST(0x0000A30000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (939, 162, 4, 12, CAST(0x0000A31E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (940, 163, 4, 12, CAST(0x0000A33D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (941, 164, 4, 12, CAST(0x0000A35B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (942, 165, 4, 12, CAST(0x0000A37A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (943, 166, 4, 12, CAST(0x0000A39900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (944, 167, 4, 12, CAST(0x0000A3B700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (945, 168, 4, 12, CAST(0x0000A3D600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (946, 169, 4, 12, CAST(0x0000A3F400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (966, 189, 4, 12, CAST(0x0000A2A700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (967, 190, 4, 12, CAST(0x0000A2C600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (968, 191, 4, 12, CAST(0x0000A2E200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (969, 192, 4, 12, CAST(0x0000A30100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (970, 193, 4, 12, CAST(0x0000A31F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (971, 194, 4, 12, CAST(0x0000A33E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (972, 195, 4, 12, CAST(0x0000A35C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (973, 196, 4, 12, CAST(0x0000A37B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (974, 197, 4, 12, CAST(0x0000A39A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (975, 198, 4, 12, CAST(0x0000A3B800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (976, 199, 4, 12, CAST(0x0000A3D700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (977, 200, 4, 12, CAST(0x0000A3F500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (994, 217, 4, 12, CAST(0x0000A2A800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (995, 218, 4, 12, CAST(0x0000A2C700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (996, 219, 4, 12, CAST(0x0000A2E300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (997, 220, 4, 12, CAST(0x0000A30200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (998, 221, 4, 12, CAST(0x0000A32000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (999, 222, 4, 12, CAST(0x0000A33F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1000, 223, 4, 12, CAST(0x0000A35D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1001, 224, 4, 12, CAST(0x0000A37C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1002, 225, 4, 12, CAST(0x0000A39B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1003, 226, 4, 12, CAST(0x0000A3B900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1004, 227, 4, 12, CAST(0x0000A3D800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1005, 228, 4, 12, CAST(0x0000A3F600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1025, 248, 4, 12, CAST(0x0000A2A900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1026, 249, 4, 12, CAST(0x0000A2C800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1027, 250, 4, 12, CAST(0x0000A2E400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1028, 251, 4, 12, CAST(0x0000A30300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1029, 252, 4, 12, CAST(0x0000A32100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1030, 253, 4, 12, CAST(0x0000A34000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1031, 254, 4, 12, CAST(0x0000A35E00000000 AS DateTime))
GO
print 'Processed 400 total records'
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1032, 255, 4, 12, CAST(0x0000A37D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1033, 256, 4, 12, CAST(0x0000A39C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1034, 257, 4, 12, CAST(0x0000A3BA00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1035, 258, 4, 12, CAST(0x0000A3D900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1036, 259, 4, 12, CAST(0x0000A3F700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1055, 19, 5, 24, CAST(0x0000A2AA00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1056, 20, 5, 24, CAST(0x0000A2C900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1057, 21, 5, 24, CAST(0x0000A2E500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1058, 22, 5, 24, CAST(0x0000A30400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1059, 23, 5, 24, CAST(0x0000A32200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1060, 24, 5, 24, CAST(0x0000A34100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1061, 25, 5, 24, CAST(0x0000A35F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1062, 26, 5, 24, CAST(0x0000A37E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1063, 27, 5, 24, CAST(0x0000A39D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1064, 28, 5, 24, CAST(0x0000A3BB00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1065, 29, 5, 24, CAST(0x0000A3DA00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1066, 30, 5, 24, CAST(0x0000A3F800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1086, 50, 5, 12, CAST(0x0000A2AB00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1087, 51, 5, 12, CAST(0x0000A2CA00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1088, 52, 5, 12, CAST(0x0000A2E600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1089, 53, 5, 12, CAST(0x0000A30500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1090, 54, 5, 12, CAST(0x0000A32300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1091, 55, 5, 12, CAST(0x0000A34200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1092, 56, 5, 12, CAST(0x0000A36000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1093, 57, 5, 12, CAST(0x0000A37F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1094, 58, 5, 12, CAST(0x0000A39E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1095, 59, 5, 12, CAST(0x0000A3BC00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1096, 60, 5, 12, CAST(0x0000A3DB00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1097, 61, 5, 12, CAST(0x0000A3F900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1116, 80, 5, 12, CAST(0x0000A2AC00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1117, 81, 5, 12, CAST(0x0000A2CB00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1118, 82, 5, 12, CAST(0x0000A2E700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1119, 83, 5, 12, CAST(0x0000A30600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1120, 84, 5, 12, CAST(0x0000A32400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1121, 85, 5, 12, CAST(0x0000A34300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1122, 86, 5, 12, CAST(0x0000A36100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1123, 87, 5, 12, CAST(0x0000A38000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1124, 88, 5, 12, CAST(0x0000A39F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1125, 89, 5, 12, CAST(0x0000A3BD00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1126, 90, 5, 12, CAST(0x0000A3DC00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1127, 91, 5, 12, CAST(0x0000A3FA00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1147, 111, 5, 12, CAST(0x0000A2AD00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1148, 112, 5, 12, CAST(0x0000A2CC00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1149, 113, 5, 12, CAST(0x0000A2E800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1150, 114, 5, 12, CAST(0x0000A30700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1151, 115, 5, 12, CAST(0x0000A32500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1152, 116, 5, 12, CAST(0x0000A34400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1153, 117, 5, 12, CAST(0x0000A36200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1154, 118, 5, 12, CAST(0x0000A38100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1155, 119, 5, 12, CAST(0x0000A3A000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1156, 120, 5, 12, CAST(0x0000A3BE00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1157, 121, 5, 12, CAST(0x0000A3DD00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1158, 122, 5, 12, CAST(0x0000A3FB00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1178, 142, 5, 12, CAST(0x0000A2AE00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1179, 143, 5, 12, CAST(0x0000A2CD00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1180, 144, 5, 12, CAST(0x0000A2E900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1181, 145, 5, 12, CAST(0x0000A30800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1182, 146, 5, 12, CAST(0x0000A32600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1183, 147, 5, 12, CAST(0x0000A34500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1184, 148, 5, 12, CAST(0x0000A36300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1185, 149, 5, 12, CAST(0x0000A38200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1186, 150, 5, 12, CAST(0x0000A3A100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1187, 151, 5, 12, CAST(0x0000A3BF00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1188, 152, 5, 12, CAST(0x0000A3DE00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1189, 153, 5, 12, CAST(0x0000A3FC00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1208, 172, 5, 12, CAST(0x0000A2AF00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1209, 173, 5, 12, CAST(0x0000A2CE00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1210, 174, 5, 12, CAST(0x0000A2EA00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1211, 175, 5, 12, CAST(0x0000A30900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1212, 176, 5, 12, CAST(0x0000A32700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1213, 177, 5, 12, CAST(0x0000A34600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1214, 178, 5, 12, CAST(0x0000A36400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1215, 179, 5, 12, CAST(0x0000A38300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1216, 180, 5, 12, CAST(0x0000A3A200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1217, 181, 5, 12, CAST(0x0000A3C000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1218, 182, 5, 12, CAST(0x0000A3DF00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1219, 183, 5, 12, CAST(0x0000A3FD00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1239, 203, 5, 12, CAST(0x0000A2B000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1240, 204, 5, 12, CAST(0x0000A2CF00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1241, 205, 5, 12, CAST(0x0000A2EB00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1242, 206, 5, 12, CAST(0x0000A30A00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1243, 207, 5, 12, CAST(0x0000A32800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1244, 208, 5, 12, CAST(0x0000A34700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1245, 209, 5, 12, CAST(0x0000A36500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1246, 210, 5, 12, CAST(0x0000A38400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1247, 211, 5, 12, CAST(0x0000A3A300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1248, 212, 5, 12, CAST(0x0000A3C100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1249, 213, 5, 12, CAST(0x0000A3E000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1250, 214, 5, 12, CAST(0x0000A3FE00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1269, 233, 5, 12, CAST(0x0000A2B100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1270, 234, 5, 12, CAST(0x0000A2D000000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1271, 235, 5, 12, CAST(0x0000A2EC00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1272, 236, 5, 12, CAST(0x0000A30B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1273, 237, 5, 12, CAST(0x0000A32900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1274, 238, 5, 12, CAST(0x0000A34800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1275, 239, 5, 12, CAST(0x0000A36600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1276, 240, 5, 12, CAST(0x0000A38500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1277, 241, 5, 12, CAST(0x0000A3A400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1278, 242, 5, 12, CAST(0x0000A3C200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1279, 243, 5, 12, CAST(0x0000A3E100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1280, 244, 5, 12, CAST(0x0000A3FF00000000 AS DateTime))
GO
print 'Processed 500 total records'
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1300, 5, 6, 24, CAST(0x0000A41300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1301, 6, 6, 24, CAST(0x0000A43200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1302, 7, 6, 24, CAST(0x0000A44E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1303, 8, 6, 24, CAST(0x0000A46D00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1304, 9, 6, 24, CAST(0x0000A48B00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1305, 10, 6, 24, CAST(0x0000A4AA00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1306, 11, 6, 24, CAST(0x0000A4C800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1307, 12, 6, 24, CAST(0x0000A4E700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1308, 13, 6, 24, CAST(0x0000A50600000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1309, 14, 6, 24, CAST(0x0000A52400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1310, 15, 6, 24, CAST(0x0000A54300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1311, 16, 6, 24, CAST(0x0000A56100000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1331, 4, 7, 24, CAST(0x0000A41400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1332, 5, 7, 24, CAST(0x0000A43300000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1333, 6, 7, 24, CAST(0x0000A44F00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1334, 7, 7, 24, CAST(0x0000A46E00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1335, 8, 7, 24, CAST(0x0000A48C00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1336, 9, 7, 24, CAST(0x0000A4AB00000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1337, 10, 7, 24, CAST(0x0000A4C900000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1338, 11, 7, 24, CAST(0x0000A4E800000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1339, 12, 7, 24, CAST(0x0000A50700000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1340, 13, 7, 24, CAST(0x0000A52500000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1341, 14, 7, 24, CAST(0x0000A54400000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1342, 15, 7, 24, CAST(0x0000A56200000000 AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1359, 32, 7, 24, CAST(0x0000A41500000000 AS DateTime))
/****** Object:  Table [dbo].[tblHora]    Script Date: 03/08/2015 14:09:45 ******/
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
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (1, N'1')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (2, N'2')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (3, N'3')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (4, N'4')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (5, N'5')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (6, N'6')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (7, N'7')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (8, N'8')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (9, N'9')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (10, N'10')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (11, N'11')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (12, N'12')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (13, N'13')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (14, N'14')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (15, N'15')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (16, N'16')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (17, N'17')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (18, N'18')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (19, N'19')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (20, N'20')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (21, N'21')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (22, N'22')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (23, N'23')
INSERT [dbo].[tblHora] ([idHora], [Hora]) VALUES (24, N'24')
/****** Object:  Table [dbo].[tblEstatus]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstatus](
	[idEstatus] [int] NOT NULL,
	[Estatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblEstatus] PRIMARY KEY CLUSTERED 
(
	[idEstatus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblEstatus] ([idEstatus], [Estatus]) VALUES (1, N'Sin Confirmar')
INSERT [dbo].[tblEstatus] ([idEstatus], [Estatus]) VALUES (2, N'Confirmada')
INSERT [dbo].[tblEstatus] ([idEstatus], [Estatus]) VALUES (3, N'Atendida')
INSERT [dbo].[tblEstatus] ([idEstatus], [Estatus]) VALUES (4, N'Cancelada')
INSERT [dbo].[tblEstatus] ([idEstatus], [Estatus]) VALUES (5, N'Reprogramada')
/****** Object:  Table [dbo].[tblEstado]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstado](
	[IdEstado] [int] NOT NULL,
	[Estado] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblEstado] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDireccion]    Script Date: 03/08/2015 14:09:45 ******/
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
/****** Object:  Table [dbo].[tblDia]    Script Date: 03/08/2015 14:09:45 ******/
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
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (1, N'Lun  ')
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (2, N'Mar  ')
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (3, N'Mier ')
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (4, N'Jue  ')
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (5, N'Vie  ')
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (6, N'Sab  ')
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (7, N'Dom  ')
/****** Object:  Table [dbo].[tblDatosContacto]    Script Date: 03/08/2015 14:09:45 ******/
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
/****** Object:  Table [dbo].[tblCita]    Script Date: 03/08/2015 14:09:45 ******/
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
INSERT [dbo].[tblCita] ([idCita], [idHorario], [idPersona], [idMedico], [idEstatus], [Fecha], [FecReg]) VALUES (1, 1, 28, 18, 5, CAST(0x0000A46B00000000 AS DateTime), CAST(0x0000A45500D0FC0B AS DateTime))
INSERT [dbo].[tblCita] ([idCita], [idHorario], [idPersona], [idMedico], [idEstatus], [Fecha], [FecReg]) VALUES (2, 1, 28, 18, 4, CAST(0x0000A46400000000 AS DateTime), CAST(0x0000A45500D2700D AS DateTime))
INSERT [dbo].[tblCita] ([idCita], [idHorario], [idPersona], [idMedico], [idEstatus], [Fecha], [FecReg]) VALUES (3, 1, 28, 18, 5, CAST(0x0000A44F00000000 AS DateTime), CAST(0x0000A45500E4F38E AS DateTime))
INSERT [dbo].[tblCita] ([idCita], [idHorario], [idPersona], [idMedico], [idEstatus], [Fecha], [FecReg]) VALUES (4, 1, 28, 18, 4, CAST(0x0000A46400000000 AS DateTime), CAST(0x0000A45500E53195 AS DateTime))
INSERT [dbo].[tblCita] ([idCita], [idHorario], [idPersona], [idMedico], [idEstatus], [Fecha], [FecReg]) VALUES (5, 1, 29, 18, 5, CAST(0x0000A46B00000000 AS DateTime), CAST(0x0000A45500E6E9A0 AS DateTime))
INSERT [dbo].[tblCita] ([idCita], [idHorario], [idPersona], [idMedico], [idEstatus], [Fecha], [FecReg]) VALUES (6, 1, 30, 18, 5, CAST(0x0000A45600000000 AS DateTime), CAST(0x0000A45500E795CA AS DateTime))
INSERT [dbo].[tblCita] ([idCita], [idHorario], [idPersona], [idMedico], [idEstatus], [Fecha], [FecReg]) VALUES (7, 1, 30, 18, 2, CAST(0x0000A46400000000 AS DateTime), CAST(0x0000A45500E7D6A2 AS DateTime))
INSERT [dbo].[tblCita] ([idCita], [idHorario], [idPersona], [idMedico], [idEstatus], [Fecha], [FecReg]) VALUES (8, 1, 29, 18, 4, CAST(0x0000A45D00000000 AS DateTime), CAST(0x0000A45500E8446F AS DateTime))
/****** Object:  Table [dbo].[tblCentroSalud]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCentroSalud](
	[idCentroSalud] [int] NULL,
	[CentroSalud] [nvarchar](50) NULL,
	[idEstado] [int] NULL,
	[idMunicipio] [int] NULL,
	[Direccion] [nvarchar](500) NULL,
	[Lat] [nvarchar](50) NULL,
	[Long] [nvarchar](50) NULL,
	[Tipo] [nvarchar](50) NULL,
	[Subtipo] [nvarchar](50) NULL,
	[FecReg] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (129, N'Exhacienda de Eslava', 9, 9, N'Calle ProlongaciÃ³n Puente Cuadritos s/n, Col. San NicolÃ¡s Totolapan, C.P. 10900', N'-99.242603', N'19.293368', N'ClÃ­nica', N'T-I', CAST(0x0000A34800000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (130, N'AmpliaciÃ³n Lomas de San BernabÃ©', 9, 9, N'Av. Principal Mz-2  s/n Esq. Andador 14, Col. Tierra Unida, C.P. 10300', N'-99.269827', N'19.303073', N'ClÃ­nica', N'T-I', CAST(0x0000A36600000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (131, N'Tierra Colorada', 9, 9, N'Av. Metropolitana S/N, Col. Tierra Colorada, C.P. 10900', N'-99.145359', N'19.161551', N'ClÃ­nica', N'T-I', CAST(0x0000A38500000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (132, N'Dr. Manuel GutiÃ©rrez Zavala', 10, 10, N'Calle Laguna de TÃ©rminos No. 492,  Col. Anahuac, C.P. 11320 ', N'-99.173082', N'19.442404', N'ClÃ­nica', N'T-III', CAST(0x0000A3A400000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (134, N'Dr. Manuel GonzÃ¡lez Rivera', 10, 10, N'Prol. Carpio y Plan de San Luis S/n, Col. Santo TomÃ¡s, CP 11340', N'-99.169176', N'19.45248', N'ClÃ­nica', N'T-III', CAST(0x0000A3E100000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (156, N'Miguel Hidalgo', 12, 12, N'Calle Fidelio s/n esq. Deodato, Col. 10, C.P. 13200 ', N'-99.046942', N'19.291135', N'ClÃ­nica', N'T-III', CAST(0x0000A43200000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (157, N'San Francisco Tlaltenco', 12, 12, N'Â AndrÃ©s Quintana Roo y General Carlos A. Vidal s/n. Col San Francisco Tlaltenco C.P. 13400 ', N'-99.014058', N'19.295231', N'ClÃ­nica', N'T-III', CAST(0x0000A44E00000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (159, N'Quiahuatla', 12, 12, N'Margaritas S/N y Geranio Zona 02, Manzana 17, Lote 18), Col Quiahutla, C.P. 13090', N'-99.004017', N'19.26294', N'ClÃ­nica', N'T-I', CAST(0x0000A48B00000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (161, N'Parres', 13, 13, N'Calle Hidalgo s/n, frente a la Calle 20 de Noviembre, Col. Parres.', N'-99.182587', N'19.132063', N'ClÃ­nica', N'T-I', CAST(0x0000A4C800000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (162, N'Pedregal de las Ãguilas', 13, 13, N'Mixtecas s/n casi esq. Nahoas, Col Pedregal de las Ãguilas, C.P. 14439 ', N'-99.175741', N'19.272157', N'ClÃ­nica', N'T-II', CAST(0x0000A4E700000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (163, N'San AndrÃ©s Totoltepec', 13, 13, N'Camino Real al Ajusco s/n casi esq. 3ra. Cda de Tlaquexpa, Col San AndrÃ©s Totoltepec, C.P. 14629. ', N'-9917674', N'19.249186', N'ClÃ­nica', N'T-II', CAST(0x0000A50600000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (164, N'Topilejo', 13, 13, N' ProlongaciÃ³n Las Cruces s/n, esquina Mirador Chapultepec,  Col. San Miguel Topilejo, C.P. 14500 ', N'-99.146709', N'19.203305', N'ClÃ­nica', N'T-II', CAST(0x0000A52400000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (165, N'Cultura Maya', 13, 13, N'Izamal S/N entre las calles Tepakan y Hezelchakan, Col. Cultura Maya, C.P.14238', N'-99.222122', N'19.275939', N'ClÃ­nica', N'T-II', CAST(0x0000A54300000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (187, N'Dr. Juan Duque de Estrada', 14, 14, N'ORIENTE 170 No. 154 ESQ. 4a CERRADA DE ORIENTE 168, COL. MOCTEZUMA 2Â° SECCIÃ“N, C.P. 15500 ', N'-99.097078', N'19.428452', N'ClÃ­nica', N'T-III', CAST(0x0000A43300000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (188, N'Dr. Luis E. Ruiz ', 14, 14, N'EJE 2 ORIENTE AV. H. CONGRESO DE LA UNIÃ“N No. 148, COL. DEL PARQUE, C.P. 15810 ', N'-99.1196', N'19.424547', N'ClÃ­nica', N'T-III', CAST(0x0000A44F00000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (189, N'Romero Rubio', 14, 14, N'MANCHURIA No. 8 ESQ. TRANSVAAL, COL. AQUILES SERDÃN, C.P. 15430', N'-99.090367', N'19.444073', N'ClÃ­nica', N'T-III', CAST(0x0000A46E00000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (190, N'RevoluciÃ³n', 14, 14, N'FRANCISCO SERRANO No. 5, COL. 10, C.P. 15470  ', N'-99.106648', N'19.436541', N'ClÃ­nica', N'T-I', CAST(0x0000A48C00000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (191, N'RenovaciÃ³n', 14, 14, N'FRANCISCO ESPEJEL No. 92, COL. MOCTEZUMA 1a SECCIÃ“N, C.P. 15500 ', N'-99.109556', N'19.432105', N'ClÃ­nica', N'T-I', CAST(0x0000A4AB00000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (192, N'Cuatro Arboles', 14, 14, N'BIENES NACIONALES No. 88, COL. CUATRO ÃRBOLES, C.P. 15730 ', N'-99.084111', N'19.416773', N'ClÃ­nica', N'T-I', CAST(0x0000A4C900000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (193, N'AmpliaciÃ³n Caracol', 14, 14, N'AV. RÃO CHURUBUSCO No. 180, COL. AMPLIACIÃ“N CARACOL, C.P. 15650 ', N'-99.065115', N'19.427521', N'ClÃ­nica', N'T-I', CAST(0x0000A4E800000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (194, N'PolvorÃ­n', 14, 14, N'JUAN PARDAVÃ‰ No. 35, PUEBLO DE LA MAGDALENA MIXHUCA, C.P. 15850  ', N'-99.115252', N'19.409854', N'ClÃ­nica', N'T-I', CAST(0x0000A50700000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (196, N'San BartolomÃ© Xicomulco', 15, 15, N'', N'', N'', N'ClÃ­nica', N'T-I', CAST(0x0000A54400000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (197, N'Santa Cruz Acalpixca', 15, 15, N'Ahualapa s/n, Col. Pueblo de Santa Cruz Acalpixca, C.P. 16500 ', N'-99.068272', N'19.246319', N'ClÃ­nica', N'T-II', CAST(0x0000A56200000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (214, N'ClÃ­nica de Especialidades No. 5', 5, 5, N'Arcos de BelÃ©n 17, Col. Centro, C.P. 06070', N'-99.84692', N'19.253732', N'ClÃ­nica', N'Especialidades', CAST(0x0000A41500000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (215, N'ClÃ­nica de Especialidades No. 6', 5, 5, N'Lucerna 67, Col. JuÃ¡rez, C.P. 06600', N'-99.84692', N'19.253732', N'ClÃ­nica', N'Especialidades', CAST(0x0000A43400000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (216, N'Pascua', 5, 5, N'Dr. Vertiz 464, Col. Buenos Aires, C.P. 06780', N'-99.91706', N'19.25235', N'ClÃ­nica', N'DermatolÃ³gico', CAST(0x0000A45000000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (230, N'Dr. Juan Duque de Estrada', 14, 14, N'ORIENTE 170 No. 154 ESQ. 4a CERRADA DE ORIENTE 168, COL. MOCTEZUMA 2Â° SECCIÃ“N, C.P. 15500 ', N'-99.097078', N'19.428452', N'ClÃ­nica', N'T-III', CAST(0x0000A43300000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (231, N'Dr. Luis E. Ruiz ', 14, 14, N'EJE 2 ORIENTE AV. H. CONGRESO DE LA UNIÃ“N No. 148, COL. DEL PARQUE, C.P. 15810 ', N'-99.1196', N'19.424547', N'ClÃ­nica', N'T-III', CAST(0x0000A44F00000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (232, N'Romero Rubio', 14, 14, N'MANCHURIA No. 8 ESQ. TRANSVAAL, COL. AQUILES SERDÃN, C.P. 15430', N'-99.090367', N'19.444073', N'ClÃ­nica', N'T-III', CAST(0x0000A46E00000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (233, N'RevoluciÃ³n', 14, 14, N'FRANCISCO SERRANO No. 5, COL. 10, C.P. 15470  ', N'-99.106648', N'19.436541', N'ClÃ­nica', N'T-I', CAST(0x0000A48C00000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (234, N'RenovaciÃ³n', 14, 14, N'FRANCISCO ESPEJEL No. 92, COL. MOCTEZUMA 1a SECCIÃ“N, C.P. 15500 ', N'-99.109556', N'19.432105', N'ClÃ­nica', N'T-I', CAST(0x0000A4AB00000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (235, N'Cuatro Arboles', 14, 14, N'BIENES NACIONALES No. 88, COL. CUATRO ÃRBOLES, C.P. 15730 ', N'-99.084111', N'19.416773', N'ClÃ­nica', N'T-I', CAST(0x0000A4C900000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (236, N'AmpliaciÃ³n Caracol', 14, 14, N'AV. RÃO CHURUBUSCO No. 180, COL. AMPLIACIÃ“N CARACOL, C.P. 15650 ', N'-99.065115', N'19.427521', N'ClÃ­nica', N'T-I', CAST(0x0000A4E800000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (237, N'PolvorÃ­n', 14, 14, N'JUAN PARDAVÃ‰ No. 35, PUEBLO DE LA MAGDALENA MIXHUCA, C.P. 15850  ', N'-99.115252', N'19.409854', N'ClÃ­nica', N'T-I', CAST(0x0000A50700000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (239, N'San BartolomÃ© Xicomulco', 15, 15, N'', N'', N'', N'ClÃ­nica', N'T-I', CAST(0x0000A54400000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (240, N'Santa Cruz Acalpixca', 15, 15, N'Ahualapa s/n, Col. Pueblo de Santa Cruz Acalpixca, C.P. 16500 ', N'-99.068272', N'19.246319', N'ClÃ­nica', N'T-II', CAST(0x0000A56200000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (257, N'ClÃ­nica de Especialidades No. 5', 5, 5, N'Arcos de BelÃ©n 17, Col. Centro, C.P. 06070', N'-99.84692', N'19.253732', N'ClÃ­nica', N'Especialidades', CAST(0x0000A41500000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (258, N'ClÃ­nica de Especialidades No. 6', 5, 5, N'Lucerna 67, Col. JuÃ¡rez, C.P. 06600', N'-99.84692', N'19.253732', N'ClÃ­nica', N'Especialidades', CAST(0x0000A43400000000 AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (259, N'Pascua', 5, 5, N'Dr. Vertiz 464, Col. Buenos Aires, C.P. 06780', N'-99.91706', N'19.25235', N'ClÃ­nica', N'DermatolÃ³gico', CAST(0x0000A45000000000 AS DateTime))
/****** Object:  StoredProcedure [dbo].[sp_ValidaDatos]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidaDatos]
@curp nvarchar(500)
AS
BEGIN
	select * from tblPersona where Curp = @curp
END
GO
/****** Object:  StoredProcedure [dbo].[sp_traeServicioCentroSalud]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_traeServicioCentroSalud]
@idCentroSalud int
as
begin
select * from relCentroSaludServicio CSS
            inner join tblServicio S on CSS.idServicio = S.idServicio
      where CSS.idCentroSalud = @idCentroSalud
      
      
      
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TraeMedicoEspecialidadCentro]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TraeMedicoEspecialidadCentro]
@idCentroSalud int,
@idServicio int as
begin
select P.Nombre + ' ' + P.Paterno + ' ' + P.Materno as nombreC, P.idPersona from relMedicoCentroServicio rMCS
            inner join tblPersona P on rMCS.idMedico = P.idPersona
            
where rMCS.idCentroSalud = @idCentroSalud and rMCS.idServicio = @idServicio


end
GO
/****** Object:  StoredProcedure [dbo].[sp_TraeInformaciòn]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_TraeInformaciòn]
	@Actividad int,
	@Identificador int,
	@Identificador2 int
AS
BEGIN
	if(@Actividad = 1)
		begin
			SELECT idCentroSalud,CentroSalud FROM tblCentroSalud
		end
	else if(@Actividad = 2)
		begin
			SELECT th.idHora,Hora FROM tblHorarioCentroSalud thc
			INNER JOIN tblHora th on thc.idHora = th.idHora 
			WHERE  idCentroSalud = @Identificador AND thc.idDia = @Identificador2
		end
	else
		begin
			SELECT ts.idServicio,Servicio FROM relCentroSaludServicio rcs
			INNER JOIN tblServicio ts on rcs.idServicio = ts.idServicio
			WHERE idCentroSalud = @Identificador
		end		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_traeHorasMedicoCentro]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_traeHorasMedicoCentro]
@idCentroSalud int,
@idDia int,
@idMedico int
as
begin
select * from tblHorarioCentroSalud HCS 
            inner join tblHora H on HCS.idHora = H.idHora
            inner join tblHorarioMedico HM on HCS.idHorario = HM.idHorario
            
      where HCS.idCentroSalud = @idCentroSalud and HCS.idDia = @idDia and HM.idPersona = @idMedico

end
GO
/****** Object:  StoredProcedure [dbo].[sp_traeCitasPaciente]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        <Author,,Name>
-- Create date: <Create Date,,>
-- Description:   <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_traeCitasPaciente] 
@idPersona int
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

    -- Insert statements for procedure here
      SELECT C.idCita, CS.CentroSalud, D.Dia, CONVERT(nvarchar, C.Fecha, 103)Fecha, H.Hora
            , P.Nombre + ' ' + P.Paterno + ' ' + P.Materno as Medico 
            , E.Estatus
      
      from tblCita C 
                  inner join tblHorarioCentroSalud HCS on C.idHorario = HCS.idHorario
                  inner join tblCentroSalud CS on HCS.idCentroSalud = CS.idCentroSalud
                  inner join tblDia D on HCS.idDia = D.idDia
                  inner join tblHora H on HCS.idHora = H.idHora
                  inner join tblPersona P on C.idMedico = P.idPersona
                  inner join tblestatus E on C.idEstatus = E.idEstatus
            where C.idPersona = @idPersona and C.idEstatus in (1,2)
                  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_traeCitasMedico]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        <Author,,Name>
-- Create date: <Create Date,,>
-- Description:   <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_traeCitasMedico]   ----- sp_traeCitasMedico 2
@idMedico int
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

    -- Insert statements for procedure here
      SELECT convert(nvarchar, C.idCita) +'-'+convert(nvarchar, C.idPersona) idCita, CS.CentroSalud, D.Dia, CONVERT(nvarchar, C.Fecha, 103)Fecha, H.Hora
            , P.Nombre + ' ' + P.Paterno + ' ' + P.Materno as Paciente 
            , E.Estatus
      
      from tblCita C 
                  inner join tblHorarioCentroSalud HCS on C.idHorario = HCS.idHorario
                  inner join tblCentroSalud CS on HCS.idCentroSalud = CS.idCentroSalud
                  inner join tblDia D on HCS.idDia = D.idDia
                  inner join tblHora H on HCS.idHora = H.idHora
                  inner join tblPersona P on C.idPersona = P.idPersona
                  inner join tblestatus E on C.idEstatus = E.idEstatus
            where C.idMedico = @idMedico and C.idEstatus in (1,2)
                  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_traeCentrosSalud]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_traeCentrosSalud]
as
begin

	select * from tblCentroSalud
order by idCentroSalud
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TraeCentroSaludID]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TraeCentroSaludID] --sp_TraeCentroSaludID 2
	@idCentroSalud int
AS
BEGIN
	select * from tblCentroSalud where @idCentroSalud=idCentroSalud
END
GO
/****** Object:  StoredProcedure [dbo].[sp_tblHorarioCentroSalud]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_tblHorarioCentroSalud]
	-- Add the parameters for the stored procedure here
	@idCentroSalud int,
	@idDia int,
	@idHora int 
AS
BEGIN
	declare @id int
	set @id = (select idHorario from tblHorarioCentroSalud where idCentroSalud = @idCentroSalud and idDia= @idDia and idHora=@idHora)
	if(@id IS NOT NULL)
			begin

				select 0 as Valido , 'Horario Ya Existente' as Mensaje
				
			end
				else
			begin
				
				set @id = (select ISNULL(MAX(idHorario),0)+1 from tblHorarioCentroSalud);
				insert into tblHorarioCentroSalud(idHorario,idCentroSalud,idDia,idHora) 
				values(@id,@idCentroSalud,@idDia,@idHora);
				select 1 as Valido ,'Registro Exitoso' as Mensaje

			end
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Servicios]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Servicios]
-- Add the parameters for the stored procedure here
	@Ser nvarchar(100) ,
	@Descripcion nvarchar(100)

AS
BEGIN
	
	declare @id int
	set @id = (select idServicio from tblServicio where Servicio = @Ser)
		if(@id IS NOT NULL)
			begin

				select 0 as Valido , 'Centro De Salud Ya Registrado' as Mensaje
				
			end
				else
			begin
				
				set @id = (select ISNULL(MAX(idServicio),0)+1 from tblServicio);
				insert into tblServicio(idServicio,Servicio,Descripcion) 
				values(@id,@Ser,@Descripcion);
				select 1 as Valido ,'RegistroExitoso' as Mensaje

			end

END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Municipio]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Municipio]
	-- Add the parameters for the stored procedure here
	@Minicipio int,
	@IdEstado	int
AS
BEGIN
		declare @id int
	set @id = (select IdMunicipio from tblMunicipio where IdEstado = @IdEstado and Municipio =@Minicipio) 
		if(@id IS NOT NULL)
			begin

				select 0 as Valido , 'Municipio Ya Existente' as Mensaje
				
			end
				else
			begin
				
				set @id = (select ISNULL(MAX(IdMunicipio),0)+1 from tblMunicipio);
				insert into tblMunicipio(IdMunicipio,IdEstado,Municipio) 
				values(@id,@IdEstado,@Minicipio);
				select 1 as Valido ,'Registro Exitoso' as Mensaje

			end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MuestraInformaciòn]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[sp_MuestraInformaciòn]
	@Actividad int,
	@Persona int

AS
DECLARE
@Existe int
BEGIN
	if(@Actividad = 1)
		begin
		/**Guarda Horario Medico**/
			SELECT Hora,CentroSalud FROM tblHorarioMedico thm INNER JOIN tblHorarioCentroSalud thcs
			ON thm.idHorario = thcs.idHorario INNER JOIN tblHora th on th.idHora = thcs.idHora
			INNER JOIN tblDia td on td.idDia = thcs.idDia 
			INNER JOIN tblCentroSalud tcs on thcs.idCentroSalud = tcs.idCentroSalud
			WHERE idPersona = @Persona
		end		
		
	else
		begin
		/**Guarda Especialidad Medico**/
			SELECT CentroSalud,Servicio FROM relMedicoCentroServicio rm
			INNER JOIN tblCentroSalud ts on ts.idCentroSalud = rm.idCentroSalud
			INNER JOIN tblServicio s on s.idServicio = rm.idServicio
			where idMedico = @Persona
		end		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_IniciaSesion]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_IniciaSesion] ---- [sp_IniciaSesion] 'gier', '1234'
@user nvarchar(100),
@pass nvarchar(100)
AS
BEGIN
	declare @id int
	set @id = (select idUsuario from tblUsuario where usuario = @user and contrasenia = @pass)
	print ('id')
	print(@id)
	if(@id IS NOT NULL)
	begin
	declare @idPer int
	select @idPer = idPersona from tblUsuario where usuario = @user and contrasenia = @pass
	print ('@idPer')
	print(@idPer)
	select ctgRol.idRol,ctgRol.Rol, @idPer as idPersona from relUsuarioRol
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
/****** Object:  StoredProcedure [dbo].[sp_GuardaVerificacionTelefono]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GuardaVerificacionTelefono]
@CURP nvarchar(100)
AS
BEGIN
declare @id int
   set @id = (select idPersona from tblPersona where Curp = @CURP)
   set @id = (select idUsuario from tblUsuario where idPersona = @id)
	update relUsuarioRol
	set idEstatus = 1 
	where idUsuario = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GuardaVerificacionEmail]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GuardaVerificacionEmail]
	@id nvarchar(10)
AS
BEGIN
	update relUsuarioRol 
	set idEstatus = 1 
	where idUsuario = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GuardaValidacionCita]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GuardaValidacionCita]
@idCita nvarchar(10),
@idPersona nvarchar(10)
AS
BEGIN
	if(Convert(int,DATEDIFF(DD,GETDATE(), Convert(DATE,(select Fecha from tblCita where idCita = @idCita and idPersona = @idPersona))))>1)
	begin
	update tblCita set idEstatus = 1
	where idCita = @idCita and idPersona = @idPersona
	end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GuardaPaciente]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GuardaPaciente]
@usuario nvarchar(500),
@pass nvarchar(500),
@nombre nvarchar(500),
@apPaterno nvarchar(600),
@apMaterno nvarchar(500),
@genero	nvarchar(10),
@fechaNac nvarchar(100),
@curp nvarchar(100),
@nombreTutor nvarchar(500),
@apPaternoTutor nvarchar(600),
@apMaternoTutor nvarchar(500),
@generoTutor	nvarchar(10),
@fechaNacTutor nvarchar(100),
@curpTutor nvarchar(100),
@idPer nvarchar(10),
@mail nvarchar(500),
@mailTutor nvarchar(500)
AS
BEGIN
	declare @id int
	declare @edad int
	declare @idPersona int
	declare @idRelUsuario int

	set @edad = (DATEDIFF(yy,GETDATE(), @fechaNac))
	select @id = ISNULL(MAX(tblUsuario.idUsuario), 0) + 1 from tblUsuario
	select @idPersona = ISNULL(MAX(tblPersona.idPersona), 0) + 1 from tblPersona
	select @idRelUsuario = ISNULL(MAX(relUsuarioRol.idRelPersonaRol), 0) + 1 from relUsuarioRol

	insert into tblUsuario(idUsuario,usuario,contrasenia,idPersona)
	values(@id,@usuario,@pass,@idPersona)

	if(@idPer = '')
	begin
	insert into tblPersona (idPersona,Nombre, Paterno, Materno, Genero, FecNac, Curp, mail)
	values(@idPersona,@nombre,@apPaterno,@apMaterno,@genero,@fechaNac,@curp, @mail)
	end
	
	insert into relUsuarioRol(idRelPersonaRol,idRol,idUsuario,idEstatus)
	values (@idRelUsuario,1, @id, 0)

	if(@edad > 18)
	begin

	declare @idTutor int
	declare @idRelTutor int
	select @IdTutor = ISNULL(MAX(tblPersona.idPersona), 0) + 1 from tblPersona
	select @idRelTutor = ISNULL(MAX(tblTutor.idTutor),0) + 1 from tblTutor

	insert into tblPersona (idPersona,Nombre, Paterno, Materno, Genero, FecNac, Curp, mail)
	values(@idTutor,@nombreTutor,@apPaternoTutor,@apMaternoTutor,@generoTutor,@fechaNacTutor,@curpTutor, @mailTutor)
	
	insert tblTutor (idTutor,idPersonaTutor,idPersona)
	values(@idRelTutor, @idTutor,@idPersona)

	end
	select @idPersona 'Clave'
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GuardaMedico]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GuardaMedico]
	@idPersona int,
	@Nombre nvarchar(200),
	@ApPat nvarchar(200),
	@ApMat nvarchar(200),
	@Genero nvarchar(200),
	@FecNac nvarchar(200),
	@CURP nvarchar(200),
	@Cedula nvarchar(50)
AS
DECLARE
@CedulaR nvarchar(200),
@idMedico int,
@Identificador int

BEGIN
	if(@idPersona = 0)
		begin
			SELECT @CedulaR = COUNT(*) from tblMedico WHERE Cedula = @Cedula
			if(@CedulaR = 0)
				begin
					SELECT @idPersona = ISNULL(MAX(idPersona),0)+1 from tblPersona
					SELECT @Identificador = @idPersona
					INSERT INTO tblPersona(idPersona,Nombre,Paterno,Materno,Genero,FecNac,Curp)
					VALUES (@idPersona,@Nombre,@ApPat,@ApMat,@Genero,@FecNac,@CURP)
					
					SELECT @idMedico = ISNULL(MAX(idMedico),0)+1 from tblMedico
					INSERT INTO tblMedico(idMedico,idPersona,Cedula)
					VALUES(@idMedico,@idPersona,@Cedula)
					
					SELECT @idMedico = ISNULL(MAX(idRelPersonaRol),0)+1 from relUsuarioRol
					
					INSERT INTO relUsuarioRol(idRelPersonaRol,idRol,idUsuario,idEstatus)
					VALUES(@idMedico,2,@idPersona,1)
					
					
					
					SELECT 'Mèdico Registrado en el Sistema de Salud de la Ciudad de Mèxico' msj , @Identificador idPersona
				end	
			else
				begin
					SELECT 'Cedula Profesional Registrada Anteriormente' msj  , @idPersona idPersona
				end
		end
		else
			begin
				if(@Nombre = 'BajaUsuarioCDMX')
					BEGIN
						UPDATE relUsuarioRol SET idEstatus = 0 WHERE idUsuario = @idPersona
						SELECT 'Medico dado de baja correctamente' msj , @idPersona idPersona
					END
				else if(@Nombre = 'TraeUsuariosCDMX')
					begin
						SELECT tp.idPersona,Nombre,Paterno,Materno,Genero,FecNac,Curp,Cedula FROM tblPersona tp 
						INNER JOIN tblMedico tm ON tp.idPersona = tm.idPersona
						 
					end
				else if(@Nombre = 'TraeUsuarioEspecificoCDMX')
					begin
						SELECT tp.idPersona,Nombre,Paterno,Materno,Genero,FecNac,Curp,Cedula FROM tblPersona tp 
						INNER JOIN tblMedico tm ON tp.idPersona = tm.idPersona WHERE tp.idPersona = @idPersona
					end
				ELSE
					BEGIN
						UPDATE tblPersona SET Nombre=@Nombre,Paterno=@ApPat,Materno=@ApMat,Genero=@Genero,FecNac=@FecNac,Curp=@CURP
						WHERE idPersona = @idPersona
						UPDATE tblMedico SET Cedula = @Cedula WHERE idPersona = @idPersona
						SELECT 'Datos del Medico Modificados' msj  , @idPersona idPersona
					END	
			end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GuardaInformaciòn]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GuardaInformaciòn]
	@Actividad int,
	@Persona int,
	@Centro int,
	@Horario int,
	@Servicio int
AS
DECLARE
@Existe int
BEGIN
	if(@Actividad = 1)
		begin
		/**Guarda Horario Medico**/
			SELECT @Existe = COUNT(*) FROM dbo.tblHorarioMedico WHERE idHorario = @Horario AND idPersona = @Persona
			if(@Existe = 0)
				begin
					select @Existe = ISNULL(MAX(idHorarioMedico),0)+1 from tblHorarioMedico
					INSERT INTO tblHorarioMedico(idHorarioMedico,idHorario,idPersona)
					VALUES(@Existe,@Horario,@Persona)
				end
			
		end		
		
	else
		begin
		/**Guarda Especialidad Medico**/
			SELECT @Existe = COUNT(*) FROM relMedicoCentroServicio WHERE idMedico = @Persona AND idCentroSalud = @Centro AND idServicio = @Servicio
			if(@Existe = 0)
				begin
					INSERT INTO relMedicoCentroServicio(idMedico,idCentroSalud,idServicio)
					VALUES (@Persona,@Centro,@Servicio)
				end
			
		end		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GuardaDireccion]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GuardaDireccion]
	@idDireccion int,
	@idPersona int,
	@idEstado int,
	@idMunicipio int,
	@Calle nvarchar(500),
	@NumE nvarchar(300),
	@NumI nvarchar(100),
	@Colonia nvarchar(100),
	@CP int
AS

BEGIN
	if(@idDireccion = 0)
		begin
			
			SELECT @idDireccion= ISNULL(MAX(idDireccion),0)+1 from tblDireccion
					
			INSERT INTO tblDireccion(idDireccion,idPersona,idEstado,idMunicipio,Calle,Exterior,Interior,Colonia,CP)
			VALUES(@idDireccion,@idPersona,@idEstado,@idMunicipio,@Calle,@NumE,@NumI,@Colonia,@CP)
				
		end
		else
			begin
				if(@Calle = 'BajaDireccionCDMX')
					BEGIN
						DELETE FROM tblDireccion WHERE idDireccion = @idDireccion
					END
				ELSE
					BEGIN
						SELECT idDireccion,idEstado,idMunicipio,Calle,Exterior,Interior,Colonia,CP FROM tblDireccion WHERE idPersona = @idPersona
					END	
			end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GuardaContacto]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GuardaContacto]
	@idDatoContacto int,
	@idPersona int,
	@idTipoContacto int,
	@Contacto nvarchar(500)
AS
DECLARE
@ContactoR nvarchar(200)

BEGIN
	if(@idDatoContacto = 0)
		begin
			SELECT @ContactoR = COUNT(*) from tblDatosContacto WHERE idPersona = @idPersona AND Contacto = @Contacto
			if(@ContactoR = 0)
				begin
					SELECT @idDatoContacto= ISNULL(MAX(idDatosContacto),0)+1 from tblDatosContacto
					
					INSERT INTO tblDatosContacto(idDatosContacto,idPersona,idTipoContacto,Contacto)
					VALUES(@idDatoContacto,@idPersona,@idTipoContacto,@Contacto)
					
					
				end	

		end
		else
			begin
				if(@Contacto = 'BajaContactoCDMX')
					BEGIN
						DELETE FROM tblDatosContacto WHERE idDatosContacto = @idDatoContacto
					END
				ELSE
					BEGIN
						SELECT idDatosContacto,TipoContacto,Contacto FROM tblDatosContacto tdc
						INNER JOIN tblTipoContacto ttc on ttc.idTipoContacto = tdc.idTipoContacto WHERE idPersona = @idPersona
					END	
			end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GuardaCita]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GuardaCita]
@idPersona int,
@idMedico int,
@idCentroSalud int,
@idDia int,
@idHora int,
@fecha date,
@idCitaRep int
as
declare
@existe int,
@idHorario int
begin
print('buscamos que exista el horario en CS')
select @idHorario = idHorario from tblHorarioCentroSalud where idCentroSalud = @idCentroSalud and idDia = @idDia and idHora = @idHora
print('si existe es mayor a cero si hay horario en el hospital')
print(@idHorario)

if( @idHorario is not null)
begin
	  select @existe = COUNT(*)
		from tblHorarioMedico HM where HM.idHorario = @idHorario and HM.idPersona = @idMedico
	  print('buscamos que el medico tenga horario en ese horario')
	  if(@existe >0)
	  begin
		  declare
		  @CitaMedico int
			print ('buscamos si hay alguna cita en el horario y el doctor')
			select @CitaMedico = COUNT(*) from tblCita C where C.idHorario = @idHorario and C.idMedico = @idMedico and C.Fecha = @fecha and C.idEstatus = 1
			print('si citamedico es cero si tiene libre')
			
			if(@CitaMedico=0)
			begin
				
				print('buscamos que el paciente no tenga citas agendadas en el sistema osea pendientes ')
				
				declare
				@citaPersona int
				
				if @idCitaRep = 0
				begin
					select @citaPersona = COUNT(*) from tblCita C where C.idPersona = @idPersona and  C.idEstatus = 1
				end
				else
				begin
					set @citaPersona = 0
				end
				if(@citaPersona = 0)
				begin
						declare
						@idcita int,
						@idEstatus int = 1
						select @idcita = ISNULL(max(idcita), 0) + 1 from tblCita
							insert into tblCita (idCita, idHorario, idPersona, idMedico, idEstatus, Fecha)
								values (@idcita, @idHorario, @idPersona, @idMedico, @idEstatus, @fecha)
								
						if @idCitaRep >0
						begin
							update tblCita set idEstatus = 5 where idCita = @idCitaRep
						end

						declare @mail nvarchar(500)
						set @mail = (select mail from tblPersona where idPersona = @idPersona)

						select 'Cita registrada con exito, favor de confirmar su cita médica via correo electronico al mail que registro ó via telefonica al numero 55555555' as msj, 1 as idEstatus, @mail as mail
				end
				else
				begin
					--select * from tblCita C where C.idPersona = @idPersona and C.idEstatus = 1
					select 'el paciente tiene uan cita pendiente' msj, 0 idEstatus
					print('tiene una cita pendiente el paciente')
				end
			end
			else
			begin
				select 'el doctor ya tiene una cita a a esa hora' msj, 0 idEstatus
				print('ya tiene cita el doctor')
			
			end
		end
	  else
	  begin
		select 'el medico no tiene horario en ese hospital' msj, 0 idEstatus
		print('ffff')
	  end
end
else
begin

	select 'no hay horario de atencion tencion en el CS' msj, 0 idEstatus

end

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Estado]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Estado]
	@Estado int 
AS
BEGIN

	declare @id int
	set @id = (select IdEstado from tblEstado where Estado = @Estado) 
		if(@id IS NOT NULL)
			begin

				select 0 as Valido , 'Estado Ya Existente' as Mensaje
				
			end
				else
			begin
				
				set @id = (select ISNULL(MAX(IdEstado),0)+1 from tblEstado);
				insert into tblEstado(IdEstado,Estado) 
				values(@id,@Estado);
				select 1 as Valido ,'Registro Exitoso' as Mensaje

			end
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_DatosContactoCentroSalud]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_DatosContactoCentroSalud]
	-- Add the parameters for the stored procedure here
	@IdCentroMedico nvarchar(100),
	@Contacto  nvarchar(100),
	@IdTipo  int
AS
BEGIN
	declare @id int
	set @id = (select idPersona from tblDatosContacto where Contacto = @Contacto and idTipoContacto =@IdTipo and idPersona = @IdCentroMedico)
		if(@id IS NOT NULL)
			begin

				select 0 as Valido , 'Datos  Ya Registrados' as Mensaje
				
			end
				else
			begin
				
				set @id = (select ISNULL(MAX(idDatosContacto),0)+1 from tblDatosContacto);
				insert into tblDatosContacto(idDatosContacto,idPersona,idTipoContacto,Contacto) 
				values(@id,@IdCentroMedico,@IdTipo,@Contacto);
				select 1 as Valido ,'Registro Exitoso' as Mensaje

			end
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CtgHora]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_CtgHora]
	-- Add the parameters for the stored procedure here
	@Hora int 
AS
BEGIN

	declare @id int
	set @id = (select idHora from tblHora where Hora = @Hora) 
		if(@id IS NOT NULL)
			begin

				select 0 as Valido , 'Hora Ya Existente' as Mensaje
				
			end
				else
			begin
				
				set @id = (select ISNULL(MAX(idHora),0)+1 from tblHora);
				insert into tblHora(idHora,Hora) 
				values(@id,@Hora);
				select 1 as Valido ,'Registro Exitoso' as Mensaje

			end
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CtgDia]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_CtgDia]
	-- Add the parameters for the stored procedure here
	@idDia int 
AS
BEGIN
	declare @id int
	set @id = (select idDia from tbldia where Dia = @idDia) 
		if(@id IS NOT NULL)
			begin

				select 0 as Valido , 'Dia Ya Existente' as Mensaje
				
			end
				else
			begin
				
				set @id = (select ISNULL(MAX(idDia),0)+1 from tblDia);
				insert into tblDia(idDia,Dia) 
				values(@id,@idDia);
				select 1 as Valido ,'RegistroExitoso' as Mensaje

			end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConfirmaCitaPaciente]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_ConfirmaCitaPaciente]
@idCita int,
@idPAciente int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tblCita set idEstatus = 2 where idPersona = @idPAciente and idCita = @idCita
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CentroSalud]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CentroSalud]
	-- Add the parameters for the stored procedure here
	@CentroSalud nvarchar(100),
	@Calle nvarchar(100),
	@Exterior nvarchar(100),
	@Interior nvarchar(100),
	@CP nvarchar(100),
	@Lat nvarchar(100),
	@Long nvarchar(100),

	@IdEstado int,
	@IdMunicipio int

AS
BEGIN
	declare @id int
	set @id = (select idCentroSalud from tblCentroSalud where CentroSalud = @CentroSalud)
		if(@id IS NOT NULL)
			begin

				select 0 as Valido , 'Centro De Salud Ya Registrado' as Mensaje
				
			end
				else
			begin
				
				set @id = (select ISNULL(MAX(idCentroSalud),0)+1 from tblCentroSalud);
				insert into tblCentroSalud(idCentroSalud,CentroSalud,IdEstado,idMunicipio,Calle,Exterior,interior,CP,Lat,Long) 
				values(@id,@CentroSalud,@IdEstado,@IdMunicipio,@calle,@Exterior,@Interior,@CP,@Lat,@Long);
				select 1 as Valido ,'RegistroExitoso' as Mensaje

			end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_CancelaCitaPaciente]    Script Date: 03/08/2015 14:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CancelaCitaPaciente]
@idCita int,
@idPAciente int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tblCita set idEstatus = 4 where idPersona = @idPAciente and idCita = @idCita
END
GO
/****** Object:  Default [DF_relMedicoCentroServicio_fecReg]    Script Date: 03/08/2015 14:09:45 ******/
ALTER TABLE [dbo].[relMedicoCentroServicio] ADD  CONSTRAINT [DF_relMedicoCentroServicio_fecReg]  DEFAULT (getdate()) FOR [fecReg]
GO
/****** Object:  Default [DF_tblCita_FecReg]    Script Date: 03/08/2015 14:09:45 ******/
ALTER TABLE [dbo].[tblCita] ADD  CONSTRAINT [DF_tblCita_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
/****** Object:  Default [DF_tblDatosContacto_fecReg]    Script Date: 03/08/2015 14:09:45 ******/
ALTER TABLE [dbo].[tblDatosContacto] ADD  CONSTRAINT [DF_tblDatosContacto_fecReg]  DEFAULT (getdate()) FOR [fecReg]
GO
/****** Object:  Default [DF_tblDireccion_FecReg]    Script Date: 03/08/2015 14:09:45 ******/
ALTER TABLE [dbo].[tblDireccion] ADD  CONSTRAINT [DF_tblDireccion_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
/****** Object:  Default [DF_tblHorarioCentroSalud_fecReg]    Script Date: 03/08/2015 14:09:45 ******/
ALTER TABLE [dbo].[tblHorarioCentroSalud] ADD  CONSTRAINT [DF_tblHorarioCentroSalud_fecReg]  DEFAULT (getdate()) FOR [fecReg]
GO
/****** Object:  Default [DF_tblMedico_FecReg]    Script Date: 03/08/2015 14:09:45 ******/
ALTER TABLE [dbo].[tblMedico] ADD  CONSTRAINT [DF_tblMedico_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
/****** Object:  Default [DF_tblPersona_FecReg]    Script Date: 03/08/2015 14:09:45 ******/
ALTER TABLE [dbo].[tblPersona] ADD  CONSTRAINT [DF_tblPersona_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
/****** Object:  Default [DF_tblServicio_FecReg]    Script Date: 03/08/2015 14:09:45 ******/
ALTER TABLE [dbo].[tblServicio] ADD  CONSTRAINT [DF_tblServicio_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
/****** Object:  Default [DF_tblTutor_fecRecg]    Script Date: 03/08/2015 14:09:45 ******/
ALTER TABLE [dbo].[tblTutor] ADD  CONSTRAINT [DF_tblTutor_fecRecg]  DEFAULT (getdate()) FOR [fecRecg]
GO
/****** Object:  Default [DF_tblUsuario_FecReg]    Script Date: 03/08/2015 14:09:45 ******/
ALTER TABLE [dbo].[tblUsuario] ADD  CONSTRAINT [DF_tblUsuario_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
