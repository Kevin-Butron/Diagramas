-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ER-P-A
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ER-P-A
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ER-P-A` DEFAULT CHARACTER SET utf8 ;
USE `ER-P-A` ;

-- -----------------------------------------------------
-- Table `ER-P-A`.`PROFESOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-P-A`.`PROFESOR` (
  `cod-profesor` INT NOT NULL,
  `nif` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apelllidos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod-profesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ER-P-A`.`GRUPO ALUMNOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-P-A`.`GRUPO ALUMNOS` (
  `cod-grupo` INT NOT NULL,
  `curso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod-grupo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ER-P-A`.`P-G`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-P-A`.`P-G` (
  `año-academico` INT NOT NULL,
  `PROFESOR_cod-profesor` INT NOT NULL,
  `GRUPO ALUMNOS_cod-grupo` INT NOT NULL,
  INDEX `fk_P-G_PROFESOR_idx` (`PROFESOR_cod-profesor` ASC) VISIBLE,
  INDEX `fk_P-G_GRUPO ALUMNOS1_idx` (`GRUPO ALUMNOS_cod-grupo` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
