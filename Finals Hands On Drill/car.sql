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
CREATE SCHEMA IF NOT EXISTS `prac` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `prac` ;

-- -----------------------------------------------------
-- Table `mydb`.`contract_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`contract_types` (
  `idcontract_types` INT NOT NULL,
  `contract_classification` VARCHAR(45) NULL DEFAULT NULL,
  `contract_description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcontract_types`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `driver_license_number` VARCHAR(20) NOT NULL,
  `driver_license_expiry_date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `driver_license_number_UNIQUE` (`driver_license_number` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`insurance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`insurance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `options` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `option_name_UNIQUE` (`options` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`rental_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`rental_status` (
  `id` INT NOT NULL,
  `name` ENUM('reserved', 'active', 'completed', 'cancelled') NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`vehicle_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`vehicle_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `category_name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`vehicle` (
  `vin_id` VARCHAR(17) NOT NULL,
  `VEHICLE_CATEGORY_id` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `model_year` YEAR NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `license_plate` VARCHAR(15) NOT NULL,
  `engine_type` VARCHAR(45) NOT NULL,
  `transmission_type` VARCHAR(45) NOT NULL,
  `mileage` INT NOT NULL,
  `current_location` VARCHAR(45) NOT NULL,
  `daily_rental_rate` DOUBLE NOT NULL,
  `rental_status` ENUM('reserved', 'active', 'completed', 'cancelled') NOT NULL,
  `model_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`vin_id`),
  INDEX `fk_VEHICLE_VEHICLE_CATEGORY1_idx` (`VEHICLE_CATEGORY_id` ASC) VISIBLE,
  CONSTRAINT `fk_VEHICLE_VEHICLE_CATEGORY1`
    FOREIGN KEY (`VEHICLE_CATEGORY_id`)
    REFERENCES `mydb`.`vehicle_category` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`rental` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `RENTAL_STATUS_id` INT NOT NULL,
  `CUSTOMER_id` INT NOT NULL,
  `VEHICLE_vin_id` VARCHAR(17) NOT NULL,
  `start_date_time` DATETIME NOT NULL,
  `end_date_time` DATETIME NOT NULL,
  `pickup_location` VARCHAR(45) NOT NULL,
  `dropoff_location` VARCHAR(45) NOT NULL,
  `estimated_mileage_allowance` INT NOT NULL,
  `additional_services` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `RENTAL_STATUS_id`, `CUSTOMER_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_RENTAL_RENTAL_STATUS1_idx` (`RENTAL_STATUS_id` ASC) VISIBLE,
  INDEX `fk_RENTAL_VEHICLE1_idx` (`VEHICLE_vin_id` ASC) VISIBLE,
  INDEX `fk_RENTAL_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  CONSTRAINT `fk_RENTAL_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `prac`.`customer` (`id`),
  CONSTRAINT `fk_RENTAL_RENTAL_STATUS1`
    FOREIGN KEY (`RENTAL_STATUS_id`)
    REFERENCES `mydb`.`rental_status` (`id`),
  CONSTRAINT `fk_RENTAL_VEHICLE1`
    FOREIGN KEY (`VEHICLE_vin_id`)
    REFERENCES `prac`.`vehicle` (`vin_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `INSURANCE_id` INT NOT NULL,
  `rental_id` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `payment_date_time` DATETIME NOT NULL,
  `payment_method` VARCHAR(45) NOT NULL,
  `deposit` DOUBLE NULL DEFAULT NULL,
  `unpaid_balance` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_payment_rental_idx` (`rental_id` ASC) VISIBLE,
  INDEX `fk_PAYMENT_INSURANCE1_idx` (`INSURANCE_id` ASC) VISIBLE,
  CONSTRAINT `fk_PAYMENT_INSURANCE1`
    FOREIGN KEY (`INSURANCE_id`)
    REFERENCES `prac`.`insurance` (`id`),
  CONSTRAINT `fk_payment_rental`
    FOREIGN KEY (`rental_id`)
    REFERENCES `prac`.`rental` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`customer_refund`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`customer_refund` (
  `id` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `PAYMENT_id` INT NOT NULL,
  `CUSTOMER_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CUSTOMER_REFUND_PAYMENT1_idx` (`PAYMENT_id` ASC) VISIBLE,
  INDEX `fk_CUSTOMER_REFUND_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  CONSTRAINT `fk_CUSTOMER_REFUND_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `prac`.`customer` (`id`),
  CONSTRAINT `fk_CUSTOMER_REFUND_PAYMENT1`
    FOREIGN KEY (`PAYMENT_id`)
    REFERENCES `prac`.`payment` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`customer_rental_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`customer_rental_history` (
  `id` INT NOT NULL,
  `LATE_FEE_id` INT NOT NULL,
  `violation` VARCHAR(45) NULL DEFAULT NULL,
  `past_rental` VARCHAR(45) NULL DEFAULT NULL,
  `CUSTOMER_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CUSTOMER_RENTAL_HISTORY_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  CONSTRAINT `fk_CUSTOMER_RENTAL_HISTORY_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `prac`.`customer` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`departments` (
  `iddepartments` INT NOT NULL,
  `dept_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddepartments`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`employees` (
  `idemployees` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `name_extension` VARCHAR(5) NULL DEFAULT NULL,
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
  `gsis_no` VARCHAR(45) NULL DEFAULT NULL,
  `sss_no` VARCHAR(45) NULL DEFAULT NULL,
  `philhealthno` VARCHAR(45) NULL DEFAULT NULL,
  `tin` VARCHAR(45) NOT NULL,
  `employee_no` INT NOT NULL,
  `citizenship` VARCHAR(45) NOT NULL,
  `res_spec_address` VARCHAR(45) NULL DEFAULT NULL,
  `res_street_address` VARCHAR(45) NULL DEFAULT NULL,
  `res_vill_address` VARCHAR(45) NULL DEFAULT NULL,
  `res_barangay_address` VARCHAR(45) NOT NULL,
  `res_city` VARCHAR(45) NOT NULL,
  `res_municipality` VARCHAR(45) NOT NULL,
  `res_province` VARCHAR(45) NOT NULL,
  `res_zipcode` VARCHAR(45) NOT NULL,
  `perm_spec_address` VARCHAR(45) NULL DEFAULT NULL,
  `perm_street_address` VARCHAR(45) NULL DEFAULT NULL,
  `perm_vill_address` VARCHAR(45) NULL DEFAULT NULL,
  `perm_barangay_address` VARCHAR(45) NOT NULL,
  `perm_city` VARCHAR(45) NOT NULL,
  `perm_municipality` VARCHAR(45) NOT NULL,
  `perm_province` VARCHAR(45) NOT NULL,
  `perm_zipcode` VARCHAR(45) NOT NULL,
  `telephone` VARCHAR(45) NULL DEFAULT NULL,
  `mobile_no` VARCHAR(15) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `Q34A` TINYINT NOT NULL,
  `Q34B` TINYINT NOT NULL,
  `Q34_details` VARCHAR(45) NULL DEFAULT NULL,
  `Q35a` TINYINT NOT NULL,
  `Q35b` TINYINT NOT NULL,
  `Q35_details` VARCHAR(45) NULL DEFAULT NULL,
  `Q36` VARCHAR(45) NOT NULL,
  `Q36_details` VARCHAR(45) NULL DEFAULT NULL,
  `Q37` TINYINT NOT NULL,
  `Q37_details` VARCHAR(45) NULL DEFAULT NULL,
  `Q38a` TINYINT NOT NULL,
  `Q38b` TINYINT NOT NULL,
  `Q38_details` VARCHAR(45) NULL DEFAULT NULL,
  `Q39a` TINYINT NOT NULL,
  `Q39b` TINYINT NOT NULL,
  `Q39_details` VARCHAR(45) NULL DEFAULT NULL,
  `Q40a` TINYINT NOT NULL,
  `Q40a_details` VARCHAR(45) NULL DEFAULT NULL,
  `Q40b` TINYINT NOT NULL,
  `Q40b_details` VARCHAR(45) NULL DEFAULT NULL,
  `Q40c` TINYINT NOT NULL,
  `Q40c_details` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idemployees`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`institutions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`institutions` (
  `idinstitutions` INT NOT NULL,
  `institution_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idinstitutions`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`employees_education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`employees_education` (
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
  CONSTRAINT `fk_institutions_has_employees_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `prac`.`employees` (`idemployees`),
  CONSTRAINT `fk_institutions_has_employees_institutions1`
    FOREIGN KEY (`institutions_idinstitutions`)
    REFERENCES `prac`.`institutions` (`idinstitutions`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`employees_ext_involvements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`employees_ext_involvements` (
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
    REFERENCES `prac`.`employees` (`idemployees`),
  CONSTRAINT `fk_employees_has_institutions_institutions1`
    FOREIGN KEY (`institutions_idinstitutions`)
    REFERENCES `prac`.`institutions` (`idinstitutions`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`trainings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`trainings` (
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
    REFERENCES `prac`.`institutions` (`idinstitutions`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`employees_has_trainings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`employees_has_trainings` (
  `employees_idemployees` INT NOT NULL,
  `trainings_idtrainings` INT NOT NULL,
  `participation_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employees_idemployees`, `trainings_idtrainings`),
  INDEX `fk_employees_has_trainings_trainings1_idx` (`trainings_idtrainings` ASC) VISIBLE,
  INDEX `fk_employees_has_trainings_employees1_idx` (`employees_idemployees` ASC) VISIBLE,
  CONSTRAINT `fk_employees_has_trainings_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `prac`.`employees` (`idemployees`),
  CONSTRAINT `fk_employees_has_trainings_trainings1`
    FOREIGN KEY (`trainings_idtrainings`)
    REFERENCES `prac`.`trainings` (`idtrainings`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`professional_exams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`professional_exams` (
  `idprofessional_exams` INT NOT NULL,
  `Exam_description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idprofessional_exams`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`employees_prof_eligibility`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`employees_prof_eligibility` (
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
  CONSTRAINT `fk_professional_exams_has_employees_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `prac`.`employees` (`idemployees`),
  CONSTRAINT `fk_professional_exams_has_employees_professional_exams1`
    FOREIGN KEY (`professional_exams_idprofessional_exams`)
    REFERENCES `prac`.`professional_exams` (`idprofessional_exams`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`relatives`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`relatives` (
  `idrelatives` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `name_extension` VARCHAR(5) NOT NULL,
  `Occupation` VARCHAR(45) NOT NULL,
  `Emp_business` VARCHAR(45) NOT NULL,
  `business_address` VARCHAR(100) NOT NULL,
  `telephone` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  PRIMARY KEY (`idrelatives`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`employees_relatives`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`employees_relatives` (
  `Relatives_idrelatives` INT NOT NULL,
  `employees_idemployees` INT NOT NULL,
  `relationship` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Relatives_idrelatives`, `employees_idemployees`),
  INDEX `fk_Relatives_has_employees_employees1_idx` (`employees_idemployees` ASC) VISIBLE,
  INDEX `fk_Relatives_has_employees_Relatives1_idx` (`Relatives_idrelatives` ASC) VISIBLE,
  CONSTRAINT `fk_Relatives_has_employees_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `prac`.`employees` (`idemployees`),
  CONSTRAINT `fk_Relatives_has_employees_Relatives1`
    FOREIGN KEY (`Relatives_idrelatives`)
    REFERENCES `prac`.`relatives` (`idrelatives`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`employees_unitassignments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`employees_unitassignments` (
  `employees_idemployees` INT NOT NULL,
  `departments_iddepartments` INT NOT NULL,
  `transfer_date` DATE NOT NULL,
  PRIMARY KEY (`employees_idemployees`, `departments_iddepartments`),
  INDEX `fk_employees_has_departments_departments1_idx` (`departments_iddepartments` ASC) VISIBLE,
  INDEX `fk_employees_has_departments_employees1_idx` (`employees_idemployees` ASC) VISIBLE,
  CONSTRAINT `fk_employees_has_departments_departments1`
    FOREIGN KEY (`departments_iddepartments`)
    REFERENCES `prac`.`departments` (`iddepartments`),
  CONSTRAINT `fk_employees_has_departments_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `prac`.`employees` (`idemployees`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`job_positions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`job_positions` (
  `idjob_positions` INT NOT NULL,
  `job_category` VARCHAR(45) NOT NULL,
  `Job_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idjob_positions`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`late_fees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`late_fees` (
  `id` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `expected_due_date` DATETIME NOT NULL,
  `PAYMENT_id` INT NOT NULL,
  `CUSTOMER_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_LATE_FEES_PAYMENT1_idx` (`PAYMENT_id` ASC) VISIBLE,
  INDEX `fk_LATE_FEES_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  CONSTRAINT `fk_LATE_FEES_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `prac`.`customer` (`id`),
  CONSTRAINT `fk_LATE_FEES_PAYMENT1`
    FOREIGN KEY (`PAYMENT_id`)
    REFERENCES `prac`.`payment` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`reservation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `VEHICLE_vin_id` VARCHAR(17) NOT NULL,
  `CUSTOMER_id` INT NOT NULL,
  `reservation_start_date_time` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_RESERVATION_VEHICLE1_idx` (`VEHICLE_vin_id` ASC) VISIBLE,
  INDEX `fk_RESERVATION_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVATION_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `prac`.`customer` (`id`),
  CONSTRAINT `fk_RESERVATION_VEHICLE1`
    FOREIGN KEY (`VEHICLE_vin_id`)
    REFERENCES `prac`.`vehicle` (`vin_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`service_records`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`service_records` (
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
    REFERENCES `prac`.`employees` (`idemployees`),
  CONSTRAINT `fk_employees_has_job_positions_job_positions1`
    FOREIGN KEY (`job_positions_idjob_positions`)
    REFERENCES `prac`.`job_positions` (`idjob_positions`),
  CONSTRAINT `fk_service_records_contract_types1`
    FOREIGN KEY (`contract_types_idcontract_types`)
    REFERENCES `prac`.`contract_types` (`idcontract_types`),
  CONSTRAINT `fk_service_records_institutions1`
    FOREIGN KEY (`institutions_idinstitutions`)
    REFERENCES `prac`.`institutions` (`idinstitutions`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`skills` (
  `idskills` INT NOT NULL,
  `skill_type` VARCHAR(45) NOT NULL,
  `skill_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idskills`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`skills_has_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`skills_has_employees` (
  `skills_idskills` INT NOT NULL,
  `employees_idemployees` INT NOT NULL,
  `skill_level` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`skills_idskills`, `employees_idemployees`),
  INDEX `fk_skills_has_employees_employees1_idx` (`employees_idemployees` ASC) VISIBLE,
  INDEX `fk_skills_has_employees_skills1_idx` (`skills_idskills` ASC) VISIBLE,
  CONSTRAINT `fk_skills_has_employees_employees1`
    FOREIGN KEY (`employees_idemployees`)
    REFERENCES `prac`.`employees` (`idemployees`),
  CONSTRAINT `fk_skills_has_employees_skills1`
    FOREIGN KEY (`skills_idskills`)
    REFERENCES `prac`.`skills` (`idskills`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`vehicle_availability`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`vehicle_availability` (
  `id` INT NOT NULL,
  `VEHICLE_vin_id` VARCHAR(17) NOT NULL,
  `status` ENUM('available', 'reserved', 'maintenance') NOT NULL,
  PRIMARY KEY (`id`, `VEHICLE_vin_id`),
  INDEX `fk_VEHICLE_has_RESERVATION_VEHICLE1_idx` (`VEHICLE_vin_id` ASC) VISIBLE,
  CONSTRAINT `fk_VEHICLE_has_RESERVATION_VEHICLE1`
    FOREIGN KEY (`VEHICLE_vin_id`)
    REFERENCES `prac`.`vehicle` (`vin_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`vehicle_damage_reports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prac`.`vehicle_damage_reports` (
  `id` INT NOT NULL,
  `RENTAL_STATUS_id` INT NOT NULL,
  `descriptions` VARCHAR(100) NOT NULL,
  `vehicle_vin_id` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `RENTAL_STATUS_id`),
  INDEX `fk_VEHICLE_DAMAGE_REPORTS_RENTAL_STATUS1_idx` (`RENTAL_STATUS_id` ASC) VISIBLE,
  INDEX `fk_vehicle_id` (`vehicle_vin_id` ASC) VISIBLE,
  CONSTRAINT `fk_VEHICLE_DAMAGE_REPORTS_RENTAL_STATUS1`
    FOREIGN KEY (`RENTAL_STATUS_id`)
    REFERENCES `prac`.`rental_status` (`id`),
  CONSTRAINT `fk_vehicle_id`
    FOREIGN KEY (`vehicle_vin_id`)
    REFERENCES `prac`.`vehicle` (`vin_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
