
DROP SCHEMA IF EXISTS `hw4` ;

CREATE SCHEMA IF NOT EXISTS `hw4` DEFAULT CHARACTER SET utf8 ;
USE `hw4` ;

CREATE TABLE IF NOT EXISTS `hw4`.`EMPLOYEE` (
  `Fname` VARCHAR(100) NOT NULL,
  `Minit` VARCHAR(100) NULL,
  `Lname` VARCHAR(45) NOT NULL,
  `Ssn` INT(9) NOT NULL,
  `Bdate` DATE NOT NULL,
  `Address` VARCHAR(100) NOT NULL,
  `Sex` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL(2) NOT NULL,
  `Super_ssn` INT(9) NOT NULL,
  `Dno` INT NOT NULL,
  PRIMARY KEY (`Ssn`),
  CONSTRAINT `fk-emp_dno_to_department_num`
    FOREIGN KEY (`Dno`)
    REFERENCES `hw4`.`DEPARTMENT` (`Dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `hw4`.`DEPARTMENT` (
  `Dname` VARCHAR(100) NOT NULL,
  `Dnumber` INT NOT NULL,
  `Mgr_ssn` INT(9) NOT NULL,
  `Mgr_start_date` DATE NOT NULL,
  PRIMARY KEY (`Dnumber`),
  INDEX `fk-dept-mg_ssn_to_emp_ssn_idx` (`Mgr_ssn` ASC),
  CONSTRAINT `fk-dept-mg_ssn_to_emp_ssn`
    FOREIGN KEY (`Mgr_ssn`)
    REFERENCES `hw4`.`EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `hw4`.`PROJECT` (
  `Pname` VARCHAR(100) NOT NULL,
  `Pnumber` INT NOT NULL,
  `Plocation` VARCHAR(100) NOT NULL,
  `Dnum` INT NOT NULL,
  PRIMARY KEY (`Pnumber`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `hw4`.`WORKS_ON` (
  `Essn` INT(9) NOT NULL,
  `Pno` INT NULL,
  `Hours` DECIMAL(2) NULL,
  PRIMARY KEY (`Essn`),
  INDEX `fk_works_on_to_project_idx` (`Pno` ASC),
  CONSTRAINT `fk_works_on_to_emp`
    FOREIGN KEY (`Essn`)
    REFERENCES `hw4`.`EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_works_on_to_project`
    FOREIGN KEY (`Pno`)
    REFERENCES `hw4`.`PROJECT` (`Pnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `hw4`.`DEPT_LOCATION` (
  `Dnumber` INT NOT NULL,
  `Dlocation` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Dnumber`, `Dlocation`),
  CONSTRAINT `fk_dept_location_to_dept`
    FOREIGN KEY (`Dnumber`)
    REFERENCES `hw4`.`DEPARTMENT` (`Dnumber`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `hw4`.`DEPENDENT` (
  `Essn` INT(9) NOT NULL,
  `Dependent_name` VARCHAR(100) NOT NULL,
  `Sex` VARCHAR(1) NOT NULL,
  `Bdate` DATE NOT NULL,
  `Relationship` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Essn`, `Dependent_name`),
  CONSTRAINT `fk_dependent_to_emp`
    FOREIGN KEY (`Essn`)
    REFERENCES `hw4`.`EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;