-- CREATE USER 'smartboss'@'smartbossdb.c09tob7ay9ht.us-east-1.rds.amazonaws.com' IDENTIFIED BY 'smartb0ss';

/*
CREATE TABLE users
        (
        userid INT AUTO_INCREMENT PRIMARY KEY ,
        firstname VARCHAR(20),
        lastname VARCHAR(20),
        age int,
        email VARCHAR(30)
        );
*/

--ALTER TABLE users AUTO_INCREMENT = 100000;

--INSERT INTO users(firstname, lastname, age, email) VALUES ('root', 'root', '99', 'cooperj2@g.cofc.edu')
--INSERT INTO users(firstname, lastname, age, email) VALUES ('Johnnie', 'Cooper', '29', 'johntylercooper@icloud.com')
--SELECT * FROM users

/*
CREATE TABLE businesses
        (
        businessid INT AUTO_INCREMENT PRIMARY KEY ,
        name VARCHAR(20),
        owner INT,
        FOREIGN KEY fk_owner(owner)
        REFERENCES users(userid) 
        );
*/

-- ALTER TABLE businesses AUTO_INCREMENT = 100000;

--INSERT INTO businesses(name, owner) VALUES ('Daimler AG', (SELECT userid FROM users WHERE firstname = 'Johnnie'))
--SELECT * FROM businesses

/*
CREATE TABLE employees
        (
        employeeid INT AUTO_INCREMENT PRIMARY KEY ,
        userid INT,
        businessid INT,
        payrate FLOAT,
        ytd FLOAT,
        vacation FLOAT,
        sicktime FLOAT,
        FOREIGN KEY fk_user(userid) REFERENCES users(userid),
        FOREIGN KEY fk_business(businessid) REFERENCES businesses(businessid)
        );
*/

--  ALTER TABLE employees AUTO_INCREMENT = 100000;

/*
INSERT INTO  employees(
                userid, 
                businessid, 
                payrate, 
                ytd, 
                vacation, 
                sicktime) 
VALUES
       (
        (SELECT userid FROM users WHERE firstname = 'Johnnie'),
        (SELECT businessid from businesses WHERE owner = (SELECT userid FROM users WHERE firstname = 'Johnnie')),
        100.00,
        100000.00,
        40.0,
        40.0
       )
 */

--SELECT * FROM employees

/*
CREATE TABLE payroll
        (
        payrollid INT AUTO_INCREMENT PRIMARY KEY ,
        businessid INT,
        startdate DATE,
        enddate DATE,
        FOREIGN KEY (businessid) REFERENCES businesses(businessid)
        );
*/

--ALTER TABLE payroll AUTO_INCREMENT = 100000;


/*
INSERT INTO  payroll(
                businessid, 
                startdate, 
                enddate
                ) 
VALUES
       (
        (SELECT businessid from businesses WHERE owner = (SELECT userid FROM users WHERE firstname = 'Johnnie')),
        STR_TO_DATE('2019-05-30', '%Y-%m-%d'),
        STR_TO_DATE('2019-06-13', '%Y-%m-%d')
       )
*/


--SELECT * FROM payroll


/*
CREATE TABLE paycheck
        (
        paycheckid INT AUTO_INCREMENT PRIMARY KEY ,
        payrollid INT,
        FOREIGN KEY (payrollid) REFERENCES payroll(payrollid)
        );
*/

--ALTER TABLE paycheck AUTO_INCREMENT = 100000;

/*
INSERT INTO  paycheck(
                payrollid 
                ) 
VALUES
       (
        (SELECT payrollid from payroll WHERE businessid = (SELECT businessid from businesses WHERE owner = (SELECT userid FROM users WHERE firstname = 'Johnnie')))
       )
*/

--SELECT * FROM paycheck

/*
CREATE TABLE timeclock
        (
        clockid INT AUTO_INCREMENT PRIMARY KEY ,
        employeeid INT,
        paycheckid INT,
        payrate FLOAT,
        starttime DATE,
        stoptime DATE,
        FOREIGN KEY (employeeid) REFERENCES employees(employeeid),
        FOREIGN KEY (paycheckid) REFERENCES paycheck(paycheckid)
        );
*/

--ALTER TABLE timeclock AUTO_INCREMENT = 100000;

/*
INSERT INTO  timeclock(
                employeeid, 
                paycheckid, 
                starttime,
                stoptime)
VALUES
       (
        (SELECT employeeid from employees WHERE userid = (SELECT userid FROM users WHERE firstname = 'Johnnie')),
        (SELECT paycheckid from paycheck WHERE paycheckid = 100000),
        CURDATE(),
        CURDATE()-1
       )
*/

--SELECT * FROM timeclock

--ALTER TABLE timeclock DROP payrate