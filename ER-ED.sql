-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema entidad_debil
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema entidad_debil
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `entidad_debil` DEFAULT CHARACTER SET utf8 ;
USE `entidad_debil` ;

-- -----------------------------------------------------
-- Table `entidad_debil`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entidad_debil`.`Empleado` (
  `num_dept` INT NOT NULL,
  `num_emp` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha:ingreso` DATE NOT NULL,
  PRIMARY KEY (`num_dept`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `entidad_debil`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entidad_debil`.`Departamento` (
  `nombre` VARCHAR(30) NOT NULL,
  `presupuesto` INT NOT NULL,
  `num_departamento` INT NOT NULL,
  `Empleado_num_dept` INT NOT NULL,
  PRIMARY KEY (`num_departamento`),
  INDEX `fk_Departamento_Empleado_idx` (`Empleado_num_dept` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
