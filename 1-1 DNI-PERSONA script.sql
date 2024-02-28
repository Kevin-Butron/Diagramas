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
-- Table `mydb`.`DNI`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DNI` (
  `Num-dni` INT NOT NULL,
  PRIMARY KEY (`Num-dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PERSONA` (
  `nombre` VARCHAR(20) NOT NULL,
  `apellido1` VARCHAR(15) NOT NULL,
  `apellido2` VARCHAR(15) NOT NULL,
  `DNI_Num-dni` INT NOT NULL,
  PRIMARY KEY (`DNI_Num-dni`),
  CONSTRAINT `fk_PERSONA_DNI`
    FOREIGN KEY (`DNI_Num-dni`)
    REFERENCES `mydb`.`DNI` (`Num-dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
