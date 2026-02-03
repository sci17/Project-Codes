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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
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
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`insurance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`insurance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `options` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `option_name_UNIQUE` (`options` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`vehicle_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vehicle_category` (
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
CREATE TABLE IF NOT EXISTS `mydb`.`vehicle` (
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
-- Table `mydb`.`vehicle_damage_reports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vehicle_damage_reports` (
  `id` INT NOT NULL,
  `descriptions` VARCHAR(100) NOT NULL,
  `vehicle_vin_id` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vehicle_id` (`vehicle_vin_id` ASC) VISIBLE,
  CONSTRAINT `fk_vehicle_id`
    FOREIGN KEY (`vehicle_vin_id`)
    REFERENCES `mydb`.`vehicle` (`vin_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`rental_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rental_status` (
  `id` INT NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  `vehicle_damage_reports_id` INT NOT NULL,
  PRIMARY KEY (`id`, `vehicle_damage_reports_id`),
  INDEX `fk_rental_status_vehicle_damage_reports1_idx` (`vehicle_damage_reports_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_status_vehicle_damage_reports1`
    FOREIGN KEY (`vehicle_damage_reports_id`)
    REFERENCES `mydb`.`vehicle_damage_reports` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rental` (
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
    REFERENCES `mydb`.`customer` (`id`),
  CONSTRAINT `fk_RENTAL_RENTAL_STATUS1`
    FOREIGN KEY (`RENTAL_STATUS_id`)
    REFERENCES `mydb`.`rental_status` (`id`),
  CONSTRAINT `fk_RENTAL_VEHICLE1`
    FOREIGN KEY (`VEHICLE_vin_id`)
    REFERENCES `mydb`.`vehicle` (`vin_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`payment` (
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
    REFERENCES `mydb`.`insurance` (`id`),
  CONSTRAINT `fk_payment_rental`
    FOREIGN KEY (`rental_id`)
    REFERENCES `mydb`.`rental` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`customer_refund`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer_refund` (
  `id` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `PAYMENT_id` INT NOT NULL,
  `CUSTOMER_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CUSTOMER_REFUND_PAYMENT1_idx` (`PAYMENT_id` ASC) VISIBLE,
  INDEX `fk_CUSTOMER_REFUND_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  CONSTRAINT `fk_CUSTOMER_REFUND_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `mydb`.`customer` (`id`),
  CONSTRAINT `fk_CUSTOMER_REFUND_PAYMENT1`
    FOREIGN KEY (`PAYMENT_id`)
    REFERENCES `mydb`.`payment` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`customer_rental_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer_rental_history` (
  `id` INT NOT NULL,
  `LATE_FEE_id` INT NOT NULL,
  `violation` VARCHAR(45) NULL DEFAULT NULL,
  `past_rental` VARCHAR(45) NULL DEFAULT NULL,
  `CUSTOMER_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CUSTOMER_RENTAL_HISTORY_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  CONSTRAINT `fk_CUSTOMER_RENTAL_HISTORY_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `mydb`.`customer` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`late_fees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`late_fees` (
  `id` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `expected_due_date` DATETIME NOT NULL,
  `CUSTOMER_id` INT NOT NULL,
  `payment_id` INT NOT NULL,
  PRIMARY KEY (`id`, `payment_id`),
  INDEX `fk_LATE_FEES_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  INDEX `fk_late_fees_payment1_idx` (`payment_id` ASC) VISIBLE,
  CONSTRAINT `fk_LATE_FEES_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `mydb`.`customer` (`id`),
  CONSTRAINT `fk_late_fees_payment1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `mydb`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reservation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `VEHICLE_vin_id` VARCHAR(17) NOT NULL,
  `CUSTOMER_id` INT NOT NULL,
  `reservation_start_date_time` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_RESERVATION_VEHICLE1_idx` (`VEHICLE_vin_id` ASC) VISIBLE,
  INDEX `fk_RESERVATION_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVATION_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `mydb`.`customer` (`id`),
  CONSTRAINT `fk_RESERVATION_VEHICLE1`
    FOREIGN KEY (`VEHICLE_vin_id`)
    REFERENCES `mydb`.`vehicle` (`vin_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`vehicle_availability`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vehicle_availability` (
  `id` INT NOT NULL,
  `VEHICLE_vin_id` VARCHAR(17) NOT NULL,
  `status` ENUM('available', 'reserved', 'maintenance') NOT NULL,
  PRIMARY KEY (`id`, `VEHICLE_vin_id`),
  INDEX `fk_VEHICLE_has_RESERVATION_VEHICLE1_idx` (`VEHICLE_vin_id` ASC) VISIBLE,
  CONSTRAINT `fk_VEHICLE_has_RESERVATION_VEHICLE1`
    FOREIGN KEY (`VEHICLE_vin_id`)
    REFERENCES `mydb`.`vehicle` (`vin_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
