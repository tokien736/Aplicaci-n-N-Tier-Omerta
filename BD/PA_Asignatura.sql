USE BDAcademico
GO

-- Procedimiento almacenado para crear asignatura
IF OBJECT_ID('sp_InsertarAsignatura') IS NOT NULL
    DROP PROCEDURE sp_InsertarAsignatura
GO

CREATE PROCEDURE sp_InsertarAsignatura
    @CodAsignatura CHAR(3),
    @Nombre VARCHAR(50),
    @CodRequisito CHAR(3)
AS
BEGIN
    INSERT INTO TAsignatura (CodAsignatura, Nombre, CodRequisito)
    VALUES (@CodAsignatura, @Nombre, @CodRequisito)
    SELECT 'Asignatura insertada correctamente' AS Mensaje, 0 AS CodError
END
GO

-- Procedimiento almacenado para leer asignatura
IF OBJECT_ID('sp_ListarAsignatura') IS NOT NULL
    DROP PROCEDURE sp_ListarAsignatura
GO

CREATE PROCEDURE sp_ListarAsignatura
AS
BEGIN
    SELECT CodAsignatura, Nombre, CodRequisito
    FROM TAsignatura
END
GO

-- Procedimiento almacenado para buscar asignatura
IF OBJECT_ID('sp_BuscarAsignatura') IS NOT NULL
    DROP PROCEDURE sp_BuscarAsignatura
GO

CREATE PROCEDURE sp_BuscarAsignatura
    @Nombre VARCHAR(50)
AS
BEGIN
    SELECT CodAsignatura, Nombre, CodRequisito
    FROM TAsignatura
    WHERE Nombre LIKE '%' + @Nombre + '%'
END
GO

-- Procedimiento almacenado para obtener una asignatura por código
IF OBJECT_ID('sp_ObtenerAsignaturaPorCodigo') IS NOT NULL
    DROP PROCEDURE sp_ObtenerAsignaturaPorCodigo
GO

CREATE PROCEDURE sp_ObtenerAsignaturaPorCodigo
    @CodAsignatura CHAR(3)
AS
BEGIN
    SELECT CodAsignatura, Nombre, CodRequisito
    FROM TAsignatura
    WHERE CodAsignatura = @CodAsignatura
END
GO

-- Procedimiento almacenado para actualizar asignatura
IF OBJECT_ID('sp_ActualizarAsignatura') IS NOT NULL
    DROP PROCEDURE sp_ActualizarAsignatura
GO

CREATE PROCEDURE sp_ActualizarAsignatura
    @CodAsignatura CHAR(3),
    @NuevoNombre VARCHAR(50),
    @NuevoCodRequisito CHAR(3)
AS
BEGIN
    UPDATE TAsignatura
    SET Nombre = @NuevoNombre, CodRequisito = @NuevoCodRequisito
    WHERE CodAsignatura = @CodAsignatura
    SELECT 'Asignatura actualizada correctamente' AS Mensaje, 0 AS CodError
END
GO

-- Procedimiento almacenado para eliminar asignatura
IF OBJECT_ID('sp_EliminarAsignatura') IS NOT NULL
    DROP PROCEDURE sp_EliminarAsignatura
GO

CREATE PROCEDURE sp_EliminarAsignatura
    @CodAsignatura CHAR(3)
AS
BEGIN
    DELETE FROM TAsignatura
    WHERE CodAsignatura = @CodAsignatura
    SELECT 'Asignatura eliminada correctamente' AS Mensaje, 0 AS CodError
END
GO

-- Pruebas para los procedimientos almacenados

-- Insertar asignatura
EXEC sp_InsertarAsignatura 'S22', 'Nueva Asignatura', 'S01';

-- Listar asignaturas
EXEC sp_ListarAsignatura;

-- Buscar asignatura
EXEC sp_BuscarAsignatura 'Base de Datos';

-- Actualizar asignatura
EXEC sp_ActualizarAsignatura 'S22', 'Asignatura Actualizada', 'S02';

-- Eliminar asignatura
EXEC sp_EliminarAsignatura 'S22';

-- Obtener asignatura por código
EXEC sp_ObtenerAsignaturaPorCodigo 'S01';
