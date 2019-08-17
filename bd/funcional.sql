-- MySQL Script generated by MySQL Workbench
-- Sat Aug 17 13:05:07 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema campoEscuela
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema campoEscuela
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `campoEscuela` DEFAULT CHARACTER SET utf8 ;
USE `campoEscuela` ;

-- -----------------------------------------------------
-- Table `campoEscuela`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`roles` (
  `idroles` INT NOT NULL AUTO_INCREMENT,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idroles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `campoEscuela`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `lastlogin` VARCHAR(50) NOT NULL,
  `nombres` VARCHAR(65) NOT NULL,
  `apellidos` VARCHAR(75) NOT NULL,
  `idroles` INT NOT NULL,
  PRIMARY KEY (`idusuarios`),
  CONSTRAINT `idroles1`
    FOREIGN KEY (`idroles`)
    REFERENCES `campoEscuela`.`roles` (`idroles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idroles_idx1` ON `campoEscuela`.`usuarios` (`idroles` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`incidentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`incidentes` (
  `idincidentes` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `descripcionInci` VARCHAR(250) NOT NULL,
  `idusuarios` INT NOT NULL,
  PRIMARY KEY (`idincidentes`),
  CONSTRAINT `idusuarios8`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `campoEscuela`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idusuarios_idx8` ON `campoEscuela`.`incidentes` (`idusuarios` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`pedidos` (
  `idpedidos` INT NOT NULL AUTO_INCREMENT,
  `idusuarios` INT NOT NULL,
  `fechaPedido` DATETIME NOT NULL,
  PRIMARY KEY (`idpedidos`),
  CONSTRAINT `idusuarios1`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `campoEscuela`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idusuarios_idx1` ON `campoEscuela`.`pedidos` (`idusuarios` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`donaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`donaciones` (
  `iddonaciones` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `donante` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `cantidad` DECIMAL(10,2) NOT NULL,
  `idusuarios` INT NOT NULL,
  PRIMARY KEY (`iddonaciones`),
  CONSTRAINT `idusuarios5`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `campoEscuela`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idusuarios_idx5` ON `campoEscuela`.`donaciones` (`idusuarios` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`capacitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`capacitaciones` (
  `idcapacitaciones` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `nombreGrupo` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `encargado` VARCHAR(45) NOT NULL,
  `idusuarios` INT NOT NULL,
  PRIMARY KEY (`idcapacitaciones`),
  CONSTRAINT `idusuarios4`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `campoEscuela`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idusuarios_idx4` ON `campoEscuela`.`capacitaciones` (`idusuarios` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`categorias` (
  `idcategorias` INT NOT NULL AUTO_INCREMENT,
  `nombrecate` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idcategorias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `campoEscuela`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`inventario` (
  `idinventario` INT NOT NULL AUTO_INCREMENT,
  `nombreprod` VARCHAR(60) NOT NULL,
  `precio` DECIMAL(6,2) NOT NULL,
  `unidaddemedida` VARCHAR(50) NOT NULL,
  `idusuarios` INT NOT NULL,
  `idcategorias` INT NOT NULL,
  PRIMARY KEY (`idinventario`),
  CONSTRAINT `idusuarios6`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `campoEscuela`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idcategorias`
    FOREIGN KEY (`idcategorias`)
    REFERENCES `campoEscuela`.`categorias` (`idcategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idusuarios_idx6` ON `campoEscuela`.`inventario` (`idusuarios` ASC);

CREATE INDEX `idcategorias_idx` ON `campoEscuela`.`inventario` (`idcategorias` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`kardex`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`kardex` (
  `idkardex` INT NOT NULL AUTO_INCREMENT,
  `entrada` DECIMAL(10,2) NOT NULL,
  `salida` DECIMAL(10,2) NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  `saldoanterior` DECIMAL(10,2) NOT NULL,
  `idinventario` INT NOT NULL,
  PRIMARY KEY (`idkardex`),
  CONSTRAINT `idinventario1`
    FOREIGN KEY (`idinventario`)
    REFERENCES `campoEscuela`.`inventario` (`idinventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idinventario_idx` ON `campoEscuela`.`kardex` (`idinventario` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`perdidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`perdidas` (
  `idperdidas` INT NOT NULL AUTO_INCREMENT,
  `nombreProduc` VARCHAR(45) NOT NULL,
  `cantidad` TINYINT(2) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `precioProduc` DECIMAL(10,2) NOT NULL,
  `mes` TINYINT(2) NOT NULL,
  `año` SMALLINT(4) NOT NULL,
  `unidadDelProduc` VARCHAR(45) NULL,
  `idusuarios` INT NOT NULL,
  PRIMARY KEY (`idperdidas`),
  CONSTRAINT `idusuarios3`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `campoEscuela`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idusuarios_idx3` ON `campoEscuela`.`perdidas` (`idusuarios` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`ventas` (
  `idventas` INT NOT NULL AUTO_INCREMENT,
  `fechaventa` DATETIME NOT NULL,
  `preciounit` DECIMAL(6,2) NOT NULL,
  `cantidadprod` INT NOT NULL,
  `idusuarios` INT NOT NULL,
  `idinventario` INT NOT NULL,
  PRIMARY KEY (`idventas`),
  CONSTRAINT `idusuarios7`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `campoEscuela`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idinventario2`
    FOREIGN KEY (`idinventario`)
    REFERENCES `campoEscuela`.`inventario` (`idinventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idusuarios_idx7` ON `campoEscuela`.`ventas` (`idusuarios` ASC);

CREATE INDEX `idinventario_idx` ON `campoEscuela`.`ventas` (`idinventario` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`partidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`partidas` (
  `idpartidas` INT NOT NULL AUTO_INCREMENT,
  `nombrepartida` VARCHAR(150) NULL,
  `responsable` VARCHAR(50) NOT NULL,
  `idusuarios` INT NOT NULL,
  PRIMARY KEY (`idpartidas`),
  CONSTRAINT `idusuarios9`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `campoEscuela`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idusuarios_idx9` ON `campoEscuela`.`partidas` (`idusuarios` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`menu` (
  `idmenu` INT NULL AUTO_INCREMENT,
  `menu` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `url` VARCHAR(45) NOT NULL,
  `idpadre` INT NOT NULL,
  PRIMARY KEY (`idmenu`),
  CONSTRAINT `idpadre`
    FOREIGN KEY (`idpadre`)
    REFERENCES `campoEscuela`.`menu` (`idmenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idpadre_idx` ON `campoEscuela`.`menu` (`idpadre` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`permisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`permisos` (
  `idpermisos` INT NOT NULL AUTO_INCREMENT,
  `idmenu` INT NOT NULL,
  `idroles` INT NOT NULL,
  `codigo` INT NOT NULL,
  PRIMARY KEY (`idpermisos`),
  CONSTRAINT `idroles2`
    FOREIGN KEY (`idroles`)
    REFERENCES `campoEscuela`.`roles` (`idroles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idmenu`
    FOREIGN KEY (`idmenu`)
    REFERENCES `campoEscuela`.`menu` (`idmenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idroles_idx2` ON `campoEscuela`.`permisos` (`idroles` ASC);

CREATE INDEX `idmenu_idx` ON `campoEscuela`.`permisos` (`idmenu` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`detallepedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`detallepedidos` (
  `iddetallepedidos` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(100) NOT NULL,
  `cantidad` TINYINT(2) NOT NULL,
  `unidadmedida` VARCHAR(45) NOT NULL,
  `nombreProducto` VARCHAR(45) NOT NULL,
  `precioUnitario` DECIMAL(10,2) NOT NULL,
  `precioTotal` DECIMAL(10,2) NOT NULL,
  `idpedidos` INT NOT NULL,
  PRIMARY KEY (`iddetallepedidos`),
  CONSTRAINT `idpedidos`
    FOREIGN KEY (`idpedidos`)
    REFERENCES `campoEscuela`.`pedidos` (`idpedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idpedidos_idx` ON `campoEscuela`.`detallepedidos` (`idpedidos` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`detallecapacitados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`detallecapacitados` (
  `iddetallecapacitaciones` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `idcapacitaciones` INT NOT NULL,
  PRIMARY KEY (`iddetallecapacitaciones`),
  CONSTRAINT `idcapacitaciones`
    FOREIGN KEY (`idcapacitaciones`)
    REFERENCES `campoEscuela`.`capacitaciones` (`idcapacitaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idcapacitaciones_idx` ON `campoEscuela`.`detallecapacitados` (`idcapacitaciones` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`cuentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`cuentas` (
  `idcuentas` INT NOT NULL AUTO_INCREMENT,
  `idpartida` INT NULL,
  `fechaInicio` DATETIME NULL,
  `fechaFin` DATETIME NULL,
  `IndicadorLogrado` VARCHAR(100) NULL,
  `actGeneral` VARCHAR(100) NULL,
  PRIMARY KEY (`idcuentas`),
  CONSTRAINT `idpartida`
    FOREIGN KEY (`idpartida`)
    REFERENCES `campoEscuela`.`partidas` (`idpartidas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idpartida_idx` ON `campoEscuela`.`cuentas` (`idpartida` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`actividadesEspecificas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`actividadesEspecificas` (
  `idactividades` INT NOT NULL AUTO_INCREMENT,
  `idcuentas` INT NOT NULL,
  `actespecifica` VARCHAR(100) NOT NULL,
  `Racademico` VARCHAR(50) NULL,
  `Rtecnico` VARCHAR(50) NULL,
  `Rfinanciero` DECIMAL(10,2) NULL,
  `RInfraestructura` VARCHAR(50) NULL,
  PRIMARY KEY (`idactividades`),
  CONSTRAINT `idcuenta`
    FOREIGN KEY (`idcuentas`)
    REFERENCES `campoEscuela`.`cuentas` (`idcuentas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idcuenta_idx` ON `campoEscuela`.`actividadesEspecificas` (`idcuentas` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`entidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`entidades` (
  `identidades` INT NOT NULL AUTO_INCREMENT,
  `nombreentidad` VARCHAR(45) NOT NULL,
  `idpermisos` INT NOT NULL,
  PRIMARY KEY (`identidades`),
  CONSTRAINT `idpermisos`
    FOREIGN KEY (`idpermisos`)
    REFERENCES `campoEscuela`.`permisos` (`idpermisos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idpermisos_idx` ON `campoEscuela`.`entidades` (`idpermisos` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`historial` (
  `idhistorial` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `accion` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idhistorial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `campoEscuela`.`gasto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`gasto` (
  `idgasto` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `idusuarios` INT NOT NULL,
  PRIMARY KEY (`idgasto`),
  CONSTRAINT `idusuarios2`
    FOREIGN KEY (`idusuarios`)
    REFERENCES `campoEscuela`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idusuarios_idx2` ON `campoEscuela`.`gasto` (`idusuarios` ASC);


-- -----------------------------------------------------
-- Table `campoEscuela`.`insumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `campoEscuela`.`insumo` (
  `idInsumo` INT NOT NULL AUTO_INCREMENT,
  `cantidad` TINYINT(2) NOT NULL,
  `unidadMedida` VARCHAR(45) NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `idpedido` INT NOT NULL,
  PRIMARY KEY (`idInsumo`),
  CONSTRAINT `idpedido`
    FOREIGN KEY (`idpedido`)
    REFERENCES `campoEscuela`.`pedidos` (`idpedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idpedido_idx` ON `campoEscuela`.`insumo` (`idpedido` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
