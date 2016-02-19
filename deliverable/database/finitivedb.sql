-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema finitivedb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema finitivedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `finitivedb` DEFAULT CHARACTER SET utf8 ;
USE `finitivedb` ;

-- -----------------------------------------------------
-- Table `finitivedb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NULL,
  `password` VARCHAR(100) NULL,
  `salt` VARCHAR(100) NULL,
  `name` VARCHAR(200) NULL,
  `url_photo` TEXT NULL,
  `alamat` VARCHAR(350) NULL,
  `url_scan_ktp` TEXT NULL,
  `is_investors` INT NULL,
  `is_appliers` INT NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`admins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`admins` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `salt` VARCHAR(100) NULL,
  `username` VARCHAR(45) NULL,
  `name` VARCHAR(300) NULL,
  `url_photo` VARCHAR(45) NULL,
  `previllage` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`provinces`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`provinces` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `province` VARCHAR(150) NULL,
  `created_at` TIMESTAMP NULL,
  `provincescol` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`cities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(200) NULL,
  `provinces_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`, `provinces_id`),
  INDEX `fk_cities_provinces1_idx` (`provinces_id` ASC),
  CONSTRAINT `fk_cities_provinces1`
    FOREIGN KEY (`provinces_id`)
    REFERENCES `finitivedb`.`provinces` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categories` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`actions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`actions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(300) NOT NULL,
  `tag_line` TEXT NULL,
  `short_description` TEXT NULL,
  `goal_founding` INT NULL,
  `date_upload` TIMESTAMP NULL,
  `date_expired` TIMESTAMP NULL,
  `long_description` TEXT NULL,
  `url_photo1` TEXT NULL,
  `url_photo2` TEXT NULL,
  `url_photo3` TEXT NULL,
  `url_video` TEXT NULL,
  `ishold` INT NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `cities_id` INT NOT NULL,
  `cities_provinces_id` INT NOT NULL,
  `categories_id` INT NOT NULL,
  PRIMARY KEY (`id`, `categories_id`),
  INDEX `fk_actions_cities1_idx` (`cities_id` ASC, `cities_provinces_id` ASC),
  INDEX `fk_actions_categories1_idx` (`categories_id` ASC),
  CONSTRAINT `fk_actions_cities1`
    FOREIGN KEY (`cities_id` , `cities_provinces_id`)
    REFERENCES `finitivedb`.`cities` (`id` , `provinces_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actions_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `finitivedb`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`contribute_gifts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`contribute_gifts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kind` INT NULL,
  `range` VARCHAR(500) NULL,
  `gift` TEXT NULL,
  `actions_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`, `actions_id`),
  INDEX `fk_donate_gift_actions1_idx` (`actions_id` ASC),
  CONSTRAINT `fk_donate_gift_actions1`
    FOREIGN KEY (`actions_id`)
    REFERENCES `finitivedb`.`actions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`blogs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`blogs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `article` VARCHAR(45) NULL,
  `url_photo1` VARCHAR(45) NULL,
  `url_photo2` VARCHAR(45) NULL,
  `url_photo3` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `admins_id` INT NOT NULL,
  PRIMARY KEY (`id`, `admins_id`),
  INDEX `fk_blogs_admins_idx` (`admins_id` ASC),
  CONSTRAINT `fk_blogs_admins`
    FOREIGN KEY (`admins_id`)
    REFERENCES `finitivedb`.`admins` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`contributions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`contributions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_time` TIMESTAMP NULL,
  `number_contributions` INT NULL,
  `bank_name` VARCHAR(45) NULL,
  `jenis_pembayaran` VARCHAR(150) NULL,
  `nominal` INT NULL,
  `random_number` INT NOT NULL,
  `total_payment` INT NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`, `users_id`),
  INDEX `fk_contributions_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_contributions_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `finitivedb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`confirms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`confirms` (
  `actions_id` INT NOT NULL,
  `contributions_id` INT NOT NULL,
  `contributions_users_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `date_time_confirm` VARCHAR(45) NULL,
  `randomnumber` VARCHAR(45) NULL,
  `bank_name` VARCHAR(45) NULL,
  `admins_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`actions_id`, `contributions_id`, `contributions_users_id`),
  INDEX `fk_actions_has_contributions_contributions1_idx` (`contributions_id` ASC, `contributions_users_id` ASC),
  INDEX `fk_actions_has_contributions_actions1_idx` (`actions_id` ASC),
  INDEX `fk_confirms_admins1_idx` (`admins_id` ASC),
  CONSTRAINT `fk_actions_has_contributions_actions1`
    FOREIGN KEY (`actions_id`)
    REFERENCES `finitivedb`.`actions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actions_has_contributions_contributions1`
    FOREIGN KEY (`contributions_id` , `contributions_users_id`)
    REFERENCES `finitivedb`.`contributions` (`id` , `users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_confirms_admins1`
    FOREIGN KEY (`admins_id`)
    REFERENCES `finitivedb`.`admins` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`votes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`votes` (
  `users_id` INT NOT NULL,
  `actions_id` INT NOT NULL,
  `date_time_vote` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`users_id`, `actions_id`),
  INDEX `fk_users_has_actions_actions1_idx` (`actions_id` ASC),
  INDEX `fk_users_has_actions_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_users_has_actions_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `finitivedb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_actions_actions1`
    FOREIGN KEY (`actions_id`)
    REFERENCES `finitivedb`.`actions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`shares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`shares` (
  `users_id` INT NOT NULL,
  `actions_id` INT NOT NULL,
  `is_shared` INT NULL,
  `date_time` TIMESTAMP NULL,
  `nick_fb` VARCHAR(100) NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`users_id`, `actions_id`),
  INDEX `fk_users_has_actions_actions2_idx` (`actions_id` ASC),
  INDEX `fk_users_has_actions_users2_idx` (`users_id` ASC),
  CONSTRAINT `fk_users_has_actions_users2`
    FOREIGN KEY (`users_id`)
    REFERENCES `finitivedb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_actions_actions2`
    FOREIGN KEY (`actions_id`)
    REFERENCES `finitivedb`.`actions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`makes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`makes` (
  `users_id` INT NOT NULL,
  `actions_id` INT NOT NULL,
  `admins_id` INT NULL,
  `status` INT NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`users_id`, `actions_id`),
  INDEX `fk_users_has_actions_actions3_idx` (`actions_id` ASC),
  INDEX `fk_users_has_actions_users3_idx` (`users_id` ASC),
  INDEX `fk_makes_admins1_idx` (`admins_id` ASC),
  CONSTRAINT `fk_users_has_actions_users3`
    FOREIGN KEY (`users_id`)
    REFERENCES `finitivedb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_actions_actions3`
    FOREIGN KEY (`actions_id`)
    REFERENCES `finitivedb`.`actions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_makes_admins1`
    FOREIGN KEY (`admins_id`)
    REFERENCES `finitivedb`.`admins` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`messages` (
  `date_time` TIMESTAMP NOT NULL,
  `title` VARCHAR(150) NULL,
  `content` TEXT NULL,
  `users_id` INT NOT NULL,
  `admins_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`date_time`, `admins_id`),
  INDEX `fk_messages_users1_idx` (`users_id` ASC),
  INDEX `fk_messages_admins1_idx` (`admins_id` ASC),
  CONSTRAINT `fk_messages_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `finitivedb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_admins1`
    FOREIGN KEY (`admins_id`)
    REFERENCES `finitivedb`.`admins` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`messages_investor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`messages_investor` (
  `date_time` TIMESTAMP NOT NULL,
  `users_id` INT NOT NULL,
  `users_id1` INT NOT NULL,
  `title` VARCHAR(500) NULL,
  `content` TEXT NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`date_time`),
  INDEX `fk_users_has_users_users2_idx` (`users_id1` ASC),
  INDEX `fk_users_has_users_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_users_has_users_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `finitivedb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_users_users2`
    FOREIGN KEY (`users_id1`)
    REFERENCES `finitivedb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finitivedb`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finitivedb`.`comments` (
  `id` INT NOT NULL,
  `content` VARCHAR(500) NULL,
  `date_time` TIMESTAMP NULL,
  `actions_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`, `actions_id`, `users_id`),
  INDEX `fk_comments_actions1_idx` (`actions_id` ASC),
  INDEX `fk_comments_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_comments_actions1`
    FOREIGN KEY (`actions_id`)
    REFERENCES `finitivedb`.`actions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `finitivedb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `finitivedb` ;

-- -----------------------------------------------------
--  routine1
-- -----------------------------------------------------

DELIMITER $$
USE `finitivedb`$$
$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
