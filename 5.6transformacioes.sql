-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 5.6Transformacion
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 5.6Transformacion
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `5.6Transformacion` DEFAULT CHARACTER SET utf8 ;
USE `5.6Transformacion` ;

-- -----------------------------------------------------
-- Table `5.6Transformacion`.`PILOTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.6Transformacion`.`PILOTO` (
  `nif` INT NOT NULL,
  `Nombre` VARCHAR(15) NOT NULL,
  `apellidos` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.6Transformacion`.`CIUDAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.6Transformacion`.`CIUDAD` (
  `nombre-ciudad` VARCHAR(50) NOT NULL,
  `pais` VARCHAR(15) NOT NULL,
  `numero-habitantes` INT NOT NULL,
  PRIMARY KEY (`nombre-ciudad`, `pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.6Transformacion`.`AVION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.6Transformacion`.`AVION` (
  `cod-avion` VARCHAR(20) NOT NULL,
  `nombre-avion` VARCHAR(45) NOT NULL,
  `numero-motores` INT NOT NULL,
  PRIMARY KEY (`cod-avion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.6Transformacion`.`P-C-A`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.6Transformacion`.`P-C-A` (
  `fecha` DATE NOT NULL,
  `PILOTO_nif` INT NOT NULL,
  `CIUDAD_nombre-ciudad` VARCHAR(50) NOT NULL,
  `CIUDAD_pais` VARCHAR(15) NOT NULL,
  `AVION_cod-avion` VARCHAR(20) NOT NULL,
  INDEX `fk_P-C-A_PILOTO_idx` (`PILOTO_nif` ASC) VISIBLE,
  INDEX `fk_P-C-A_CIUDAD1_idx` (`CIUDAD_nombre-ciudad` ASC, `CIUDAD_pais` ASC) VISIBLE,
  INDEX `fk_P-C-A_AVION1_idx` (`AVION_cod-avion` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
