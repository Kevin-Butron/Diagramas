-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ejemplos
-- -----------------------------------------------------
-- ejemplos de transicion
-- 

-- -----------------------------------------------------
-- Schema ejemplos
--
-- ejemplos de transicion
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ejemplos` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `ejemplos` ;

-- -----------------------------------------------------
-- Table `ejemplos`.`LIBRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejemplos`.`LIBRO` (
  `ISBN` INT NOT NULL,
  `titulo_principal` VARCHAR(45) NOT NULL,
  `subtitulo` VARCHAR(45) NULL,
  `editorial` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `idioma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ejemplos`.`AUTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejemplos`.`AUTOR` (
  `autor` VARCHAR(30) NOT NULL,
  `LIBRO_ISBN` INT NOT NULL,
  INDEX `fk_AUTOR_LIBRO1_idx` (`LIBRO_ISBN` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ejemplos`.`EDICION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ejemplos`.`EDICION` (
  `numero` INT NOT NULL,
  `año` INT NOT NULL,
  `LIBRO_ISBN` INT NOT NULL,
  INDEX `fk_EDICION_LIBRO_idx` (`LIBRO_ISBN` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
