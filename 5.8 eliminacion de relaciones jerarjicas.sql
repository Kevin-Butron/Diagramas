-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`EDIFICIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EDIFICIO` (
  `cod-edif` INT NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod-edif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`E-A`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`E-A` (
  `fecha-inicio` VARCHAR(45) NOT NULL,
  `fecha-fin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`fecha-inicio`, `fecha-fin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`E-C`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`E-C` (
  `fecha-inicio` INT NOT NULL,
  `fecha-fin` VARCHAR(45) NOT NULL,
  `EDIFICIO_cod-edif` INT NOT NULL,
  PRIMARY KEY (`EDIFICIO_cod-edif`),
  CONSTRAINT `fk_E-C_EDIFICIO`
    FOREIGN KEY (`EDIFICIO_cod-edif`)
    REFERENCES `mydb`.`EDIFICIO` (`cod-edif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`E-AL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`E-AL` (
  `fecha-inicio` INT NOT NULL,
  `fecha-fin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`fecha-inicio`, `fecha-fin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ARQUITECTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ARQUITECTO` (
  `cod-empleado` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  `num-colegiado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod-empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CAPATAZ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CAPATAZ` (
  `cod-empleado` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`cod-empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ALBAÑIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ALBAÑIL` (
  `cod-empleado` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod-empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`A-F`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`A-F` (
  `ARQUITECTO_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`ARQUITECTO_cod-empleado`),
  CONSTRAINT `fk_A-F_ARQUITECTO1`
    FOREIGN KEY (`ARQUITECTO_cod-empleado`)
    REFERENCES `mydb`.`ARQUITECTO` (`cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FACULTAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FACULTAD` (
  `cod-facultad` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `A-F_ARQUITECTO_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`cod-facultad`, `A-F_ARQUITECTO_cod-empleado`),
  INDEX `fk_FACULTAD_A-F1_idx` (`A-F_ARQUITECTO_cod-empleado` ASC) VISIBLE,
  CONSTRAINT `fk_FACULTAD_A-F1`
    FOREIGN KEY (`A-F_ARQUITECTO_cod-empleado`)
    REFERENCES `mydb`.`A-F` (`ARQUITECTO_cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`C-A`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`C-A` (
  `CAPATAZ_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`CAPATAZ_cod-empleado`),
  CONSTRAINT `fk_C-A_CAPATAZ1`
    FOREIGN KEY (`CAPATAZ_cod-empleado`)
    REFERENCES `mydb`.`CAPATAZ` (`cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`A-H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`A-H` (
  `utiliza` INT NOT NULL,
  PRIMARY KEY (`utiliza`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HERRAMIENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HERRAMIENTA` (
  `cod-herrami` INT NOT NULL,
  `nombre-herram` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod-herrami`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`E-C_has_CAPATAZ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`E-C_has_CAPATAZ` (
  `E-C_EDIFICIO_cod-edif` INT NOT NULL,
  `CAPATAZ_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`E-C_EDIFICIO_cod-edif`, `CAPATAZ_cod-empleado`),
  INDEX `fk_E-C_has_CAPATAZ_CAPATAZ1_idx` (`CAPATAZ_cod-empleado` ASC) VISIBLE,
  INDEX `fk_E-C_has_CAPATAZ_E-C1_idx` (`E-C_EDIFICIO_cod-edif` ASC) VISIBLE,
  CONSTRAINT `fk_E-C_has_CAPATAZ_E-C1`
    FOREIGN KEY (`E-C_EDIFICIO_cod-edif`)
    REFERENCES `mydb`.`E-C` (`EDIFICIO_cod-edif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_E-C_has_CAPATAZ_CAPATAZ1`
    FOREIGN KEY (`CAPATAZ_cod-empleado`)
    REFERENCES `mydb`.`CAPATAZ` (`cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`C-A_has_ALBAÑIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`C-A_has_ALBAÑIL` (
  `C-A_CAPATAZ_cod-empleado` INT NOT NULL,
  `ALBAÑIL_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`C-A_CAPATAZ_cod-empleado`, `ALBAÑIL_cod-empleado`),
  INDEX `fk_C-A_has_ALBAÑIL_ALBAÑIL1_idx` (`ALBAÑIL_cod-empleado` ASC) VISIBLE,
  INDEX `fk_C-A_has_ALBAÑIL_C-A1_idx` (`C-A_CAPATAZ_cod-empleado` ASC) VISIBLE,
  CONSTRAINT `fk_C-A_has_ALBAÑIL_C-A1`
    FOREIGN KEY (`C-A_CAPATAZ_cod-empleado`)
    REFERENCES `mydb`.`C-A` (`CAPATAZ_cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_C-A_has_ALBAÑIL_ALBAÑIL1`
    FOREIGN KEY (`ALBAÑIL_cod-empleado`)
    REFERENCES `mydb`.`ALBAÑIL` (`cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`E-A_has_EDIFICIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`E-A_has_EDIFICIO` (
  `E-A_fecha-inicio` VARCHAR(45) NOT NULL,
  `E-A_fecha-fin` VARCHAR(45) NOT NULL,
  `EDIFICIO_cod-edif` INT NOT NULL,
  PRIMARY KEY (`E-A_fecha-inicio`, `E-A_fecha-fin`, `EDIFICIO_cod-edif`),
  INDEX `fk_E-A_has_EDIFICIO_EDIFICIO1_idx` (`EDIFICIO_cod-edif` ASC) VISIBLE,
  INDEX `fk_E-A_has_EDIFICIO_E-A1_idx` (`E-A_fecha-inicio` ASC, `E-A_fecha-fin` ASC) VISIBLE,
  CONSTRAINT `fk_E-A_has_EDIFICIO_E-A1`
    FOREIGN KEY (`E-A_fecha-inicio` , `E-A_fecha-fin`)
    REFERENCES `mydb`.`E-A` (`fecha-inicio` , `fecha-fin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_E-A_has_EDIFICIO_EDIFICIO1`
    FOREIGN KEY (`EDIFICIO_cod-edif`)
    REFERENCES `mydb`.`EDIFICIO` (`cod-edif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`E-AL_has_EDIFICIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`E-AL_has_EDIFICIO` (
  `E-AL_fecha-inicio` INT NOT NULL,
  `E-AL_fecha-fin` VARCHAR(45) NOT NULL,
  `EDIFICIO_cod-edif` INT NOT NULL,
  PRIMARY KEY (`E-AL_fecha-inicio`, `E-AL_fecha-fin`, `EDIFICIO_cod-edif`),
  INDEX `fk_E-AL_has_EDIFICIO_EDIFICIO1_idx` (`EDIFICIO_cod-edif` ASC) VISIBLE,
  INDEX `fk_E-AL_has_EDIFICIO_E-AL1_idx` (`E-AL_fecha-inicio` ASC, `E-AL_fecha-fin` ASC) VISIBLE,
  CONSTRAINT `fk_E-AL_has_EDIFICIO_E-AL1`
    FOREIGN KEY (`E-AL_fecha-inicio` , `E-AL_fecha-fin`)
    REFERENCES `mydb`.`E-AL` (`fecha-inicio` , `fecha-fin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_E-AL_has_EDIFICIO_EDIFICIO1`
    FOREIGN KEY (`EDIFICIO_cod-edif`)
    REFERENCES `mydb`.`EDIFICIO` (`cod-edif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`E-A_has_ARQUITECTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`E-A_has_ARQUITECTO` (
  `E-A_fecha-inicio` VARCHAR(45) NOT NULL,
  `E-A_fecha-fin` VARCHAR(45) NOT NULL,
  `ARQUITECTO_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`E-A_fecha-inicio`, `E-A_fecha-fin`, `ARQUITECTO_cod-empleado`),
  INDEX `fk_E-A_has_ARQUITECTO_ARQUITECTO1_idx` (`ARQUITECTO_cod-empleado` ASC) VISIBLE,
  INDEX `fk_E-A_has_ARQUITECTO_E-A1_idx` (`E-A_fecha-inicio` ASC, `E-A_fecha-fin` ASC) VISIBLE,
  CONSTRAINT `fk_E-A_has_ARQUITECTO_E-A1`
    FOREIGN KEY (`E-A_fecha-inicio` , `E-A_fecha-fin`)
    REFERENCES `mydb`.`E-A` (`fecha-inicio` , `fecha-fin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_E-A_has_ARQUITECTO_ARQUITECTO1`
    FOREIGN KEY (`ARQUITECTO_cod-empleado`)
    REFERENCES `mydb`.`ARQUITECTO` (`cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`E-AL_has_ALBAÑIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`E-AL_has_ALBAÑIL` (
  `E-AL_fecha-inicio` INT NOT NULL,
  `E-AL_fecha-fin` VARCHAR(45) NOT NULL,
  `ALBAÑIL_cod-empleado` INT NOT NULL,
  PRIMARY KEY (`E-AL_fecha-inicio`, `E-AL_fecha-fin`, `ALBAÑIL_cod-empleado`),
  INDEX `fk_E-AL_has_ALBAÑIL_ALBAÑIL1_idx` (`ALBAÑIL_cod-empleado` ASC) VISIBLE,
  INDEX `fk_E-AL_has_ALBAÑIL_E-AL1_idx` (`E-AL_fecha-inicio` ASC, `E-AL_fecha-fin` ASC) VISIBLE,
  CONSTRAINT `fk_E-AL_has_ALBAÑIL_E-AL1`
    FOREIGN KEY (`E-AL_fecha-inicio` , `E-AL_fecha-fin`)
    REFERENCES `mydb`.`E-AL` (`fecha-inicio` , `fecha-fin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_E-AL_has_ALBAÑIL_ALBAÑIL1`
    FOREIGN KEY (`ALBAÑIL_cod-empleado`)
    REFERENCES `mydb`.`ALBAÑIL` (`cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ALBAÑIL_has_A-H`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ALBAÑIL_has_A-H` (
  `ALBAÑIL_cod-empleado` INT NOT NULL,
  `A-H_utiliza` INT NOT NULL,
  PRIMARY KEY (`ALBAÑIL_cod-empleado`, `A-H_utiliza`),
  INDEX `fk_ALBAÑIL_has_A-H_A-H1_idx` (`A-H_utiliza` ASC) VISIBLE,
  INDEX `fk_ALBAÑIL_has_A-H_ALBAÑIL1_idx` (`ALBAÑIL_cod-empleado` ASC) VISIBLE,
  CONSTRAINT `fk_ALBAÑIL_has_A-H_ALBAÑIL1`
    FOREIGN KEY (`ALBAÑIL_cod-empleado`)
    REFERENCES `mydb`.`ALBAÑIL` (`cod-empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ALBAÑIL_has_A-H_A-H1`
    FOREIGN KEY (`A-H_utiliza`)
    REFERENCES `mydb`.`A-H` (`utiliza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`A-H_has_HERRAMIENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`A-H_has_HERRAMIENTA` (
  `A-H_utiliza` INT NOT NULL,
  `HERRAMIENTA_cod-herrami` INT NOT NULL,
  PRIMARY KEY (`A-H_utiliza`, `HERRAMIENTA_cod-herrami`),
  INDEX `fk_A-H_has_HERRAMIENTA_HERRAMIENTA1_idx` (`HERRAMIENTA_cod-herrami` ASC) VISIBLE,
  INDEX `fk_A-H_has_HERRAMIENTA_A-H1_idx` (`A-H_utiliza` ASC) VISIBLE,
  CONSTRAINT `fk_A-H_has_HERRAMIENTA_A-H1`
    FOREIGN KEY (`A-H_utiliza`)
    REFERENCES `mydb`.`A-H` (`utiliza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_A-H_has_HERRAMIENTA_HERRAMIENTA1`
    FOREIGN KEY (`HERRAMIENTA_cod-herrami`)
    REFERENCES `mydb`.`HERRAMIENTA` (`cod-herrami`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
