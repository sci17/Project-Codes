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
-- Table `mydb`.`PEST_CATEGORIES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PEST_CATEGORIES` (
  `pest_category_code` INT NOT NULL,
  PRIMARY KEY (`pest_category_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PESTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PESTS` (
  `pest_id` INT NOT NULL,
  `pest_category_code` INT NULL,
  PRIMARY KEY (`pest_id`),
  INDEX `fk_PESTS_PEST_CATEGORIES_idx` (`pest_category_code` ASC) VISIBLE,
  CONSTRAINT `fk_PESTS_PEST_CATEGORIES`
    FOREIGN KEY (`pest_category_code`)
    REFERENCES `mydb`.`PEST_CATEGORIES` (`pest_category_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CONTROL_METHOD_TYPES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONTROL_METHOD_TYPES` (
  `control_method_type_code` INT NOT NULL,
  PRIMARY KEY (`control_method_type_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CONTROL_METHODS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONTROL_METHODS` (
  `control_method_id` INT NOT NULL,
  `control_method_type_code` INT NULL,
  PRIMARY KEY (`control_method_id`),
  INDEX `fk_CONTROL_METHODS_CONTROL_METHOD_TYPES1_idx` (`control_method_type_code` ASC) VISIBLE,
  CONSTRAINT `fk_CONTROL_METHODS_CONTROL_METHOD_TYPES1`
    FOREIGN KEY (`control_method_type_code`)
    REFERENCES `mydb`.`CONTROL_METHOD_TYPES` (`control_method_type_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PEST_CONTROL_METHODS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PEST_CONTROL_METHODS` (
  `pest_id` INT NOT NULL,
  `control_method_id` INT NOT NULL,
  PRIMARY KEY (`pest_id`, `control_method_id`),
  INDEX `fk_PEST_CONTROL_METHODS_CONTROL_METHODS1_idx` (`control_method_id` ASC) VISIBLE,
  CONSTRAINT `fk_PEST_CONTROL_METHODS_PESTS1`
    FOREIGN KEY (`pest_id`)
    REFERENCES `mydb`.`PESTS` (`pest_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PEST_CONTROL_METHODS_CONTROL_METHODS1`
    FOREIGN KEY (`control_method_id`)
    REFERENCES `mydb`.`CONTROL_METHODS` (`control_method_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PRODUCTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRODUCTS` (
  `product_id` INT NOT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PESTS_CONTROL_METHODS_PRODUCTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PESTS_CONTROL_METHODS_PRODUCTS` (
  `pest_method_product_id` INT NOT NULL,
  `pest_id` INT NULL,
  `control_method_id` INT NULL,
  `product_id` INT NULL,
  PRIMARY KEY (`pest_method_product_id`),
  INDEX `fk_PESTS_CONTROL_METHODS_PRODUCTS_PEST_CONTROL_METHODS1_idx` (`pest_id` ASC, `control_method_id` ASC) VISIBLE,
  INDEX `fk_PESTS_CONTROL_METHODS_PRODUCTS_PRODUCTS1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_PESTS_CONTROL_METHODS_PRODUCTS_PEST_CONTROL_METHODS1`
    FOREIGN KEY (`pest_id` , `control_method_id`)
    REFERENCES `mydb`.`PEST_CONTROL_METHODS` (`pest_id` , `control_method_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PESTS_CONTROL_METHODS_PRODUCTS_PRODUCTS1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`PRODUCTS` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMERS` (
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMERS_PURCHASES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMERS_PURCHASES` (
  `customer_purchase_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NULL,
  `product_id` INT NULL,
  PRIMARY KEY (`customer_purchase_id`),
  INDEX `fk_CUSTOMERS_PURCHASES_CUSTOMERS1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_CUSTOMERS_PURCHASES_PRODUCTS1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_CUSTOMERS_PURCHASES_CUSTOMERS1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`CUSTOMERS` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUSTOMERS_PURCHASES_PRODUCTS1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`PRODUCTS` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMERS_EXPERIENCES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMERS_EXPERIENCES` (
  `date_of_purchase` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `customer_purchase_id` INT NOT NULL,
  `pest_method_product_id` INT NOT NULL,
  PRIMARY KEY (`date_of_purchase`, `customer_id`, `product_id`, `customer_purchase_id`, `pest_method_product_id`),
  INDEX `fk_CUSTOMERS_EXPERIENCES_CUSTOMERS_PURCHASES1_idx` (`customer_purchase_id` ASC) VISIBLE,
  INDEX `fk_CUSTOMERS_EXPERIENCES_PESTS_CONTROL_METHODS_PRODUCTS1_idx` (`pest_method_product_id` ASC) VISIBLE,
  CONSTRAINT `fk_CUSTOMERS_EXPERIENCES_CUSTOMERS_PURCHASES1`
    FOREIGN KEY (`customer_purchase_id`)
    REFERENCES `mydb`.`CUSTOMERS_PURCHASES` (`customer_purchase_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUSTOMERS_EXPERIENCES_PESTS_CONTROL_METHODS_PRODUCTS1`
    FOREIGN KEY (`pest_method_product_id`)
    REFERENCES `mydb`.`PESTS_CONTROL_METHODS_PRODUCTS` (`pest_method_product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
