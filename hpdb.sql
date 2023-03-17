
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hpdb_test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hpdb_test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hpdb_test` ;
USE `hpdb_test` ;

-- -----------------------------------------------------
-- Table `hpdb_test`.`escuelas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`escuelas` (
  `id_escuela` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_escuela` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_escuela`))
ENGINE = InnoDB
AUTO_INCREMENT = 3;


-- -----------------------------------------------------
-- Table `hpdb_test`.`casas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`casas` (
  `id_casa` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_casa` VARCHAR(255) NOT NULL,
  `casa_escuela` INT(11) NOT NULL,
  PRIMARY KEY (`id_casa`),
  INDEX `casa_escuela_idx` (`casa_escuela` ASC) VISIBLE,
  CONSTRAINT `casa_escuela`
    FOREIGN KEY (`casa_escuela`)
    REFERENCES `hpdb_test`.`escuelas` (`id_escuela`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`escobas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`escobas` (
  `id_escoba` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_escoba` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_escoba`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`animales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`animales` (
  `id_animal` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_animal` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_animal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`familliares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`familliares` (
  `id_familliares` INT(11) NOT NULL AUTO_INCREMENT,
  `animal` INT(11) NOT NULL,
  PRIMARY KEY (`id_familliares`),
  INDEX `animal_familiar_idx` (`animal` ASC) VISIBLE,
  CONSTRAINT `animal_familiar`
    FOREIGN KEY (`animal`)
    REFERENCES `hpdb_test`.`animales` (`id_animal`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`hechizos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`hechizos` (
  `id_hechizo` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_hechizo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_hechizo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`patronus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`patronus` (
  `id_patronus` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_animal` INT(11) NOT NULL,
  `id_hechizo` INT(11) NOT NULL,
  PRIMARY KEY (`id_patronus`),
  INDEX `patronus_animal_idx` (`nombre_animal` ASC) VISIBLE,
  INDEX `id_hechizo_idx` (`id_hechizo` ASC) VISIBLE,
  CONSTRAINT `id_hechizo`
    FOREIGN KEY (`id_hechizo`)
    REFERENCES `hpdb_test`.`hechizos` (`id_hechizo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `patronus_animal`
    FOREIGN KEY (`nombre_animal`)
    REFERENCES `hpdb_test`.`animales` (`id_animal`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`razas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`razas` (
  `id_raza` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_raza` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_raza`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`varitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`varitas` (
  `id_varita` INT(11) NOT NULL AUTO_INCREMENT,
  `madera` VARCHAR(255) NOT NULL,
  `nucleo` VARCHAR(255) NOT NULL,
  `medida` FLOAT NOT NULL,
  `flexibilidad` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_varita`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`Alumnos` (
  `id_alumnos` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_alumno` VARCHAR(255) NOT NULL,
  `edad_alumno` INT(11) NOT NULL,
  `escuela` INT(11) NOT NULL,
  `casa` INT(11) NOT NULL,
  `raza` INT(11) NOT NULL,
  `varita` INT(11) NOT NULL,
  `escoba` INT(11) NOT NULL,
  `familiar` INT(11) NOT NULL,
  `patronus` INT(11) NOT NULL,
  PRIMARY KEY (`id_alumnos`),
  INDEX `alumno_escuela_idx` (`escuela` ASC) VISIBLE,
  INDEX `alumno_raza_idx` (`raza` ASC) VISIBLE,
  INDEX `alumno_varita_idx` (`varita` ASC) VISIBLE,
  INDEX `alumno_escoba_idx` (`escoba` ASC) VISIBLE,
  INDEX `alumno_familiar_idx` (`familiar` ASC) VISIBLE,
  INDEX `alumno_patronus_idx` (`patronus` ASC) VISIBLE,
  INDEX `alumno_casa_idx` (`casa` ASC) VISIBLE,
  CONSTRAINT `alumno_casa`
    FOREIGN KEY (`casa`)
    REFERENCES `hpdb_test`.`casas` (`id_casa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `alumno_escoba`
    FOREIGN KEY (`escoba`)
    REFERENCES `hpdb_test`.`escobas` (`id_escoba`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `alumno_escuela`
    FOREIGN KEY (`escuela`)
    REFERENCES `hpdb_test`.`escuelas` (`id_escuela`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `alumno_familiar`
    FOREIGN KEY (`familiar`)
    REFERENCES `hpdb_test`.`familliares` (`id_familliares`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `alumno_patronus`
    FOREIGN KEY (`patronus`)
    REFERENCES `hpdb_test`.`patronus` (`id_patronus`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `alumno_raza`
    FOREIGN KEY (`raza`)
    REFERENCES `hpdb_test`.`razas` (`id_raza`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `alumno_varita`
    FOREIGN KEY (`varita`)
    REFERENCES `hpdb_test`.`varitas` (`id_varita`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`Profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`Profesores` (
  `id_profesor` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_profesor` VARCHAR(255) NOT NULL,
  `edad_profesor` INT(11) NOT NULL,
  `escuela` INT(11) NOT NULL,
  `casa` INT(11) NOT NULL,
  `raza` INT(11) NOT NULL,
  `varita` INT(11) NOT NULL,
  `escoba` INT(11) NOT NULL,
  `familiar` INT(11) NOT NULL,
  `patronus` INT(11) NOT NULL,
  PRIMARY KEY (`id_profesor`),
  INDEX `profesor_escuela_idx` (`escuela` ASC) VISIBLE,
  INDEX `profesor_casa_idx` (`casa` ASC) VISIBLE,
  INDEX `profesor_raza_idx` (`raza` ASC) VISIBLE,
  INDEX `profesor_varita_idx` (`varita` ASC) VISIBLE,
  INDEX `profesor_escoba_idx` (`escoba` ASC) VISIBLE,
  INDEX `profesores_familiar_idx` (`familiar` ASC) VISIBLE,
  INDEX `profesores_patronus_idx` (`patronus` ASC) VISIBLE,
  CONSTRAINT `profesor_casa`
    FOREIGN KEY (`casa`)
    REFERENCES `hpdb_test`.`casas` (`id_casa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `profesor_escoba`
    FOREIGN KEY (`escoba`)
    REFERENCES `hpdb_test`.`escobas` (`id_escoba`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `profesor_escuela`
    FOREIGN KEY (`escuela`)
    REFERENCES `hpdb_test`.`escuelas` (`id_escuela`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `profesor_raza`
    FOREIGN KEY (`raza`)
    REFERENCES `hpdb_test`.`razas` (`id_raza`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `profesor_varita`
    FOREIGN KEY (`varita`)
    REFERENCES `hpdb_test`.`varitas` (`id_varita`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `profesores_familiar`
    FOREIGN KEY (`familiar`)
    REFERENCES `hpdb_test`.`familliares` (`id_familliares`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `profesores_patronus`
    FOREIGN KEY (`patronus`)
    REFERENCES `hpdb_test`.`patronus` (`id_patronus`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`cursos` (
  `id_curso` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_curso` VARCHAR(255) NOT NULL,
  `profesor` INT(11) NOT NULL,
  PRIMARY KEY (`id_curso`),
  INDEX `curso_profesor_idx` (`profesor` ASC) VISIBLE,
  CONSTRAINT `curso_profesor`
    FOREIGN KEY (`profesor`)
    REFERENCES `hpdb_test`.`Profesores` (`id_profesor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`alumnos_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`alumnos_cursos` (
  `id_alumnos_cursos` INT(11) NOT NULL AUTO_INCREMENT,
  `alumno` INT(11) NOT NULL,
  `curso` INT(11) NOT NULL,
  PRIMARY KEY (`id_alumnos_cursos`),
  INDEX `alumnos_cursos_alumnos_idx` (`alumno` ASC) VISIBLE,
  INDEX `alumnos_cursos_cursos_idx` (`curso` ASC) VISIBLE,
  CONSTRAINT `alumnos_cursos_alumnos`
    FOREIGN KEY (`alumno`)
    REFERENCES `hpdb_test`.`Alumnos` (`id_alumnos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `alumnos_cursos_cursos`
    FOREIGN KEY (`curso`)
    REFERENCES `hpdb_test`.`cursos` (`id_curso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`deportes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`deportes` (
  `id_deporte` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_deporte` VARCHAR(255) NOT NULL,
  `deporte_escuela` INT(11) NOT NULL,
  PRIMARY KEY (`id_deporte`),
  INDEX `deportes_escuela_idx` (`deporte_escuela` ASC) VISIBLE,
  CONSTRAINT `deportes_escuela`
    FOREIGN KEY (`deporte_escuela`)
    REFERENCES `hpdb_test`.`escuelas` (`id_escuela`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`alumnos_deportes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`alumnos_deportes` (
  `id_alumnos_deportes` INT(11) NOT NULL AUTO_INCREMENT,
  `alumno` INT(11) NOT NULL,
  `deporte` INT(11) NOT NULL,
  PRIMARY KEY (`id_alumnos_deportes`),
  INDEX `alumnos_deportes_alumnos_idx` (`alumno` ASC) VISIBLE,
  INDEX `alumnos_deportes_deporte_idx` (`deporte` ASC) VISIBLE,
  CONSTRAINT `alumnos_deportes_alumnos`
    FOREIGN KEY (`alumno`)
    REFERENCES `hpdb_test`.`Alumnos` (`id_alumnos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `alumnos_deportes_deporte`
    FOREIGN KEY (`deporte`)
    REFERENCES `hpdb_test`.`deportes` (`id_deporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`alumnos_hechizos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`alumnos_hechizos` (
  `id_alumnos_hechizos` INT(11) NOT NULL AUTO_INCREMENT,
  `alumno` INT(11) NOT NULL,
  `hechizo` INT(11) NOT NULL,
  PRIMARY KEY (`id_alumnos_hechizos`),
  INDEX `alumnos_hechizos_alumno_idx` (`alumno` ASC) VISIBLE,
  INDEX `alumnos_hechizos_hechizo_idx` (`hechizo` ASC) VISIBLE,
  CONSTRAINT `alumnos_hechizos_alumno`
    FOREIGN KEY (`alumno`)
    REFERENCES `hpdb_test`.`Alumnos` (`id_alumnos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `alumnos_hechizos_hechizo`
    FOREIGN KEY (`hechizo`)
    REFERENCES `hpdb_test`.`hechizos` (`id_hechizo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`lugares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`lugares` (
  `id_lugar` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_lugar` VARCHAR(255) NOT NULL,
  `lugar_escuela` INT(11) NOT NULL,
  PRIMARY KEY (`id_lugar`),
  INDEX `lugar_escuela_idx` (`lugar_escuela` ASC) VISIBLE,
  CONSTRAINT `lugar_escuela`
    FOREIGN KEY (`lugar_escuela`)
    REFERENCES `hpdb_test`.`escuelas` (`id_escuela`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hpdb_test`.`profesores_hechizos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hpdb_test`.`profesores_hechizos` (
  `id_profesorres_hechizos` INT(11) NOT NULL AUTO_INCREMENT,
  `profesor` INT(11) NOT NULL,
  `hechizo` INT(11) NOT NULL,
  PRIMARY KEY (`id_profesorres_hechizos`),
  INDEX `profesores_hechizos_profesor_idx` (`profesor` ASC) VISIBLE,
  INDEX `profesores_hechizos_hechizo_idx` (`hechizo` ASC) VISIBLE,
  CONSTRAINT `profesores_hechizos_hechizo`
    FOREIGN KEY (`hechizo`)
    REFERENCES `hpdb_test`.`hechizos` (`id_hechizo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `profesores_hechizos_profesor`
    FOREIGN KEY (`profesor`)
    REFERENCES `hpdb_test`.`Profesores` (`id_profesor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
