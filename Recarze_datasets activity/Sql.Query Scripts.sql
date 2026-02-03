-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema data_science_salary
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema data_science_salary
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `data_science_salary` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `data_science_salary` ;

-- -----------------------------------------------------
-- Table `data_science_salary`.`salary_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_science_salary`.`salary_data` (
  `id` INT NULL DEFAULT NULL,
  `work_year` INT NULL DEFAULT NULL,
  `experience_level` VARCHAR(50) NULL DEFAULT NULL,
  `employment_type` VARCHAR(30) NULL DEFAULT NULL,
  `job_title` VARCHAR(40) NULL DEFAULT NULL,
  `salary` INT NULL DEFAULT NULL,
  `salary_currency` VARCHAR(50) NULL DEFAULT NULL,
  `salary_in_usd` INT NULL DEFAULT NULL,
  `employee_residence` VARCHAR(70) NULL DEFAULT NULL,
  `remote_ratio` INT NULL DEFAULT NULL,
  `company_location` VARCHAR(40) NULL DEFAULT NULL,
  `company_size` VARCHAR(50) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
