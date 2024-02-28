-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ER-M:M
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ER-M:M
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ER-M:M` DEFAULT CHARACTER SET utf8 ;
USE `ER-M:M` ;

-- -----------------------------------------------------
-- Table `ER-M:M`.`MEDICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-M:M`.`MEDICO` (
  `codmed` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codmed`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ER-M:M`.`PACIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-M:M`.`PACIENTE` (
  `codpac` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codpac`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ER-M:M`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-M:M`.`Cita` (
  `hora` DATETIME NOT NULL,
  `fehca` DATE NOT NULL,
  `CITA.codmed` INT NOT NULL,
  `CITA.codpac` INT NOT NULL,
  INDEX `fk_Cita_MEDICO_idx` (`CITA.codmed` ASC) VISIBLE,
  INDEX `fk_Cita_PACIENTE1_idx` (`CITA.codpac` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
