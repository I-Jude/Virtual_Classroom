DROP DATABASE project;

CREATE DATABASE project;

USE project;

CREATE TABLE admin ( password BLOB NOT NULL )ENGINE = InnoDB;

INSERT INTO admin VALUES ( SHA1('1234'));

CREATE TABLE enroll_for (degree varchar(7) NOT NULL, course varchar(40) NOT NULL) ENGINE = InnoDB;

INSERT INTO enroll_for (degree, course) VALUES ('B.Tech.', 'Computer Engineering');
INSERT INTO enroll_for (degree, course) VALUES ('B.Tech.', 'Information Technology');
INSERT INTO enroll_for (degree, course) VALUES ('B.Tech.', 'Electronics and Communication Engineering');
INSERT INTO enroll_for (degree, course) VALUES ('B.E', 'Computer Science and Engineering');
INSERT INTO enroll_for (degree, course) VALUES ('B.E', 'Data Science');
INSERT INTO enroll_for (degree, course) VALUES ('B.E', 'Mechanical Engineering');
INSERT INTO enroll_for (degree, course) VALUES ('B.E', 'Civil Engineering');


CREATE TABLE student ( roll_no INT PRIMARY KEY, name varchar(50) NOT NULL, password BLOB NOT NULL, email_id varchar(255) NOT NULL, degree varchar(5) NOT NULL, course varchar(30) NOT NULL, year integer NOT NULL, is_approved BOOLEAN DEFAULT false,  CONSTRAINT CHK_year CHECK (year BETWEEN 1 AND 4)) ENGINE = InnoDB;


CREATE TABLE faculty ( name varchar(20) NOT NULL, username varchar(50) NOT NULL, password BLOB NOT NULL, email_id varchar(255) NOT NULL, degree varchar(5) NOT NULL, course varchar(30) NOT NULL, year integer NOT NULL, subject varchar(50) primary key, is_approved BOOLEAN DEFAULT false, CONSTRAINT CHK_faculty_year CHECK (year BETWEEN 1 AND 4)) ENGINE = InnoDB;
