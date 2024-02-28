-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ER-BIN3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ER-BIN3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ER-BIN3` DEFAULT CHARACTER SET utf8 ;
USE `ER-BIN3` ;

-- -----------------------------------------------------
-- Table `ER-BIN3`.`CONDUCE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-BIN3`.`CONDUCE` (
  `codemp` INT NOT NULL,
  `matricula` VARCHAR(15) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  PRIMARY KEY (`codemp`, `matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ER-BIN3`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-BIN3`.`EMPLEADO` (
  `nombre` VARCHAR(30) NOT NULL,
  `CONDUCE_codemp` INT NOT NULL,
  INDEX `fk_EMPLEADO_CONDUCE_idx` (`CONDUCE_codemp` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ER-BIN3`.`table3`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-BIN3`.`table3` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ER-BIN3`.`VEHICULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ER-BIN3`.`VEHICULO` (
  `modelo` VARCHAR(15) NOT NULL,
  `CONDUCE_matricula` VARCHAR(15) NOT NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
