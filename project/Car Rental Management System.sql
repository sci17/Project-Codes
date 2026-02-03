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
-- Table `mydb`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER` (
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
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`INSURANCE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`INSURANCE` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `options` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `option_name_UNIQUE` (`options` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`RENTAL_STATUS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RENTAL_STATUS` (
  `id` INT NOT NULL,
  `name` ENUM('reserved', 'active', 'completed', 'cancelled') NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VEHICLE_CATEGORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VEHICLE_CATEGORY` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `category_name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`VEHICLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VEHICLE` (
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
  PRIMARY KEY (`vin_id`),
  INDEX `fk_VEHICLE_VEHICLE_CATEGORY1_idx` (`VEHICLE_CATEGORY_id` ASC) VISIBLE,
  CONSTRAINT `fk_VEHICLE_VEHICLE_CATEGORY1`
    FOREIGN KEY (`VEHICLE_CATEGORY_id`)
    REFERENCES `mydb`.`VEHICLE_CATEGORY` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`RENTAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RENTAL` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `RENTAL_STATUS_id` INT NOT NULL,
  `CUSTOMER_id` INT NOT NULL,
  `VEHICLE_vin_id` VARCHAR(17) NOT NULL,
  `start_date_time` DATETIME NOT NULL,
  `end_date_time` DATETIME NOT NULL,
  `pickup_location` VARCHAR(45) NOT NULL,
  `dropoff_location` VARCHAR(45) NOT NULL,
  `estimated_mileage_allowance` INT NOT NULL,
  `total_cost` DOUBLE NOT NULL,
  `payment_method` VARCHAR(45) NOT NULL,
  `additional_services` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `RENTAL_STATUS_id`, `CUSTOMER_id`),
  INDEX `fk_RENTAL_RENTAL_STATUS1_idx` (`RENTAL_STATUS_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_RENTAL_VEHICLE1_idx` (`VEHICLE_vin_id` ASC) VISIBLE,
  INDEX `fk_RENTAL_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  CONSTRAINT `fk_RENTAL_RENTAL_STATUS1`
    FOREIGN KEY (`RENTAL_STATUS_id`)
    REFERENCES `mydb`.`RENTAL_STATUS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RENTAL_VEHICLE1`
    FOREIGN KEY (`VEHICLE_vin_id`)
    REFERENCES `mydb`.`VEHICLE` (`vin_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RENTAL_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `mydb`.`CUSTOMER` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`PAYMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PAYMENT` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `INSURANCE_id` INT NOT NULL,
  `rental_id` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `payment_date_time` DATETIME NOT NULL,
  `payment_method` VARCHAR(45) NOT NULL,
  `deposit` DOUBLE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_payment_rental_idx` (`rental_id` ASC) VISIBLE,
  INDEX `fk_PAYMENT_INSURANCE1_idx` (`INSURANCE_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_rental`
    FOREIGN KEY (`rental_id`)
    REFERENCES `mydb`.`RENTAL` (`id`),
  CONSTRAINT `fk_PAYMENT_INSURANCE1`
    FOREIGN KEY (`INSURANCE_id`)
    REFERENCES `mydb`.`INSURANCE` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`RESERVATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RESERVATION` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `VEHICLE_vin_id` VARCHAR(17) NOT NULL,
  `CUSTOMER_id` INT NOT NULL,
  `reservation_start_date_time` DATETIME NOT NULL,
  `reservation_end_date_time` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_RESERVATION_VEHICLE1_idx` (`VEHICLE_vin_id` ASC) VISIBLE,
  INDEX `fk_RESERVATION_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  CONSTRAINT `fk_RESERVATION_VEHICLE1`
    FOREIGN KEY (`VEHICLE_vin_id`)
    REFERENCES `mydb`.`VEHICLE` (`vin_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVATION_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `mydb`.`CUSTOMER` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`VEHICLE_AVAILABILITY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VEHICLE_AVAILABILITY` (
  `id` INT NOT NULL,
  `VEHICLE_vin_id` VARCHAR(17) NOT NULL,
  `RESERVATION_id` INT NOT NULL,
  `status` ENUM('available', 'reserved', 'maintenance') NOT NULL,
  PRIMARY KEY (`id`, `VEHICLE_vin_id`, `RESERVATION_id`),
  INDEX `fk_VEHICLE_has_RESERVATION_RESERVATION1_idx` (`RESERVATION_id` ASC) VISIBLE,
  INDEX `fk_VEHICLE_has_RESERVATION_VEHICLE1_idx` (`VEHICLE_vin_id` ASC) VISIBLE,
  CONSTRAINT `fk_VEHICLE_has_RESERVATION_VEHICLE1`
    FOREIGN KEY (`VEHICLE_vin_id`)
    REFERENCES `mydb`.`VEHICLE` (`vin_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VEHICLE_has_RESERVATION_RESERVATION1`
    FOREIGN KEY (`RESERVATION_id`)
    REFERENCES `mydb`.`RESERVATION` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`VEHICLE_DAMAGE_REPORTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VEHICLE_DAMAGE_REPORTS` (
  `id` INT NOT NULL,
  `RENTAL_STATUS_id` INT NOT NULL,
  `descriptions` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`, `RENTAL_STATUS_id`),
  INDEX `fk_VEHICLE_DAMAGE_REPORTS_RENTAL_STATUS1_idx` (`RENTAL_STATUS_id` ASC) VISIBLE,
  CONSTRAINT `fk_VEHICLE_DAMAGE_REPORTS_RENTAL_STATUS1`
    FOREIGN KEY (`RENTAL_STATUS_id`)
    REFERENCES `mydb`.`RENTAL_STATUS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMER_RENTAL_HISTORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER_RENTAL_HISTORY` (
  `id` INT NOT NULL,
  `LATE_FEE_id` INT NOT NULL,
  `violation` VARCHAR(45) NULL,
  `past_rental` VARCHAR(45) NULL,
  `CUSTOMER_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CUSTOMER_RENTAL_HISTORY_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  CONSTRAINT `fk_CUSTOMER_RENTAL_HISTORY_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `mydb`.`CUSTOMER` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMER_REFUND`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER_REFUND` (
  `id` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `PAYMENT_id` INT NOT NULL,
  `CUSTOMER_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CUSTOMER_REFUND_PAYMENT1_idx` (`PAYMENT_id` ASC) VISIBLE,
  INDEX `fk_CUSTOMER_REFUND_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  CONSTRAINT `fk_CUSTOMER_REFUND_PAYMENT1`
    FOREIGN KEY (`PAYMENT_id`)
    REFERENCES `mydb`.`PAYMENT` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUSTOMER_REFUND_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `mydb`.`CUSTOMER` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LATE_FEES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LATE_FEES` (
  `id` INT NOT NULL,
  `amount` DOUBLE NOT NULL,
  `expected_due_date` DATETIME NOT NULL,
  `PAYMENT_id` INT NOT NULL,
  `CUSTOMER_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_LATE_FEES_PAYMENT1_idx` (`PAYMENT_id` ASC) VISIBLE,
  INDEX `fk_LATE_FEES_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  CONSTRAINT `fk_LATE_FEES_PAYMENT1`
    FOREIGN KEY (`PAYMENT_id`)
    REFERENCES `mydb`.`PAYMENT` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LATE_FEES_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `mydb`.`CUSTOMER` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
