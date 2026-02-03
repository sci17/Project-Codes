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
CREATE SCHEMA IF NOT EXISTS `drill` DEFAULT CHARACTER SET utf8 ;
USE `drill` ;

-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`employees` (
  `idemployees` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `name_extension` VARCHAR(5) NULL,
  `birthdate` DATE NOT NULL,
  `birth_city` VARCHAR(45) NOT NULL,
  `birth_province` VARCHAR(45) NOT NULL,
  `birth_country` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(7) NOT NULL,
  `civil_status` VARCHAR(10) NOT NULL,
  `height_in_meter` FLOAT NOT NULL,
  `weight_in_kg` FLOAT NOT NULL,
  `contactno` VARCHAR(45) NOT NULL,
  `blood_type` VARCHAR(45) NOT NULL,
  `gsis_no` VARCHAR(45) NULL,
  `sss_no` VARCHAR(45) NULL,
  `philhealthno` VARCHAR(45) NULL,
  `tin` VARCHAR(45) NOT NULL,
  `employee_no` INT NOT NULL,
  `citizenship` VARCHAR(45) NOT NULL,
  `res_spec_address` VARCHAR(45) NULL,
  `res_street_address` VARCHAR(45) NULL,
  `res_vill_address` VARCHAR(45) NULL,
  `res_barangay_address` VARCHAR(45) NOT NULL,
  `res_city` VARCHAR(45) NOT NULL,
  `res_municipality` VARCHAR(45) NOT NULL,
  `res_province` VARCHAR(45) NOT NULL,
  `res_zipcode` VARCHAR(45) NOT NULL,
  `perm_spec_address` VARCHAR(45) NULL,
  `perm_street_address` VARCHAR(45) NULL,
  `perm_vill_address` VARCHAR(45) NULL,
  `perm_barangay_address` VARCHAR(45) NOT NULL,
  `perm_city` VARCHAR(45) NOT NULL,
  `perm_municipality` VARCHAR(45) NOT NULL,
  `perm_province` VARCHAR(45) NOT NULL,
  `perm_zipcode` VARCHAR(45) NOT NULL,
  `telephone` VARCHAR(45) NULL,
  `mobile_no` VARCHAR(15) NOT NULL,
  `email` VARCHAR(45) NULL,
  `Q34A` TINYINT NOT NULL,
  `Q34B` TINYINT NOT NULL,
  `Q34_details` VARCHAR(45) NULL,
  `Q35a` TINYINT NOT NULL,
  `Q35b` TINYINT NOT NULL,
  `Q35_details` VARCHAR(45) NULL,
  `Q36` VARCHAR(45) NOT NULL,
  `Q36_details` VARCHAR(45) NULL,
  `Q37` TINYINT NOT NULL,
  `Q37_details` VARCHAR(45) NULL,
  `Q38a` TINYINT NOT NULL,
  `Q38b` TINYINT NOT NULL,
  `Q38_details` VARCHAR(45) NULL,
  `Q39a` TINYINT NOT NULL,
  `Q39b` TINYINT NOT NULL,
  `Q39_details` VARCHAR(45) NULL,
  `Q40a` TINYINT NOT NULL,
  `Q40a_details` VARCHAR(45) NULL,
  `Q40b` TINYINT NOT NULL,
  `Q40b_details` VARCHAR(45) NULL,
  `Q40c` TINYINT NOT NULL,
  `Q40c_details` VARCHAR(45) NULL,
  PRIMARY KEY (`idemployees`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`job_positions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`job_positions` (
  `idjob_positions` INT NOT NULL,
  `job_category` VARCHAR(45) NOT NULL,
  `Job_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idjob_positions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`contract_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`contract_types` (
  `idcontract_types` INT NOT NULL,
  `contract_classification` VARCHAR(45) NULL,
  `contract_description` VARCHAR(45) NULL,
  PRIMARY KEY (`idcontract_types`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`institutions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`institutions` (
  `idinstitutions` INT NOT NULL,
  `institution_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idinstitutions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`service_records`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`service_records` (
  `employees_idemployees` INT NOT NULL,
  `job_positions_idjob_positions` INT NOT NULL,
  `appointment_start_date` DATE NOT NULL,
  `appointment_end_date` DATE NOT NULL,
  `institutions_idinstitutions` INT NOT NULL,
  `monthly_salary` DOUBLE NOT NULL,
  `pay_grade` VARCHAR(45) NOT NULL,
  `contract_types_idcontract_types` INT NOT NULL,
  `gov_service` TINYINT NOT NULL,
  PRIMARY KEY (`employees_idemployees`, `job_positions_idjob_positions`),
  INDEX `fk_employees_has_job_positions_job_positions1_idx` (`job_positions_idjob_positions` ASC) VISIBLE,
  INDEX `fk_employees_has_job_positions_employees_idx` (`employees_idemployees` ASC) VISIBLE,
  INDEX `fk_service_records_contract_types1_idx` (`contract_types_idcontract_types` ASC) VISIBLE,
  INDEX `fk_service_records_institutions1_idx` (`institutions_idinstitutions` ASC) VISIBLE,
  CONSTRAINT `fk_employees_has_job_positions_employees`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `mydb`.`employees` (`idemployees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_job_positions_job_positions1`
    FOREIGN KEY (`job_positions_idjob_positions`)
    REFERENCES `mydb`.`job_positions` (`idjob_positions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_records_contract_types1`
    FOREIGN KEY (`contract_types_idcontract_types`)
    REFERENCES `mydb`.`contract_types` (`idcontract_types`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_records_institutions1`
    FOREIGN KEY (`institutions_idinstitutions`)
    REFERENCES `mydb`.`institutions` (`idinstitutions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`departments` (
  `iddepartments` INT NOT NULL,
  `dept_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddepartments`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees_unitassignments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`employees_unitassignments` (
  `employees_idemployees` INT NOT NULL,
  `departments_iddepartments` INT NOT NULL,
  `transfer_date` DATE NOT NULL,
  PRIMARY KEY (`employees_idemployees`, `departments_iddepartments`),
  INDEX `fk_employees_has_departments_departments1_idx` (`departments_iddepartments` ASC) VISIBLE,
  INDEX `fk_employees_has_departments_employees1_idx` (`employees_idemployees` ASC) VISIBLE,
  CONSTRAINT `fk_employees_has_departments_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `mydb`.`employees` (`idemployees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_departments_departments1`
    FOREIGN KEY (`departments_iddepartments`)
    REFERENCES `mydb`.`departments` (`iddepartments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`trainings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`trainings` (
  `idtrainings` INT NOT NULL,
  `training_venue` VARCHAR(45) NOT NULL,
  `training_type` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `training_title` VARCHAR(45) NOT NULL,
  `institutions_idinstitutions` INT NOT NULL,
  PRIMARY KEY (`idtrainings`),
  INDEX `fk_trainings_institutions1_idx` (`institutions_idinstitutions` ASC) VISIBLE,
  CONSTRAINT `fk_trainings_institutions1`
    FOREIGN KEY (`institutions_idinstitutions`)
    REFERENCES `mydb`.`institutions` (`idinstitutions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees_has_trainings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`employees_has_trainings` (
  `employees_idemployees` INT NOT NULL,
  `trainings_idtrainings` INT NOT NULL,
  `participation_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employees_idemployees`, `trainings_idtrainings`),
  INDEX `fk_employees_has_trainings_trainings1_idx` (`trainings_idtrainings` ASC) VISIBLE,
  INDEX `fk_employees_has_trainings_employees1_idx` (`employees_idemployees` ASC) VISIBLE,
  CONSTRAINT `fk_employees_has_trainings_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `mydb`.`employees` (`idemployees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_trainings_trainings1`
    FOREIGN KEY (`trainings_idtrainings`)
    REFERENCES `mydb`.`trainings` (`idtrainings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Relatives`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`Relatives` (
  `idrelatives` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `name_extension` VARCHAR(5) NOT NULL,
  `Occupation` VARCHAR(45) NOT NULL,
  `Emp_business` VARCHAR(45) NOT NULL,
  `business_address` VARCHAR(100) NOT NULL,
  `telephone` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  PRIMARY KEY (`idrelatives`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees_relatives`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`employees_relatives` (
  `Relatives_idrelatives` INT NOT NULL,
  `employees_idemployees` INT NOT NULL,
  `relationship` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Relatives_idrelatives`, `employees_idemployees`),
  INDEX `fk_Relatives_has_employees_employees1_idx` (`employees_idemployees` ASC) VISIBLE,
  INDEX `fk_Relatives_has_employees_Relatives1_idx` (`Relatives_idrelatives` ASC) VISIBLE,
  CONSTRAINT `fk_Relatives_has_employees_Relatives1`
    FOREIGN KEY (`Relatives_idrelatives`)
    REFERENCES `mydb`.`Relatives` (`idrelatives`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Relatives_has_employees_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `mydb`.`employees` (`idemployees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees_education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`employees_education` (
  `institutions_idinstitutions` INT NOT NULL,
  `employees_idemployees` INT NOT NULL,
  `Education_degree` VARCHAR(45) NOT NULL,
  `start_period` DATE NOT NULL,
  `end_period` DATE NOT NULL,
  `units_earned` INT NOT NULL,
  `year_graduated` DATE NOT NULL,
  `scholarships` VARCHAR(100) NOT NULL,
  `acad_honors` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`institutions_idinstitutions`, `employees_idemployees`),
  INDEX `fk_institutions_has_employees_employees1_idx` (`employees_idemployees` ASC) VISIBLE,
  INDEX `fk_institutions_has_employees_institutions1_idx` (`institutions_idinstitutions` ASC) VISIBLE,
  CONSTRAINT `fk_institutions_has_employees_institutions1`
    FOREIGN KEY (`institutions_idinstitutions`)
    REFERENCES `mydb`.`institutions` (`idinstitutions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_institutions_has_employees_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `mydb`.`employees` (`idemployees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`professional_exams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`professional_exams` (
  `idprofessional_exams` INT NOT NULL,
  `Exam_description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idprofessional_exams`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees_prof_eligibility`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`employees_prof_eligibility` (
  `professional_exams_idprofessional_exams` INT NOT NULL,
  `employees_idemployees` INT NOT NULL,
  `rating` FLOAT NOT NULL,
  `exam_date` DATE NOT NULL,
  `exam_place` VARCHAR(100) NOT NULL,
  `license_no` VARCHAR(45) NOT NULL,
  `license_validity` DATE NOT NULL,
  PRIMARY KEY (`professional_exams_idprofessional_exams`, `employees_idemployees`),
  INDEX `fk_professional_exams_has_employees_employees1_idx` (`employees_idemployees` ASC) VISIBLE,
  INDEX `fk_professional_exams_has_employees_professional_exams1_idx` (`professional_exams_idprofessional_exams` ASC) VISIBLE,
  CONSTRAINT `fk_professional_exams_has_employees_professional_exams1`
    FOREIGN KEY (`professional_exams_idprofessional_exams`)
    REFERENCES `mydb`.`professional_exams` (`idprofessional_exams`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professional_exams_has_employees_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `mydb`.`employees` (`idemployees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees_ext_involvements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`employees_ext_involvements` (
  `employees_idemployees` INT NOT NULL,
  `institutions_idinstitutions` INT NOT NULL,
  `involvement_type` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `no_hours` INT NOT NULL,
  `work_nature` VARCHAR(45) NOT NULL DEFAULT 'not applicable',
  PRIMARY KEY (`employees_idemployees`, `institutions_idinstitutions`),
  INDEX `fk_employees_has_institutions_institutions1_idx` (`institutions_idinstitutions` ASC) VISIBLE,
  INDEX `fk_employees_has_institutions_employees1_idx` (`employees_idemployees` ASC) VISIBLE,
  CONSTRAINT `fk_employees_has_institutions_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `mydb`.`employees` (`idemployees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_institutions_institutions1`
    FOREIGN KEY (`institutions_idinstitutions`)
    REFERENCES `mydb`.`institutions` (`idinstitutions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`skills` (
  `idskills` INT NOT NULL,
  `skill_type` VARCHAR(45) NOT NULL,
  `skill_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idskills`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`skills_has_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drill`.`skills_has_employees` (
  `skills_idskills` INT NOT NULL,
  `employees_idemployees` INT NOT NULL,
  `skill_level` VARCHAR(45) NULL,
  PRIMARY KEY (`skills_idskills`, `employees_idemployees`),
  INDEX `fk_skills_has_employees_employees1_idx` (`employees_idemployees` ASC) VISIBLE,
  INDEX `fk_skills_has_employees_skills1_idx` (`skills_idskills` ASC) VISIBLE,
  CONSTRAINT `fk_skills_has_employees_skills1`
    FOREIGN KEY (`skills_idskills`)
    REFERENCES `mydb`.`skills` (`idskills`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_skills_has_employees_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `mydb`.`employees` (`idemployees`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
