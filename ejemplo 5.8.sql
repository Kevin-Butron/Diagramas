-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema empleado_obra
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema empleado_obra
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `empleado_obra` DEFAULT CHARACTER SET utf8 ;
USE `empleado_obra` ;

-- -----------------------------------------------------
-- Table `empleado_obra`.`EMPLEADO_DE_OBRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado_obra`.`EMPLEADO_DE_OBRA` (
  `cod-empleado` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`cod-empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleado_obra`.`E-E`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado_obra`.`E-E` (
  `fecha-inicio` VARCHAR(45) NULL,
  `fecha-fin` VARCHAR(45) NULL,
  `EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`EMPLEADO_DE_OBRA_cod-empleado`),
  INDEX `fk_E-E_EMPLEADO_DE_OBRA_idx` (`EMPLEADO_DE_OBRA_cod-empleado` ASC) VISIBLE,
  CONSTRAINT `fk_E-E_EMPLEADO_DE_OBRA`
    FOREIGN KEY (`EMPLEADO_DE_OBRA_cod-empleado`)
    REFERENCES `empleado_obra`.`EMPLEADO_DE_OBRA` (`cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleado_obra`.`EDIFICIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado_obra`.`EDIFICIO` (
  `cod-edif` INT NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `E-E_EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`cod-edif`),
  INDEX `fk_EDIFICIO_E-E1_idx` (`E-E_EMPLEADO_DE_OBRA_cod-empleado` ASC) VISIBLE,
  CONSTRAINT `fk_EDIFICIO_E-E1`
    FOREIGN KEY (`E-E_EMPLEADO_DE_OBRA_cod-empleado`)
    REFERENCES `empleado_obra`.`E-E` (`EMPLEADO_DE_OBRA_cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleado_obra`.`ES -UN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado_obra`.`ES -UN` (
  `tipo` INT NOT NULL,
  `EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`EMPLEADO_DE_OBRA_cod-empleado`),
  CONSTRAINT `fk_ES -UN_EMPLEADO_DE_OBRA1`
    FOREIGN KEY (`EMPLEADO_DE_OBRA_cod-empleado`)
    REFERENCES `empleado_obra`.`EMPLEADO_DE_OBRA` (`cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleado_obra`.`A-F`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado_obra`.`A-F` (
  `ARQUITECTO_num-colegiado` INT NOT NULL,
  `ARQUITECTO_ES -UN_EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`ARQUITECTO_num-colegiado`, `ARQUITECTO_ES -UN_EMPLEADO_DE_OBRA_cod-empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleado_obra`.`ARQUITECTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado_obra`.`ARQUITECTO` (
  `num-colegiado` INT NOT NULL,
  `ES -UN_EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  `A-F_ARQUITECTO_num-colegiado` INT NOT NULL,
  `A-F_ARQUITECTO_ES -UN_EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`ES -UN_EMPLEADO_DE_OBRA_cod-empleado`),
  INDEX `fk_ARQUITECTO_ES -UN1_idx` (`ES -UN_EMPLEADO_DE_OBRA_cod-empleado` ASC) VISIBLE,
  INDEX `fk_ARQUITECTO_A-F1_idx` (`A-F_ARQUITECTO_num-colegiado` ASC, `A-F_ARQUITECTO_ES -UN_EMPLEADO_DE_OBRA_cod-empleado` ASC) VISIBLE,
  CONSTRAINT `fk_ARQUITECTO_ES -UN1`
    FOREIGN KEY (`ES -UN_EMPLEADO_DE_OBRA_cod-empleado`)
    REFERENCES `empleado_obra`.`ES -UN` (`EMPLEADO_DE_OBRA_cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ARQUITECTO_A-F1`
    FOREIGN KEY (`A-F_ARQUITECTO_num-colegiado` , `A-F_ARQUITECTO_ES -UN_EMPLEADO_DE_OBRA_cod-empleado`)
    REFERENCES `empleado_obra`.`A-F` (`ARQUITECTO_num-colegiado` , `ARQUITECTO_ES -UN_EMPLEADO_DE_OBRA_cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleado_obra`.`CAPATAZ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado_obra`.`CAPATAZ` (
  `ES -UN_EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  `C-A_cargo` INT NOT NULL,
  PRIMARY KEY (`ES -UN_EMPLEADO_DE_OBRA_cod-empleado`, `C-A_cargo`),
  CONSTRAINT `fk_CAPATAZ_ES -UN1`
    FOREIGN KEY (`ES -UN_EMPLEADO_DE_OBRA_cod-empleado`)
    REFERENCES `empleado_obra`.`ES -UN` (`EMPLEADO_DE_OBRA_cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleado_obra`.`ALBAÑIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado_obra`.`ALBAÑIL` (
  `especialidad` INT NOT NULL,
  `ES -UN_EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`ES -UN_EMPLEADO_DE_OBRA_cod-empleado`),
  CONSTRAINT `fk_ALBAÑIL_ES -UN1`
    FOREIGN KEY (`ES -UN_EMPLEADO_DE_OBRA_cod-empleado`)
    REFERENCES `empleado_obra`.`ES -UN` (`EMPLEADO_DE_OBRA_cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleado_obra`.`FACULTAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado_obra`.`FACULTAD` (
  `cod-facultad` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `A-F_ARQUITECTO_num-colegiado` INT NOT NULL,
  `A-F_ARQUITECTO_ES -UN_EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`cod-facultad`, `A-F_ARQUITECTO_num-colegiado`, `A-F_ARQUITECTO_ES -UN_EMPLEADO_DE_OBRA_cod-empleado`),
  INDEX `fk_FACULTAD_A-F1_idx` (`A-F_ARQUITECTO_num-colegiado` ASC, `A-F_ARQUITECTO_ES -UN_EMPLEADO_DE_OBRA_cod-empleado` ASC) VISIBLE,
  CONSTRAINT `fk_FACULTAD_A-F1`
    FOREIGN KEY (`A-F_ARQUITECTO_num-colegiado` , `A-F_ARQUITECTO_ES -UN_EMPLEADO_DE_OBRA_cod-empleado`)
    REFERENCES `empleado_obra`.`A-F` (`ARQUITECTO_num-colegiado` , `ARQUITECTO_ES -UN_EMPLEADO_DE_OBRA_cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleado_obra`.`C-A`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado_obra`.`C-A` (
  `CAPATAZ_ES -UN_EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  `CAPATAZ_C-A_cargo` INT NOT NULL,
  `C-A_has_ALBAÑIL_C-A_cargo` INT NOT NULL,
  `C-A_has_ALBAÑIL_ALBAÑIL_ES -UN_EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  `ALBAÑIL_ES -UN_EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  INDEX `fk_C-A_CAPATAZ1_idx` (`CAPATAZ_ES -UN_EMPLEADO_DE_OBRA_cod-empleado` ASC, `CAPATAZ_C-A_cargo` ASC) VISIBLE,
  INDEX `fk_C-A_ALBAÑIL1_idx` (`ALBAÑIL_ES -UN_EMPLEADO_DE_OBRA_cod-empleado` ASC) VISIBLE,
  CONSTRAINT `fk_C-A_CAPATAZ1`
    FOREIGN KEY (`CAPATAZ_ES -UN_EMPLEADO_DE_OBRA_cod-empleado` , `CAPATAZ_C-A_cargo`)
    REFERENCES `empleado_obra`.`CAPATAZ` (`ES -UN_EMPLEADO_DE_OBRA_cod-empleado` , `C-A_cargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_C-A_ALBAÑIL1`
    FOREIGN KEY (`ALBAÑIL_ES -UN_EMPLEADO_DE_OBRA_cod-empleado`)
    REFERENCES `empleado_obra`.`ALBAÑIL` (`ES -UN_EMPLEADO_DE_OBRA_cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleado_obra`.`HERRAMIENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado_obra`.`HERRAMIENTA` (
  `cod-herramienta` INT NOT NULL,
  `nombre-herramienta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod-herramienta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleado_obra`.`E-E_has_EDIFICIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado_obra`.`E-E_has_EDIFICIO` (
  `E-E_EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  `EDIFICIO_cod-edif` INT NOT NULL,
  PRIMARY KEY (`E-E_EMPLEADO_DE_OBRA_cod-empleado`, `EDIFICIO_cod-edif`),
  INDEX `fk_E-E_has_EDIFICIO_EDIFICIO1_idx` (`EDIFICIO_cod-edif` ASC) VISIBLE,
  INDEX `fk_E-E_has_EDIFICIO_E-E1_idx` (`E-E_EMPLEADO_DE_OBRA_cod-empleado` ASC) VISIBLE,
  CONSTRAINT `fk_E-E_has_EDIFICIO_E-E1`
    FOREIGN KEY (`E-E_EMPLEADO_DE_OBRA_cod-empleado`)
    REFERENCES `empleado_obra`.`E-E` (`EMPLEADO_DE_OBRA_cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_E-E_has_EDIFICIO_EDIFICIO1`
    FOREIGN KEY (`EDIFICIO_cod-edif`)
    REFERENCES `empleado_obra`.`EDIFICIO` (`cod-edif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `empleado_obra`.`A-H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empleado_obra`.`A-H` (
  `ALBAÑIL_ES -UN_EMPLEADO_DE_OBRA_cod-empleado` INT NOT NULL,
  `HERRAMIENTA_cod-herramienta` INT NOT NULL,
  PRIMARY KEY (`ALBAÑIL_ES -UN_EMPLEADO_DE_OBRA_cod-empleado`, `HERRAMIENTA_cod-herramienta`),
  INDEX `fk_ALBAÑIL_has_HERRAMIENTA_HERRAMIENTA1_idx` (`HERRAMIENTA_cod-herramienta` ASC) VISIBLE,
  INDEX `fk_ALBAÑIL_has_HERRAMIENTA_ALBAÑIL1_idx` (`ALBAÑIL_ES -UN_EMPLEADO_DE_OBRA_cod-empleado` ASC) VISIBLE,
  CONSTRAINT `fk_ALBAÑIL_has_HERRAMIENTA_ALBAÑIL1`
    FOREIGN KEY (`ALBAÑIL_ES -UN_EMPLEADO_DE_OBRA_cod-empleado`)
    REFERENCES `empleado_obra`.`ALBAÑIL` (`ES -UN_EMPLEADO_DE_OBRA_cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ALBAÑIL_has_HERRAMIENTA_HERRAMIENTA1`
    FOREIGN KEY (`HERRAMIENTA_cod-herramienta`)
    REFERENCES `empleado_obra`.`HERRAMIENTA` (`cod-herramienta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
