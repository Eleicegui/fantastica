-- MySQL Script generated by MySQL Workbench
-- Sat Oct 13 13:12:53 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fantasticaDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fantasticaDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fantasticaDB` DEFAULT CHARACTER SET utf8 ;
USE `fantasticaDB` ;

-- -----------------------------------------------------
-- Table `fantasticaDB`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fantasticaDB`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `fantasticaDB`.`Cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `cuil` VARCHAR(20) NOT NULL,
  `fecha_alta` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fantasticaDB`.`OrdenCompra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fantasticaDB`.`OrdenCompra` ;

CREATE TABLE IF NOT EXISTS `fantasticaDB`.`OrdenCompra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `activa` TINYINT(1),
  `estado` ENUM(`Paga`, `Pendiente`, `Cancelada`, `Entregada`),
  PRIMARY KEY (`id`, `cliente_id`),
  INDEX `fk_OrdenCompra_Cliente_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_OrdenCompra_Cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `fantasticaDB`.`Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fantasticaDB`.`Proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fantasticaDB`.`Proveedor` ;

CREATE TABLE IF NOT EXISTS `fantasticaDB`.`Proveedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `razon_social` VARCHAR(50) NOT NULL,
  `cuit` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `activo` TINYINT(1) NULL,
  `fecha_alta` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fantasticaDB`.`Marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fantasticaDB`.`Marca` ;

CREATE TABLE IF NOT EXISTS `fantasticaDB`.`Marca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `proveedor_id` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`, `proveedor_id`),
  INDEX `fk_Marca_Proveedor1_idx` (`proveedor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Marca_Proveedor1`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `fantasticaDB`.`Proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fantasticaDB`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fantasticaDB`.`Categoria` ;

CREATE TABLE IF NOT EXISTS `fantasticaDB`.`Categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fantasticaDB`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fantasticaDB`.`Producto` ;

CREATE TABLE IF NOT EXISTS `fantasticaDB`.`Producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `marca_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  `detalle` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`, `marca_id`, `categoria_id`),
  INDEX `fk_Producto_Marca1_idx` (`marca_id` ASC) VISIBLE,
  INDEX `fk_Producto_Categoria1_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Marca1`
    FOREIGN KEY (`marca_id`)
    REFERENCES `fantasticaDB`.`Marca` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `fantasticaDB`.`Categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fantasticaDB`.`DescripcionProducto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fantasticaDB`.`DescripcionProducto` ;

CREATE TABLE IF NOT EXISTS `fantasticaDB`.`DescripcionProducto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `producto_id` INT NOT NULL,
  `fecha_alta` DATETIME NOT NULL,
  `modelo` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `costo` DECIMAL(10,2) NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `stock` INT(11) NOT NULL,
  `imagen` VARCHAR(100),
  `tipo` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`, `producto_id`),
  INDEX `fk_DescripcionProducto_Producto1_idx` (`producto_id` ASC) VISIBLE,
  CONSTRAINT `fk_DescripcionProducto_Producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `fantasticaDB`.`Producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fantasticaDB`.`DescripcionOrden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fantasticaDB`.`DescripcionOrden` ;

CREATE TABLE IF NOT EXISTS `fantasticaDB`.`DescripcionOrden` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcionProducto_id` INT NOT NULL,
  `ordenCompra_id` INT NOT NULL,
  `costo` DECIMAL(10,2) NOT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `cantidad` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `descripcionProducto_id`, `ordenCompra_id`),
  INDEX `fk_DescripcionOrden_DescripcionProducto1_idx` (`descripcionProducto_id` ASC) VISIBLE,
  INDEX `fk_DescripcionOrden_OrdenCompra1_idx` (`ordenCompra_id` ASC) VISIBLE,
  CONSTRAINT `fk_DescripcionOrden_DescripcionProducto1`
    FOREIGN KEY (`descripcionProducto_id`)
    REFERENCES `fantasticaDB`.`DescripcionProducto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DescripcionOrden_OrdenCompra1`
    FOREIGN KEY (`ordenCompra_id`)
    REFERENCES `fantasticaDB`.`OrdenCompra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;