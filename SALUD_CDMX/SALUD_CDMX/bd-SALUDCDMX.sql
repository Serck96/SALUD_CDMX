USE [master]
GO
/****** Object:  Database [SALUD-CDMX]    Script Date: 08/03/2015 10:11:59 a. m. ******/
CREATE DATABASE [SALUD-CDMX] ON  PRIMARY 
( NAME = N'SALUD-CDMX', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SALUD-CDMX.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SALUD-CDMX_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SALUD-CDMX_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SALUD-CDMX].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SALUD-CDMX] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET ANSI_NULLS ON 
GO
ALTER DATABASE [SALUD-CDMX] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET ARITHABORT OFF 
GO
ALTER DATABASE [SALUD-CDMX] SET AUTO_CLOSE ON 
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
ALTER DATABASE [SALUD-CDMX] SET  ENABLE_BROKER 
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
/****** Object:  StoredProcedure [dbo].[sp_CancelaCitaPaciente]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CentroSalud]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ConfirmaCitaPaciente]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_CtgDia]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_CtgHora]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_DatosContactoCentroSalud]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Estado]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GuardaCita]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
						select 'Cita registrada con exito, favor de confirmar su cita médica via correo electronico al mail que registro ó via telefonica al numero 55555555' msj, 1 idEstatus
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
/****** Object:  StoredProcedure [dbo].[sp_GuardaContacto]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GuardaDireccion]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GuardaInformaciòn]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GuardaMedico]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GuardaPaciente]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
@idPer nvarchar(10)
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

	insert into tblUsuario(idUsuario,usuario,contrasenia)
	values(@id,@usuario,@pass)

	if(@idPer = '')
	begin
	insert into tblPersona (idPersona,Nombre, Paterno, Materno, Genero, FecNac, Curp)
	values(@idPersona,@nombre,@apPaterno,@apMaterno,@genero,@fechaNac,@curp)
	end
	
	insert into relUsuarioRol(idRelPersonaRol,idRol,idUsuario,idEstatus)
	values (@idRelUsuario,1, @id, 0)

	if(@edad < 18)
	begin

	declare @idTutor int
	declare @idRelTutor int
	select @IdTutor = ISNULL(MAX(tblPersona.idPersona), 0) + 1 from tblPersona
	select @idRelTutor = ISNULL(MAX(tblTutor.idTutor),0) + 1 from tblTutor

	insert into tblPersona (idPersona,Nombre, Paterno, Materno, Genero, FecNac, Curp)
	values(@idTutor,@nombreTutor,@apPaternoTutor,@apMaternoTutor,@generoTutor,@fechaNacTutor,@curpTutor)
	
	insert tblTutor (idTutor,idPersonaTutor,idPersona)
	values(@idRelTutor, @idTutor,@idPersona)

	end
	select @id 'Clave'
	
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GuardaValidacionCita]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GuardaVerificacionEmail]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GuardaVerificacionTelefono]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_IniciaSesion]    Script Date: 08/03/2015 10:11:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  StoredProcedure [dbo].[sp_MuestraInformaciòn]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Municipio]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_Servicios]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_tblHorarioCentroSalud]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TraeCentroSaludID]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_traeCentrosSalud]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_traeCitasMedico]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
      SELECT C.idCita, CS.CentroSalud, D.Dia, CONVERT(nvarchar, C.Fecha, 103)Fecha, H.Hora
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
/****** Object:  StoredProcedure [dbo].[sp_traeCitasPaciente]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_traeHorasMedicoCentro]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TraeInformaciòn]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_TraeMedicoEspecialidadCentro]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_traeServicioCentroSalud]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ValidaDatos]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  Table [dbo].[ctgRol]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  Table [dbo].[relCentroSaludServicio]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  Table [dbo].[relMedicoCentroServicio]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  Table [dbo].[relUsuarioRol]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCentroSalud]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  Table [dbo].[tblCita]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  Table [dbo].[tblDatosContacto]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  Table [dbo].[tblDia]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  Table [dbo].[tblDireccion]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  Table [dbo].[tblEstado]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHora]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  Table [dbo].[tblHorarioCentroSalud]    Script Date: 08/03/2015 10:11:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHorarioCentroSalud](
	[idHorario] [int] NOT NULL,
	[idCentroSalud] [int] NOT NULL,
	[idDia] [int] NOT NULL,
	[idHora] [int] NOT NULL,
	[fecReg] [datetime] NULL CONSTRAINT [DF_tblHorarioCentroSalud_fecReg]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblHorarioCentroSalud] PRIMARY KEY CLUSTERED 
(
	[idHorario] ASC,
	[idCentroSalud] ASC,
	[idDia] ASC,
	[idHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHorarioMedico]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMedico]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  Table [dbo].[tblMunicipio]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNivelAtencion]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  Table [dbo].[tblPersona]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
	[FecReg] [datetime] NULL CONSTRAINT [DF_tblPersona_FecReg]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblPersona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblServicio]    Script Date: 08/03/2015 10:11:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblServicio](
	[idServicio] [int] NOT NULL,
	[idNivelAtencion] [int] NULL,
	[Servicio] [nvarchar](200) NULL,
	[Descripcion] [nvarchar](500) NULL,
	[FecReg] [datetime] NULL CONSTRAINT [DF_tblServicio_FecReg]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblServicio] PRIMARY KEY CLUSTERED 
(
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTipoContacto]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
/****** Object:  Table [dbo].[tblTutor]    Script Date: 08/03/2015 10:11:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTutor](
	[idTutor] [int] NOT NULL,
	[idPersonaTutor] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[fecRecg] [datetime] NULL CONSTRAINT [DF_tblTutor_fecRecg]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblTutor_1] PRIMARY KEY CLUSTERED 
(
	[idTutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 08/03/2015 10:11:59 a. m. ******/
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
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (1, 1)
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
GO
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (56, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (56, 10)
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
GO
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (89, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (90, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (90, 9)
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
GO
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (123, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (123, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (123, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (124, 8)
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
GO
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (156, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (156, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (157, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (157, 9)
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
GO
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (189, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (190, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (190, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (190, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (191, 8)
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
GO
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (223, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (223, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (223, 10)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (224, 8)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (224, 9)
INSERT [dbo].[relCentroSaludServicio] ([idCentroSalud], [idServicio]) VALUES (224, 10)
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
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (1, 4, 1, NULL)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (2, 1, 2, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (3, 1, 3, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (4, 1, 4, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (5, 1, 5, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (6, 1, 6, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (7, 1, 7, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (8, 1, 8, 0)
INSERT [dbo].[relUsuarioRol] ([idRelPersonaRol], [idRol], [idUsuario], [idEstatus]) VALUES (9, 1, 9, 0)
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (129, N'Exhacienda de Eslava', 9, 9, N'Calle ProlongaciÃ³n Puente Cuadritos s/n, Col. San NicolÃ¡s Totolapan, C.P. 10900', N'-99.242603', N'19.293368', N'ClÃ­nica', N'T-I', CAST(N'2014-12-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (130, N'AmpliaciÃ³n Lomas de San BernabÃ©', 9, 9, N'Av. Principal Mz-2  s/n Esq. Andador 14, Col. Tierra Unida, C.P. 10300', N'-99.269827', N'19.303073', N'ClÃ­nica', N'T-I', CAST(N'2014-12-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (131, N'Tierra Colorada', 9, 9, N'Av. Metropolitana S/N, Col. Tierra Colorada, C.P. 10900', N'-99.145359', N'19.161551', N'ClÃ­nica', N'T-I', CAST(N'2014-12-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (132, N'Dr. Manuel GutiÃ©rrez Zavala', 10, 10, N'Calle Laguna de TÃ©rminos No. 492,  Col. Anahuac, C.P. 11320 ', N'-99.173082', N'19.442404', N'ClÃ­nica', N'T-III', CAST(N'2014-12-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (134, N'Dr. Manuel GonzÃ¡lez Rivera', 10, 10, N'Prol. Carpio y Plan de San Luis S/n, Col. Santo TomÃ¡s, CP 11340', N'-99.169176', N'19.45248', N'ClÃ­nica', N'T-III', CAST(N'2014-12-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (136, N'Lago Cardiel', 10, 10, N'Lago Cardiel No. 61, Col. Argentina,                  C.P. 11270 ', N'-99.202757', N'19.455758', N'ClÃ­nica', N'T-III', CAST(N'2014-12-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (137, N'San Salvador Cuauhtenco', 11, 11, N'Chapultepec s/n, Col. Pueblo San Salvador Cuauhtenco, C.P. 12300 ', N'-99.091907', N'19.191886', N'ClÃ­nica', N'T-II', CAST(N'2014-12-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (138, N'Dr. Luis Alberto Erosa LeÃ³n', 11, 11, N'Av. Hidalgo s/n, Col. San Pedro Atocpan, C.P. 12200  ', N'-99.046586', N'19.203092', N'ClÃ­nica', N'T-II', CAST(N'2014-12-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (139, N'San Pablo Oztotepec', 11, 11, N'Matamoros s/n, Col. Pueblo San Pablo Oztotepec, C.P. 12400 ', N'-99.072627', N'19.187321', N'ClÃ­nica', N'T-II', CAST(N'2014-12-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (140, N'Santa Ana Tlacotenco', 11, 11, N'Av. Morelos S/N, esq. AgustÃ­n Melgar , Col. Santa Ana Tlacotenco, C.P. 12900 ', N'-98.994554', N'19172846', N'ClÃ­nica', N'T-II', CAST(N'2014-12-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (141, N'Dr. GastÃ³n Melo', 11, 11, N'Av. Dr. GastÃ³n Melo s/n, esquina Ignacio Aldama, Col. San Antonio Tecomitl, C.P. 12100  ', N'-98.99562', N'19.220366', N'ClÃ­nica', N'T-III', CAST(N'2014-12-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (142, N'San Fco. Tecoxpa', 11, 11, N'Calle JuÃ¡rez s/n, Pueblo San Francisco Tecoxpa,  C.P. 12700 ', N'-99.007827', N'19.197033', N'ClÃ­nica', N'T-I', CAST(N'2014-12-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (143, N'San JerÃ³nimo MiacatlÃ¡n', 11, 11, N'Av. SimÃ³n Bolivar s/n, Col. San JerÃ³nimo MiacatlÃ¡n, C.P. 12600', N'-99.008428', N'19.192818', N'ClÃ­nica', N'T-I', CAST(N'2014-12-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (144, N'San Juan Tepenahuac', 11, 11, N'Vicente Guerrero s/n, Col. San J. Tepenahuac, C.P. 12800', N'-98.993677', N'19.187078', N'ClÃ­nica', N'T-I', CAST(N'2014-12-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (145, N'Villa Milpa Alta', 11, 11, N'Av. Nuevo LeÃ³n s/n, Col. Villa 11, C.P. 12000 ', N'-99.01703', N'19.197327', N'ClÃ­nica', N'T-I', CAST(N'2014-12-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (146, N'San Lorenzo Tlacoyucan', 11, 11, N'Consulado s/n, Col. San Lorenzo Tlacoyucan, C.P. 12500', N'-99.029765', N'19.176975', N'ClÃ­nica', N'T-I', CAST(N'2014-12-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (147, N' San BartolomÃ© Xicomulco', 11, 11, N'Av. 2 No. 26. Col. San BartolomÃ© Xicomulco, C.P. 12220', N'-99.01703', N'19.197327', N'ClÃ­nica', N'T-I', CAST(N'2014-12-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (148, N'Mixquic', 12, 12, N'Carretera Mixquic -Chalco Km 8, s/n, esq. Calle Calmecac, Col Santa Cruz Mixquic, C.P. 13600 ', N'-98.951231', N'19.226049', N'ClÃ­nica', N'Comunitaria', CAST(N'2014-12-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (149, N'13 de septiembre', 12, 12, N'Calle Cisne s/n, entre Adalberto Tejeda y RevoluciÃ³n, Col. Los Olivos,  C.P. 13210 ', N'-99.056622', N'19.29875', N'ClÃ­nica', N'T-II', CAST(N'2014-12-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (151, N'Del Mar', 12, 12, N'Av. La Turba s/n entre AbulÃ³n y Cangrejo, Col. Del Mar. C.P. 13270  ', N'-99.055267', N'19.289077', N'ClÃ­nica', N'T-II', CAST(N'2014-12-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (153, N'Santa Catarina Yecahuizotl', 12, 12, N'Calle Rafael Oropeza y Gabriel Mar s/n,  Col. Pueblo Santa Catarina Yecahuizotl, C.P. 13100 ', N'-98.968053', N'19.307893', N'ClÃ­nica', N'T-II', CAST(N'2014-12-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (154, N'Zapotitla', 12, 12, N'Calle Cecilio Acosta s/n esq. Alma Fuerte, Col. Zapotitla, C.P. 13310 ', N'-99.036207', N'19.311002', N'ClÃ­nica', N'T-II', CAST(N'2014-12-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (156, N'Miguel Hidalgo', 12, 12, N'Calle Fidelio s/n esq. Deodato, Col. 10, C.P. 13200 ', N'-99.046942', N'19.291135', N'ClÃ­nica', N'T-III', CAST(N'2015-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (157, N'San Francisco Tlaltenco', 12, 12, N'Â AndrÃ©s Quintana Roo y General Carlos A. Vidal s/n. Col San Francisco Tlaltenco C.P. 13400 ', N'-99.014058', N'19.295231', N'ClÃ­nica', N'T-III', CAST(N'2015-01-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (159, N'Quiahuatla', 12, 12, N'Margaritas S/N y Geranio Zona 02, Manzana 17, Lote 18), Col Quiahutla, C.P. 13090', N'-99.004017', N'19.26294', N'ClÃ­nica', N'T-I', CAST(N'2015-01-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (161, N'Parres', 13, 13, N'Calle Hidalgo s/n, frente a la Calle 20 de Noviembre, Col. Parres.', N'-99.182587', N'19.132063', N'ClÃ­nica', N'T-I', CAST(N'2015-01-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (162, N'Pedregal de las Ãguilas', 13, 13, N'Mixtecas s/n casi esq. Nahoas, Col Pedregal de las Ãguilas, C.P. 14439 ', N'-99.175741', N'19.272157', N'ClÃ­nica', N'T-II', CAST(N'2015-01-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (163, N'San AndrÃ©s Totoltepec', 13, 13, N'Camino Real al Ajusco s/n casi esq. 3ra. Cda de Tlaquexpa, Col San AndrÃ©s Totoltepec, C.P. 14629. ', N'-9917674', N'19.249186', N'ClÃ­nica', N'T-II', CAST(N'2015-01-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (164, N'Topilejo', 13, 13, N' ProlongaciÃ³n Las Cruces s/n, esquina Mirador Chapultepec,  Col. San Miguel Topilejo, C.P. 14500 ', N'-99.146709', N'19.203305', N'ClÃ­nica', N'T-II', CAST(N'2015-01-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (165, N'Cultura Maya', 13, 13, N'Izamal S/N entre las calles Tepakan y Hezelchakan, Col. Cultura Maya, C.P.14238', N'-99.222122', N'19.275939', N'ClÃ­nica', N'T-II', CAST(N'2015-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (167, N'Dr. David Fragoso Lizalde', 13, 13, N'Calle Dr. David Fragoso Lizalde, esq. Cedral s/n, Col. Ejidos de San Pedro MÃ¡rtir,  C.P. 14640  ', N'-99.160922', N'19.265339', N'ClÃ­nica', N'T-III', CAST(N'2015-01-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (168, N'Dr. Gerardo Varela Mariscal', 13, 13, N'Calle Matamoros y Allende, s/n,  Col Santo TomÃ¡s Ajusco, C.P. 14710  ', N'-99.160386', N'19.293208', N'ClÃ­nica', N'T-III', CAST(N'2015-01-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (169, N'Dr. JosÃ© Castro Villagrana', 13, 13, N'Calle Coapa , esq. Carrasco No. 153, Col. Toriello Guerra,  C.P. 14050 ', N'-99.166957', N'19.293444', N'ClÃ­nica', N'T-III', CAST(N'2015-01-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (170, N'Ejidos de Huipulco', 13, 13, N'Escuela s/n casi esq. Gadiez, Col. Ejidos de Huipulco,  C.P. 14387', N'-99.133695', N'19.286152', N'ClÃ­nica', N'T-I', CAST(N'2015-01-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (171, N'Magdalena Petlacalco', 13, 13, N'5de mayo, esq. JuÃ¡rez, dentro de la SubdelegaciÃ³n Magdalena Petlacalco, C.P. 14480  ', N'-99.18033', N'19.23387', N'ClÃ­nica', N'T-I', CAST(N'2015-01-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (172, N'San Miguel Xicalco', 13, 13, N'16 de Septiembre s/n, Col. Pueblo San Miguel Xicalco, C.P. 14490  ', N'-99.163758', N'19.234184', N'ClÃ­nica', N'T-I', CAST(N'2015-01-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (173, N'Xitle', 13, 13, N'Cerro Xitle S/N casi esq. con Sierra Las Cruces, Col. MarÃ­a Esther Zuno de EcheverrÃ­a, C.P. 16460', N'-99.182877', N'19.255506', N'ClÃ­nica', N'T-I', CAST(N'2015-01-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (178, N'Tierra y Libertad', 13, 13, N'Ahuehuetes esq. Av. Bosques, Col Bosques del Pedregal, C.P. 14210  tel. 54463572', N'-99.237835', N'19.27087', N'ClÃ­nica', N'T-I', CAST(N'2015-01-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (179, N'Bosques del Pedregal', 13, 13, N'Sisal s/n casi esq. Encinos, Col. Bosques del Pedregal, C.P. 14738 ', N'-99.236943', N'19.273919', N'ClÃ­nica', N'T-I', CAST(N'2015-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (180, N'Pedregal de San NicolÃ¡s Sur', 13, 13, N'Calle Homun s/n (Lote 13-A, Manzana 860, Zona 74), Col Pedregal de San NicolÃ¡s, C.P. 14109 ', N'-99.140067', N'19.170067', N'ClÃ­nica', N'T-I', CAST(N'2015-01-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (181, N'Bekal', 13, 13, N'ProlongaciÃ³n Bekal entre Ãtica y Peloponeso, Manzana 110, Lote 22,  Col. Belvedere, C.P. 14720', N'-99.227185', N'19.268095', N'ClÃ­nica', N'T-I', CAST(N'2015-01-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (182, N'Arenal 4a. SecciÃ³n', 14, 14, N'XOCOYOTE S/N, XALTOCAN Y XANICHO, COL. EL ARENAL 4a SECCIÃ“N, C.P. 15610 ', N'-99.060944', N'19.430668', N'ClÃ­nica', N'T-II', CAST(N'2015-01-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (183, N'Cuchilla PantitlÃ¡n', 14, 14, N'PRIVADA DE ESTAÃ‘O No. 43, COL. CUCHILLA PANTITLÃN, C.P. 15610 ', N'-99.062392', N'19.421319', N'ClÃ­nica', N'T-II', CAST(N'2015-01-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (184, N'Ixnahualtongo', 14, 14, N'CUITLÃHUAC S/N ESQ. FERROCARRIL INDUSTRIAL Y ZOQUIPA, COL. MERCED BALBUENA, C.P. 15810  ', N'-99.126186', N'19.418961', N'ClÃ­nica', N'T-II', CAST(N'2015-01-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (185, N'JosÃ© MarÃ­a Morelos y PavÃ³n', 14, 14, N'MINEROS No. 59 ESQ. AV. FERROCARRIL DE CINTURA, COL. MORELOS, C.P. 15270 ', N'-99.120929', N'19.445207', N'ClÃ­nica', N'T-II', CAST(N'2015-01-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (187, N'Dr. Juan Duque de Estrada', 14, 14, N'ORIENTE 170 No. 154 ESQ. 4a CERRADA DE ORIENTE 168, COL. MOCTEZUMA 2Â° SECCIÃ“N, C.P. 15500 ', N'-99.097078', N'19.428452', N'ClÃ­nica', N'T-III', CAST(N'2015-02-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (188, N'Dr. Luis E. Ruiz ', 14, 14, N'EJE 2 ORIENTE AV. H. CONGRESO DE LA UNIÃ“N No. 148, COL. DEL PARQUE, C.P. 15810 ', N'-99.1196', N'19.424547', N'ClÃ­nica', N'T-III', CAST(N'2015-02-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (189, N'Romero Rubio', 14, 14, N'MANCHURIA No. 8 ESQ. TRANSVAAL, COL. AQUILES SERDÃN, C.P. 15430', N'-99.090367', N'19.444073', N'ClÃ­nica', N'T-III', CAST(N'2015-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (190, N'RevoluciÃ³n', 14, 14, N'FRANCISCO SERRANO No. 5, COL. 10, C.P. 15470  ', N'-99.106648', N'19.436541', N'ClÃ­nica', N'T-I', CAST(N'2015-02-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (191, N'RenovaciÃ³n', 14, 14, N'FRANCISCO ESPEJEL No. 92, COL. MOCTEZUMA 1a SECCIÃ“N, C.P. 15500 ', N'-99.109556', N'19.432105', N'ClÃ­nica', N'T-I', CAST(N'2015-02-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (192, N'Cuatro Arboles', 14, 14, N'BIENES NACIONALES No. 88, COL. CUATRO ÃRBOLES, C.P. 15730 ', N'-99.084111', N'19.416773', N'ClÃ­nica', N'T-I', CAST(N'2015-02-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (193, N'AmpliaciÃ³n Caracol', 14, 14, N'AV. RÃO CHURUBUSCO No. 180, COL. AMPLIACIÃ“N CARACOL, C.P. 15650 ', N'-99.065115', N'19.427521', N'ClÃ­nica', N'T-I', CAST(N'2015-02-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (194, N'PolvorÃ­n', 14, 14, N'JUAN PARDAVÃ‰ No. 35, PUEBLO DE LA MAGDALENA MIXHUCA, C.P. 15850  ', N'-99.115252', N'19.409854', N'ClÃ­nica', N'T-I', CAST(N'2015-02-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (196, N'San BartolomÃ© Xicomulco', 15, 15, N'', N'', N'', N'ClÃ­nica', N'T-I', CAST(N'2015-02-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (197, N'Santa Cruz Acalpixca', 15, 15, N'Ahualapa s/n, Col. Pueblo de Santa Cruz Acalpixca, C.P. 16500 ', N'-99.068272', N'19.246319', N'ClÃ­nica', N'T-II', CAST(N'2015-02-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (198, N'Santa MarÃ­a Nativitas', 15, 15, N'Carretera Vieja a Tulyehualco-15 s/n, esq. los Pinos, Col. Pueblo Nativitas, C.P. 16450  ', N'-99.094407', N'19.246532', N'ClÃ­nica', N'T-II', CAST(N'2015-02-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (199, N'San Mateo Xalpa', 15, 15, N'Carretera 15-Topilejo No. 255, casi esq. Las Granjas y 5, Col. San Mateo Xalpa, C.P. 16800  ', N'-99.119437', N'19.227954', N'ClÃ­nica', N'T-III', CAST(N'2015-02-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (201, N'Xochimilco', 15, 15, N' y  JuÃ¡rez No. 2, esq. Calle Pino, Col. Barrio San Juan, C.P. 16070  ', N'-99.104223', N'19.264789', N'ClÃ­nica', N'T-III', CAST(N'2015-02-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (203, N'San Luis Tlaxialtemanco', 15, 15, N'Av. 5 de Mayo S/N, esq. con la calle Temacpalco, Col. Barrio La Candelaria, C.P. 16610  ', N'-99.041072', N'19.255693', N'ClÃ­nica', N'T-I', CAST(N'2015-02-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (206, N'Santa Cecilia Tepetlapa', 15, 15, N'Francisco Sarabia s/n, Col. Santa Cecilia Tepetlapa, C.P. 16880.  ', N'-99.099331', N'19.215944', N'ClÃ­nica', N'T-I', CAST(N'2015-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (207, N'San Francisco Tlalnepantla', 15, 15, N'ConstituciÃ³n s/n, junto al No. 35, Col. San Francisco Tlalnepantla, C.P. 16890.  ', N'-99.122754', N'19.194885', N'ClÃ­nica', N'T-I', CAST(N'2015-02-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (209, N'CEMI', 5, 5, N'Francisco DÃ­az Covarrubias 23, Col. San Rafael, C.P. 06470', N'-99.261163', N'19.261163', N'ClÃ­nica', N'Especializada', CAST(N'2015-02-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (210, N'ClÃ­nica de AtenciÃ³n Integral a la Mujer', 8, 8, N'Desposorios s/n esq. Sur 1, Col. San Lorenzo Tezonco', N'-99.071597', N'19.310156', N'ClÃ­nica', N'AtenciÃ³n a la Mujer', CAST(N'2015-02-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (211, N'ClÃ­nica de Displasias', 8, 8, N'Calz. Ermita 8 s/n, ex cÃ¡rcel de mujeres, Col. Lomas de Zaragoza, 09620', N'-99.0271', N'19.212838', N'ClÃ­nica', N'Displasias', CAST(N'2015-02-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (212, N'ClÃ­nica de Especialidades No. 2', 5, 5, N'RepÃºblica de Guatemala 78, Col. Centro, C.P. 06020', N'-99.74458', N'19.26446', N'ClÃ­nica', N'Especialidades', CAST(N'2015-02-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (213, N'ClÃ­nica de Especialidades No. 3', 5, 5, N'TenochtitÃ¡n 79, Col. Morelos, C.P. 06200', N'-99.74427', N'19265175', N'ClÃ­nica', N'Especialidades', CAST(N'2015-02-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (214, N'ClÃ­nica de Especialidades No. 5', 5, 5, N'Arcos de BelÃ©n 17, Col. Centro, C.P. 06070', N'-99.84692', N'19.253732', N'ClÃ­nica', N'Especialidades', CAST(N'2015-03-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (215, N'ClÃ­nica de Especialidades No. 6', 5, 5, N'Lucerna 67, Col. JuÃ¡rez, C.P. 06600', N'-99.84692', N'19.253732', N'ClÃ­nica', N'Especialidades', CAST(N'2015-03-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (216, N'Pascua', 5, 5, N'Dr. Vertiz 464, Col. Buenos Aires, C.P. 06780', N'-99.91706', N'19.25235', N'ClÃ­nica', N'DermatolÃ³gico', CAST(N'2015-03-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (221, N'Tierra y Libertad', 13, 13, N'Ahuehuetes esq. Av. Bosques, Col Bosques del Pedregal, C.P. 14210  tel. 54463572', N'-99.237835', N'19.27087', N'ClÃ­nica', N'T-I', CAST(N'2015-01-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (222, N'Bosques del Pedregal', 13, 13, N'Sisal s/n casi esq. Encinos, Col. Bosques del Pedregal, C.P. 14738 ', N'-99.236943', N'19.273919', N'ClÃ­nica', N'T-I', CAST(N'2015-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (223, N'Pedregal de San NicolÃ¡s Sur', 13, 13, N'Calle Homun s/n (Lote 13-A, Manzana 860, Zona 74), Col Pedregal de San NicolÃ¡s, C.P. 14109 ', N'-99.140067', N'19.170067', N'ClÃ­nica', N'T-I', CAST(N'2015-01-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (224, N'Bekal', 13, 13, N'ProlongaciÃ³n Bekal entre Ãtica y Peloponeso, Manzana 110, Lote 22,  Col. Belvedere, C.P. 14720', N'-99.227185', N'19.268095', N'ClÃ­nica', N'T-I', CAST(N'2015-01-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (225, N'Arenal 4a. SecciÃ³n', 14, 14, N'XOCOYOTE S/N, XALTOCAN Y XANICHO, COL. EL ARENAL 4a SECCIÃ“N, C.P. 15610 ', N'-99.060944', N'19.430668', N'ClÃ­nica', N'T-II', CAST(N'2015-01-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (226, N'Cuchilla PantitlÃ¡n', 14, 14, N'PRIVADA DE ESTAÃ‘O No. 43, COL. CUCHILLA PANTITLÃN, C.P. 15610 ', N'-99.062392', N'19.421319', N'ClÃ­nica', N'T-II', CAST(N'2015-01-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (227, N'Ixnahualtongo', 14, 14, N'CUITLÃHUAC S/N ESQ. FERROCARRIL INDUSTRIAL Y ZOQUIPA, COL. MERCED BALBUENA, C.P. 15810  ', N'-99.126186', N'19.418961', N'ClÃ­nica', N'T-II', CAST(N'2015-01-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (228, N'JosÃ© MarÃ­a Morelos y PavÃ³n', 14, 14, N'MINEROS No. 59 ESQ. AV. FERROCARRIL DE CINTURA, COL. MORELOS, C.P. 15270 ', N'-99.120929', N'19.445207', N'ClÃ­nica', N'T-II', CAST(N'2015-01-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (230, N'Dr. Juan Duque de Estrada', 14, 14, N'ORIENTE 170 No. 154 ESQ. 4a CERRADA DE ORIENTE 168, COL. MOCTEZUMA 2Â° SECCIÃ“N, C.P. 15500 ', N'-99.097078', N'19.428452', N'ClÃ­nica', N'T-III', CAST(N'2015-02-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (231, N'Dr. Luis E. Ruiz ', 14, 14, N'EJE 2 ORIENTE AV. H. CONGRESO DE LA UNIÃ“N No. 148, COL. DEL PARQUE, C.P. 15810 ', N'-99.1196', N'19.424547', N'ClÃ­nica', N'T-III', CAST(N'2015-02-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (232, N'Romero Rubio', 14, 14, N'MANCHURIA No. 8 ESQ. TRANSVAAL, COL. AQUILES SERDÃN, C.P. 15430', N'-99.090367', N'19.444073', N'ClÃ­nica', N'T-III', CAST(N'2015-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (233, N'RevoluciÃ³n', 14, 14, N'FRANCISCO SERRANO No. 5, COL. 10, C.P. 15470  ', N'-99.106648', N'19.436541', N'ClÃ­nica', N'T-I', CAST(N'2015-02-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (234, N'RenovaciÃ³n', 14, 14, N'FRANCISCO ESPEJEL No. 92, COL. MOCTEZUMA 1a SECCIÃ“N, C.P. 15500 ', N'-99.109556', N'19.432105', N'ClÃ­nica', N'T-I', CAST(N'2015-02-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (235, N'Cuatro Arboles', 14, 14, N'BIENES NACIONALES No. 88, COL. CUATRO ÃRBOLES, C.P. 15730 ', N'-99.084111', N'19.416773', N'ClÃ­nica', N'T-I', CAST(N'2015-02-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (236, N'AmpliaciÃ³n Caracol', 14, 14, N'AV. RÃO CHURUBUSCO No. 180, COL. AMPLIACIÃ“N CARACOL, C.P. 15650 ', N'-99.065115', N'19.427521', N'ClÃ­nica', N'T-I', CAST(N'2015-02-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (237, N'PolvorÃ­n', 14, 14, N'JUAN PARDAVÃ‰ No. 35, PUEBLO DE LA MAGDALENA MIXHUCA, C.P. 15850  ', N'-99.115252', N'19.409854', N'ClÃ­nica', N'T-I', CAST(N'2015-02-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (239, N'San BartolomÃ© Xicomulco', 15, 15, N'', N'', N'', N'ClÃ­nica', N'T-I', CAST(N'2015-02-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (240, N'Santa Cruz Acalpixca', 15, 15, N'Ahualapa s/n, Col. Pueblo de Santa Cruz Acalpixca, C.P. 16500 ', N'-99.068272', N'19.246319', N'ClÃ­nica', N'T-II', CAST(N'2015-02-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (241, N'Santa MarÃ­a Nativitas', 15, 15, N'Carretera Vieja a Tulyehualco-15 s/n, esq. los Pinos, Col. Pueblo Nativitas, C.P. 16450  ', N'-99.094407', N'19.246532', N'ClÃ­nica', N'T-II', CAST(N'2015-02-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (242, N'San Mateo Xalpa', 15, 15, N'Carretera 15-Topilejo No. 255, casi esq. Las Granjas y 5, Col. San Mateo Xalpa, C.P. 16800  ', N'-99.119437', N'19.227954', N'ClÃ­nica', N'T-III', CAST(N'2015-02-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (244, N'Xochimilco', 15, 15, N' y  JuÃ¡rez No. 2, esq. Calle Pino, Col. Barrio San Juan, C.P. 16070  ', N'-99.104223', N'19.264789', N'ClÃ­nica', N'T-III', CAST(N'2015-02-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (246, N'San Luis Tlaxialtemanco', 15, 15, N'Av. 5 de Mayo S/N, esq. con la calle Temacpalco, Col. Barrio La Candelaria, C.P. 16610  ', N'-99.041072', N'19.255693', N'ClÃ­nica', N'T-I', CAST(N'2015-02-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (249, N'Santa Cecilia Tepetlapa', 15, 15, N'Francisco Sarabia s/n, Col. Santa Cecilia Tepetlapa, C.P. 16880.  ', N'-99.099331', N'19.215944', N'ClÃ­nica', N'T-I', CAST(N'2015-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (250, N'San Francisco Tlalnepantla', 15, 15, N'ConstituciÃ³n s/n, junto al No. 35, Col. San Francisco Tlalnepantla, C.P. 16890.  ', N'-99.122754', N'19.194885', N'ClÃ­nica', N'T-I', CAST(N'2015-02-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (252, N'CEMI', 5, 5, N'Francisco DÃ­az Covarrubias 23, Col. San Rafael, C.P. 06470', N'-99.261163', N'19.261163', N'ClÃ­nica', N'Especializada', CAST(N'2015-02-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (253, N'ClÃ­nica de AtenciÃ³n Integral a la Mujer', 8, 8, N'Desposorios s/n esq. Sur 1, Col. San Lorenzo Tezonco', N'-99.071597', N'19.310156', N'ClÃ­nica', N'AtenciÃ³n a la Mujer', CAST(N'2015-02-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (254, N'ClÃ­nica de Displasias', 8, 8, N'Calz. Ermita 8 s/n, ex cÃ¡rcel de mujeres, Col. Lomas de Zaragoza, 09620', N'-99.0271', N'19.212838', N'ClÃ­nica', N'Displasias', CAST(N'2015-02-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (255, N'ClÃ­nica de Especialidades No. 2', 5, 5, N'RepÃºblica de Guatemala 78, Col. Centro, C.P. 06020', N'-99.74458', N'19.26446', N'ClÃ­nica', N'Especialidades', CAST(N'2015-02-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (256, N'ClÃ­nica de Especialidades No. 3', 5, 5, N'TenochtitÃ¡n 79, Col. Morelos, C.P. 06200', N'-99.74427', N'19265175', N'ClÃ­nica', N'Especialidades', CAST(N'2015-02-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (257, N'ClÃ­nica de Especialidades No. 5', 5, 5, N'Arcos de BelÃ©n 17, Col. Centro, C.P. 06070', N'-99.84692', N'19.253732', N'ClÃ­nica', N'Especialidades', CAST(N'2015-03-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (258, N'ClÃ­nica de Especialidades No. 6', 5, 5, N'Lucerna 67, Col. JuÃ¡rez, C.P. 06600', N'-99.84692', N'19.253732', N'ClÃ­nica', N'Especialidades', CAST(N'2015-03-02 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblCentroSalud] ([idCentroSalud], [CentroSalud], [idEstado], [idMunicipio], [Direccion], [Lat], [Long], [Tipo], [Subtipo], [FecReg]) VALUES (259, N'Pascua', 5, 5, N'Dr. Vertiz 464, Col. Buenos Aires, C.P. 06780', N'-99.91706', N'19.25235', N'ClÃ­nica', N'DermatolÃ³gico', CAST(N'2015-03-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (1, N'Lun  ')
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (2, N'Mar  ')
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (3, N'Mier ')
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (4, N'Jue  ')
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (5, N'Vie  ')
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (6, N'Sab  ')
INSERT [dbo].[tblDia] ([idDia], [Dia]) VALUES (7, N'Dom  ')
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
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1, 1, 1, 24, CAST(N'2011-06-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (2, 2, 1, 24, CAST(N'2011-06-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (3, 3, 1, 24, CAST(N'2011-06-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (4, 4, 1, 24, CAST(N'2011-06-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (5, 5, 1, 24, CAST(N'2011-06-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (6, 6, 1, 24, CAST(N'2011-06-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (7, 7, 1, 24, CAST(N'2011-06-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (8, 8, 1, 24, CAST(N'2011-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (9, 9, 1, 24, CAST(N'2011-06-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (10, 10, 1, 24, CAST(N'2011-06-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (11, 11, 1, 24, CAST(N'2011-06-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (12, 12, 1, 24, CAST(N'2011-06-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (13, 13, 1, 24, CAST(N'2011-06-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (14, 14, 1, 24, CAST(N'2011-06-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (15, 15, 1, 24, CAST(N'2011-06-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (16, 16, 1, 24, CAST(N'2011-06-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (17, 17, 1, 24, CAST(N'2011-06-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (18, 18, 1, 24, CAST(N'2011-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (19, 19, 1, 24, CAST(N'2011-06-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (20, 20, 1, 24, CAST(N'2011-07-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (21, 21, 1, 24, CAST(N'2011-07-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (22, 22, 1, 24, CAST(N'2011-07-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (23, 23, 1, 24, CAST(N'2011-07-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (24, 24, 1, 24, CAST(N'2011-07-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (25, 25, 1, 24, CAST(N'2011-07-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (26, 26, 1, 24, CAST(N'2011-07-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (27, 27, 1, 24, CAST(N'2011-07-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (28, 28, 1, 24, CAST(N'2011-07-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (29, 29, 1, 24, CAST(N'2011-07-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (30, 30, 1, 24, CAST(N'2011-07-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (31, 31, 1, 24, CAST(N'2011-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (32, 32, 1, 24, CAST(N'2011-07-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (33, 33, 1, 12, CAST(N'2011-07-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (34, 34, 1, 12, CAST(N'2011-07-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (35, 35, 1, 12, CAST(N'2011-07-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (36, 36, 1, 12, CAST(N'2011-07-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (37, 37, 1, 12, CAST(N'2011-07-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (38, 38, 1, 12, CAST(N'2011-07-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (39, 39, 1, 12, CAST(N'2011-07-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (40, 40, 1, 12, CAST(N'2011-07-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (41, 41, 1, 12, CAST(N'2011-07-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (42, 42, 1, 12, CAST(N'2011-07-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (43, 43, 1, 12, CAST(N'2011-07-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (44, 44, 1, 12, CAST(N'2011-07-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (45, 45, 1, 12, CAST(N'2011-07-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (46, 46, 1, 12, CAST(N'2011-07-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (47, 47, 1, 12, CAST(N'2011-07-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (48, 48, 1, 12, CAST(N'2011-07-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (49, 49, 1, 12, CAST(N'2011-07-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (50, 50, 1, 12, CAST(N'2011-07-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (51, 51, 1, 12, CAST(N'2011-08-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (52, 52, 1, 12, CAST(N'2011-08-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (53, 53, 1, 12, CAST(N'2011-08-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (54, 54, 1, 12, CAST(N'2011-08-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (55, 55, 1, 12, CAST(N'2011-08-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (56, 56, 1, 12, CAST(N'2011-08-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (57, 57, 1, 12, CAST(N'2011-08-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (58, 58, 1, 12, CAST(N'2011-08-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (59, 59, 1, 12, CAST(N'2011-08-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (60, 60, 1, 12, CAST(N'2011-08-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (61, 61, 1, 12, CAST(N'2011-08-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (62, 62, 1, 12, CAST(N'2011-08-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (63, 63, 1, 12, CAST(N'2011-08-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (64, 64, 1, 12, CAST(N'2011-08-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (65, 65, 1, 12, CAST(N'2011-08-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (66, 66, 1, 12, CAST(N'2011-08-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (67, 67, 1, 12, CAST(N'2011-08-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (68, 68, 1, 12, CAST(N'2011-08-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (69, 69, 1, 12, CAST(N'2011-08-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (70, 70, 1, 12, CAST(N'2011-08-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (71, 71, 1, 12, CAST(N'2011-08-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (72, 72, 1, 12, CAST(N'2011-08-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (73, 73, 1, 12, CAST(N'2011-08-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (74, 74, 1, 12, CAST(N'2011-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (75, 75, 1, 12, CAST(N'2011-08-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (76, 76, 1, 12, CAST(N'2011-08-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (77, 77, 1, 12, CAST(N'2011-08-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (78, 78, 1, 12, CAST(N'2011-08-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (79, 79, 1, 12, CAST(N'2011-08-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (80, 80, 1, 12, CAST(N'2011-08-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (81, 81, 1, 12, CAST(N'2011-08-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (82, 82, 1, 12, CAST(N'2011-09-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (83, 83, 1, 12, CAST(N'2011-09-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (84, 84, 1, 12, CAST(N'2011-09-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (85, 85, 1, 12, CAST(N'2011-09-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (86, 86, 1, 12, CAST(N'2011-09-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (87, 87, 1, 12, CAST(N'2011-09-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (88, 88, 1, 12, CAST(N'2011-09-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (89, 89, 1, 12, CAST(N'2011-09-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (90, 90, 1, 12, CAST(N'2011-09-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (91, 91, 1, 12, CAST(N'2011-09-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (92, 92, 1, 12, CAST(N'2011-09-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (93, 93, 1, 12, CAST(N'2011-09-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (94, 94, 1, 12, CAST(N'2011-09-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (95, 95, 1, 12, CAST(N'2011-09-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (96, 96, 1, 12, CAST(N'2011-09-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (97, 97, 1, 12, CAST(N'2011-09-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (98, 98, 1, 12, CAST(N'2011-09-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (99, 99, 1, 12, CAST(N'2011-09-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (100, 100, 1, 12, CAST(N'2011-09-19 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (101, 101, 1, 12, CAST(N'2011-09-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (102, 102, 1, 12, CAST(N'2011-09-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (103, 103, 1, 12, CAST(N'2011-09-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (104, 104, 1, 12, CAST(N'2011-09-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (105, 105, 1, 12, CAST(N'2011-09-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (106, 106, 1, 12, CAST(N'2011-09-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (107, 107, 1, 12, CAST(N'2011-09-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (108, 108, 1, 12, CAST(N'2011-09-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (109, 109, 1, 12, CAST(N'2011-09-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (110, 110, 1, 12, CAST(N'2011-09-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (111, 111, 1, 12, CAST(N'2011-09-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (112, 112, 1, 12, CAST(N'2011-10-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (113, 113, 1, 12, CAST(N'2011-10-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (114, 114, 1, 12, CAST(N'2011-10-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (115, 115, 1, 12, CAST(N'2011-10-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (116, 116, 1, 12, CAST(N'2011-10-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (117, 117, 1, 12, CAST(N'2011-10-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (118, 118, 1, 12, CAST(N'2011-10-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (119, 119, 1, 12, CAST(N'2011-10-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (120, 120, 1, 12, CAST(N'2011-10-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (121, 121, 1, 12, CAST(N'2011-10-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (122, 122, 1, 12, CAST(N'2011-10-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (123, 123, 1, 12, CAST(N'2011-10-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (124, 124, 1, 12, CAST(N'2011-10-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (125, 125, 1, 12, CAST(N'2011-10-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (126, 126, 1, 12, CAST(N'2011-10-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (127, 127, 1, 12, CAST(N'2011-10-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (128, 128, 1, 12, CAST(N'2011-10-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (129, 129, 1, 12, CAST(N'2011-10-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (130, 130, 1, 12, CAST(N'2011-10-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (131, 131, 1, 12, CAST(N'2011-10-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (132, 132, 1, 12, CAST(N'2011-10-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (133, 133, 1, 12, CAST(N'2011-10-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (134, 134, 1, 12, CAST(N'2011-10-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (135, 135, 1, 12, CAST(N'2011-10-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (136, 136, 1, 12, CAST(N'2011-10-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (137, 137, 1, 12, CAST(N'2011-10-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (138, 138, 1, 12, CAST(N'2011-10-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (139, 139, 1, 12, CAST(N'2011-10-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (140, 140, 1, 12, CAST(N'2011-10-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (141, 141, 1, 12, CAST(N'2011-10-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (142, 142, 1, 12, CAST(N'2011-10-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (143, 143, 1, 12, CAST(N'2011-11-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (144, 144, 1, 12, CAST(N'2011-11-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (145, 145, 1, 12, CAST(N'2011-11-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (146, 146, 1, 12, CAST(N'2011-11-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (147, 147, 1, 12, CAST(N'2011-11-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (148, 148, 1, 12, CAST(N'2011-11-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (149, 149, 1, 12, CAST(N'2011-11-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (150, 150, 1, 12, CAST(N'2011-11-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (151, 151, 1, 12, CAST(N'2011-11-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (152, 152, 1, 12, CAST(N'2011-11-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (153, 153, 1, 12, CAST(N'2011-11-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (154, 154, 1, 12, CAST(N'2011-11-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (155, 155, 1, 12, CAST(N'2011-11-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (156, 156, 1, 12, CAST(N'2011-11-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (157, 157, 1, 12, CAST(N'2011-11-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (158, 158, 1, 12, CAST(N'2011-11-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (159, 159, 1, 12, CAST(N'2011-11-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (160, 160, 1, 12, CAST(N'2011-11-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (161, 161, 1, 12, CAST(N'2011-11-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (162, 162, 1, 12, CAST(N'2011-11-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (163, 163, 1, 12, CAST(N'2011-11-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (164, 164, 1, 12, CAST(N'2011-11-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (165, 165, 1, 12, CAST(N'2011-11-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (166, 166, 1, 12, CAST(N'2011-11-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (167, 167, 1, 12, CAST(N'2011-11-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (168, 168, 1, 12, CAST(N'2011-11-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (169, 169, 1, 12, CAST(N'2011-11-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (170, 170, 1, 12, CAST(N'2011-11-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (171, 171, 1, 12, CAST(N'2011-11-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (172, 172, 1, 12, CAST(N'2011-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (173, 173, 1, 12, CAST(N'2011-12-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (174, 174, 1, 12, CAST(N'2011-12-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (175, 175, 1, 12, CAST(N'2011-12-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (176, 176, 1, 12, CAST(N'2011-12-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (177, 177, 1, 12, CAST(N'2011-12-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (178, 178, 1, 12, CAST(N'2011-12-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (179, 179, 1, 12, CAST(N'2011-12-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (180, 180, 1, 12, CAST(N'2011-12-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (181, 181, 1, 12, CAST(N'2011-12-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (182, 182, 1, 12, CAST(N'2011-12-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (183, 183, 1, 12, CAST(N'2011-12-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (184, 184, 1, 12, CAST(N'2011-12-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (185, 185, 1, 12, CAST(N'2011-12-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (186, 186, 1, 12, CAST(N'2011-12-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (187, 187, 1, 12, CAST(N'2011-12-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (188, 188, 1, 12, CAST(N'2011-12-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (189, 189, 1, 12, CAST(N'2011-12-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (190, 190, 1, 12, CAST(N'2011-12-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (191, 191, 1, 12, CAST(N'2011-12-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (192, 192, 1, 12, CAST(N'2011-12-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (193, 193, 1, 12, CAST(N'2011-12-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (194, 194, 1, 12, CAST(N'2011-12-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (195, 195, 1, 12, CAST(N'2011-12-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (196, 196, 1, 12, CAST(N'2011-12-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (197, 197, 1, 12, CAST(N'2011-12-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (198, 198, 1, 12, CAST(N'2011-12-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (199, 199, 1, 12, CAST(N'2011-12-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (200, 200, 1, 12, CAST(N'2011-12-28 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (201, 201, 1, 12, CAST(N'2011-12-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (202, 202, 1, 12, CAST(N'2011-12-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (203, 203, 1, 12, CAST(N'2011-12-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (204, 204, 1, 12, CAST(N'2012-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (205, 205, 1, 12, CAST(N'2012-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (206, 206, 1, 12, CAST(N'2012-01-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (207, 207, 1, 12, CAST(N'2012-01-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (208, 208, 1, 12, CAST(N'2012-01-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (209, 209, 1, 12, CAST(N'2012-01-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (210, 210, 1, 12, CAST(N'2012-01-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (211, 211, 1, 12, CAST(N'2012-01-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (212, 212, 1, 12, CAST(N'2012-01-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (213, 213, 1, 12, CAST(N'2012-01-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (214, 214, 1, 12, CAST(N'2012-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (215, 215, 1, 12, CAST(N'2012-01-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (216, 216, 1, 12, CAST(N'2012-01-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (217, 217, 1, 12, CAST(N'2012-01-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (218, 218, 1, 12, CAST(N'2012-01-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (219, 219, 1, 12, CAST(N'2012-01-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (220, 220, 1, 12, CAST(N'2012-01-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (221, 221, 1, 12, CAST(N'2012-01-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (222, 222, 1, 12, CAST(N'2012-01-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (223, 223, 1, 12, CAST(N'2012-01-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (224, 224, 1, 12, CAST(N'2012-01-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (225, 225, 1, 12, CAST(N'2012-01-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (226, 226, 1, 12, CAST(N'2012-01-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (227, 227, 1, 12, CAST(N'2012-01-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (228, 228, 1, 12, CAST(N'2012-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (229, 229, 1, 12, CAST(N'2012-01-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (230, 230, 1, 12, CAST(N'2012-01-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (231, 231, 1, 12, CAST(N'2012-01-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (232, 232, 1, 12, CAST(N'2012-01-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (233, 233, 1, 12, CAST(N'2012-01-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (234, 234, 1, 12, CAST(N'2012-01-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (235, 235, 1, 12, CAST(N'2012-02-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (236, 236, 1, 12, CAST(N'2012-02-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (237, 237, 1, 12, CAST(N'2012-02-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (238, 238, 1, 12, CAST(N'2012-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (239, 239, 1, 12, CAST(N'2012-02-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (240, 240, 1, 12, CAST(N'2012-02-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (241, 241, 1, 12, CAST(N'2012-02-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (242, 242, 1, 12, CAST(N'2012-02-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (243, 243, 1, 12, CAST(N'2012-02-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (244, 244, 1, 12, CAST(N'2012-02-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (245, 245, 1, 12, CAST(N'2012-02-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (246, 246, 1, 12, CAST(N'2012-02-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (247, 247, 1, 12, CAST(N'2012-02-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (248, 248, 1, 12, CAST(N'2012-02-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (249, 249, 1, 12, CAST(N'2012-02-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (250, 250, 1, 12, CAST(N'2012-02-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (251, 251, 1, 12, CAST(N'2012-02-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (252, 252, 1, 12, CAST(N'2012-02-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (253, 253, 1, 12, CAST(N'2012-02-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (254, 254, 1, 12, CAST(N'2012-02-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (255, 255, 1, 12, CAST(N'2012-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (256, 256, 1, 12, CAST(N'2012-02-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (257, 257, 1, 12, CAST(N'2012-02-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (258, 258, 1, 12, CAST(N'2012-02-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (259, 259, 1, 12, CAST(N'2012-02-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (260, 1, 2, 24, CAST(N'2012-02-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (261, 2, 2, 24, CAST(N'2012-02-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (262, 3, 2, 24, CAST(N'2012-02-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (263, 4, 2, 24, CAST(N'2012-02-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (264, 5, 2, 24, CAST(N'2012-03-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (265, 6, 2, 24, CAST(N'2012-03-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (266, 7, 2, 24, CAST(N'2012-03-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (267, 8, 2, 24, CAST(N'2012-03-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (268, 9, 2, 24, CAST(N'2012-03-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (269, 10, 2, 24, CAST(N'2012-03-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (270, 11, 2, 24, CAST(N'2012-03-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (271, 12, 2, 24, CAST(N'2012-03-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (272, 13, 2, 24, CAST(N'2012-03-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (273, 14, 2, 24, CAST(N'2012-03-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (274, 15, 2, 24, CAST(N'2012-03-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (275, 16, 2, 24, CAST(N'2012-03-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (276, 17, 2, 24, CAST(N'2012-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (277, 18, 2, 24, CAST(N'2012-03-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (278, 19, 2, 24, CAST(N'2012-03-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (279, 20, 2, 24, CAST(N'2012-03-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (280, 21, 2, 24, CAST(N'2012-03-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (281, 22, 2, 24, CAST(N'2012-03-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (282, 23, 2, 24, CAST(N'2012-03-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (283, 24, 2, 24, CAST(N'2012-03-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (284, 25, 2, 24, CAST(N'2012-03-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (285, 26, 2, 24, CAST(N'2012-03-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (286, 27, 2, 24, CAST(N'2012-03-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (287, 28, 2, 24, CAST(N'2012-03-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (288, 29, 2, 24, CAST(N'2012-03-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (289, 30, 2, 24, CAST(N'2012-03-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (290, 31, 2, 24, CAST(N'2012-03-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (291, 32, 2, 24, CAST(N'2012-03-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (292, 33, 2, 12, CAST(N'2012-03-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (293, 34, 2, 12, CAST(N'2012-03-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (294, 35, 2, 12, CAST(N'2012-03-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (295, 36, 2, 12, CAST(N'2012-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (296, 37, 2, 12, CAST(N'2012-04-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (297, 38, 2, 12, CAST(N'2012-04-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (298, 39, 2, 12, CAST(N'2012-04-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (299, 40, 2, 12, CAST(N'2012-04-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (300, 41, 2, 12, CAST(N'2012-04-06 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (301, 42, 2, 12, CAST(N'2012-04-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (302, 43, 2, 12, CAST(N'2012-04-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (303, 44, 2, 12, CAST(N'2012-04-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (304, 45, 2, 12, CAST(N'2012-04-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (305, 46, 2, 12, CAST(N'2012-04-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (306, 47, 2, 12, CAST(N'2012-04-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (307, 48, 2, 12, CAST(N'2012-04-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (308, 49, 2, 12, CAST(N'2012-04-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (309, 50, 2, 12, CAST(N'2012-04-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (310, 51, 2, 12, CAST(N'2012-04-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (311, 52, 2, 12, CAST(N'2012-04-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (312, 53, 2, 12, CAST(N'2012-04-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (313, 54, 2, 12, CAST(N'2012-04-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (314, 55, 2, 12, CAST(N'2012-04-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (315, 56, 2, 12, CAST(N'2012-04-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (316, 57, 2, 12, CAST(N'2012-04-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (317, 58, 2, 12, CAST(N'2012-04-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (318, 59, 2, 12, CAST(N'2012-04-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (319, 60, 2, 12, CAST(N'2012-04-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (320, 61, 2, 12, CAST(N'2012-04-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (321, 62, 2, 12, CAST(N'2012-04-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (322, 63, 2, 12, CAST(N'2012-04-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (323, 64, 2, 12, CAST(N'2012-04-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (324, 65, 2, 12, CAST(N'2012-04-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (325, 66, 2, 12, CAST(N'2012-05-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (326, 67, 2, 12, CAST(N'2012-05-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (327, 68, 2, 12, CAST(N'2012-05-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (328, 69, 2, 12, CAST(N'2012-05-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (329, 70, 2, 12, CAST(N'2012-05-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (330, 71, 2, 12, CAST(N'2012-05-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (331, 72, 2, 12, CAST(N'2012-05-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (332, 73, 2, 12, CAST(N'2012-05-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (333, 74, 2, 12, CAST(N'2012-05-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (334, 75, 2, 12, CAST(N'2012-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (335, 76, 2, 12, CAST(N'2012-05-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (336, 77, 2, 12, CAST(N'2012-05-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (337, 78, 2, 12, CAST(N'2012-05-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (338, 79, 2, 12, CAST(N'2012-05-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (339, 80, 2, 12, CAST(N'2012-05-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (340, 81, 2, 12, CAST(N'2012-05-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (341, 82, 2, 12, CAST(N'2012-05-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (342, 83, 2, 12, CAST(N'2012-05-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (343, 84, 2, 12, CAST(N'2012-05-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (344, 85, 2, 12, CAST(N'2012-05-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (345, 86, 2, 12, CAST(N'2012-05-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (346, 87, 2, 12, CAST(N'2012-05-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (347, 88, 2, 12, CAST(N'2012-05-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (348, 89, 2, 12, CAST(N'2012-05-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (349, 90, 2, 12, CAST(N'2012-05-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (350, 91, 2, 12, CAST(N'2012-05-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (351, 92, 2, 12, CAST(N'2012-05-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (352, 93, 2, 12, CAST(N'2012-05-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (353, 94, 2, 12, CAST(N'2012-05-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (354, 95, 2, 12, CAST(N'2012-05-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (355, 96, 2, 12, CAST(N'2012-05-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (356, 97, 2, 12, CAST(N'2012-06-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (357, 98, 2, 12, CAST(N'2012-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (358, 99, 2, 12, CAST(N'2012-06-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (359, 100, 2, 12, CAST(N'2012-06-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (360, 101, 2, 12, CAST(N'2012-06-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (361, 102, 2, 12, CAST(N'2012-06-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (362, 103, 2, 12, CAST(N'2012-06-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (363, 104, 2, 12, CAST(N'2012-06-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (364, 105, 2, 12, CAST(N'2012-06-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (365, 106, 2, 12, CAST(N'2012-06-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (366, 107, 2, 12, CAST(N'2012-06-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (367, 108, 2, 12, CAST(N'2012-06-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (368, 109, 2, 12, CAST(N'2012-06-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (369, 110, 2, 12, CAST(N'2012-06-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (370, 111, 2, 12, CAST(N'2012-06-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (371, 112, 2, 12, CAST(N'2012-06-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (372, 113, 2, 12, CAST(N'2012-06-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (373, 114, 2, 12, CAST(N'2012-06-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (374, 115, 2, 12, CAST(N'2012-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (375, 116, 2, 12, CAST(N'2012-06-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (376, 117, 2, 12, CAST(N'2012-06-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (377, 118, 2, 12, CAST(N'2012-06-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (378, 119, 2, 12, CAST(N'2012-06-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (379, 120, 2, 12, CAST(N'2012-06-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (380, 121, 2, 12, CAST(N'2012-06-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (381, 122, 2, 12, CAST(N'2012-06-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (382, 123, 2, 12, CAST(N'2012-06-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (383, 124, 2, 12, CAST(N'2012-06-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (384, 125, 2, 12, CAST(N'2012-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (385, 126, 2, 12, CAST(N'2012-06-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (386, 127, 2, 12, CAST(N'2012-07-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (387, 128, 2, 12, CAST(N'2012-07-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (388, 129, 2, 12, CAST(N'2012-07-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (389, 130, 2, 12, CAST(N'2012-07-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (390, 131, 2, 12, CAST(N'2012-07-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (391, 132, 2, 12, CAST(N'2012-07-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (392, 133, 2, 12, CAST(N'2012-07-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (393, 134, 2, 12, CAST(N'2012-07-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (394, 135, 2, 12, CAST(N'2012-07-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (395, 136, 2, 12, CAST(N'2012-07-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (396, 137, 2, 12, CAST(N'2012-07-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (397, 138, 2, 12, CAST(N'2012-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (398, 139, 2, 12, CAST(N'2012-07-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (399, 140, 2, 12, CAST(N'2012-07-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (400, 141, 2, 12, CAST(N'2012-07-15 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (401, 142, 2, 12, CAST(N'2012-07-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (402, 143, 2, 12, CAST(N'2012-07-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (403, 144, 2, 12, CAST(N'2012-07-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (404, 145, 2, 12, CAST(N'2012-07-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (405, 146, 2, 12, CAST(N'2012-07-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (406, 147, 2, 12, CAST(N'2012-07-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (407, 148, 2, 12, CAST(N'2012-07-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (408, 149, 2, 12, CAST(N'2012-07-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (409, 150, 2, 12, CAST(N'2012-07-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (410, 151, 2, 12, CAST(N'2012-07-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (411, 152, 2, 12, CAST(N'2012-07-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (412, 153, 2, 12, CAST(N'2012-07-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (413, 154, 2, 12, CAST(N'2012-07-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (414, 155, 2, 12, CAST(N'2012-07-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (415, 156, 2, 12, CAST(N'2012-07-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (416, 157, 2, 12, CAST(N'2012-07-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (417, 158, 2, 12, CAST(N'2012-08-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (418, 159, 2, 12, CAST(N'2012-08-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (419, 160, 2, 12, CAST(N'2012-08-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (420, 161, 2, 12, CAST(N'2012-08-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (421, 162, 2, 12, CAST(N'2012-08-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (422, 163, 2, 12, CAST(N'2012-08-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (423, 164, 2, 12, CAST(N'2012-08-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (424, 165, 2, 12, CAST(N'2012-08-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (425, 166, 2, 12, CAST(N'2012-08-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (426, 167, 2, 12, CAST(N'2012-08-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (427, 168, 2, 12, CAST(N'2012-08-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (428, 169, 2, 12, CAST(N'2012-08-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (429, 170, 2, 12, CAST(N'2012-08-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (430, 171, 2, 12, CAST(N'2012-08-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (431, 172, 2, 12, CAST(N'2012-08-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (432, 173, 2, 12, CAST(N'2012-08-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (433, 174, 2, 12, CAST(N'2012-08-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (434, 175, 2, 12, CAST(N'2012-08-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (435, 176, 2, 12, CAST(N'2012-08-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (436, 177, 2, 12, CAST(N'2012-08-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (437, 178, 2, 12, CAST(N'2012-08-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (438, 179, 2, 12, CAST(N'2012-08-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (439, 180, 2, 12, CAST(N'2012-08-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (440, 181, 2, 12, CAST(N'2012-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (441, 182, 2, 12, CAST(N'2012-08-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (442, 183, 2, 12, CAST(N'2012-08-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (443, 184, 2, 12, CAST(N'2012-08-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (444, 185, 2, 12, CAST(N'2012-08-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (445, 186, 2, 12, CAST(N'2012-08-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (446, 187, 2, 12, CAST(N'2012-08-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (447, 188, 2, 12, CAST(N'2012-08-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (448, 189, 2, 12, CAST(N'2012-09-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (449, 190, 2, 12, CAST(N'2012-09-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (450, 191, 2, 12, CAST(N'2012-09-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (451, 192, 2, 12, CAST(N'2012-09-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (452, 193, 2, 12, CAST(N'2012-09-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (453, 194, 2, 12, CAST(N'2012-09-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (454, 195, 2, 12, CAST(N'2012-09-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (455, 196, 2, 12, CAST(N'2012-09-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (456, 197, 2, 12, CAST(N'2012-09-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (457, 198, 2, 12, CAST(N'2012-09-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (458, 199, 2, 12, CAST(N'2012-09-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (459, 200, 2, 12, CAST(N'2012-09-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (460, 201, 2, 12, CAST(N'2012-09-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (461, 202, 2, 12, CAST(N'2012-09-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (462, 203, 2, 12, CAST(N'2012-09-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (463, 204, 2, 12, CAST(N'2012-09-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (464, 205, 2, 12, CAST(N'2012-09-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (465, 206, 2, 12, CAST(N'2012-09-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (466, 207, 2, 12, CAST(N'2012-09-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (467, 208, 2, 12, CAST(N'2012-09-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (468, 209, 2, 12, CAST(N'2012-09-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (469, 210, 2, 12, CAST(N'2012-09-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (470, 211, 2, 12, CAST(N'2012-09-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (471, 212, 2, 12, CAST(N'2012-09-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (472, 213, 2, 12, CAST(N'2012-09-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (473, 214, 2, 12, CAST(N'2012-09-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (474, 215, 2, 12, CAST(N'2012-09-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (475, 216, 2, 12, CAST(N'2012-09-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (476, 217, 2, 12, CAST(N'2012-09-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (477, 218, 2, 12, CAST(N'2012-09-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (478, 219, 2, 12, CAST(N'2012-10-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (479, 220, 2, 12, CAST(N'2012-10-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (480, 221, 2, 12, CAST(N'2012-10-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (481, 222, 2, 12, CAST(N'2012-10-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (482, 223, 2, 12, CAST(N'2012-10-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (483, 224, 2, 12, CAST(N'2012-10-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (484, 225, 2, 12, CAST(N'2012-10-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (485, 226, 2, 12, CAST(N'2012-10-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (486, 227, 2, 12, CAST(N'2012-10-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (487, 228, 2, 12, CAST(N'2012-10-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (488, 229, 2, 12, CAST(N'2012-10-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (489, 230, 2, 12, CAST(N'2012-10-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (490, 231, 2, 12, CAST(N'2012-10-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (491, 232, 2, 12, CAST(N'2012-10-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (492, 233, 2, 12, CAST(N'2012-10-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (493, 234, 2, 12, CAST(N'2012-10-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (494, 235, 2, 12, CAST(N'2012-10-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (495, 236, 2, 12, CAST(N'2012-10-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (496, 237, 2, 12, CAST(N'2012-10-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (497, 238, 2, 12, CAST(N'2012-10-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (498, 239, 2, 12, CAST(N'2012-10-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (499, 240, 2, 12, CAST(N'2012-10-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (500, 241, 2, 12, CAST(N'2012-10-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (501, 242, 2, 12, CAST(N'2012-10-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (502, 243, 2, 12, CAST(N'2012-10-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (503, 244, 2, 12, CAST(N'2012-10-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (504, 245, 2, 12, CAST(N'2012-10-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (505, 246, 2, 12, CAST(N'2012-10-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (506, 247, 2, 12, CAST(N'2012-10-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (507, 248, 2, 12, CAST(N'2012-10-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (508, 249, 2, 12, CAST(N'2012-10-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (509, 250, 2, 12, CAST(N'2012-11-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (510, 251, 2, 12, CAST(N'2012-11-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (511, 252, 2, 12, CAST(N'2012-11-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (512, 253, 2, 12, CAST(N'2012-11-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (513, 254, 2, 12, CAST(N'2012-11-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (514, 255, 2, 12, CAST(N'2012-11-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (515, 256, 2, 12, CAST(N'2012-11-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (516, 257, 2, 12, CAST(N'2012-11-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (517, 258, 2, 12, CAST(N'2012-11-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (518, 259, 2, 12, CAST(N'2012-11-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (519, 1, 3, 24, CAST(N'2012-11-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (520, 2, 3, 24, CAST(N'2012-11-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (521, 3, 3, 24, CAST(N'2012-11-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (522, 4, 3, 24, CAST(N'2012-11-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (523, 5, 3, 24, CAST(N'2012-11-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (524, 6, 3, 24, CAST(N'2012-11-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (525, 7, 3, 24, CAST(N'2012-11-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (526, 8, 3, 24, CAST(N'2012-11-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (527, 9, 3, 24, CAST(N'2012-11-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (528, 10, 3, 24, CAST(N'2012-11-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (529, 11, 3, 24, CAST(N'2012-11-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (530, 12, 3, 24, CAST(N'2012-11-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (531, 13, 3, 24, CAST(N'2012-11-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (532, 14, 3, 24, CAST(N'2012-11-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (533, 15, 3, 24, CAST(N'2012-11-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (534, 16, 3, 24, CAST(N'2012-11-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (535, 17, 3, 24, CAST(N'2012-11-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (536, 18, 3, 24, CAST(N'2012-11-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (537, 19, 3, 24, CAST(N'2012-11-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (538, 20, 3, 24, CAST(N'2012-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (539, 21, 3, 24, CAST(N'2012-12-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (540, 22, 3, 24, CAST(N'2012-12-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (541, 23, 3, 24, CAST(N'2012-12-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (542, 24, 3, 24, CAST(N'2012-12-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (543, 25, 3, 24, CAST(N'2012-12-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (544, 26, 3, 24, CAST(N'2012-12-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (545, 27, 3, 24, CAST(N'2012-12-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (546, 28, 3, 24, CAST(N'2012-12-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (547, 29, 3, 24, CAST(N'2012-12-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (548, 30, 3, 24, CAST(N'2012-12-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (549, 31, 3, 24, CAST(N'2012-12-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (550, 32, 3, 24, CAST(N'2012-12-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (551, 33, 3, 12, CAST(N'2012-12-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (552, 34, 3, 12, CAST(N'2012-12-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (553, 35, 3, 12, CAST(N'2012-12-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (554, 36, 3, 12, CAST(N'2012-12-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (555, 37, 3, 12, CAST(N'2012-12-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (556, 38, 3, 12, CAST(N'2012-12-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (557, 39, 3, 12, CAST(N'2012-12-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (558, 40, 3, 12, CAST(N'2012-12-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (559, 41, 3, 12, CAST(N'2012-12-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (560, 42, 3, 12, CAST(N'2012-12-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (561, 43, 3, 12, CAST(N'2012-12-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (562, 44, 3, 12, CAST(N'2012-12-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (563, 45, 3, 12, CAST(N'2012-12-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (564, 46, 3, 12, CAST(N'2012-12-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (565, 47, 3, 12, CAST(N'2012-12-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (566, 48, 3, 12, CAST(N'2012-12-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (567, 49, 3, 12, CAST(N'2012-12-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (568, 50, 3, 12, CAST(N'2012-12-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (569, 51, 3, 12, CAST(N'2012-12-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (570, 52, 3, 12, CAST(N'2013-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (571, 53, 3, 12, CAST(N'2013-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (572, 54, 3, 12, CAST(N'2013-01-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (573, 55, 3, 12, CAST(N'2013-01-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (574, 56, 3, 12, CAST(N'2013-01-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (575, 57, 3, 12, CAST(N'2013-01-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (576, 58, 3, 12, CAST(N'2013-01-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (577, 59, 3, 12, CAST(N'2013-01-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (578, 60, 3, 12, CAST(N'2013-01-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (579, 61, 3, 12, CAST(N'2013-01-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (580, 62, 3, 12, CAST(N'2013-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (581, 63, 3, 12, CAST(N'2013-01-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (582, 64, 3, 12, CAST(N'2013-01-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (583, 65, 3, 12, CAST(N'2013-01-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (584, 66, 3, 12, CAST(N'2013-01-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (585, 67, 3, 12, CAST(N'2013-01-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (586, 68, 3, 12, CAST(N'2013-01-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (587, 69, 3, 12, CAST(N'2013-01-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (588, 70, 3, 12, CAST(N'2013-01-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (589, 71, 3, 12, CAST(N'2013-01-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (590, 72, 3, 12, CAST(N'2013-01-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (591, 73, 3, 12, CAST(N'2013-01-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (592, 74, 3, 12, CAST(N'2013-01-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (593, 75, 3, 12, CAST(N'2013-01-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (594, 76, 3, 12, CAST(N'2013-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (595, 77, 3, 12, CAST(N'2013-01-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (596, 78, 3, 12, CAST(N'2013-01-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (597, 79, 3, 12, CAST(N'2013-01-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (598, 80, 3, 12, CAST(N'2013-01-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (599, 81, 3, 12, CAST(N'2013-01-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (600, 82, 3, 12, CAST(N'2013-01-31 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (601, 83, 3, 12, CAST(N'2013-02-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (602, 84, 3, 12, CAST(N'2013-02-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (603, 85, 3, 12, CAST(N'2013-02-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (604, 86, 3, 12, CAST(N'2013-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (605, 87, 3, 12, CAST(N'2013-02-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (606, 88, 3, 12, CAST(N'2013-02-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (607, 89, 3, 12, CAST(N'2013-02-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (608, 90, 3, 12, CAST(N'2013-02-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (609, 91, 3, 12, CAST(N'2013-02-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (610, 92, 3, 12, CAST(N'2013-02-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (611, 93, 3, 12, CAST(N'2013-02-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (612, 94, 3, 12, CAST(N'2013-02-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (613, 95, 3, 12, CAST(N'2013-02-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (614, 96, 3, 12, CAST(N'2013-02-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (615, 97, 3, 12, CAST(N'2013-02-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (616, 98, 3, 12, CAST(N'2013-02-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (617, 99, 3, 12, CAST(N'2013-02-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (618, 100, 3, 12, CAST(N'2013-02-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (619, 101, 3, 12, CAST(N'2013-02-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (620, 102, 3, 12, CAST(N'2013-02-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (621, 103, 3, 12, CAST(N'2013-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (622, 104, 3, 12, CAST(N'2013-02-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (623, 105, 3, 12, CAST(N'2013-02-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (624, 106, 3, 12, CAST(N'2013-02-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (625, 107, 3, 12, CAST(N'2013-02-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (626, 108, 3, 12, CAST(N'2013-02-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (627, 109, 3, 12, CAST(N'2013-02-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (628, 110, 3, 12, CAST(N'2013-02-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (629, 111, 3, 12, CAST(N'2013-03-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (630, 112, 3, 12, CAST(N'2013-03-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (631, 113, 3, 12, CAST(N'2013-03-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (632, 114, 3, 12, CAST(N'2013-03-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (633, 115, 3, 12, CAST(N'2013-03-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (634, 116, 3, 12, CAST(N'2013-03-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (635, 117, 3, 12, CAST(N'2013-03-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (636, 118, 3, 12, CAST(N'2013-03-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (637, 119, 3, 12, CAST(N'2013-03-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (638, 120, 3, 12, CAST(N'2013-03-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (639, 121, 3, 12, CAST(N'2013-03-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (640, 122, 3, 12, CAST(N'2013-03-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (641, 123, 3, 12, CAST(N'2013-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (642, 124, 3, 12, CAST(N'2013-03-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (643, 125, 3, 12, CAST(N'2013-03-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (644, 126, 3, 12, CAST(N'2013-03-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (645, 127, 3, 12, CAST(N'2013-03-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (646, 128, 3, 12, CAST(N'2013-03-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (647, 129, 3, 12, CAST(N'2013-03-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (648, 130, 3, 12, CAST(N'2013-03-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (649, 131, 3, 12, CAST(N'2013-03-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (650, 132, 3, 12, CAST(N'2013-03-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (651, 133, 3, 12, CAST(N'2013-03-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (652, 134, 3, 12, CAST(N'2013-03-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (653, 135, 3, 12, CAST(N'2013-03-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (654, 136, 3, 12, CAST(N'2013-03-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (655, 137, 3, 12, CAST(N'2013-03-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (656, 138, 3, 12, CAST(N'2013-03-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (657, 139, 3, 12, CAST(N'2013-03-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (658, 140, 3, 12, CAST(N'2013-03-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (659, 141, 3, 12, CAST(N'2013-03-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (660, 142, 3, 12, CAST(N'2013-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (661, 143, 3, 12, CAST(N'2013-04-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (662, 144, 3, 12, CAST(N'2013-04-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (663, 145, 3, 12, CAST(N'2013-04-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (664, 146, 3, 12, CAST(N'2013-04-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (665, 147, 3, 12, CAST(N'2013-04-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (666, 148, 3, 12, CAST(N'2013-04-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (667, 149, 3, 12, CAST(N'2013-04-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (668, 150, 3, 12, CAST(N'2013-04-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (669, 151, 3, 12, CAST(N'2013-04-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (670, 152, 3, 12, CAST(N'2013-04-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (671, 153, 3, 12, CAST(N'2013-04-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (672, 154, 3, 12, CAST(N'2013-04-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (673, 155, 3, 12, CAST(N'2013-04-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (674, 156, 3, 12, CAST(N'2013-04-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (675, 157, 3, 12, CAST(N'2013-04-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (676, 158, 3, 12, CAST(N'2013-04-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (677, 159, 3, 12, CAST(N'2013-04-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (678, 160, 3, 12, CAST(N'2013-04-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (679, 161, 3, 12, CAST(N'2013-04-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (680, 162, 3, 12, CAST(N'2013-04-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (681, 163, 3, 12, CAST(N'2013-04-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (682, 164, 3, 12, CAST(N'2013-04-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (683, 165, 3, 12, CAST(N'2013-04-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (684, 166, 3, 12, CAST(N'2013-04-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (685, 167, 3, 12, CAST(N'2013-04-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (686, 168, 3, 12, CAST(N'2013-04-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (687, 169, 3, 12, CAST(N'2013-04-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (688, 170, 3, 12, CAST(N'2013-04-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (689, 171, 3, 12, CAST(N'2013-04-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (690, 172, 3, 12, CAST(N'2013-05-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (691, 173, 3, 12, CAST(N'2013-05-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (692, 174, 3, 12, CAST(N'2013-05-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (693, 175, 3, 12, CAST(N'2013-05-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (694, 176, 3, 12, CAST(N'2013-05-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (695, 177, 3, 12, CAST(N'2013-05-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (696, 178, 3, 12, CAST(N'2013-05-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (697, 179, 3, 12, CAST(N'2013-05-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (698, 180, 3, 12, CAST(N'2013-05-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (699, 181, 3, 12, CAST(N'2013-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (700, 182, 3, 12, CAST(N'2013-05-11 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (701, 183, 3, 12, CAST(N'2013-05-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (702, 184, 3, 12, CAST(N'2013-05-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (703, 185, 3, 12, CAST(N'2013-05-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (704, 186, 3, 12, CAST(N'2013-05-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (705, 187, 3, 12, CAST(N'2013-05-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (706, 188, 3, 12, CAST(N'2013-05-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (707, 189, 3, 12, CAST(N'2013-05-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (708, 190, 3, 12, CAST(N'2013-05-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (709, 191, 3, 12, CAST(N'2013-05-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (710, 192, 3, 12, CAST(N'2013-05-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (711, 193, 3, 12, CAST(N'2013-05-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (712, 194, 3, 12, CAST(N'2013-05-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (713, 195, 3, 12, CAST(N'2013-05-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (714, 196, 3, 12, CAST(N'2013-05-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (715, 197, 3, 12, CAST(N'2013-05-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (716, 198, 3, 12, CAST(N'2013-05-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (717, 199, 3, 12, CAST(N'2013-05-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (718, 200, 3, 12, CAST(N'2013-05-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (719, 201, 3, 12, CAST(N'2013-05-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (720, 202, 3, 12, CAST(N'2013-05-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (721, 203, 3, 12, CAST(N'2013-06-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (722, 204, 3, 12, CAST(N'2013-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (723, 205, 3, 12, CAST(N'2013-06-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (724, 206, 3, 12, CAST(N'2013-06-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (725, 207, 3, 12, CAST(N'2013-06-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (726, 208, 3, 12, CAST(N'2013-06-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (727, 209, 3, 12, CAST(N'2013-06-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (728, 210, 3, 12, CAST(N'2013-06-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (729, 211, 3, 12, CAST(N'2013-06-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (730, 212, 3, 12, CAST(N'2013-06-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (731, 213, 3, 12, CAST(N'2013-06-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (732, 214, 3, 12, CAST(N'2013-06-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (733, 215, 3, 12, CAST(N'2013-06-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (734, 216, 3, 12, CAST(N'2013-06-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (735, 217, 3, 12, CAST(N'2013-06-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (736, 218, 3, 12, CAST(N'2013-06-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (737, 219, 3, 12, CAST(N'2013-06-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (738, 220, 3, 12, CAST(N'2013-06-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (739, 221, 3, 12, CAST(N'2013-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (740, 222, 3, 12, CAST(N'2013-06-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (741, 223, 3, 12, CAST(N'2013-06-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (742, 224, 3, 12, CAST(N'2013-06-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (743, 225, 3, 12, CAST(N'2013-06-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (744, 226, 3, 12, CAST(N'2013-06-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (745, 227, 3, 12, CAST(N'2013-06-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (746, 228, 3, 12, CAST(N'2013-06-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (747, 229, 3, 12, CAST(N'2013-06-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (748, 230, 3, 12, CAST(N'2013-06-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (749, 231, 3, 12, CAST(N'2013-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (750, 232, 3, 12, CAST(N'2013-06-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (751, 233, 3, 12, CAST(N'2013-07-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (752, 234, 3, 12, CAST(N'2013-07-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (753, 235, 3, 12, CAST(N'2013-07-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (754, 236, 3, 12, CAST(N'2013-07-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (755, 237, 3, 12, CAST(N'2013-07-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (756, 238, 3, 12, CAST(N'2013-07-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (757, 239, 3, 12, CAST(N'2013-07-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (758, 240, 3, 12, CAST(N'2013-07-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (759, 241, 3, 12, CAST(N'2013-07-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (760, 242, 3, 12, CAST(N'2013-07-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (761, 243, 3, 12, CAST(N'2013-07-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (762, 244, 3, 12, CAST(N'2013-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (763, 245, 3, 12, CAST(N'2013-07-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (764, 246, 3, 12, CAST(N'2013-07-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (765, 247, 3, 12, CAST(N'2013-07-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (766, 248, 3, 12, CAST(N'2013-07-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (767, 249, 3, 12, CAST(N'2013-07-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (768, 250, 3, 12, CAST(N'2013-07-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (769, 251, 3, 12, CAST(N'2013-07-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (770, 252, 3, 12, CAST(N'2013-07-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (771, 253, 3, 12, CAST(N'2013-07-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (772, 254, 3, 12, CAST(N'2013-07-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (773, 255, 3, 12, CAST(N'2013-07-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (774, 256, 3, 12, CAST(N'2013-07-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (775, 257, 3, 12, CAST(N'2013-07-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (776, 258, 3, 12, CAST(N'2013-07-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (777, 259, 3, 12, CAST(N'2013-07-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (778, 1, 4, 24, CAST(N'2013-07-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (779, 2, 4, 24, CAST(N'2013-07-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (780, 3, 4, 24, CAST(N'2013-07-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (781, 4, 4, 24, CAST(N'2013-07-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (782, 5, 4, 24, CAST(N'2013-08-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (783, 6, 4, 24, CAST(N'2013-08-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (784, 7, 4, 24, CAST(N'2013-08-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (785, 8, 4, 24, CAST(N'2013-08-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (786, 9, 4, 24, CAST(N'2013-08-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (787, 10, 4, 24, CAST(N'2013-08-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (788, 11, 4, 24, CAST(N'2013-08-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (789, 12, 4, 24, CAST(N'2013-08-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (790, 13, 4, 24, CAST(N'2013-08-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (791, 14, 4, 24, CAST(N'2013-08-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (792, 15, 4, 24, CAST(N'2013-08-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (793, 16, 4, 24, CAST(N'2013-08-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (794, 17, 4, 24, CAST(N'2013-08-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (795, 18, 4, 24, CAST(N'2013-08-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (796, 19, 4, 24, CAST(N'2013-08-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (797, 20, 4, 24, CAST(N'2013-08-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (798, 21, 4, 24, CAST(N'2013-08-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (799, 22, 4, 24, CAST(N'2013-08-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (800, 23, 4, 24, CAST(N'2013-08-19 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (801, 24, 4, 24, CAST(N'2013-08-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (802, 25, 4, 24, CAST(N'2013-08-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (803, 26, 4, 24, CAST(N'2013-08-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (804, 27, 4, 24, CAST(N'2013-08-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (805, 28, 4, 24, CAST(N'2013-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (806, 29, 4, 24, CAST(N'2013-08-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (807, 30, 4, 24, CAST(N'2013-08-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (808, 31, 4, 24, CAST(N'2013-08-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (809, 32, 4, 24, CAST(N'2013-08-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (810, 33, 4, 12, CAST(N'2013-08-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (811, 34, 4, 12, CAST(N'2013-08-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (812, 35, 4, 12, CAST(N'2013-08-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (813, 36, 4, 12, CAST(N'2013-09-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (814, 37, 4, 12, CAST(N'2013-09-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (815, 38, 4, 12, CAST(N'2013-09-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (816, 39, 4, 12, CAST(N'2013-09-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (817, 40, 4, 12, CAST(N'2013-09-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (818, 41, 4, 12, CAST(N'2013-09-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (819, 42, 4, 12, CAST(N'2013-09-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (820, 43, 4, 12, CAST(N'2013-09-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (821, 44, 4, 12, CAST(N'2013-09-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (822, 45, 4, 12, CAST(N'2013-09-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (823, 46, 4, 12, CAST(N'2013-09-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (824, 47, 4, 12, CAST(N'2013-09-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (825, 48, 4, 12, CAST(N'2013-09-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (826, 49, 4, 12, CAST(N'2013-09-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (827, 50, 4, 12, CAST(N'2013-09-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (828, 51, 4, 12, CAST(N'2013-09-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (829, 52, 4, 12, CAST(N'2013-09-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (830, 53, 4, 12, CAST(N'2013-09-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (831, 54, 4, 12, CAST(N'2013-09-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (832, 55, 4, 12, CAST(N'2013-09-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (833, 56, 4, 12, CAST(N'2013-09-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (834, 57, 4, 12, CAST(N'2013-09-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (835, 58, 4, 12, CAST(N'2013-09-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (836, 59, 4, 12, CAST(N'2013-09-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (837, 60, 4, 12, CAST(N'2013-09-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (838, 61, 4, 12, CAST(N'2013-09-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (839, 62, 4, 12, CAST(N'2013-09-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (840, 63, 4, 12, CAST(N'2013-09-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (841, 64, 4, 12, CAST(N'2013-09-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (842, 65, 4, 12, CAST(N'2013-09-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (843, 66, 4, 12, CAST(N'2013-10-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (844, 67, 4, 12, CAST(N'2013-10-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (845, 68, 4, 12, CAST(N'2013-10-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (846, 69, 4, 12, CAST(N'2013-10-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (847, 70, 4, 12, CAST(N'2013-10-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (848, 71, 4, 12, CAST(N'2013-10-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (849, 72, 4, 12, CAST(N'2013-10-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (850, 73, 4, 12, CAST(N'2013-10-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (851, 74, 4, 12, CAST(N'2013-10-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (852, 75, 4, 12, CAST(N'2013-10-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (853, 76, 4, 12, CAST(N'2013-10-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (854, 77, 4, 12, CAST(N'2013-10-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (855, 78, 4, 12, CAST(N'2013-10-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (856, 79, 4, 12, CAST(N'2013-10-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (857, 80, 4, 12, CAST(N'2013-10-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (858, 81, 4, 12, CAST(N'2013-10-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (859, 82, 4, 12, CAST(N'2013-10-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (860, 83, 4, 12, CAST(N'2013-10-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (861, 84, 4, 12, CAST(N'2013-10-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (862, 85, 4, 12, CAST(N'2013-10-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (863, 86, 4, 12, CAST(N'2013-10-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (864, 87, 4, 12, CAST(N'2013-10-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (865, 88, 4, 12, CAST(N'2013-10-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (866, 89, 4, 12, CAST(N'2013-10-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (867, 90, 4, 12, CAST(N'2013-10-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (868, 91, 4, 12, CAST(N'2013-10-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (869, 92, 4, 12, CAST(N'2013-10-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (870, 93, 4, 12, CAST(N'2013-10-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (871, 94, 4, 12, CAST(N'2013-10-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (872, 95, 4, 12, CAST(N'2013-10-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (873, 96, 4, 12, CAST(N'2013-10-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (874, 97, 4, 12, CAST(N'2013-11-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (875, 98, 4, 12, CAST(N'2013-11-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (876, 99, 4, 12, CAST(N'2013-11-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (877, 100, 4, 12, CAST(N'2013-11-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (878, 101, 4, 12, CAST(N'2013-11-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (879, 102, 4, 12, CAST(N'2013-11-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (880, 103, 4, 12, CAST(N'2013-11-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (881, 104, 4, 12, CAST(N'2013-11-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (882, 105, 4, 12, CAST(N'2013-11-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (883, 106, 4, 12, CAST(N'2013-11-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (884, 107, 4, 12, CAST(N'2013-11-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (885, 108, 4, 12, CAST(N'2013-11-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (886, 109, 4, 12, CAST(N'2013-11-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (887, 110, 4, 12, CAST(N'2013-11-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (888, 111, 4, 12, CAST(N'2013-11-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (889, 112, 4, 12, CAST(N'2013-11-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (890, 113, 4, 12, CAST(N'2013-11-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (891, 114, 4, 12, CAST(N'2013-11-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (892, 115, 4, 12, CAST(N'2013-11-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (893, 116, 4, 12, CAST(N'2013-11-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (894, 117, 4, 12, CAST(N'2013-11-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (895, 118, 4, 12, CAST(N'2013-11-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (896, 119, 4, 12, CAST(N'2013-11-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (897, 120, 4, 12, CAST(N'2013-11-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (898, 121, 4, 12, CAST(N'2013-11-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (899, 122, 4, 12, CAST(N'2013-11-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (900, 123, 4, 12, CAST(N'2013-11-27 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (901, 124, 4, 12, CAST(N'2013-11-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (902, 125, 4, 12, CAST(N'2013-11-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (903, 126, 4, 12, CAST(N'2013-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (904, 127, 4, 12, CAST(N'2013-12-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (905, 128, 4, 12, CAST(N'2013-12-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (906, 129, 4, 12, CAST(N'2013-12-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (907, 130, 4, 12, CAST(N'2013-12-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (908, 131, 4, 12, CAST(N'2013-12-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (909, 132, 4, 12, CAST(N'2013-12-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (910, 133, 4, 12, CAST(N'2013-12-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (911, 134, 4, 12, CAST(N'2013-12-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (912, 135, 4, 12, CAST(N'2013-12-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (913, 136, 4, 12, CAST(N'2013-12-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (914, 137, 4, 12, CAST(N'2013-12-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (915, 138, 4, 12, CAST(N'2013-12-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (916, 139, 4, 12, CAST(N'2013-12-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (917, 140, 4, 12, CAST(N'2013-12-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (918, 141, 4, 12, CAST(N'2013-12-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (919, 142, 4, 12, CAST(N'2013-12-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (920, 143, 4, 12, CAST(N'2013-12-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (921, 144, 4, 12, CAST(N'2013-12-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (922, 145, 4, 12, CAST(N'2013-12-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (923, 146, 4, 12, CAST(N'2013-12-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (924, 147, 4, 12, CAST(N'2013-12-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (925, 148, 4, 12, CAST(N'2013-12-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (926, 149, 4, 12, CAST(N'2013-12-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (927, 150, 4, 12, CAST(N'2013-12-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (928, 151, 4, 12, CAST(N'2013-12-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (929, 152, 4, 12, CAST(N'2013-12-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (930, 153, 4, 12, CAST(N'2013-12-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (931, 154, 4, 12, CAST(N'2013-12-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (932, 155, 4, 12, CAST(N'2013-12-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (933, 156, 4, 12, CAST(N'2013-12-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (934, 157, 4, 12, CAST(N'2013-12-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (935, 158, 4, 12, CAST(N'2014-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (936, 159, 4, 12, CAST(N'2014-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (937, 160, 4, 12, CAST(N'2014-01-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (938, 161, 4, 12, CAST(N'2014-01-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (939, 162, 4, 12, CAST(N'2014-01-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (940, 163, 4, 12, CAST(N'2014-01-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (941, 164, 4, 12, CAST(N'2014-01-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (942, 165, 4, 12, CAST(N'2014-01-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (943, 166, 4, 12, CAST(N'2014-01-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (944, 167, 4, 12, CAST(N'2014-01-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (945, 168, 4, 12, CAST(N'2014-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (946, 169, 4, 12, CAST(N'2014-01-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (947, 170, 4, 12, CAST(N'2014-01-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (948, 171, 4, 12, CAST(N'2014-01-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (949, 172, 4, 12, CAST(N'2014-01-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (950, 173, 4, 12, CAST(N'2014-01-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (951, 174, 4, 12, CAST(N'2014-01-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (952, 175, 4, 12, CAST(N'2014-01-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (953, 176, 4, 12, CAST(N'2014-01-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (954, 177, 4, 12, CAST(N'2014-01-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (955, 178, 4, 12, CAST(N'2014-01-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (956, 179, 4, 12, CAST(N'2014-01-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (957, 180, 4, 12, CAST(N'2014-01-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (958, 181, 4, 12, CAST(N'2014-01-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (959, 182, 4, 12, CAST(N'2014-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (960, 183, 4, 12, CAST(N'2014-01-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (961, 184, 4, 12, CAST(N'2014-01-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (962, 185, 4, 12, CAST(N'2014-01-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (963, 186, 4, 12, CAST(N'2014-01-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (964, 187, 4, 12, CAST(N'2014-01-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (965, 188, 4, 12, CAST(N'2014-01-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (966, 189, 4, 12, CAST(N'2014-02-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (967, 190, 4, 12, CAST(N'2014-02-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (968, 191, 4, 12, CAST(N'2014-02-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (969, 192, 4, 12, CAST(N'2014-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (970, 193, 4, 12, CAST(N'2014-02-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (971, 194, 4, 12, CAST(N'2014-02-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (972, 195, 4, 12, CAST(N'2014-02-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (973, 196, 4, 12, CAST(N'2014-02-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (974, 197, 4, 12, CAST(N'2014-02-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (975, 198, 4, 12, CAST(N'2014-02-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (976, 199, 4, 12, CAST(N'2014-02-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (977, 200, 4, 12, CAST(N'2014-02-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (978, 201, 4, 12, CAST(N'2014-02-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (979, 202, 4, 12, CAST(N'2014-02-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (980, 203, 4, 12, CAST(N'2014-02-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (981, 204, 4, 12, CAST(N'2014-02-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (982, 205, 4, 12, CAST(N'2014-02-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (983, 206, 4, 12, CAST(N'2014-02-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (984, 207, 4, 12, CAST(N'2014-02-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (985, 208, 4, 12, CAST(N'2014-02-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (986, 209, 4, 12, CAST(N'2014-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (987, 210, 4, 12, CAST(N'2014-02-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (988, 211, 4, 12, CAST(N'2014-02-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (989, 212, 4, 12, CAST(N'2014-02-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (990, 213, 4, 12, CAST(N'2014-02-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (991, 214, 4, 12, CAST(N'2014-02-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (992, 215, 4, 12, CAST(N'2014-02-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (993, 216, 4, 12, CAST(N'2014-02-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (994, 217, 4, 12, CAST(N'2014-03-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (995, 218, 4, 12, CAST(N'2014-03-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (996, 219, 4, 12, CAST(N'2014-03-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (997, 220, 4, 12, CAST(N'2014-03-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (998, 221, 4, 12, CAST(N'2014-03-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (999, 222, 4, 12, CAST(N'2014-03-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1000, 223, 4, 12, CAST(N'2014-03-07 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1001, 224, 4, 12, CAST(N'2014-03-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1002, 225, 4, 12, CAST(N'2014-03-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1003, 226, 4, 12, CAST(N'2014-03-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1004, 227, 4, 12, CAST(N'2014-03-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1005, 228, 4, 12, CAST(N'2014-03-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1006, 229, 4, 12, CAST(N'2014-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1007, 230, 4, 12, CAST(N'2014-03-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1008, 231, 4, 12, CAST(N'2014-03-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1009, 232, 4, 12, CAST(N'2014-03-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1010, 233, 4, 12, CAST(N'2014-03-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1011, 234, 4, 12, CAST(N'2014-03-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1012, 235, 4, 12, CAST(N'2014-03-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1013, 236, 4, 12, CAST(N'2014-03-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1014, 237, 4, 12, CAST(N'2014-03-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1015, 238, 4, 12, CAST(N'2014-03-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1016, 239, 4, 12, CAST(N'2014-03-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1017, 240, 4, 12, CAST(N'2014-03-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1018, 241, 4, 12, CAST(N'2014-03-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1019, 242, 4, 12, CAST(N'2014-03-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1020, 243, 4, 12, CAST(N'2014-03-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1021, 244, 4, 12, CAST(N'2014-03-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1022, 245, 4, 12, CAST(N'2014-03-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1023, 246, 4, 12, CAST(N'2014-03-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1024, 247, 4, 12, CAST(N'2014-03-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1025, 248, 4, 12, CAST(N'2014-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1026, 249, 4, 12, CAST(N'2014-04-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1027, 250, 4, 12, CAST(N'2014-04-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1028, 251, 4, 12, CAST(N'2014-04-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1029, 252, 4, 12, CAST(N'2014-04-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1030, 253, 4, 12, CAST(N'2014-04-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1031, 254, 4, 12, CAST(N'2014-04-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1032, 255, 4, 12, CAST(N'2014-04-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1033, 256, 4, 12, CAST(N'2014-04-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1034, 257, 4, 12, CAST(N'2014-04-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1035, 258, 4, 12, CAST(N'2014-04-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1036, 259, 4, 12, CAST(N'2014-04-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1037, 1, 5, 24, CAST(N'2014-04-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1038, 2, 5, 24, CAST(N'2014-04-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1039, 3, 5, 24, CAST(N'2014-04-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1040, 4, 5, 24, CAST(N'2014-04-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1041, 5, 5, 24, CAST(N'2014-04-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1042, 6, 5, 24, CAST(N'2014-04-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1043, 7, 5, 24, CAST(N'2014-04-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1044, 8, 5, 24, CAST(N'2014-04-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1045, 9, 5, 24, CAST(N'2014-04-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1046, 10, 5, 24, CAST(N'2014-04-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1047, 11, 5, 24, CAST(N'2014-04-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1048, 12, 5, 24, CAST(N'2014-04-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1049, 13, 5, 24, CAST(N'2014-04-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1050, 14, 5, 24, CAST(N'2014-04-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1051, 15, 5, 24, CAST(N'2014-04-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1052, 16, 5, 24, CAST(N'2014-04-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1053, 17, 5, 24, CAST(N'2014-04-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1054, 18, 5, 24, CAST(N'2014-04-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1055, 19, 5, 24, CAST(N'2014-05-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1056, 20, 5, 24, CAST(N'2014-05-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1057, 21, 5, 24, CAST(N'2014-05-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1058, 22, 5, 24, CAST(N'2014-05-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1059, 23, 5, 24, CAST(N'2014-05-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1060, 24, 5, 24, CAST(N'2014-05-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1061, 25, 5, 24, CAST(N'2014-05-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1062, 26, 5, 24, CAST(N'2014-05-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1063, 27, 5, 24, CAST(N'2014-05-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1064, 28, 5, 24, CAST(N'2014-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1065, 29, 5, 24, CAST(N'2014-05-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1066, 30, 5, 24, CAST(N'2014-05-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1067, 31, 5, 24, CAST(N'2014-05-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1068, 32, 5, 24, CAST(N'2014-05-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1069, 33, 5, 12, CAST(N'2014-05-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1070, 34, 5, 12, CAST(N'2014-05-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1071, 35, 5, 12, CAST(N'2014-05-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1072, 36, 5, 12, CAST(N'2014-05-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1073, 37, 5, 12, CAST(N'2014-05-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1074, 38, 5, 12, CAST(N'2014-05-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1075, 39, 5, 12, CAST(N'2014-05-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1076, 40, 5, 12, CAST(N'2014-05-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1077, 41, 5, 12, CAST(N'2014-05-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1078, 42, 5, 12, CAST(N'2014-05-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1079, 43, 5, 12, CAST(N'2014-05-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1080, 44, 5, 12, CAST(N'2014-05-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1081, 45, 5, 12, CAST(N'2014-05-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1082, 46, 5, 12, CAST(N'2014-05-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1083, 47, 5, 12, CAST(N'2014-05-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1084, 48, 5, 12, CAST(N'2014-05-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1085, 49, 5, 12, CAST(N'2014-05-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1086, 50, 5, 12, CAST(N'2014-06-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1087, 51, 5, 12, CAST(N'2014-06-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1088, 52, 5, 12, CAST(N'2014-06-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1089, 53, 5, 12, CAST(N'2014-06-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1090, 54, 5, 12, CAST(N'2014-06-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1091, 55, 5, 12, CAST(N'2014-06-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1092, 56, 5, 12, CAST(N'2014-06-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1093, 57, 5, 12, CAST(N'2014-06-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1094, 58, 5, 12, CAST(N'2014-06-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1095, 59, 5, 12, CAST(N'2014-06-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1096, 60, 5, 12, CAST(N'2014-06-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1097, 61, 5, 12, CAST(N'2014-06-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1098, 62, 5, 12, CAST(N'2014-06-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1099, 63, 5, 12, CAST(N'2014-06-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1100, 64, 5, 12, CAST(N'2014-06-15 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1101, 65, 5, 12, CAST(N'2014-06-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1102, 66, 5, 12, CAST(N'2014-06-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1103, 67, 5, 12, CAST(N'2014-06-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1104, 68, 5, 12, CAST(N'2014-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1105, 69, 5, 12, CAST(N'2014-06-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1106, 70, 5, 12, CAST(N'2014-06-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1107, 71, 5, 12, CAST(N'2014-06-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1108, 72, 5, 12, CAST(N'2014-06-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1109, 73, 5, 12, CAST(N'2014-06-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1110, 74, 5, 12, CAST(N'2014-06-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1111, 75, 5, 12, CAST(N'2014-06-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1112, 76, 5, 12, CAST(N'2014-06-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1113, 77, 5, 12, CAST(N'2014-06-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1114, 78, 5, 12, CAST(N'2014-06-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1115, 79, 5, 12, CAST(N'2014-06-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1116, 80, 5, 12, CAST(N'2014-07-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1117, 81, 5, 12, CAST(N'2014-07-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1118, 82, 5, 12, CAST(N'2014-07-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1119, 83, 5, 12, CAST(N'2014-07-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1120, 84, 5, 12, CAST(N'2014-07-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1121, 85, 5, 12, CAST(N'2014-07-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1122, 86, 5, 12, CAST(N'2014-07-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1123, 87, 5, 12, CAST(N'2014-07-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1124, 88, 5, 12, CAST(N'2014-07-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1125, 89, 5, 12, CAST(N'2014-07-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1126, 90, 5, 12, CAST(N'2014-07-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1127, 91, 5, 12, CAST(N'2014-07-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1128, 92, 5, 12, CAST(N'2014-07-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1129, 93, 5, 12, CAST(N'2014-07-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1130, 94, 5, 12, CAST(N'2014-07-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1131, 95, 5, 12, CAST(N'2014-07-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1132, 96, 5, 12, CAST(N'2014-07-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1133, 97, 5, 12, CAST(N'2014-07-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1134, 98, 5, 12, CAST(N'2014-07-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1135, 99, 5, 12, CAST(N'2014-07-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1136, 100, 5, 12, CAST(N'2014-07-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1137, 101, 5, 12, CAST(N'2014-07-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1138, 102, 5, 12, CAST(N'2014-07-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1139, 103, 5, 12, CAST(N'2014-07-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1140, 104, 5, 12, CAST(N'2014-07-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1141, 105, 5, 12, CAST(N'2014-07-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1142, 106, 5, 12, CAST(N'2014-07-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1143, 107, 5, 12, CAST(N'2014-07-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1144, 108, 5, 12, CAST(N'2014-07-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1145, 109, 5, 12, CAST(N'2014-07-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1146, 110, 5, 12, CAST(N'2014-07-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1147, 111, 5, 12, CAST(N'2014-08-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1148, 112, 5, 12, CAST(N'2014-08-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1149, 113, 5, 12, CAST(N'2014-08-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1150, 114, 5, 12, CAST(N'2014-08-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1151, 115, 5, 12, CAST(N'2014-08-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1152, 116, 5, 12, CAST(N'2014-08-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1153, 117, 5, 12, CAST(N'2014-08-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1154, 118, 5, 12, CAST(N'2014-08-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1155, 119, 5, 12, CAST(N'2014-08-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1156, 120, 5, 12, CAST(N'2014-08-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1157, 121, 5, 12, CAST(N'2014-08-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1158, 122, 5, 12, CAST(N'2014-08-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1159, 123, 5, 12, CAST(N'2014-08-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1160, 124, 5, 12, CAST(N'2014-08-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1161, 125, 5, 12, CAST(N'2014-08-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1162, 126, 5, 12, CAST(N'2014-08-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1163, 127, 5, 12, CAST(N'2014-08-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1164, 128, 5, 12, CAST(N'2014-08-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1165, 129, 5, 12, CAST(N'2014-08-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1166, 130, 5, 12, CAST(N'2014-08-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1167, 131, 5, 12, CAST(N'2014-08-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1168, 132, 5, 12, CAST(N'2014-08-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1169, 133, 5, 12, CAST(N'2014-08-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1170, 134, 5, 12, CAST(N'2014-08-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1171, 135, 5, 12, CAST(N'2014-08-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1172, 136, 5, 12, CAST(N'2014-08-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1173, 137, 5, 12, CAST(N'2014-08-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1174, 138, 5, 12, CAST(N'2014-08-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1175, 139, 5, 12, CAST(N'2014-08-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1176, 140, 5, 12, CAST(N'2014-08-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1177, 141, 5, 12, CAST(N'2014-08-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1178, 142, 5, 12, CAST(N'2014-09-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1179, 143, 5, 12, CAST(N'2014-09-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1180, 144, 5, 12, CAST(N'2014-09-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1181, 145, 5, 12, CAST(N'2014-09-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1182, 146, 5, 12, CAST(N'2014-09-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1183, 147, 5, 12, CAST(N'2014-09-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1184, 148, 5, 12, CAST(N'2014-09-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1185, 149, 5, 12, CAST(N'2014-09-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1186, 150, 5, 12, CAST(N'2014-09-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1187, 151, 5, 12, CAST(N'2014-09-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1188, 152, 5, 12, CAST(N'2014-09-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1189, 153, 5, 12, CAST(N'2014-09-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1190, 154, 5, 12, CAST(N'2014-09-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1191, 155, 5, 12, CAST(N'2014-09-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1192, 156, 5, 12, CAST(N'2014-09-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1193, 157, 5, 12, CAST(N'2014-09-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1194, 158, 5, 12, CAST(N'2014-09-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1195, 159, 5, 12, CAST(N'2014-09-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1196, 160, 5, 12, CAST(N'2014-09-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1197, 161, 5, 12, CAST(N'2014-09-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1198, 162, 5, 12, CAST(N'2014-09-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1199, 163, 5, 12, CAST(N'2014-09-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1200, 164, 5, 12, CAST(N'2014-09-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1201, 165, 5, 12, CAST(N'2014-09-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1202, 166, 5, 12, CAST(N'2014-09-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1203, 167, 5, 12, CAST(N'2014-09-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1204, 168, 5, 12, CAST(N'2014-09-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1205, 169, 5, 12, CAST(N'2014-09-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1206, 170, 5, 12, CAST(N'2014-09-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1207, 171, 5, 12, CAST(N'2014-09-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1208, 172, 5, 12, CAST(N'2014-10-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1209, 173, 5, 12, CAST(N'2014-10-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1210, 174, 5, 12, CAST(N'2014-10-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1211, 175, 5, 12, CAST(N'2014-10-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1212, 176, 5, 12, CAST(N'2014-10-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1213, 177, 5, 12, CAST(N'2014-10-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1214, 178, 5, 12, CAST(N'2014-10-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1215, 179, 5, 12, CAST(N'2014-10-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1216, 180, 5, 12, CAST(N'2014-10-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1217, 181, 5, 12, CAST(N'2014-10-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1218, 182, 5, 12, CAST(N'2014-10-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1219, 183, 5, 12, CAST(N'2014-10-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1220, 184, 5, 12, CAST(N'2014-10-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1221, 185, 5, 12, CAST(N'2014-10-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1222, 186, 5, 12, CAST(N'2014-10-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1223, 187, 5, 12, CAST(N'2014-10-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1224, 188, 5, 12, CAST(N'2014-10-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1225, 189, 5, 12, CAST(N'2014-10-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1226, 190, 5, 12, CAST(N'2014-10-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1227, 191, 5, 12, CAST(N'2014-10-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1228, 192, 5, 12, CAST(N'2014-10-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1229, 193, 5, 12, CAST(N'2014-10-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1230, 194, 5, 12, CAST(N'2014-10-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1231, 195, 5, 12, CAST(N'2014-10-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1232, 196, 5, 12, CAST(N'2014-10-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1233, 197, 5, 12, CAST(N'2014-10-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1234, 198, 5, 12, CAST(N'2014-10-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1235, 199, 5, 12, CAST(N'2014-10-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1236, 200, 5, 12, CAST(N'2014-10-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1237, 201, 5, 12, CAST(N'2014-10-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1238, 202, 5, 12, CAST(N'2014-10-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1239, 203, 5, 12, CAST(N'2014-11-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1240, 204, 5, 12, CAST(N'2014-11-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1241, 205, 5, 12, CAST(N'2014-11-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1242, 206, 5, 12, CAST(N'2014-11-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1243, 207, 5, 12, CAST(N'2014-11-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1244, 208, 5, 12, CAST(N'2014-11-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1245, 209, 5, 12, CAST(N'2014-11-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1246, 210, 5, 12, CAST(N'2014-11-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1247, 211, 5, 12, CAST(N'2014-11-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1248, 212, 5, 12, CAST(N'2014-11-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1249, 213, 5, 12, CAST(N'2014-11-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1250, 214, 5, 12, CAST(N'2014-11-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1251, 215, 5, 12, CAST(N'2014-11-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1252, 216, 5, 12, CAST(N'2014-11-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1253, 217, 5, 12, CAST(N'2014-11-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1254, 218, 5, 12, CAST(N'2014-11-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1255, 219, 5, 12, CAST(N'2014-11-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1256, 220, 5, 12, CAST(N'2014-11-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1257, 221, 5, 12, CAST(N'2014-11-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1258, 222, 5, 12, CAST(N'2014-11-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1259, 223, 5, 12, CAST(N'2014-11-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1260, 224, 5, 12, CAST(N'2014-11-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1261, 225, 5, 12, CAST(N'2014-11-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1262, 226, 5, 12, CAST(N'2014-11-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1263, 227, 5, 12, CAST(N'2014-11-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1264, 228, 5, 12, CAST(N'2014-11-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1265, 229, 5, 12, CAST(N'2014-11-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1266, 230, 5, 12, CAST(N'2014-11-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1267, 231, 5, 12, CAST(N'2014-11-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1268, 232, 5, 12, CAST(N'2014-11-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1269, 233, 5, 12, CAST(N'2014-12-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1270, 234, 5, 12, CAST(N'2014-12-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1271, 235, 5, 12, CAST(N'2014-12-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1272, 236, 5, 12, CAST(N'2014-12-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1273, 237, 5, 12, CAST(N'2014-12-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1274, 238, 5, 12, CAST(N'2014-12-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1275, 239, 5, 12, CAST(N'2014-12-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1276, 240, 5, 12, CAST(N'2014-12-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1277, 241, 5, 12, CAST(N'2014-12-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1278, 242, 5, 12, CAST(N'2014-12-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1279, 243, 5, 12, CAST(N'2014-12-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1280, 244, 5, 12, CAST(N'2014-12-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1281, 245, 5, 12, CAST(N'2014-12-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1282, 246, 5, 12, CAST(N'2014-12-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1283, 247, 5, 12, CAST(N'2014-12-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1284, 248, 5, 12, CAST(N'2014-12-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1285, 249, 5, 12, CAST(N'2014-12-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1286, 250, 5, 12, CAST(N'2014-12-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1287, 251, 5, 12, CAST(N'2014-12-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1288, 252, 5, 12, CAST(N'2014-12-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1289, 253, 5, 12, CAST(N'2014-12-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1290, 254, 5, 12, CAST(N'2014-12-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1291, 255, 5, 12, CAST(N'2014-12-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1292, 256, 5, 12, CAST(N'2014-12-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1293, 257, 5, 12, CAST(N'2014-12-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1294, 258, 5, 12, CAST(N'2014-12-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1295, 259, 5, 12, CAST(N'2014-12-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1296, 1, 6, 24, CAST(N'2014-12-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1297, 2, 6, 24, CAST(N'2014-12-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1298, 3, 6, 24, CAST(N'2014-12-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1299, 4, 6, 24, CAST(N'2014-12-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1300, 5, 6, 24, CAST(N'2015-01-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1301, 6, 6, 24, CAST(N'2015-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1302, 7, 6, 24, CAST(N'2015-01-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1303, 8, 6, 24, CAST(N'2015-01-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1304, 9, 6, 24, CAST(N'2015-01-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1305, 10, 6, 24, CAST(N'2015-01-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1306, 11, 6, 24, CAST(N'2015-01-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1307, 12, 6, 24, CAST(N'2015-01-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1308, 13, 6, 24, CAST(N'2015-01-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1309, 14, 6, 24, CAST(N'2015-01-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1310, 15, 6, 24, CAST(N'2015-01-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1311, 16, 6, 24, CAST(N'2015-01-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1312, 17, 6, 24, CAST(N'2015-01-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1313, 18, 6, 24, CAST(N'2015-01-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1314, 19, 6, 24, CAST(N'2015-01-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1315, 20, 6, 24, CAST(N'2015-01-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1316, 21, 6, 24, CAST(N'2015-01-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1317, 22, 6, 24, CAST(N'2015-01-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1318, 23, 6, 24, CAST(N'2015-01-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1319, 24, 6, 24, CAST(N'2015-01-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1320, 25, 6, 24, CAST(N'2015-01-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1321, 26, 6, 24, CAST(N'2015-01-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1322, 27, 6, 24, CAST(N'2015-01-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1323, 28, 6, 24, CAST(N'2015-01-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1324, 29, 6, 24, CAST(N'2015-01-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1325, 30, 6, 24, CAST(N'2015-01-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1326, 31, 6, 24, CAST(N'2015-01-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1327, 32, 6, 24, CAST(N'2015-01-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1328, 1, 7, 24, CAST(N'2015-01-29 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1329, 2, 7, 24, CAST(N'2015-01-30 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1330, 3, 7, 24, CAST(N'2015-01-31 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1331, 4, 7, 24, CAST(N'2015-02-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1332, 5, 7, 24, CAST(N'2015-02-02 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1333, 6, 7, 24, CAST(N'2015-02-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1334, 7, 7, 24, CAST(N'2015-02-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1335, 8, 7, 24, CAST(N'2015-02-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1336, 9, 7, 24, CAST(N'2015-02-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1337, 10, 7, 24, CAST(N'2015-02-07 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1338, 11, 7, 24, CAST(N'2015-02-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1339, 12, 7, 24, CAST(N'2015-02-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1340, 13, 7, 24, CAST(N'2015-02-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1341, 14, 7, 24, CAST(N'2015-02-11 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1342, 15, 7, 24, CAST(N'2015-02-12 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1343, 16, 7, 24, CAST(N'2015-02-13 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1344, 17, 7, 24, CAST(N'2015-02-14 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1345, 18, 7, 24, CAST(N'2015-02-15 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1346, 19, 7, 24, CAST(N'2015-02-16 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1347, 20, 7, 24, CAST(N'2015-02-17 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1348, 21, 7, 24, CAST(N'2015-02-18 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1349, 22, 7, 24, CAST(N'2015-02-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1350, 23, 7, 24, CAST(N'2015-02-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1351, 24, 7, 24, CAST(N'2015-02-21 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1352, 25, 7, 24, CAST(N'2015-02-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1353, 26, 7, 24, CAST(N'2015-02-23 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1354, 27, 7, 24, CAST(N'2015-02-24 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1355, 28, 7, 24, CAST(N'2015-02-25 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1356, 29, 7, 24, CAST(N'2015-02-26 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1357, 30, 7, 24, CAST(N'2015-02-27 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1358, 31, 7, 24, CAST(N'2015-02-28 00:00:00.000' AS DateTime))
INSERT [dbo].[tblHorarioCentroSalud] ([idHorario], [idCentroSalud], [idDia], [idHora], [fecReg]) VALUES (1359, 32, 7, 24, CAST(N'2015-03-01 00:00:00.000' AS DateTime))
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
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (1, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ', CAST(N'2015-03-08 08:57:43.153' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (2, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ', CAST(N'2015-03-08 08:57:43.237' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (3, N'          ', N'          ', N'          ', N'          ', N'          ', N'          ', CAST(N'2015-03-08 08:58:31.970' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (4, N'Luis Alberto', N'De la Rosa', N'Muñoz', N'M', N'1976-01-05', N'dasdsaaadsadsadas', CAST(N'2015-03-08 09:00:43.190' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (5, N'', N'', N'', N'', N'', N'', CAST(N'2015-03-08 09:00:43.203' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (6, N'Luis Alberto', N'De la Rosa', N'Muñoz', N'M', N'1976-01-05', N'dasdsaaadsadsadas', CAST(N'2015-03-08 09:01:06.660' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (7, N'', N'', N'', N'', N'', N'', CAST(N'2015-03-08 09:01:06.677' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (8, N'Luis Alberto', N'De la Rosa', N'Muñoz', N'M', N'1976-01-05', N'dasdsaaadsadsadas', CAST(N'2015-03-08 09:02:41.460' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (9, N'', N'', N'', N'', N'', N'', CAST(N'2015-03-08 09:02:41.523' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (10, N'Lui', N'sa', N'sadsa', N'M', N'1840-01-28', N'dsadsadsa', CAST(N'2015-03-08 09:22:49.550' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (11, N'', N'', N'', N'', N'', N'', CAST(N'2015-03-08 09:22:49.563' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (12, N'yy', N'uyiu', N'yuiy', N'M', N'2015-10-29', N'agcde', CAST(N'2015-03-08 10:01:48.237' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (13, N'ssfsd', N'kjkjklj', N'jkllkj', N'M', N'2015-03-10', N'fsdfsd', CAST(N'2015-03-08 10:01:48.250' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (14, N'yy', N'uyiu', N'yuiy', N'M', N'2015-10-29', N'agcde', CAST(N'2015-03-08 10:03:17.763' AS DateTime))
INSERT [dbo].[tblPersona] ([idPersona], [Nombre], [Paterno], [Materno], [Genero], [FecNac], [Curp], [FecReg]) VALUES (15, N'ssfsd', N'kjkjklj', N'jkllkj', N'M', N'2015-03-10', N'fsdfsd', CAST(N'2015-03-08 10:03:17.767' AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (1, NULL, N'Gineco Obsetetricia', N'Mujeres embarazadas y Mujeres con padecimientos del sistema reproductor', CAST(N'2015-02-09 00:00:00.000' AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (2, NULL, N'Oncologia Ginecologia', N'Mujeres con padecimiento maligno del aparato reproductor femenino', CAST(N'2015-03-08 00:00:00.000' AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (3, NULL, N'Clinica De La Mujer', N'Atenciòn integral a la mujer.', CAST(N'2015-03-08 01:48:33.870' AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (4, NULL, N'Colposcopia', N'Pacientes con patología cérvico vaginal sospechosa de malignidad

Se utiliza formato de "Referencia y/o Contrarreferencia" requisitado unicamente 

por médico tratante.', CAST(N'2015-03-08 01:49:07.210' AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (5, NULL, N'Clinica de Displasia', N'Pacientes con patología cérvico vaginal sospechosa de malignidad

Solicitud por el médico tratante de 2o nivel de atención, sujeto a la valoración del 

médico especialista', CAST(N'2015-03-08 01:49:40.697' AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (6, NULL, N'Ile', N'Mujeres embarazadas con periodo de gestación NO mayor a 12 semanas

Interrupción legal del embarazo hasta las 12 semanas de gestación en forma 

segura.

INE (credencial para votar) comprobante de domicilio y si es menor de edad 

acompañado de un adulto y comprobante de escuela.

El servicio se brinda inmediatamente con un proceso médico.', CAST(N'2015-03-08 01:50:10.573' AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (7, NULL, N'Mastrografia', N'MASTOGRAFÍA

Mujeres y hombres con factores de riesgo y/o sospecha de patología mamaria', CAST(N'2015-03-08 01:50:42.307' AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (8, NULL, N'CÁNCER DE PRÓSTATA', N'Población masculina mayor de 40 años.

Unidades de salud de detección oportuna en 12 estaciones del Metro y 2 en la 

Central de Abastos, Medibuses y Centros de Salud.', CAST(N'2015-03-08 01:51:21.877' AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (9, NULL, N'OBESIDAD', N'Población en general. Prevención y control de sobrepeso y obesidad.

Adopción de una alimentación sana. Gimnasios urbanos fomentan la actividad 

física en la vida cotidiana.', CAST(N'2015-03-08 01:52:10.537' AS DateTime))
INSERT [dbo].[tblServicio] ([idServicio], [idNivelAtencion], [Servicio], [Descripcion], [FecReg]) VALUES (10, NULL, N'ENFERMEDADES CRÓNICO DEGENERATIVAS', N'Población que reside en el Distrito Federal 

Disminuir la morbilidad y mortalidad por enfermedades crónicas servicios óptimos 

en la detección, diagnóstico y tratamiento oportunos y control del padecimiento, 

participación responsable de la población en el autocuidado de su salud.', CAST(N'2015-03-08 01:52:39.330' AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (1, 1, 1, CAST(N'2015-03-08 08:57:43.163' AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (2, 2, 1, CAST(N'2015-03-08 08:57:43.240' AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (3, 3, 3, CAST(N'2015-03-08 08:58:31.970' AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (4, 5, 4, CAST(N'2015-03-08 09:00:43.203' AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (5, 7, 6, CAST(N'2015-03-08 09:01:06.730' AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (6, 9, 8, CAST(N'2015-03-08 09:02:41.533' AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (7, 11, 10, CAST(N'2015-03-08 09:22:49.563' AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (8, 13, 12, CAST(N'2015-03-08 10:01:48.250' AS DateTime))
INSERT [dbo].[tblTutor] ([idTutor], [idPersonaTutor], [idPersona], [fecRecg]) VALUES (9, 15, 14, CAST(N'2015-03-08 10:03:17.767' AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (1, NULL, N'test', N'123', CAST(N'2015-03-07 10:15:36.063' AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (2, NULL, N'Luis', N'123', CAST(N'2015-03-08 08:57:42.927' AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (3, NULL, N'Luis', N'123', CAST(N'2015-03-08 08:58:31.967' AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (4, NULL, N'Luis', N'123', CAST(N'2015-03-08 09:00:43.183' AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (5, NULL, N'Luis', N'1234', CAST(N'2015-03-08 09:01:06.617' AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (6, NULL, N'Luis', N'12345', CAST(N'2015-03-08 09:02:41.450' AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (7, NULL, N'dasds', N'dsad', CAST(N'2015-03-08 09:22:49.533' AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (8, NULL, N'dddd', N'1234', CAST(N'2015-03-08 10:01:48.217' AS DateTime))
INSERT [dbo].[tblUsuario] ([idUsuario], [idPersona], [usuario], [contrasenia], [FecReg]) VALUES (9, NULL, N'dddd', N'', CAST(N'2015-03-08 10:03:17.763' AS DateTime))
ALTER TABLE [dbo].[relMedicoCentroServicio] ADD  CONSTRAINT [DF_relMedicoCentroServicio_fecReg]  DEFAULT (getdate()) FOR [fecReg]
GO
ALTER TABLE [dbo].[tblCita] ADD  CONSTRAINT [DF_tblCita_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
ALTER TABLE [dbo].[tblDatosContacto] ADD  CONSTRAINT [DF_tblDatosContacto_fecReg]  DEFAULT (getdate()) FOR [fecReg]
GO
ALTER TABLE [dbo].[tblDireccion] ADD  CONSTRAINT [DF_tblDireccion_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
ALTER TABLE [dbo].[tblMedico] ADD  CONSTRAINT [DF_tblMedico_FecReg]  DEFAULT (getdate()) FOR [FecReg]
GO
USE [master]
GO
ALTER DATABASE [SALUD-CDMX] SET  READ_WRITE 
GO
