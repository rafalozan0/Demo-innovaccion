-- --------------------------------------------------------
-- Host:                         remi-server.database.windows.net
-- Versión del servidor:         Microsoft SQL Azure (RTM) - 12.0.2000.8
-- SO del servidor:              
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para Remi_database
DROP DATABASE IF EXISTS "Remi_database";
CREATE DATABASE IF NOT EXISTS "Remi_database";
USE "Remi_database";

-- Volcando estructura para procedimiento Remi_database.actInfUsuaio
DROP PROCEDURE IF EXISTS "actInfUsuaio";
DELIMITER //
CREATE PROCEDURE actInfUsuaio @idUsuario INT, @nombre varchar(50), @apPaterno varchar(50),
@apMaterno varchar(50), @contrasena varchar(50), @idArea INT, @idTipoUsuario INT,
@idTelefono INT, @username varchar(50), @telefono2 varchar(50), @ext1 varchar(50), 
@ext2 varchar(50), @telefono1 varchar(50)
AS
UPDATE [dbo].[Telefono] SET telefono2=@telefono2, ext1=@ext1,
ext2=@ext2, telefono1=@telefono1 WHERE  idTelefono=@idTelefono;

UPDATE [dbo].[usuario] SET nombre=@nombre, 
apPaterno=@apPaterno, apMaterno=@apMaterno, 
contrasena=@contrasena, idArea=@idArea, idTipoUsuario=@idTipoUsuario, 
idTelefono=@idTelefono, username=@username 
WHERE idUsuario=@idUsuario;//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.actualizarEquipo
DROP PROCEDURE IF EXISTS "actualizarEquipo";
DELIMITER //
CREATE PROCEDURE actualizarEquipo @IDEquipo INT, @NumeroSerie varchar(50), @Modelo varchar(50),
@IDNivelRiesgo INT, @IDEquipoArea INT, @claveCB varchar(50), @nombre varchar(50),
@descripcion varchar(50), @fechaExpGarantia DATE, @idStatus INT, @nivelPrioridad INT, 
@idMarca INT, @idTipo INT, @cantidad INT
AS
UPDATE [dbo].[Equipo] SET NumeroSerie=@NumeroSerie, Modelo=@Modelo, IDNivelRiesgo=@IDNivelRiesgo, IDEquipoArea=@IDEquipoArea,
claveCB=@claveCB, nombre=@nombre, descripcion=@descripcion, fechaExpGarantia=@fechaExpGarantia, idStatus=@idStatus, 
nivelPrioridad=@nivelPrioridad, idMarca=@idMarca, idTipo=@idTipo, cantidad=@cantidad WHERE IDEquipo=@IDEquipo;//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.agregarEquipo
DROP PROCEDURE IF EXISTS "agregarEquipo";
DELIMITER //
CREATE PROCEDURE agregarEquipo @NumeroSerie varchar(50), @Modelo varchar(50),
@IDNivelRiesgo INT, @IDEquipoArea INT, @claveCB varchar(50), @nombre varchar(50),
@descripcion varchar(50), @fechaExpGarantia DATE, @idStatus INT, @nivelPrioridad INT, 
@idMarca INT, @idTipo INT, @cantidad INT
AS
INSERT INTO [dbo].[Equipo] (IDEquipo, NumeroSerie, Modelo, IDNivelRiesgo, IDEquipoArea,
claveCB, nombre, descripcion, fechaExpGarantia, idStatus, nivelPrioridad, idMarca,
idTipo, cantidad) 
VALUES 
((SELECT MAX(IDEquipo)+1 from [dbo].[Equipo]), @NumeroSerie, @Modelo, @IDNivelRiesgo, @IDEquipoArea, @claveCB, @nombre, 
@descripcion, @fechaExpGarantia, @idStatus, @nivelPrioridad, @idMarca, @idTipo, @cantidad);//
DELIMITER ;

-- Volcando estructura para tabla Remi_database.Area
DROP TABLE IF EXISTS "Area";
CREATE TABLE IF NOT EXISTS "Area" (
	"IDArea" INT NOT NULL,
	"Area" VARCHAR(30) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("IDArea")
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento Remi_database.areas
DROP PROCEDURE IF EXISTS "areas";
DELIMITER //
CREATE PROCEDURE areas
AS
SELECT * FROM dbo.Area;//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.borrarUsuario
DROP PROCEDURE IF EXISTS "borrarUsuario";
DELIMITER //
CREATE PROCEDURE borrarUsuario @idUsuario INT
AS
DELETE FROM [dbo].[usuario] WHERE idUsuario=@idUsuario;//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.buscarUsuario
DROP PROCEDURE IF EXISTS "buscarUsuario";
DELIMITER //
CREATE PROCEDURE buscarUsuario @username varchar(50)
AS
SELECT nombre, apPaterno, apMaterno, 
idArea, idTipoUsuario, idTelefono FROM [dbo].[usuario]
where username=@username;//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.catalogoEdoEquipo
DROP PROCEDURE IF EXISTS "catalogoEdoEquipo";
DELIMITER //
CREATE PROCEDURE catalogoEdoEquipo
AS
SELECT * FROM [dbo].[estadoEquipo];//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.catalogoFallaEquipo
DROP PROCEDURE IF EXISTS "catalogoFallaEquipo";
DELIMITER //
CREATE PROCEDURE catalogoFallaEquipo
AS
SELECT * FROM [dbo].[tipoFalla];//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.catalogoMarcas
DROP PROCEDURE IF EXISTS "catalogoMarcas";
DELIMITER //
CREATE PROCEDURE catalogoMarcas
AS
SELECT * FROM [dbo].[Marca];//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.catalogoNivelRiesgo
DROP PROCEDURE IF EXISTS "catalogoNivelRiesgo";
DELIMITER //
CREATE PROCEDURE catalogoNivelRiesgo
AS
SELECT * FROM [dbo].[NivelRiesgo];//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.catalogotipoEquipo
DROP PROCEDURE IF EXISTS "catalogotipoEquipo";
DELIMITER //
CREATE PROCEDURE catalogotipoEquipo
AS
SELECT * FROM [dbo].[tipoEquipo];//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.catalogoTipoServicio
DROP PROCEDURE IF EXISTS "catalogoTipoServicio";
DELIMITER //
CREATE PROCEDURE catalogoTipoServicio
AS
SELECT * FROM [dbo].[tipoServicio];//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.catalogoTipoUsuario
DROP PROCEDURE IF EXISTS "catalogoTipoUsuario";
DELIMITER //
CREATE PROCEDURE catalogoTipoUsuario
AS
SELECT * FROM [dbo].[tipoUsuario];//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.catalogoUsuario
DROP PROCEDURE IF EXISTS "catalogoUsuario";
DELIMITER //
CREATE PROCEDURE catalogoUsuario
AS
SELECT nombre, apPaterno, apMaterno, 
idArea, idTipoUsuario, idTelefono FROM [dbo].[usuario];//
DELIMITER ;

-- Volcando estructura para tabla Remi_database.causaFallaMon
DROP TABLE IF EXISTS "causaFallaMon";
CREATE TABLE IF NOT EXISTS "causaFallaMon" (
	"idCausa" INT NOT NULL,
	"caida" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"malCon" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"malPaciente" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"ajusMon" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"malAcceso" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"malConsu" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"fuga" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"otro" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("idCausa")
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento Remi_database.eliminaEquipo
DROP PROCEDURE IF EXISTS "eliminaEquipo";
DELIMITER //
CREATE PROCEDURE eliminaEquipo @IDEquipo INT
AS
DELETE FROM [dbo].[Equipo] WHERE IDEquipo=@IDEquipo;//
DELIMITER ;

-- Volcando estructura para tabla Remi_database.Equipo
DROP TABLE IF EXISTS "Equipo";
CREATE TABLE IF NOT EXISTS "Equipo" (
	"IDEquipo" INT NOT NULL,
	"NumeroSerie" VARCHAR(20) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"Modelo" VARCHAR(30) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"IDNivelRiesgo" INT NOT NULL,
	"IDEquipoArea" INT NOT NULL,
	"claveCB" VARCHAR(50) NOT NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nombre" VARCHAR(50) NOT NULL DEFAULT '''''''''''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"descripcion" VARCHAR(50) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"fechaExpGarantia" DATE NULL DEFAULT NULL,
	"idStatus" INT NULL DEFAULT NULL,
	"nivelPrioridad" INT NULL DEFAULT 'NULL',
	"idMarca" INT NULL DEFAULT NULL,
	"idTipo" INT NULL DEFAULT NULL,
	"cantidad" INT NULL DEFAULT NULL,
	FOREIGN KEY INDEX "FK_Equipo_NivelRiesgo" ("IDNivelRiesgo"),
	FOREIGN KEY INDEX "FK_Equipo_Area" ("IDEquipoArea"),
	FOREIGN KEY INDEX "FK_Equipo_estadoEquipo" ("idStatus"),
	FOREIGN KEY INDEX "FK_Equipo_Marca" ("idMarca"),
	FOREIGN KEY INDEX "FK_Equipo_tipoEquipo" ("idTipo"),
	PRIMARY KEY ("IDEquipo"),
	CONSTRAINT "FK_Equipo_Marca" FOREIGN KEY ("idMarca") REFERENCES "Marca" ("idMarca") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_Equipo_tipoEquipo" FOREIGN KEY ("idTipo") REFERENCES "tipoEquipo" ("idTipo") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_Equipo_Area" FOREIGN KEY ("IDEquipoArea") REFERENCES "Area" ("IDArea") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_Equipo_NivelRiesgo" FOREIGN KEY ("IDNivelRiesgo") REFERENCES "NivelRiesgo" ("IDNivelRiego") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_Equipo_estadoEquipo" FOREIGN KEY ("idStatus") REFERENCES "estadoEquipo" ("idEstado") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.EquipoArea
DROP TABLE IF EXISTS "EquipoArea";
CREATE TABLE IF NOT EXISTS "EquipoArea" (
	"IDEquipoArea" INT NOT NULL,
	"IDAreaEquipo" INT NOT NULL,
	"Cantidad" INT NULL DEFAULT NULL,
	FOREIGN KEY INDEX "FK_EquipoArea_Area" ("IDEquipoArea"),
	FOREIGN KEY INDEX "FK_EquipoArea_Equipo" ("IDAreaEquipo"),
	CONSTRAINT "FK_EquipoArea_Area" FOREIGN KEY ("IDEquipoArea") REFERENCES "Area" ("IDArea") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_EquipoArea_Equipo" FOREIGN KEY ("IDAreaEquipo") REFERENCES "Equipo" ("IDEquipo") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento Remi_database.equipos
DROP PROCEDURE IF EXISTS "equipos";
DELIMITER //
CREATE PROCEDURE equipos
AS
SELECT nombre, NumeroSerie as ns, modelo, IDNivelRiesgo as riesgo,
IDEquipo as equipo, claveCB as CB, descripcion, fechaExpGarantia as garantia,
idStatus as stado, nivelPrioridad as NP, idMarca as marca, 
idTipo as tipo, cantidad FROM [dbo].[Equipo];//
DELIMITER ;

-- Volcando estructura para tabla Remi_database.estadoEquipo
DROP TABLE IF EXISTS "estadoEquipo";
CREATE TABLE IF NOT EXISTS "estadoEquipo" (
	"idEstado" INT NOT NULL,
	"estado" VARCHAR(50) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("idEstado")
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.FallaMon
DROP TABLE IF EXISTS "FallaMon";
CREATE TABLE IF NOT EXISTS "FallaMon" (
	"idFalla" INT NOT NULL,
	"pantalla" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"botonesPer" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"capnografia" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"nopani" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"notemp" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"bateri" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"impre" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"noecg" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"otro" VARCHAR(50) NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("idFalla")
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento Remi_database.login
DROP PROCEDURE IF EXISTS "login";
DELIMITER //
CREATE PROCEDURE login @username varchar(50), 
                       @contrasena varchar(50)
AS
select nombre, apPaterno, apMaterno, idArea, idTipoUsuario, idTelefono 
from usuario 
where username=@username and contrasena=@contrasena;//
DELIMITER ;

-- Volcando estructura para tabla Remi_database.Mantenimiento
DROP TABLE IF EXISTS "Mantenimiento";
CREATE TABLE IF NOT EXISTS "Mantenimiento" (
	"IDMantenimiento" INT NOT NULL,
	"IDTipoMantenimiento" INT NOT NULL,
	"IDEquipo" INT NOT NULL,
	"idOrdenServicioMon" INT NULL DEFAULT NULL,
	"idOrdenServicio" INT NULL DEFAULT NULL,
	"idOrdenEntrega" INT NULL DEFAULT NULL,
	PRIMARY KEY ("IDMantenimiento"),
	FOREIGN KEY INDEX "FK_Mantenimiento_tipoServicio" ("IDTipoMantenimiento"),
	FOREIGN KEY INDEX "FK_Mantenimiento_Equipo" ("IDEquipo"),
	FOREIGN KEY INDEX "FK_Mantenimiento_ordenServMon" ("idOrdenServicioMon"),
	FOREIGN KEY INDEX "FK_Mantenimiento_ordenServicio" ("idOrdenServicio"),
	FOREIGN KEY INDEX "FK_Mantenimiento_ordenEntrega" ("idOrdenEntrega"),
	CONSTRAINT "FK_Mantenimiento_ordenServicio" FOREIGN KEY ("idOrdenServicio") REFERENCES "ordenServicio" ("idOrdenServicio") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_Mantenimiento_tipoServicio" FOREIGN KEY ("IDTipoMantenimiento") REFERENCES "tipoServicio" ("idTipoServicio") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_Mantenimiento_ordenServMon" FOREIGN KEY ("idOrdenServicioMon") REFERENCES "ordenServMon" ("idOrden") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_Mantenimiento_ordenEntrega" FOREIGN KEY ("idOrdenEntrega") REFERENCES "ordenEntrega" ("idOrden") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_Mantenimiento_Equipo" FOREIGN KEY ("IDEquipo") REFERENCES "Equipo" ("IDEquipo") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.Marca
DROP TABLE IF EXISTS "Marca";
CREATE TABLE IF NOT EXISTS "Marca" (
	"idMarca" INT NOT NULL,
	"marca" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"idTelefono" INT NULL DEFAULT NULL,
	"direccion" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("idMarca"),
	FOREIGN KEY INDEX "FK_Marca_Telefono" ("idTelefono"),
	CONSTRAINT "FK_Marca_Telefono" FOREIGN KEY ("idTelefono") REFERENCES "Telefono" ("idTelefono") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento Remi_database.mostrarInsumos
DROP PROCEDURE IF EXISTS "mostrarInsumos";
DELIMITER //
CREATE PROCEDURE mostrarInsumos
as
select equipo.idEquipo, equipo.modelo, equipo.nombre, tipoEquipo.tipo as "consumible"  from [dbo].[Equipo] inner join [dbo].[tipoEquipo] on [dbo].[Equipo].idTipo=[dbo].[tipoEquipo].idTipo;//
DELIMITER ;

-- Volcando estructura para tabla Remi_database.NivelRiesgo
DROP TABLE IF EXISTS "NivelRiesgo";
CREATE TABLE IF NOT EXISTS "NivelRiesgo" (
	"IDNivelRiego" INT NOT NULL,
	"Riesgo" VARCHAR(30) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"DescripcionRiesgo" VARCHAR(30) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("IDNivelRiego")
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.ordenEntEnt
DROP TABLE IF EXISTS "ordenEntEnt";
CREATE TABLE IF NOT EXISTS "ordenEntEnt" (
	"idEnt" INT NOT NULL,
	"idEquipo" INT NULL DEFAULT NULL,
	"cantidad" INT NULL DEFAULT NULL,
	PRIMARY KEY ("idEnt"),
	FOREIGN KEY INDEX "FK_ordenEntEnt_Equipo" ("idEquipo"),
	CONSTRAINT "FK_ordenEntEnt_Equipo" FOREIGN KEY ("idEquipo") REFERENCES "Equipo" ("IDEquipo") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.ordenEntEntrega
DROP TABLE IF EXISTS "ordenEntEntrega";
CREATE TABLE IF NOT EXISTS "ordenEntEntrega" (
	"idorden" INT NULL DEFAULT NULL,
	"idEnt" INT NULL DEFAULT NULL,
	FOREIGN KEY INDEX "FK_ordenEntEntrega_ordenEntrega" ("idorden"),
	FOREIGN KEY INDEX "FK_ordenEntEntrega_ordenEntEnt" ("idEnt"),
	CONSTRAINT "FK_ordenEntEntrega_ordenEntrega" FOREIGN KEY ("idorden") REFERENCES "ordenEntrega" ("idOrden") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenEntEntrega_ordenEntEnt" FOREIGN KEY ("idEnt") REFERENCES "ordenEntEnt" ("idEnt") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.ordenEntrega
DROP TABLE IF EXISTS "ordenEntrega";
CREATE TABLE IF NOT EXISTS "ordenEntrega" (
	"idOrden" INT NOT NULL,
	"idEquipo" INT NULL DEFAULT NULL,
	"idEmpRep" INT NULL DEFAULT NULL,
	"idEmpAtn" INT NOT NULL,
	"idTipoSer" INT NOT NULL,
	"horaRep" TIME NOT NULL,
	"horaInicio" TIME NOT NULL,
	"horaTer" TIME NOT NULL,
	"observaciones" TEXT NOT NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"idEntrega" INT NOT NULL,
	PRIMARY KEY ("idOrden"),
	FOREIGN KEY INDEX "FK_ordenEntrega_Equipo" ("idEquipo"),
	FOREIGN KEY INDEX "FK_ordenEntrega_usuario" ("idEmpRep"),
	FOREIGN KEY INDEX "FK_ordenEntrega_usuario_2" ("idEmpAtn"),
	FOREIGN KEY INDEX "FK_ordenEntrega_tipoServicio" ("idTipoSer"),
	CONSTRAINT "FK_ordenEntrega_tipoServicio" FOREIGN KEY ("idTipoSer") REFERENCES "tipoServicio" ("idTipoServicio") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenEntrega_usuario" FOREIGN KEY ("idEmpRep") REFERENCES "usuario" ("idUsuario") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenEntrega_usuario_2" FOREIGN KEY ("idEmpAtn") REFERENCES "usuario" ("idUsuario") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenEntrega_Equipo" FOREIGN KEY ("idEquipo") REFERENCES "Equipo" ("IDEquipo") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.ordenServicio
DROP TABLE IF EXISTS "ordenServicio";
CREATE TABLE IF NOT EXISTS "ordenServicio" (
	"idOrdenServicio" INT NOT NULL,
	"horaReporte" TIME NULL DEFAULT NULL,
	"idEquipo" INT NULL DEFAULT NULL,
	"idEmpRep" INT NULL DEFAULT NULL,
	"idTipoFalla" INT NULL DEFAULT NULL,
	"idTipoServicio" INT NULL DEFAULT NULL,
	"idEstado" INT NULL DEFAULT NULL,
	"reporte" TEXT NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"descFalla" TEXT NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"trabRealizado" TEXT NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"idEquipoUti" INT NULL DEFAULT NULL,
	"idEdoFinal" INT NULL DEFAULT NULL,
	"horaInicio" TIME NULL DEFAULT NULL,
	"horaFin" TIME NULL DEFAULT NULL,
	"observaciones" TEXT NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"idEmpAtn" INT NULL DEFAULT NULL,
	PRIMARY KEY ("idOrdenServicio"),
	FOREIGN KEY INDEX "FK_ordenServicio_Equipo" ("idEquipo"),
	FOREIGN KEY INDEX "FK_ordenServicio_usuario" ("idEmpRep"),
	FOREIGN KEY INDEX "FK_ordenServicio_tipoFalla" ("idTipoFalla"),
	FOREIGN KEY INDEX "FK_ordenServicio_tipoServicio" ("idTipoServicio"),
	FOREIGN KEY INDEX "FK_ordenServicio_estadoEquipo" ("idEstado"),
	FOREIGN KEY INDEX "FK_ordenServicio_estadoEquipo_2" ("idEdoFinal"),
	FOREIGN KEY INDEX "FK_ordenServicio_usuario_2" ("idEmpAtn"),
	CONSTRAINT "FK_ordenServicio_tipoFalla" FOREIGN KEY ("idTipoFalla") REFERENCES "tipoFalla" ("idTipoFalla") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServicio_tipoServicio" FOREIGN KEY ("idTipoServicio") REFERENCES "tipoServicio" ("idTipoServicio") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServicio_usuario" FOREIGN KEY ("idEmpRep") REFERENCES "usuario" ("idUsuario") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServicio_usuario_2" FOREIGN KEY ("idEmpAtn") REFERENCES "usuario" ("idUsuario") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServicio_Equipo" FOREIGN KEY ("idEquipo") REFERENCES "Equipo" ("IDEquipo") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServicio_estadoEquipo" FOREIGN KEY ("idEstado") REFERENCES "estadoEquipo" ("idEstado") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServicio_estadoEquipo_2" FOREIGN KEY ("idEdoFinal") REFERENCES "estadoEquipo" ("idEstado") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.ordenServMon
DROP TABLE IF EXISTS "ordenServMon";
CREATE TABLE IF NOT EXISTS "ordenServMon" (
	"idOrden" INT NOT NULL,
	"horaRep" TIME NULL DEFAULT NULL,
	"idEquipo" INT NULL DEFAULT 'NULL',
	"idTipoServ" INT NULL DEFAULT 'NULL',
	"idEstadoEquipo" INT NULL DEFAULT 'NULL',
	"reporte" TEXT NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"idFallaMon" INT NULL DEFAULT 'NULL',
	"idCausaMon" INT NULL DEFAULT 'NULL',
	"idServReal" INT NULL DEFAULT 'NULL',
	"idAtnEmpleado" INT NULL DEFAULT 'NULL',
	"idEmpRep" INT NULL DEFAULT 'NULL',
	"idEdoFinal" INT NULL DEFAULT 'NULL',
	"horaInicio" TIME NULL DEFAULT 'NULL',
	"horaTermino" TIME NULL DEFAULT 'NULL',
	"idEquipoUtil" INT NULL DEFAULT NULL,
	PRIMARY KEY ("idOrden"),
	FOREIGN KEY INDEX "FK_ordenServMon_Equipo" ("idEquipo"),
	FOREIGN KEY INDEX "FK_ordenServMon_tipoServicio" ("idTipoServ"),
	FOREIGN KEY INDEX "FK_ordenServMon_estadoEquipo" ("idEstadoEquipo"),
	FOREIGN KEY INDEX "FK_ordenServMon_FallaMon" ("idFallaMon"),
	FOREIGN KEY INDEX "FK_ordenServMon_causaFallaMon" ("idCausaMon"),
	FOREIGN KEY INDEX "FK_ordenServMon_tipoServicio_2" ("idServReal"),
	FOREIGN KEY INDEX "FK_ordenServMon_usuario" ("idAtnEmpleado"),
	FOREIGN KEY INDEX "FK_ordenServMon_usuario_2" ("idEmpRep"),
	FOREIGN KEY INDEX "FK_ordenServMon_estadoEquipo_2" ("idEdoFinal"),
	CONSTRAINT "FK_ordenServMon_tipoServicio" FOREIGN KEY ("idTipoServ") REFERENCES "tipoServicio" ("idTipoServicio") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServMon_tipoServicio_2" FOREIGN KEY ("idServReal") REFERENCES "tipoServicio" ("idTipoServicio") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServMon_usuario" FOREIGN KEY ("idAtnEmpleado") REFERENCES "usuario" ("idUsuario") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServMon_usuario_2" FOREIGN KEY ("idEmpRep") REFERENCES "usuario" ("idUsuario") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServMon_FallaMon" FOREIGN KEY ("idFallaMon") REFERENCES "FallaMon" ("idFalla") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServMon_causaFallaMon" FOREIGN KEY ("idCausaMon") REFERENCES "causaFallaMon" ("idCausa") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServMon_Equipo" FOREIGN KEY ("idEquipo") REFERENCES "Equipo" ("IDEquipo") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServMon_estadoEquipo" FOREIGN KEY ("idEstadoEquipo") REFERENCES "estadoEquipo" ("idEstado") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ordenServMon_estadoEquipo_2" FOREIGN KEY ("idEdoFinal") REFERENCES "estadoEquipo" ("idEstado") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.Reporte
DROP TABLE IF EXISTS "Reporte";
CREATE TABLE IF NOT EXISTS "Reporte" (
	"IDReporte" INT NOT NULL,
	"IDTipoReporte" INT NOT NULL,
	"Descripcion" VARCHAR(200) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"idEquipo" INT NULL DEFAULT NULL,
	"horaRep" TIME NULL DEFAULT 'NULL',
	"idArea" INT NULL DEFAULT NULL,
	"fechaRep" DATE NULL DEFAULT NULL,
	"idCondReporte" INT NULL DEFAULT NULL,
	FOREIGN KEY INDEX "FK_Reporte_tipoFalla" ("IDTipoReporte"),
	FOREIGN KEY INDEX "FK_Reporte_Equipo" ("idEquipo"),
	FOREIGN KEY INDEX "FK_Reporte_Area" ("idArea"),
	PRIMARY KEY ("IDReporte"),
	CONSTRAINT "FK_Reporte_tipoFalla" FOREIGN KEY ("IDTipoReporte") REFERENCES "tipoFalla" ("idTipoFalla") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_Reporte_Area" FOREIGN KEY ("idArea") REFERENCES "Area" ("IDArea") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_Reporte_Equipo" FOREIGN KEY ("idEquipo") REFERENCES "Equipo" ("IDEquipo") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.ReporteMantenimiento
DROP TABLE IF EXISTS "ReporteMantenimiento";
CREATE TABLE IF NOT EXISTS "ReporteMantenimiento" (
	"IDReporteMantto" INT NOT NULL,
	"IDManttoReporte" INT NOT NULL,
	FOREIGN KEY INDEX "FK_ReporteMantenimiento_Reporte" ("IDReporteMantto"),
	FOREIGN KEY INDEX "FK_ReporteMantenimiento_Mantenimiento" ("IDManttoReporte"),
	CONSTRAINT "FK_ReporteMantenimiento_Reporte" FOREIGN KEY ("IDReporteMantto") REFERENCES "Reporte" ("IDReporte") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_ReporteMantenimiento_Mantenimiento" FOREIGN KEY ("IDManttoReporte") REFERENCES "Mantenimiento" ("IDMantenimiento") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para procedimiento Remi_database.sp_creatediagram
DROP PROCEDURE IF EXISTS "sp_creatediagram";
DELIMITER //

	CREATE PROCEDURE dbo.sp_creatediagram
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.sp_dropdiagram
DROP PROCEDURE IF EXISTS "sp_dropdiagram";
DELIMITER //

	CREATE PROCEDURE dbo.sp_dropdiagram
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.sp_helpdiagramdefinition
DROP PROCEDURE IF EXISTS "sp_helpdiagramdefinition";
DELIMITER //

	CREATE PROCEDURE dbo.sp_helpdiagramdefinition
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.sp_helpdiagrams
DROP PROCEDURE IF EXISTS "sp_helpdiagrams";
DELIMITER //

	CREATE PROCEDURE dbo.sp_helpdiagrams
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.sp_renamediagram
DROP PROCEDURE IF EXISTS "sp_renamediagram";
DELIMITER //

	CREATE PROCEDURE dbo.sp_renamediagram
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.sp_upgraddiagrams
DROP PROCEDURE IF EXISTS "sp_upgraddiagrams";
DELIMITER //

	CREATE PROCEDURE dbo.sp_upgraddiagrams
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	//
DELIMITER ;

-- Volcando estructura para procedimiento Remi_database.statusEquipoNoFunc
DROP PROCEDURE IF EXISTS "statusEquipoNoFunc";
DELIMITER //
CREATE PROCEDURE statusEquipoNoFunc
as
select nombre, NumeroSerie as "Número de serie", modelo, IDNivelRiesgo as "Nivel de riesgo",
IDEquipo as equipo, claveCB as CB, descripcion, fechaExpGarantia as garantia,
idStatus as stado, nivelPrioridad as NP, idMarca as marca, 
idTipo as tipo, cantidad
 from equipo where idstatus=3//
DELIMITER ;

-- Volcando estructura para tabla Remi_database.sysdiagrams
DROP TABLE IF EXISTS "sysdiagrams";
CREATE TABLE IF NOT EXISTS "sysdiagrams" (
	"name" NVARCHAR(128) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"principal_id" INT NOT NULL,
	"diagram_id" INT NOT NULL,
	"version" INT NULL DEFAULT NULL,
	"definition" VARBINARY NULL DEFAULT NULL,
	PRIMARY KEY ("diagram_id"),
	UNIQUE INDEX "UK_principal_name" ("name", "principal_id")
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.Telefono
DROP TABLE IF EXISTS "Telefono";
CREATE TABLE IF NOT EXISTS "Telefono" (
	"idTelefono" INT NOT NULL,
	"telefono2" VARCHAR(50) NOT NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"ext1" VARCHAR(50) NOT NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"ext2" VARCHAR(50) NOT NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"telefono1" VARCHAR(50) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("idTelefono")
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.tipoEquipo
DROP TABLE IF EXISTS "tipoEquipo";
CREATE TABLE IF NOT EXISTS "tipoEquipo" (
	"idTipo" INT NOT NULL,
	"tipo" VARCHAR(50) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("idTipo")
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.tipoFalla
DROP TABLE IF EXISTS "tipoFalla";
CREATE TABLE IF NOT EXISTS "tipoFalla" (
	"idTipoFalla" INT NOT NULL,
	"falla" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("idTipoFalla")
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.tipoReporte
DROP TABLE IF EXISTS "tipoReporte";
CREATE TABLE IF NOT EXISTS "tipoReporte" (
	"idTipoReporte" INT NOT NULL,
	"reporte" VARCHAR(50) NOT NULL DEFAULT '''''' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("idTipoReporte")
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.tipoServicio
DROP TABLE IF EXISTS "tipoServicio";
CREATE TABLE IF NOT EXISTS "tipoServicio" (
	"idTipoServicio" INT NOT NULL,
	"servicio" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("idTipoServicio")
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.tipoUsuario
DROP TABLE IF EXISTS "tipoUsuario";
CREATE TABLE IF NOT EXISTS "tipoUsuario" (
	"idTipoUsuario" INT NOT NULL,
	"rol" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("idTipoUsuario")
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.usuario
DROP TABLE IF EXISTS "usuario";
CREATE TABLE IF NOT EXISTS "usuario" (
	"idUsuario" INT NOT NULL,
	"nombre" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"apPaterno" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"apMaterno" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"contrasena" VARCHAR(50) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"idArea" INT NOT NULL,
	"idTipoUsuario" INT NOT NULL,
	"idTelefono" INT NOT NULL,
	"username" VARCHAR(50) NULL DEFAULT 'NULL' COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("idUsuario"),
	FOREIGN KEY INDEX "FK_usuario_Area" ("idArea"),
	FOREIGN KEY INDEX "FK_usuario_tipoUsuario" ("idTipoUsuario"),
	FOREIGN KEY INDEX "FK_usuario_Telefono" ("idTelefono"),
	CONSTRAINT "FK_usuario_Telefono" FOREIGN KEY ("idTelefono") REFERENCES "Telefono" ("idTelefono") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_usuario_tipoUsuario" FOREIGN KEY ("idTipoUsuario") REFERENCES "tipoUsuario" ("idTipoUsuario") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_usuario_Area" FOREIGN KEY ("idArea") REFERENCES "Area" ("IDArea") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla Remi_database.UsuarioReporte
DROP TABLE IF EXISTS "UsuarioReporte";
CREATE TABLE IF NOT EXISTS "UsuarioReporte" (
	"IDUsuarioReporte" INT NOT NULL,
	"IDReporteUsuario" INT NOT NULL,
	"fechaReporteMantto" TIME NULL DEFAULT NULL,
	"fechaInicioMantto" TIME NULL DEFAULT NULL,
	"fechaTerminoMantto" TIME NULL DEFAULT NULL,
	"idUsuarioAsig" INT NULL DEFAULT NULL,
	FOREIGN KEY INDEX "FK_UsuarioReporte_usuario_2" ("idUsuarioAsig"),
	FOREIGN KEY INDEX "FK_UsuarioReporte_usuario" ("IDUsuarioReporte"),
	FOREIGN KEY INDEX "FK_UsuarioReporte_Reporte" ("IDReporteUsuario"),
	CONSTRAINT "FK_UsuarioReporte_usuario_2" FOREIGN KEY ("idUsuarioAsig") REFERENCES "usuario" ("idUsuario") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_UsuarioReporte_usuario" FOREIGN KEY ("IDUsuarioReporte") REFERENCES "usuario" ("idUsuario") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_UsuarioReporte_Reporte" FOREIGN KEY ("IDReporteUsuario") REFERENCES "Reporte" ("IDReporte") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para vista Remi_database.database_firewall_rules
DROP VIEW IF EXISTS "database_firewall_rules";
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE "database_firewall_rules" (
	"id" INT NOT NULL,
	"name" NVARCHAR(128) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"start_ip_address" VARCHAR(45) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"end_ip_address" VARCHAR(45) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"create_date" DATETIME NOT NULL,
	"modify_date" DATETIME NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista Remi_database.database_firewall_rules
DROP VIEW IF EXISTS "database_firewall_rules";
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS "database_firewall_rules";
CREATE VIEW sys.database_firewall_rules AS SELECT id, name, start_ip_address, end_ip_address, create_date, modify_date FROM sys.database_firewall_rules_table;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
