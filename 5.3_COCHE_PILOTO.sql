-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 5.3_PILOTO/COCHE
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 5.3_PILOTO/COCHE
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `5.3_PILOTO/COCHE` DEFAULT CHARACTER SET utf8 ;
USE `5.3_PILOTO/COCHE` ;

-- -----------------------------------------------------
-- Table `5.3_PILOTO/COCHE`.`COCHE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.3_PILOTO/COCHE`.`COCHE` (
  `matrícula` VARCHAR(15) NOT NULL,
  `asientos` INT NOT NULL,
  `marca` VARCHAR(15) NOT NULL,
  `modelo` INT NOT NULL,
  `PILOTO_Nif` INT NOT NULL,
  PRIMARY KEY (`matrícula`),
  INDEX `fk_COCHE_PILOTO1_idx` (`PILOTO_Nif` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5.3_PILOTO/COCHE`.`PILOTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5.3_PILOTO/COCHE`.`PILOTO` (
  `Nif` INT NOT NULL,
  `nombre` VARCHAR(35) NOT NULL,
  `dirección` GEOMETRY NOT NULL,
  `COCHE_matrícula` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Nif`),
  INDEX `fk_PILOTO_COCHE_idx` (`COCHE_matrícula` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
