-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Tienda
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Tienda
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Tienda` DEFAULT CHARACTER SET utf8 ;
USE `Tienda` ;

-- -----------------------------------------------------
-- Table `Tienda`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`.`telefonos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`telefonos` (
  `id` INT NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `clientes_id` INT NOT NULL,
  `clientes_id1` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_telefonos_clientes_idx` (`clientes_id1` ASC) VISIBLE,
  CONSTRAINT `fk_telefonos_clientes`
    FOREIGN KEY (`clientes_id1`)
    REFERENCES `Tienda`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`ventas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  `sub total` DECIMAL NOT NULL,
  `iva` DECIMAL NOT NULL,
  `descuento` DECIMAL NOT NULL,
  `total` DECIMAL NOT NULL,
  `ventascol6` VARCHAR(45) NULL,
  `telefonos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ventas_telefonos1_idx` (`telefonos_id` ASC) VISIBLE,
  CONSTRAINT `fk_ventas_telefonos1`
    FOREIGN KEY (`telefonos_id`)
    REFERENCES `Tienda`.`telefonos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`productos` (
  `idproductos` INT NOT NULL AUTO_INCREMENT,
  `nombre` CHAR(80) NOT NULL,
  `precioCompra` DECIMAL NOT NULL,
  `precioVenta` DECIMAL NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idproductos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`.`provedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`provedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` CHAR(80) NOT NULL,
  `direccion` CHAR(80) NOT NULL,
  `telefono` CHAR(80) NOT NULL,
  `correo` CHAR(80) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`.`ventas_has_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`ventas_has_productos` (
  `ventas_id` INT NOT NULL,
  `productos_idproductos` INT NOT NULL,
  PRIMARY KEY (`ventas_id`, `productos_idproductos`),
  INDEX `fk_ventas_has_productos_productos1_idx` (`productos_idproductos` ASC) VISIBLE,
  INDEX `fk_ventas_has_productos_ventas1_idx` (`ventas_id` ASC) VISIBLE,
  CONSTRAINT `fk_ventas_has_productos_ventas1`
    FOREIGN KEY (`ventas_id`)
    REFERENCES `Tienda`.`ventas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_has_productos_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `Tienda`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`.`provedores_has_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`provedores_has_productos` (
  `provedores_id` INT NOT NULL,
  `productos_idproductos` INT NOT NULL,
  PRIMARY KEY (`provedores_id`, `productos_idproductos`),
  INDEX `fk_provedores_has_productos_productos1_idx` (`productos_idproductos` ASC) VISIBLE,
  INDEX `fk_provedores_has_productos_provedores1_idx` (`provedores_id` ASC) VISIBLE,
  CONSTRAINT `fk_provedores_has_productos_provedores1`
    FOREIGN KEY (`provedores_id`)
    REFERENCES `Tienda`.`provedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_provedores_has_productos_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `Tienda`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
