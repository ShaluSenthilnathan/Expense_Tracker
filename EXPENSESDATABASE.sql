CREATE DATABASE EXPENSEDATABASE;
USE EXPENSEDATABASE;

DROP DATABASE EXPENSEDATABASE;

DROP TRIGGER VALIDATE_INCOMESOURCES1;
SHOW TRIGGERS;

CREATE TABLE USERINFO(
USER_ID VARCHAR(6),
USERNAME VARCHAR(50),
GENDER CHAR(1),
AGE INT,
EMAIL VARCHAR(30),
PHONE_NO BIGINT,
WORKING_OR_NOT CHAR(2),
PRIMARY KEY(USER_ID)
);

CREATE TABLE INCOMESOURCES(
USERID VARCHAR(6),
SOURCE_ID INT,
MONTHLY_INCOME INT,
RENTAL_INCOME INT,
INTREST_AMOUNT INT,
OTHER_SOURCES INT,
TOTAL_CASH INT,
BANK_BALANCE BIGINT,
NET_AMOUNT BIGINT,
PRIMARY KEY(SOURCE_ID),
FOREIGN KEY(USERID) REFERENCES USERINFO(USER_ID) ON DELETE CASCADE
);

CREATE TABLE BANKDATA(
USERID VARCHAR(6),
BANK_NAME VARCHAR(20),
DEPOSIT_NO INT,
DEPOSIT_AMOUNT INT,
MATURITY_DATE DATE,
EMI_NUMBER INT,
EMI_AMOUNT INT,
LOAN_NO INT,
WITHDRAWABLE_AMOUNT INT, 
TOTAL_ASSET BIGINT,
PRIMARY KEY(DEPOSIT_NO),
FOREIGN KEY(USERID) REFERENCES USERINFO(USER_ID) ON DELETE CASCADE
);

CREATE TABLE CATEGORY(
EXPENSE_ACRONYM CHAR(1),
EXPENSE_CATEGORY CHAR(20),
PRIMARY KEY(EXPENSE_ACRONYM)
);

CREATE TABLE MONTHLY_EXPENSES(
USERID VARCHAR(6),
EXPENSE_NO INT,
DATE_OF_EXPENSE DATE,
EXPENSE_ACRONYM CHAR(1),
EXPENSE_DESC CHAR(20),
MODE_OF_PAYMENT CHAR(20),
PRIMARY KEY(EXPENSE_NO),
FOREIGN KEY(USERID) REFERENCES USERINFO(USER_ID) ON DELETE CASCADE,
FOREIGN KEY(EXPENSE_ACRONYM) REFERENCES CATEGORY(EXPENSE_ACRONYM) ON DELETE CASCADE 
);

delimiter //
CREATE TRIGGER VALIDATE_INCOMESOURCES1 BEFORE INSERT
ON INCOMESOURCES
FOR EACH ROW
IF NEW.NET_AMOUNT > NEW.MONTHLY_INCOME THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'TOTAL AMOUNT SHOULD BE MORE';
END IF; // 
delemiter;



delimiter //
CREATE TRIGGER VALIDATE_INCOMESOURCES2 BEFORE INSERT
ON INCOMESOURCES
FOR EACH ROW
IF NEW.NET_AMOUNT > NEW.RENTAL_INCOME THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'TOTAL AMOUNT SHOULD BE MORE';
END IF; // 
delimiter;

delimiter //
CREATE TRIGGER VALIDATE_INCOMESOURCES3 BEFORE INSERT
ON INCOMESOURCES
FOR EACH ROW
IF NEW.NET_AMOUNT > NEW.INTREST_AMOUNT THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'TOTAL AMOUNT SHOULD BE MORE';
END IF; //
delimiter;

delimiter //
CREATE TRIGGER VALIDATE_INCOMESOURCES4 BEFORE INSERT
ON INCOMESOURCES
FOR EACH ROW
IF NEW.NET_AMOUNT > NEW.OTHER_SOURCES  THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'TOTAL AMOUNT SHOULD BE MORE';
END IF; //
