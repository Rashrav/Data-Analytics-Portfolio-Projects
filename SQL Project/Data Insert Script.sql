-- -----------------------------------------------------
CREATE SCHEMA Restaurant;
USE Restaurant;
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Table `staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `staff` ;

CREATE TABLE IF NOT EXISTS `staff` (
  `acq_staff_id` INT NOT NULL AUTO_INCREMENT,
  `c_staff_id` VARCHAR(10) NULL,
  `staff_family_name` VARCHAR(30) NOT NULL,
  `staff_other_names` VARCHAR(45) NULL,
  `staff_phone` VARCHAR(10) NOT NULL,
  `staff_street_address` VARCHAR(45) NULL,
  `staff_suburb` VARCHAR(20) NULL,
  `staff_state` VARCHAR(5) NULL,
  `staff_postcode` INT NULL,
  PRIMARY KEY (`acq_staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `manager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `manager` ;

CREATE TABLE IF NOT EXISTS `manager` (
  `acq_staff_id` INT NOT NULL,
  `mgr_start_date` DATE NOT NULL,
  `mgr_review_date` DATE NULL,
  PRIMARY KEY (`acq_staff_id`),
  CONSTRAINT `fk_manager_staff1`
    FOREIGN KEY (`acq_staff_id`)
    REFERENCES `staff` (`acq_staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `loc_id` INT NOT NULL AUTO_INCREMENT,
  `centre_id` INT NULL,
  `loc_street_address` VARCHAR(45) NULL,
  `loc_suburb` VARCHAR(20) NULL,
  `loc_state` VARCHAR(5) NULL,
  `loc_postcode` INT NULL,
  `loc_size` DECIMAL(8,2) NOT NULL COMMENT 'in square metres',
  `hasSeating` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`loc_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store` ;

CREATE TABLE IF NOT EXISTS `store` (
  `acq_store_id` INT NOT NULL AUTO_INCREMENT,
  `c_store_id` VARCHAR(10) NULL,
  `store_name` VARCHAR(45) NULL,
  `store_loc_id` INT NULL,
  `company_id` INT NOT NULL,
  `store_mgr_id` INT NULL,
  PRIMARY KEY (`acq_store_id`),
  UNIQUE INDEX `c_store_id_UNIQUE` (`c_store_id` ASC),
  INDEX `fk_store_manager1_idx` (`store_mgr_id` ASC),
  INDEX `fk_store_location1_idx` (`store_loc_id` ASC),
  CONSTRAINT `fk_store_manager1`
    FOREIGN KEY (`store_mgr_id`)
    REFERENCES `manager` (`acq_staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_store_location1`
    FOREIGN KEY (`store_loc_id`)
    REFERENCES `location` (`loc_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contract` ;

CREATE TABLE IF NOT EXISTS `contract` (
  `contract_id` INT NOT NULL AUTO_INCREMENT,
  `staff_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  `contract_start_date` DATE NOT NULL,
  PRIMARY KEY (`contract_id`),
  INDEX `fk_contract_staff1_idx` (`staff_id` ASC),
  CONSTRAINT `fk_contract_staff1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `staff` (`acq_staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ft_contract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ft_contract` ;

CREATE TABLE IF NOT EXISTS `ft_contract` (
  `contract_id` INT NOT NULL,
  `ft_salary` INT NULL,
  `ft_super_amt` DECIMAL(8,2) NULL,
  PRIMARY KEY (`contract_id`),
  CONSTRAINT `fk_ft_contract_contract1`
    FOREIGN KEY (`contract_id`)
    REFERENCES `contract` (`contract_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pt_contract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pt_contract` ;

CREATE TABLE IF NOT EXISTS `pt_contract` (
  `contract_id` INT NOT NULL,
  `pt_hours_per_wk` INT NULL,
  `pt_hourly_rate` DECIMAL(5,2) NULL,
  `pt_super_amt` DECIMAL(8,2) NULL,
  PRIMARY KEY (`contract_id`),
  CONSTRAINT `fk_pt_contract_contract1`
    FOREIGN KEY (`contract_id`)
    REFERENCES `contract` (`contract_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `staff`
-- -----------------------------------------------------
INSERT INTO `staff` (`acq_staff_id`, `c_staff_id`, `staff_family_name`, `staff_other_names`, `staff_phone`, `staff_street_address`, `staff_suburb`, `staff_state`, `staff_postcode`) VALUES (1, '001', 'Freedman', 'Jeremy', '0477122226', '11 Quimby St', 'Springfield', 'TAS', 7112);
INSERT INTO `staff` (`acq_staff_id`, `c_staff_id`, `staff_family_name`, `staff_other_names`, `staff_phone`, `staff_street_address`, `staff_suburb`, `staff_state`, `staff_postcode`) VALUES (2, '002', 'Bellows', 'Rory B', '0412836227', '62 Kearney St', 'Springfield', 'TAS', 7123);
INSERT INTO `staff` (`acq_staff_id`, `c_staff_id`, `staff_family_name`, `staff_other_names`, `staff_phone`, `staff_street_address`, `staff_suburb`, `staff_state`, `staff_postcode`) VALUES (3, '006', 'Kurtofsky', 'Herschel S', '0411888222', '33 Kearney St', 'Springfield', 'TAS', 7123);
INSERT INTO `staff` (`acq_staff_id`, `c_staff_id`, `staff_family_name`, `staff_other_names`, `staff_phone`, `staff_street_address`, `staff_suburb`, `staff_state`, `staff_postcode`) VALUES (4, NULL, 'MacNeille', 'Cora', '0428474679', '42 Montgomery Park', 'Springfield', 'VIC', 3777);
INSERT INTO `staff` (`acq_staff_id`, `c_staff_id`, `staff_family_name`, `staff_other_names`, `staff_phone`, `staff_street_address`, `staff_suburb`, `staff_state`, `staff_postcode`) VALUES (5, 'L003', 'Risotto', 'Luigi', '0471333355', '7 Burnside Street', 'Montgomery', 'VIC', 3104);



-- -----------------------------------------------------
-- Data for table `manager`
-- -----------------------------------------------------
INSERT INTO `manager` (`acq_staff_id`, `mgr_start_date`, `mgr_review_date`) VALUES (2, '2020-02-28', '2022-11-02');
INSERT INTO `manager` (`acq_staff_id`, `mgr_start_date`, `mgr_review_date`) VALUES (4, '2021-11-01', '2022-12-16');
INSERT INTO `manager` (`acq_staff_id`, `mgr_start_date`, `mgr_review_date`) VALUES (5, '2020-01-23', '2022-11-21');


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
INSERT INTO `location` (`loc_id`, `centre_id`, `loc_street_address`, `loc_suburb`, `loc_state`, `loc_postcode`, `loc_size`, `hasSeating`) VALUES (1, NULL, '6 Springfield Blvd', 'Springfield', 'TAS', 7533, 138, 1);
INSERT INTO `location` (`loc_id`, `centre_id`, `loc_street_address`, `loc_suburb`, `loc_state`, `loc_postcode`, `loc_size`, `hasSeating`) VALUES (2, 2, 'Shop 6', 'Chadstone', 'VIC', 3113, 54, 0);
INSERT INTO `location` (`loc_id`, `centre_id`, `loc_street_address`, `loc_suburb`, `loc_state`, `loc_postcode`, `loc_size`, `hasSeating`) VALUES (3, NULL, '15 Springfield Blvd', 'Springfield', 'TAS', 7772, 116, 1);
INSERT INTO `location` (`loc_id`, `centre_id`, `loc_street_address`, `loc_suburb`, `loc_state`, `loc_postcode`, `loc_size`, `hasSeating`) VALUES (4, NULL, '23 3rd St', 'Springfield', 'TAS', 7111, 203, 1);
INSERT INTO `location` (`loc_id`, `centre_id`, `loc_street_address`, `loc_suburb`, `loc_state`, `loc_postcode`, `loc_size`, `hasSeating`) VALUES (5, 1, 'Shop 112', 'Macquarie Park', 'NSW', 2113, 46, 0);
INSERT INTO `location` (`loc_id`, `centre_id`, `loc_street_address`, `loc_suburb`, `loc_state`, `loc_postcode`, `loc_size`, `hasSeating`) VALUES (6, 3, 'Shop B03', 'Parramatta', 'NSW', 2150, 37, 0);


-- -----------------------------------------------------
-- Data for table `store`
-- -----------------------------------------------------
INSERT INTO `store` (`acq_store_id`, `c_store_id`, `store_name`, `store_loc_id`, `company_id`, `store_mgr_id`) VALUES (1, 'TAS01', 'Springfield Boulevard', 1, 1, 2);
INSERT INTO `store` (`acq_store_id`, `c_store_id`, `store_name`, `store_loc_id`, `company_id`, `store_mgr_id`) VALUES (2, 'VIC01', 'Chadstone', 2, 1, NULL);
INSERT INTO `store` (`acq_store_id`, `c_store_id`, `store_name`, `store_loc_id`, `company_id`, `store_mgr_id`) VALUES (3, NULL, 'Springfield', 3, 2, 4);
INSERT INTO `store` (`acq_store_id`, `c_store_id`, `store_name`, `store_loc_id`, `company_id`, `store_mgr_id`) VALUES (4, NULL, 'Luigi\'s', 4, 3, 5);
INSERT INTO `store` (`acq_store_id`, `c_store_id`, `store_name`, `store_loc_id`, `company_id`, `store_mgr_id`) VALUES (5, 'S001', 'Macquarie Park', 5, 4, NULL);
INSERT INTO `store` (`acq_store_id`, `c_store_id`, `store_name`, `store_loc_id`, `company_id`, `store_mgr_id`) VALUES (6, 'S002', 'Parramatta', 6, 4, NULL);



-- -----------------------------------------------------
-- Data for table `contract`
-- -----------------------------------------------------
INSERT INTO `contract` (`contract_id`, `staff_id`, `company_id`, `contract_start_date`) VALUES (1, 1, 1, '2020-12-12');
INSERT INTO `contract` (`contract_id`, `staff_id`, `company_id`, `contract_start_date`) VALUES (2, 1, 1, '2021-10-01');
INSERT INTO `contract` (`contract_id`, `staff_id`, `company_id`, `contract_start_date`) VALUES (3, 1, 1, '2022-02-22');
INSERT INTO `contract` (`contract_id`, `staff_id`, `company_id`, `contract_start_date`) VALUES (4, 2, 1, '2017-09-01');
INSERT INTO `contracÍt` (`contract_id`, `staff_id`, `company_id`, `contract_start_date`) VALUES (5, 3, 1, '2019-06-23');
INSERT INTO `contract` (`contract_id`, `staff_id`, `company_id`, `contract_start_date`) VALUES (6, 2, 1, '2020-02-28');
INSERT INTO `contract` (`contract_id`, `staff_id`, `company_id`, `contract_start_date`) VALUES (7, 4, 2, '2021-11-01');
INSERT INTO `contract` (`contract_id`, `staff_id`, `company_id`, `contract_start_date`) VALUES (8, 5, 3, '2020-01-23');


-- -----------------------------------------------------
-- Data for table `ft_contract`
-- -----------------------------------------------------
INSERT INTO `ft_contract` (`contract_id`, `ft_salary`, `ft_super_amt`) VALUES (3, 50000, 5250);
INSERT INTO `ft_contract` (`contract_id`, `ft_salary`, `ft_super_amt`) VALUES (7, 48500, 5000);
INSERT INTO `ft_contract` (`contract_id`, `ft_salary`, `ft_super_amt`) VALUES (8, 51000, 5375);


-- -----------------------------------------------------
-- Data for table `pt_contract`
-- -----------------------------------------------------
INSERT INTO `pt_contract` (`contract_id`, `pt_hours_per_wk`, `pt_hourly_rate`, `pt_super_amt`) VALUES (2, 20, 22.31, 1780);
INSERT INTO `pt_contract` (`contract_id`, `pt_hours_per_wk`, `pt_hourly_rate`, `pt_super_amt`) VALUES (4, 15, 23.12, 1383.73);
INSERT INTO `pt_contract` (`contract_id`, `pt_hours_per_wk`, `pt_hourly_rate`, `pt_super_amt`) VALUES (5, 25, 25.77, 2570.56);


-- -----------------------------------------------------
-- Adding date of birth columm and inserting the values
-- -----------------------------------------------------
ALTER TABLE staff
ADD dob DATE;

UPDATE staff
SET dob = '1982-03-12'
WHERE acq_staff_id = 1;

UPDATE staff
SET dob = '1986-07-21'
WHERE acq_staff_id = 2;

UPDATE staff
SET dob = '1981-03-15'
WHERE acq_staff_id = 3;

UPDATE staff
SET dob = '1990-10-26'
WHERE acq_staff_id = 4;

UPDATE staff
SET dob = '1977-11-07'
WHERE acq_staff_id = 5;

-- -----------------------------------------------------
-- Adding email columm and inserting the values
-- -----------------------------------------------------
ALTER TABLE staff
ADD email VARCHAR(30);

UPDATE staff
SET email = 'freedman@mymail.com.au'
WHERE acq_staff_id = 1;

UPDATE staff
SET email = 'rbb@yahooooo.com.au'
WHERE acq_staff_id = 2;

UPDATE staff
SET email = 'hersc_k@googly.com'
WHERE acq_staff_id = 3;

UPDATE staff
SET email = 'cora_mn@springfield.net.au'
WHERE acq_staff_id = 4;

UPDATE staff
SET email = 'l.risotto@luigispizza.com'
WHERE acq_staff_id = 5;


