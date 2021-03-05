-- MySQL Script generated by MySQL Workbench
-- Thu Jan 14 11:08:20 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`provincia` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`localidad` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `provincia_id INT` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_localidad_provincia_idx` (`provincia_id INT` ASC) VISIBLE,
  CONSTRAINT `fk_localidad_provincia`
    FOREIGN KEY (`provincia_id INT`)
    REFERENCES `mydb`.`provincia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`libro` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(200) NOT NULL,
  `isbn` VARCHAR(13) NOT NULL,
  `año_publicacion` YEAR(4) NOT NULL,
  `descripcion` VARCHAR(2048) NOT NULL,
  `tipo` SET('Papel', 'Ebook') NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`libro_papel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`libro_papel` (
  `id` INT UNSIGNED NOT NULL,
  `lugar_impresion` VARCHAR(50) NOT NULL,
  ` fecha_impresion` DATE NOT NULL,
  `precio_papel` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_libro_papel_libro1`
    FOREIGN KEY (`id`)
    REFERENCES `mydb`.`libro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`libro_ebook`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`libro_ebook` (
  `id` INT UNSIGNED NOT NULL,
  `tamanyo_archivo` VARCHAR(45) NOT NULL,
  `precio_ebook` DECIMAL(7,2) NULL,
  INDEX `fk_libro_ebook_libro1_idx` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_libro_ebook_libro1`
    FOREIGN KEY (`id`)
    REFERENCES `mydb`.`libro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido1` VARCHAR(50) NOT NULL,
  `apellido2` VARCHAR(50) NULL,
  `dirrecion` VARCHAR(200) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `localidad_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE,
  INDEX `fk_cliente_localidad1_idx` (`localidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_localidad1`
    FOREIGN KEY (`localidad_id`)
    REFERENCES `mydb`.`localidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_copy1` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido1` VARCHAR(50) NOT NULL,
  `apellido2` VARCHAR(50) NULL,
  `dirrecion` VARCHAR(200) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `localidad_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE,
  INDEX `fk_cliente_localidad1_idx` (`localidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_localidad10`
    FOREIGN KEY (`localidad_id`)
    REFERENCES `mydb`.`localidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autor` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido1` VARCHAR(50) NOT NULL,
  `apellido2` VARCHAR(50) NULL,
  `direccion` VARCHAR(300) NOT NULL,
  `url` VARCHAR(200) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `localidad_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE,
  INDEX `fk_cliente_localidad1_idx` (`localidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_localidad11`
    FOREIGN KEY (`localidad_id`)
    REFERENCES `mydb`.`localidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`editorial` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(500) NOT NULL,
  `url` VARCHAR(200) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `localidad_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE,
  INDEX `fk_cliente_localidad1_idx` (`localidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_localidad110`
    FOREIGN KEY (`localidad_id`)
    REFERENCES `mydb`.`localidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`almacen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`almacen` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(200) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `localidad_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE,
  INDEX `fk_cliente_localidad1_idx` (`localidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_localidad1100`
    FOREIGN KEY (`localidad_id`)
    REFERENCES `mydb`.`localidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cesta` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha_compra` DATETIME NOT NULL DEFAULT NOW(),
  `cliente_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cesta_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_cesta_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `mydb`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`autor_escribe_libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autor_escribe_libro` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `libro_id` INT UNSIGNED NOT NULL,
  `autor_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `libro_id`),
  INDEX `fk_libro_has_autor_autor1_idx` (`autor_id` ASC) VISIBLE,
  INDEX `fk_libro_has_autor_libro1_idx` (`libro_id` ASC) VISIBLE,
  CONSTRAINT `fk_libro_has_autor_libro1`
    FOREIGN KEY (`libro_id`)
    REFERENCES `mydb`.`libro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_has_autor_autor1`
    FOREIGN KEY (`autor_id`)
    REFERENCES `mydb`.`autor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;