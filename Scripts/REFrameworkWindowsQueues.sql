-- Crear tabla RWQ_Transacciones , RWQ_Traza
USE UipathTransacctions

DROP TYPE RWQ_TblTransac;

CREATE TYPE [dbo].[RWQ_TblTransac] AS TABLE(
	[IdTransaccion] [int] NOT NULL,
	[IdRegistro] [varchar](20) NULL,
	[FechaRegistro] [varchar](20) NULL,
	[FechaIniProc] [varchar](20) NULL,
	[FechaIniEjec] [varchar](20) NULL,
	[FechaFinProc] [varchar] (20) NULL,
	[IdEjecucion] [varchar](14) NULL,
	[TiempoEjecucion] [varchar](12) NULL,
	[TiempoProcesamiento] [varchar](12) NULL,
	[Excepcion] [varchar](5) NULL,
	[Etapa] [varchar] (20) NULL,
	[Estado] [varchar](20) NULL,
	[Observacion] [varchar](100) NULL,
	[Maquina] [varchar](20) NULL,
	[Usuario] [varchar](20) NULL, 
	[Intento] [int] NULL
);
GO

DROP TABLE RWQ_Transacciones;

CREATE TABLE [dbo].[RWQ_Transacciones](
	[IdTransaccion] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[IdRegistro] [varchar](20) NULL,
	[FechaRegistro] [varchar](20) NULL DEFAULT convert(varchar(20), getdate(), 20),
	[FechaIniProc] [varchar](20) NULL,
	[FechaIniEjec] [varchar](20) NULL,
	[FechaFinProc] [varchar] (20) NULL,
	[IdEjecucion] [varchar](14) NULL,
	[TiempoEjecucion] [varchar](12) NULL,
	[TiempoProcesamiento] [varchar](12) NULL,
	[Excepcion] [varchar](5) NULL,
	[Etapa] [varchar] (20) NULL,
	[Estado] [varchar](20) NULL,
	[Observacion] [varchar](100) NULL,
	[Maquina] [varchar](20) NULL,
	[Usuario] [varchar](20) NULL,
	[Intento] [int] NULL DEFAULT 0
);
GO

DROP TABLE RWQ_Traza

CREATE TABLE [dbo].[RWQ_Traza](
	[IdTransaccion] [int] NOT NULL,
	[IdRegistro] [varchar](20) NULL,
	[FechaRegistro] [varchar](20) NULL,
	[FechaIniProc] [varchar](20) NULL,
	[FechaIniEjec] [varchar](20) NULL,
	[FechaFinProc] [varchar] (20) NULL,
	[IdEjecucion] [varchar](14) NULL,
	[TiempoEjecucion] [varchar](12) NULL,
	[TiempoProcesamiento] [varchar](12) NULL,
	[Excepcion] [varchar](5) NULL,
	[Etapa] [varchar] (20) NULL,
	[Estado] [varchar](20) NULL,
	[Observacion] [varchar](100) NULL,
	[Maquina] [varchar](20) NULL,
	[Usuario] [varchar](20) NULL,
	[Intento] [int] NULL
);
GO


-- Procedimiento para obtener la cabecera de tabla
CREATE PROCEDURE [dbo].RWQ_SpSelCabecera 
AS
BEGIN
SELECT TOP 0 * FROM RWQ_Transacciones
;
END
GO
 
-- Procedimiento para obtener data a procesar
CREATE PROCEDURE [dbo].RWQ_SpSelTrama
@IdEjecucion as varchar(14)
AS
BEGIN
SELECT IdTransaccion FROM RWQ_Transacciones
WHERE IdEjecucion = @IdEjecucion
;
END
GO

-- Procedimiento para obtener una transaccion segun id
CREATE PROCEDURE [dbo].RWQ_SpSelTransacById
@IdTransaccion as int
AS
BEGIN
SELECT * FROM RWQ_Transacciones
WHERE IdTransaccion = @IdTransaccion
;
END
GO

-- Procedimiento para actualizar registro
CREATE PROCEDURE [dbo].RWQ_SpUpdTransacById
@TablaInput RWQ_TblTransac READONLY
AS
BEGIN
UPDATE RWQ_Transacciones
SET 
	FechaIniProc = T.FechaIniProc,
	FechaIniEjec = T.FechaIniEjec,
	FechaFinProc = T.FechaFinProc,
	TiempoEjecucion = T.TiempoEjecucion,
	TiempoProcesamiento = T.TiempoProcesamiento,
	Excepcion = T.Excepcion,
	Etapa = T.Etapa,
	Estado = T.Estado,
	Observacion = T.Observacion,
	Maquina = T.Maquina,
	Usuario = T.Usuario,
	Intento =T.Intento

FROM RWQ_Transacciones INNER JOIN @TablaInput AS T
ON RWQ_Transacciones.IdTransaccion = T.IdTransaccion
;
END
GO

-- Procedimiento para seleccionar reporte ejecucion
CREATE PROCEDURE [dbo].RWQ_SpSelReporte
@IdEjecucion as varchar(14)
AS
BEGIN
SELECT * FROM RWQ_Transacciones
WHERE IdEjecucion = @IdEjecucion
;
END
GO
