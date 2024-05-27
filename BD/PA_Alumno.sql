use BDAcademico
go


-- Procedimientos almacenados para TAlumno
if OBJECT_ID('spListarAlumno') is not null
	drop proc spListarAlumno
go
create proc spListarAlumno
as
begin
	select * from TAlumno
end
go

exec spListarAlumno
go

-- Procediimiento almacenado para agregar Alumno
if OBJECT_ID('spAgregarAlumno') is not null
	drop proc spAgregarAlumno
go
create proc spAgregarAlumno
@CodAlumno char(5),
@APaterno varchar(50),
@AMaterno varchar(50),
@Nombres varchar(50),
@CodUsuario varchar(50),
@Contrasena varchar(50),
@CodEscuela char(3)
as
begin
	-- CodAlumno no se duplique
	if not exists(select CodAlumno from TAlumno where CodAlumno = @CodAlumno)
		-- Usuario no existe en TUsuario
		if not exists(select CodUsuario from TUsuario where CodUsuario=@CodUsuario)
			-- CodCarrera debe existir en la tabla TCarrera
			if exists(select CodEscuela from TEscuela where CodEscuela = @CodEscuela)
				begin
					begin tran tranAgregar 
					begin try
						insert into TUsuario values(@CodUsuario,ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', @Contrasena))
						insert into TAlumno values(@CodAlumno,@APaterno,@AMaterno,@Nombres,@CodUsuario,@CodEscuela)
						commit tran tranAgregar
						select CodError = 0, Mensaje = 'Alumno insertado correctamente'
					end try
					begin catch
						rollback tran tranAgregar
						select CodError = 1, Mensaje = 'Error: No se ejecuto la transaccion'
					end catch
				end
			else select CodError = 1, Mensaje = 'Error: CodEscuela no existe en TEscuela'
		else select CodError = 1, Mensaje = 'Error: Usuario ya asignado en TUsuario'
	else select CodError = 1, Mensaje = 'Error: Codigo de Alumno duplicado en la TAlumno'
end
go

exec spAgregarAlumno 'A0031','Juarez','Maquera','Rosa','juarezm@gmail.com','1234','C01'
go

-- Procedimiento almacenado para eliminar un alumno
if OBJECT_ID('spEliminarAlumno') is not null
	drop proc spEliminarAlumno
go
create proc spEliminarAlumno
@CodAlumno char(5)
as
begin
	-- Verificar que el CodAlumno existe en la tabla Alumno
	if exists (select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
	begin
	    declare @CodUsuario varchar(50)
		set @CodUsuario = (select CodUsuario from TAlumno where CodAlumno = @CodAlumno)
		if exists (select CodUsuario from TUsuario where CodUsuario = @CodUsuario)
		begin
			begin tran tranEliminar
				begin try
					delete from TAlumno where CodAlumno = @CodAlumno
					delete from TUsuario where CodUsuario = @CodUsuario
					commit tran tranEliminar
					select CodError = 0, Mensaje = 'Alumno eliminado correctamente'
				end try
				begin catch
					rollback tran tranEliminar
					select CodError = 1, Mensaje = 'Error: No se ejecuto la transaccion'
				end catch
			end			
		else select CodError = 1, Mensaje = 'Error: No existe CodUsuario en la TUsuario'		
	end
	else select CodError = 1, Mensaje = 'Error: CodAlumo no existe en la TAlumno'
end
go

exec spEliminarAlumno 'A0031'
go


-- Procedimiento almacenado para actualizar informaci�n de un alumno
if OBJECT_ID('spActualizarAlumno') is not null
    drop proc spActualizarAlumno
go
create proc spActualizarAlumno
@CodAlumno char(5),
@APaterno varchar(50),
@AMaterno varchar(50),
@Nombres varchar(50),
@CodEscuela char(3)
as
begin
    if exists(select CodAlumno from TAlumno where CodAlumno = @CodAlumno)
    begin
        if exists(select CodEscuela from TEscuela where CodEscuela = @CodEscuela)
        begin
            update TAlumno 
            set APaterno = @APaterno, 
                AMaterno = @AMaterno, 
                Nombres = @Nombres, 
                CodEscuela = @CodEscuela
            where CodAlumno = @CodAlumno
            
            select CodError = 0, Mensaje = 'Alumno actualizado correctamente'
        end
        else
            select CodError = 1, Mensaje = 'Error: CodEscuela no existe en TEscuela'
    end
    else
        select CodError = 1, Mensaje = 'Error: C�digo de Alumno no existe en TAlumno'
end
go

-- Procedimiento almacenado para buscar alumnos por apellido paterno
if OBJECT_ID('spBuscarAlumnoPorApellido') is not null
    drop proc spBuscarAlumnoPorApellido
go
create proc spBuscarAlumnoPorApellido
@APaterno varchar(50)
as
begin
    select * from TAlumno where APaterno = @APaterno
end
go


if OBJECT_ID('spLogin') is not null
    drop proc spLogin
go
create proc spLogin
@CodUsuario varchar(50),
@Contrasena varchar(50)
as
begin
    declare @ContrasenaDesencriptada varchar(50)
    set @ContrasenaDesencriptada = (select CONVERT(varchar(50), DECRYPTBYPASSPHRASE('miFraseDeContrase�a', Contrasena)) 
                                    from TUsuario where CodUsuario = @CodUsuario)
                                    
    if @ContrasenaDesencriptada = @Contrasena
    begin
        if @CodUsuario = 'admin'
        begin
            select CodError = 0, Mensaje = 'Administrador'
        end
        else if exists (select CodUsuario from TDocente where CodUsuario = @CodUsuario)
        begin
            select CodError = 0, Mensaje = 'Docente'
        end
        else if exists (select CodUsuario from TAlumno where CodUsuario = @CodUsuario)
        begin
            select CodError = 0, Mensaje = 'Alumno'
        end
        else 
        begin
            select CodError = 1, Mensaje = 'Error: Usuario no tiene privilegio de docente ni alumno, consulte al administrador'
        end
    end
    else 
    begin
        select CodError = 1, Mensaje = 'Error: Usuario y/o contraseña incorrectos'
    end
end
go




exec spLogin 'cuellar@hotmail.com', '1234'
go

exec spLogin 'mnina@hotmail.com', '1234'
go

exec spLogin 'admin', '1234'
go



if OBJECT_ID('spCursosMatriculadosAlumno') is not null
    drop proc spCursosMatriculadosAlumno
go
create proc spCursosMatriculadosAlumno
@CodAlumno char(5)
as
begin
    select C.CodAsignatura, A.Nombre as Asignatura, C.Semestre
    from TNota N
    join TCarga C on N.CodAsignatura = C.CodAsignatura
    join TAsignatura A on C.CodAsignatura = A.CodAsignatura
    where N.CodAlumno = @CodAlumno
end
go


if OBJECT_ID('spNotasPorSemestreAlumno') is not null
    drop proc spNotasPorSemestreAlumno
go
create proc spNotasPorSemestreAlumno
@CodAlumno char(5),
@Semestre varchar(20)
as
begin
    select N.CodAsignatura, A.Nombre as Asignatura, N.Parcial1, N.Parcial2, N.NotaFinal
    from TNota N
    join TAsignatura A on N.CodAsignatura = A.CodAsignatura
    where N.CodAlumno = @CodAlumno and N.Semestre = @Semestre
end
go


if OBJECT_ID('spNotasPorSemestreAlumno') is not null
    drop proc spNotasPorSemestreAlumno
go
create proc spNotasPorSemestreAlumno
@CodAlumno char(5),
@Semestre varchar(20)
as
begin
    select N.CodAsignatura, A.Nombre as Asignatura, N.Parcial1, N.Parcial2, N.NotaFinal
    from TNota N
    join TAsignatura A on N.CodAsignatura = A.CodAsignatura
    where N.CodAlumno = @CodAlumno and N.Semestre = @Semestre
end
go

if OBJECT_ID('spHistorialNotasAlumno') is not null
    drop proc spHistorialNotasAlumno
go
create proc spHistorialNotasAlumno
@CodAlumno char(5)
as
begin
    select N.CodAsignatura, A.Nombre as Asignatura, N.Semestre, N.Parcial1, N.Parcial2, N.NotaFinal
    from TNota N
    join TAsignatura A on N.CodAsignatura = A.CodAsignatura
    where N.CodAlumno = @CodAlumno
    order by N.Semestre
end
go

if OBJECT_ID('spObtenerSemestresAlumno') is not null
    drop proc spObtenerSemestresAlumno
go
create proc spObtenerSemestresAlumno
@CodAlumno char(5)
as
begin
    select distinct Semestre 
    from TNota 
    where CodAlumno = @CodAlumno
    order by Semestre
end
go

if OBJECT_ID('spObtenerAlumnoPorCodigo') is not null
    drop proc spObtenerAlumnoPorCodigo
go
create proc spObtenerAlumnoPorCodigo
@CodAlumno char(5)
as
begin
    select CodAlumno, APaterno, AMaterno, Nombres, CodUsuario, CodEscuela
    from TAlumno
    where CodAlumno = @CodAlumno
end
go
if OBJECT_ID('spObtenerCodAlumnoPorUsuario') is not null
    drop proc spObtenerCodAlumnoPorUsuario
go
create proc spObtenerCodAlumnoPorUsuario
@CodUsuario varchar(50)
as
begin
    select CodAlumno
    from TAlumno
    where CodUsuario = @CodUsuario
end
go



exec spCursosMatriculadosAlumno 'A0001'
go



exec spHistorialNotasAlumno 'A0001'
go

exec spObtenerSemestresAlumno 'A0001'
go
exec spNotasPorSemestreAlumno 'A0001', '2010-I'
go
exec spObtenerAlumnoPorCodigo 'A0001';
go



-- Suponiendo que el CodUsuario 'cuellar@hotmail.com' existe en la tabla TAlumno
exec spObtenerCodAlumnoPorUsuario 'cuellar@hotmail.com'
go
