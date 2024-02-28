-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema E-R-POL1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema E-R-POL1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `E-R-POL1` DEFAULT CHARACTER SET utf8 ;
USE `E-R-POL1` ;

-- -----------------------------------------------------
-- Table `E-R-POL1`.`BENEFICIARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-R-POL1`.`BENEFICIARIO` (
  `dni` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha_nacim` DATE NOT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-R-POL1`.`POLIZA_VIDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-R-POL1`.`POLIZA_VIDA` (
  `numero` INT NOT NULL,
  `BENEFICIARIO_dni` INT NOT NULL,
  PRIMARY KEY (`numero`),
  INDEX `fk_POLIZA_VIDA_BENEFICIARIO1_idx` (`BENEFICIARIO_dni` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-R-POL1`.`POLIZA_VIVIENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-R-POL1`.`POLIZA_VIVIENDA` (
  `domicilio` GEOMETRY NOT NULL,
  `numero` INT NOT NULL,
  PRIMARY KEY (`numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-R-POL1`.`POLIZA_AUTOMOVIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-R-POL1`.`POLIZA_AUTOMOVIL` (
  `matricula` INT NOT NULL,
  `numero` INT NOT NULL,
  PRIMARY KEY (`matricula`, `numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `E-R-POL1`.`POLIZA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `E-R-POL1`.`POLIZA` (
  `numero` INT NOT NULL,
  `fecha_ini` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `POLIZA_VIDA_numero` INT NOT NULL,
  `POLIZA_VIVIENDA_numero` INT NOT NULL,
  `POLIZA_AUTOMOVIL_matricula` INT NOT NULL,
  `POLIZA_AUTOMOVIL_numero` INT NOT NULL,
  PRIMARY KEY (`numero`),
  INDEX `fk_POLIZA_POLIZA_VIDA_idx` (`POLIZA_VIDA_numero` ASC) VISIBLE,
  INDEX `fk_POLIZA_POLIZA_VIVIENDA1_idx` (`POLIZA_VIVIENDA_numero` ASC) VISIBLE,
  INDEX `fk_POLIZA_POLIZA_AUTOMOVIL1_idx` (`POLIZA_AUTOMOVIL_matricula` ASC, `POLIZA_AUTOMOVIL_numero` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
