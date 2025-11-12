-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bdpandoo
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bdpandoo` ;

-- -----------------------------------------------------
-- Schema bdpandoo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdpandoo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bdpandoo` ;

-- -----------------------------------------------------
-- Table `bdpandoo`.`Curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bdpandoo`.`Curso` ;

CREATE TABLE IF NOT EXISTS `bdpandoo`.`Curso` (
  `idCurso` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NOT NULL,
  `orden` INT NULL,
  PRIMARY KEY (`idCurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdpandoo`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bdpandoo`.`User` ;

CREATE TABLE IF NOT EXISTS `bdpandoo`.`User` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(16) NULL,
  `email` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(32) NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdpandoo`.`Inscripcion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bdpandoo`.`Inscripcion` ;

CREATE TABLE IF NOT EXISTS `bdpandoo`.`Inscripcion` (
  `idInscripcion` INT NOT NULL AUTO_INCREMENT,
  `fechaInscripcion` TIMESTAMP NOT NULL,
  `Curso_idCurso` INT NOT NULL,
  `User_iduser` INT NOT NULL,
  INDEX `fk_Curso_has_user_Curso1_idx` (`Curso_idCurso` ASC) VISIBLE,
  PRIMARY KEY (`idInscripcion`),
  INDEX `fk_Inscripcion_User1_idx` (`User_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_has_user_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `bdpandoo`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inscripcion_User1`
    FOREIGN KEY (`User_iduser`)
    REFERENCES `bdpandoo`.`User` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdpandoo`.`Actvidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bdpandoo`.`Actvidad` ;

CREATE TABLE IF NOT EXISTS `bdpandoo`.`Actvidad` (
  `idActividad` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `orden` INT NOT NULL,
  `Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`idActividad`),
  INDEX `fk_Unidad_Curso1_idx` (`Curso_idCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Unidad_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `bdpandoo`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdpandoo`.`Tipo_ejercicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bdpandoo`.`Tipo_ejercicio` ;

CREATE TABLE IF NOT EXISTS `bdpandoo`.`Tipo_ejercicio` (
  `idTipo_ejercicio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_ejercicio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdpandoo`.`Ejercicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bdpandoo`.`Ejercicio` ;

CREATE TABLE IF NOT EXISTS `bdpandoo`.`Ejercicio` (
  `idEjercicio` INT NOT NULL,
  `enunciado` VARCHAR(45) NOT NULL,
  `orden` INT NULL,
  `metadata` JSON NULL,
  `Unidad_idUnidad` INT NOT NULL,
  `Tipo_ejercicio_idTipo_ejercicio` INT NOT NULL,
  PRIMARY KEY (`idEjercicio`),
  INDEX `fk_Actividad_Unidad1_idx` (`Unidad_idUnidad` ASC) VISIBLE,
  INDEX `fk_Ejercicio_Tipo_ejercicio1_idx` (`Tipo_ejercicio_idTipo_ejercicio` ASC) VISIBLE,
  CONSTRAINT `fk_Actividad_Unidad1`
    FOREIGN KEY (`Unidad_idUnidad`)
    REFERENCES `bdpandoo`.`Actvidad` (`idActividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ejercicio_Tipo_ejercicio1`
    FOREIGN KEY (`Tipo_ejercicio_idTipo_ejercicio`)
    REFERENCES `bdpandoo`.`Tipo_ejercicio` (`idTipo_ejercicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdpandoo`.`Progreso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bdpandoo`.`Progreso` ;

CREATE TABLE IF NOT EXISTS `bdpandoo`.`Progreso` (
  `idProgreso` INT NOT NULL AUTO_INCREMENT,
  `fecha` TIMESTAMP NOT NULL,
  `Ejercicio_idEjercicio` INT NOT NULL,
  `User_iduser` INT NOT NULL,
  PRIMARY KEY (`idProgreso`),
  INDEX `fk_Progreso_Ejercicio1_idx` (`Ejercicio_idEjercicio` ASC) VISIBLE,
  INDEX `fk_Progreso_User1_idx` (`User_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_Progreso_Ejercicio1`
    FOREIGN KEY (`Ejercicio_idEjercicio`)
    REFERENCES `bdpandoo`.`Ejercicio` (`idEjercicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Progreso_User1`
    FOREIGN KEY (`User_iduser`)
    REFERENCES `bdpandoo`.`User` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
