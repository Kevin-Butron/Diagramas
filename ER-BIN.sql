-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema relacion_binaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema relacion_binaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `relacion_binaria` DEFAULT CHARACTER SET utf8 ;
USE `relacion_binaria` ;

-- -----------------------------------------------------
-- Table `relacion_binaria`.`VEHICULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relacion_binaria`.`VEHICULO` (
  `matricula` INT NOT NULL,
  `modelo` VARCHAR(20) NOT NULL,
  `codemp` INT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  PRIMARY KEY (`matricula`, `codemp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `relacion_binaria`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `relacion_binaria`.`EMPLEADO` (
  `nombre` VARCHAR(45) NOT NULL,
  `VEHICULO_codemp` INT NOT NULL,
  INDEX `fk_EMPLEADO_VEHICULO_idx` (`VEHICULO_codemp` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
