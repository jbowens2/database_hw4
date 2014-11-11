
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
  `Salary` DECIMAL(14,2) NOT NULL,
  `Super_ssn` INT(9),
  `Dno` INT NOT NULL,
  PRIMARY KEY (`Ssn`))
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
  `Hours` DECIMAL(3,1) NULL,
  /*PRIMARY KEY (`Essn`),*/
  PRIMARY KEY (`Pno`,`Essn`),
  INDEX `fk_works_on_to_project_idx` (`Pno` ASC),
  CONSTRAINT `fk_works_on_to_emp`
    FOREIGN KEY (`Essn`)
    REFERENCES `hw4`.`EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_works_on_to_project`
    FOREIGN KEY (`Pno`)
    REFERENCES `hw4`.`PROJECT` (`Pnumber`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
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
    ON UPDATE CASCADE)
ENGINE = InnoDB;

/*Employee insert_method*/

insert into employee(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno) values ("John","B","Smith",123456789, "1965-01-09","731 Fondren, Houston, TX", "M", 30000,333445555,5);
insert into employee(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno) values ("Franklin","T","Wong",333445555, "1955-12-08","638 Voss, Houston, TX", "M", 40000,888665555,5);
insert into employee(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno) values ("Alicia","J","Zelaya",999887777, "1958-01-19","3321 Castle, Spring, TX", "F", 25000,987654321,4);
insert into employee(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno) values ("Jennifer","S","Wallace",987654321, "1941-06-20","291 Berry, Bellaire, TX", "F", 43000,888665555,4);
insert into employee(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno) values ("Ramesh","K","Narayan",666884444, "1962-09-15","975 Fire Oak, Humble, TX", "M", 38000,333445555,5);
insert into employee(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno) values ("Joyce","A","English",453453453, "1972-07-31","5631 Rice, Houston, TX", "F", 25000,333445555,5);
insert into employee(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno) values ("Ahmad","V","Jabbar",987987987, "1969-03-29","980 Dallas, Houston, TX", "F", 25000,987654321,4);
insert into employee(Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno) values ("James","E","Borg",888665555, "1937-11-10","450 Stone, Houston, TX", "M", 55000,null,1);

/*department insert method*/
insert into department(Dname,Dnumber,Mgr_ssn,Mgr_start_date) values ("Research",5, 333445555,"1988-05-22");
insert into department(Dname,Dnumber,Mgr_ssn,Mgr_start_date) values ("Administration",4, 987654321,"1995-01-01");
insert into department(Dname,Dnumber,Mgr_ssn,Mgr_start_date) values ("Headquarters",1, 888665555,"1981-06-19");

/*project insert methods */
insert into dept_location(Dnumber,Dlocation) values(1, "Houston");
insert into dept_location(Dnumber,Dlocation) values(4, "Stafford");
insert into dept_location(Dnumber,Dlocation) values(5, "Bellaire");
insert into dept_location(Dnumber,Dlocation) values(5, "Sugarland");
insert into dept_location(Dnumber,Dlocation) values(5, "Houston");

/*project insert method */
insert into project(Pname,Pnumber,Plocation,Dnum) values("ProductX",1,"Bellaire",5);
insert into project(Pname,Pnumber,Plocation,Dnum) values("ProductY",2,"Sugarland",5);
insert into project(Pname,Pnumber,Plocation,Dnum) values("ProductZ",3,"Houston",5);
insert into project(Pname,Pnumber,Plocation,Dnum) values("Computerization",10,"Stafford",4);
insert into project(Pname,Pnumber,Plocation,Dnum) values("Reorganization",20,"Hoston",1);
insert into project(Pname,Pnumber,Plocation,Dnum) values("Newbenefits",30,"Stafford",4);

/*works on insert method */
insert into works_on(Essn,Pno,Hours) values(123456789,1,32.5);
insert into works_on(Essn,Pno,Hours) values(123456789,2,7.5);
insert into works_on(Essn,Pno,Hours) values(666884444,3,40.0);
insert into works_on(Essn,Pno,Hours) values(453453453,1,20.0);
insert into works_on(Essn,Pno,Hours) values(453453453,2,20.0);
insert into works_on(Essn,Pno,Hours) values(333445555,2,10.0);
insert into works_on(Essn,Pno,Hours) values(333445555,3,10.0);
insert into works_on(Essn,Pno,Hours) values(333445555,10,10.0);
insert into works_on(Essn,Pno,Hours) values(333445555,20,30.0);
insert into works_on(Essn,Pno,Hours) values(999887777,30,30.0);
insert into works_on(Essn,Pno,Hours) values(999887777,10,10.0);
insert into works_on(Essn,Pno,Hours) values(987987987,10,35.0);
insert into works_on(Essn,Pno,Hours) values(987987987,30,5.0);
insert into works_on(Essn,Pno,Hours) values(987654321,30,20.0);
insert into works_on(Essn,Pno,Hours) values(987654321,20,15.0);
insert into works_on(Essn,Pno,Hours) values(888665555,20,null);


/*dependents insert methods*/
insert into dependent(Essn,Dependent_name,Sex,Bdate,Relationship) values(333445555, "Alice", "F", "1986-04-05","Daughter");
insert into dependent(Essn,Dependent_name,Sex,Bdate,Relationship) values(333445555, "Theodore", "M", "1983-10-25","Son");
insert into dependent(Essn,Dependent_name,Sex,Bdate,Relationship) values(333445555, "Joy", "F", "1958-05-03","Spouse");
insert into dependent(Essn,Dependent_name,Sex,Bdate,Relationship) values(987654321, "Abner", "M", "1942-02-28","Spouse");
insert into dependent(Essn,Dependent_name,Sex,Bdate,Relationship) values(123456789, "Michael", "M", "1988-01-04","Son");
insert into dependent(Essn,Dependent_name,Sex,Bdate,Relationship) values(987654321, "Alice", "F", "1988-12-30","Daughter");
insert into dependent(Essn,Dependent_name,Sex,Bdate,Relationship) values(987654321, "Elizabeth", "F", "1967-05-05","Spouse");