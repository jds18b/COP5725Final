CREATE TABLE Cover1 (
    age VARCHAR(255),
    capital-gain VARCHAR(255),
    fnlwgt VARCHAR(255),
    hours-per-week VARCHAR(255),
    marital-status VARCHAR(255),
    occupation VARCHAR(255),
    relationship VARCHAR(255)
,
    UNIQUE KEY unique_Cover1_0 (age, capital-gain, fnlwgt, hours-per-week, occupation, relationship)
);


CREATE TABLE Cover2 (
    age VARCHAR(255),
    capital-loss VARCHAR(255),
    education-num VARCHAR(255),
    fnlwgt VARCHAR(255),
    hours-per-week VARCHAR(255),
    occupation VARCHAR(255),
    workclass VARCHAR(255)
,
    UNIQUE KEY unique_Cover2_0 (age, education-num, fnlwgt, hours-per-week, occupation, workclass)
);


CREATE TABLE Cover3 (
    age VARCHAR(255),
    education-num VARCHAR(255),
    fnlwgt VARCHAR(255),
    marital-status VARCHAR(255),
    race VARCHAR(255)
,
    UNIQUE KEY unique_Cover3_0 (age, education-num, fnlwgt, marital-status)
);


CREATE TABLE Cover4 (
    age VARCHAR(255),
    education-num VARCHAR(255),
    fnlwgt VARCHAR(255),
    marital-status VARCHAR(255),
    sex VARCHAR(255)
,
    UNIQUE KEY unique_Cover4_0 (age, education-num, fnlwgt, marital-status)
);


CREATE TABLE Cover5 (
    age VARCHAR(255),
    education-num VARCHAR(255),
    fnlwgt VARCHAR(255),
    race VARCHAR(255),
    relationship VARCHAR(255)
,
    UNIQUE KEY unique_Cover5_0 (age, education-num, fnlwgt, relationship)
);


CREATE TABLE Cover6 (
    age VARCHAR(255),
    education-num VARCHAR(255),
    fnlwgt VARCHAR(255),
    relationship VARCHAR(255),
    sex VARCHAR(255)
,
    UNIQUE KEY unique_Cover6_0 (age, education-num, fnlwgt, relationship)
);


CREATE TABLE Cover7 (
    age VARCHAR(255),
    fnlwgt VARCHAR(255),
    marital-status VARCHAR(255),
    occupation VARCHAR(255),
    race VARCHAR(255)
,
    UNIQUE KEY unique_Cover7_0 (age, fnlwgt, marital-status, occupation)
);


CREATE TABLE Cover8 (
    age VARCHAR(255),
    fnlwgt VARCHAR(255),
    marital-status VARCHAR(255),
    occupation VARCHAR(255),
    sex VARCHAR(255)
,
    UNIQUE KEY unique_Cover8_0 (age, fnlwgt, marital-status, occupation)
);


CREATE TABLE Cover9 (
    education VARCHAR(255),
    education-num VARCHAR(255)
,
    UNIQUE KEY unique_Cover9_0 (education)
,
    UNIQUE KEY unique_Cover9_1 (education-num)
);


CREATE TABLE Cover10 (
    education VARCHAR(255),
    education-num VARCHAR(255)
,
    UNIQUE KEY unique_Cover10_0 (education)
,
    UNIQUE KEY unique_Cover10_1 (education-num)
);


CREATE TABLE Cover11 (
    education-num VARCHAR(255),
    fnlwgt VARCHAR(255),
    native-country VARCHAR(255),
    occupation VARCHAR(255),
    race VARCHAR(255),
    sex VARCHAR(255)
,
    UNIQUE KEY unique_Cover11_0 (education-num, fnlwgt, native-country, occupation, sex)
);


CREATE TABLE Cover12 (
    education-num VARCHAR(255),
    fnlwgt VARCHAR(255),
    occupation VARCHAR(255),
    relationship VARCHAR(255),
    sex VARCHAR(255),
    workclass VARCHAR(255)
,
    UNIQUE KEY unique_Cover12_0 (education-num, fnlwgt, occupation, relationship, workclass)
);


CREATE TABLE Cover13 (
    age VARCHAR(255),
    capital-gain VARCHAR(255),
    capital-loss VARCHAR(255),
    education VARCHAR(255),
    education-num VARCHAR(255),
    fnlwgt VARCHAR(255),
    hours-per-week VARCHAR(255),
    income VARCHAR(255),
    marital-status VARCHAR(255),
    native-country VARCHAR(255),
    occupation VARCHAR(255),
    race VARCHAR(255),
    relationship VARCHAR(255),
    sex VARCHAR(255),
    workclass VARCHAR(255)
);

DELIMITER $$
CREATE TRIGGER enforce_Cover13_fd0_insert
BEFORE INSERT ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_marital-status VARCHAR(255);
    
    SELECT marital-status INTO existing_marital-status
    FROM Cover13
    WHERE age = NEW.age AND capital-gain = NEW.capital-gain AND fnlwgt = NEW.fnlwgt AND hours-per-week = NEW.hours-per-week AND occupation = NEW.occupation AND relationship = NEW.relationship
    LIMIT 1;
    
    IF existing_marital-status IS NOT NULL AND (existing_marital-status != NEW.marital-status) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,capital-gain,fnlwgt,hours-per-week,occupation,relationship -> marital-status';
    END IF;
END$$

CREATE TRIGGER enforce_Cover13_fd0_update
BEFORE UPDATE ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_marital-status VARCHAR(255);
    
    SELECT marital-status INTO existing_marital-status
    FROM Cover13
    WHERE age = NEW.age AND capital-gain = NEW.capital-gain AND fnlwgt = NEW.fnlwgt AND hours-per-week = NEW.hours-per-week AND occupation = NEW.occupation AND relationship = NEW.relationship
    LIMIT 1;
    
    IF existing_marital-status IS NOT NULL AND (existing_marital-status != NEW.marital-status) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,capital-gain,fnlwgt,hours-per-week,occupation,relationship -> marital-status';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover13_fd1_insert
BEFORE INSERT ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_capital-loss VARCHAR(255);
    
    SELECT capital-loss INTO existing_capital-loss
    FROM Cover13
    WHERE age = NEW.age AND education = NEW.education AND fnlwgt = NEW.fnlwgt AND hours-per-week = NEW.hours-per-week AND occupation = NEW.occupation AND workclass = NEW.workclass
    LIMIT 1;
    
    IF existing_capital-loss IS NOT NULL AND (existing_capital-loss != NEW.capital-loss) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,education,fnlwgt,hours-per-week,occupation,workclass -> capital-loss';
    END IF;
END$$

CREATE TRIGGER enforce_Cover13_fd1_update
BEFORE UPDATE ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_capital-loss VARCHAR(255);
    
    SELECT capital-loss INTO existing_capital-loss
    FROM Cover13
    WHERE age = NEW.age AND education = NEW.education AND fnlwgt = NEW.fnlwgt AND hours-per-week = NEW.hours-per-week AND occupation = NEW.occupation AND workclass = NEW.workclass
    LIMIT 1;
    
    IF existing_capital-loss IS NOT NULL AND (existing_capital-loss != NEW.capital-loss) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,education,fnlwgt,hours-per-week,occupation,workclass -> capital-loss';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover13_fd2_insert
BEFORE INSERT ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_race VARCHAR(255);
    
    SELECT race INTO existing_race
    FROM Cover13
    WHERE age = NEW.age AND education = NEW.education AND fnlwgt = NEW.fnlwgt AND marital-status = NEW.marital-status
    LIMIT 1;
    
    IF existing_race IS NOT NULL AND (existing_race != NEW.race) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,education,fnlwgt,marital-status -> race';
    END IF;
END$$

CREATE TRIGGER enforce_Cover13_fd2_update
BEFORE UPDATE ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_race VARCHAR(255);
    
    SELECT race INTO existing_race
    FROM Cover13
    WHERE age = NEW.age AND education = NEW.education AND fnlwgt = NEW.fnlwgt AND marital-status = NEW.marital-status
    LIMIT 1;
    
    IF existing_race IS NOT NULL AND (existing_race != NEW.race) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,education,fnlwgt,marital-status -> race';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover13_fd3_insert
BEFORE INSERT ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover13
    WHERE age = NEW.age AND education = NEW.education AND fnlwgt = NEW.fnlwgt AND marital-status = NEW.marital-status
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,education,fnlwgt,marital-status -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover13_fd3_update
BEFORE UPDATE ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover13
    WHERE age = NEW.age AND education = NEW.education AND fnlwgt = NEW.fnlwgt AND marital-status = NEW.marital-status
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,education,fnlwgt,marital-status -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover13_fd4_insert
BEFORE INSERT ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_race VARCHAR(255);
    
    SELECT race INTO existing_race
    FROM Cover13
    WHERE age = NEW.age AND education = NEW.education AND fnlwgt = NEW.fnlwgt AND relationship = NEW.relationship
    LIMIT 1;
    
    IF existing_race IS NOT NULL AND (existing_race != NEW.race) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,education,fnlwgt,relationship -> race';
    END IF;
END$$

CREATE TRIGGER enforce_Cover13_fd4_update
BEFORE UPDATE ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_race VARCHAR(255);
    
    SELECT race INTO existing_race
    FROM Cover13
    WHERE age = NEW.age AND education = NEW.education AND fnlwgt = NEW.fnlwgt AND relationship = NEW.relationship
    LIMIT 1;
    
    IF existing_race IS NOT NULL AND (existing_race != NEW.race) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,education,fnlwgt,relationship -> race';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover13_fd5_insert
BEFORE INSERT ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover13
    WHERE age = NEW.age AND education = NEW.education AND fnlwgt = NEW.fnlwgt AND relationship = NEW.relationship
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,education,fnlwgt,relationship -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover13_fd5_update
BEFORE UPDATE ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover13
    WHERE age = NEW.age AND education = NEW.education AND fnlwgt = NEW.fnlwgt AND relationship = NEW.relationship
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,education,fnlwgt,relationship -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover13_fd6_insert
BEFORE INSERT ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_race VARCHAR(255);
    
    SELECT race INTO existing_race
    FROM Cover13
    WHERE age = NEW.age AND fnlwgt = NEW.fnlwgt AND marital-status = NEW.marital-status AND occupation = NEW.occupation
    LIMIT 1;
    
    IF existing_race IS NOT NULL AND (existing_race != NEW.race) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,fnlwgt,marital-status,occupation -> race';
    END IF;
END$$

CREATE TRIGGER enforce_Cover13_fd6_update
BEFORE UPDATE ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_race VARCHAR(255);
    
    SELECT race INTO existing_race
    FROM Cover13
    WHERE age = NEW.age AND fnlwgt = NEW.fnlwgt AND marital-status = NEW.marital-status AND occupation = NEW.occupation
    LIMIT 1;
    
    IF existing_race IS NOT NULL AND (existing_race != NEW.race) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,fnlwgt,marital-status,occupation -> race';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover13_fd7_insert
BEFORE INSERT ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover13
    WHERE age = NEW.age AND fnlwgt = NEW.fnlwgt AND marital-status = NEW.marital-status AND occupation = NEW.occupation
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,fnlwgt,marital-status,occupation -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover13_fd7_update
BEFORE UPDATE ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover13
    WHERE age = NEW.age AND fnlwgt = NEW.fnlwgt AND marital-status = NEW.marital-status AND occupation = NEW.occupation
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: age,fnlwgt,marital-status,occupation -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover13_fd8_insert
BEFORE INSERT ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_education-num VARCHAR(255);
    
    SELECT education-num INTO existing_education-num
    FROM Cover13
    WHERE education = NEW.education
    LIMIT 1;
    
    IF existing_education-num IS NOT NULL AND (existing_education-num != NEW.education-num) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: education -> education-num';
    END IF;
END$$

CREATE TRIGGER enforce_Cover13_fd8_update
BEFORE UPDATE ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_education-num VARCHAR(255);
    
    SELECT education-num INTO existing_education-num
    FROM Cover13
    WHERE education = NEW.education
    LIMIT 1;
    
    IF existing_education-num IS NOT NULL AND (existing_education-num != NEW.education-num) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: education -> education-num';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover13_fd9_insert
BEFORE INSERT ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_race VARCHAR(255);
    
    SELECT race INTO existing_race
    FROM Cover13
    WHERE education = NEW.education AND fnlwgt = NEW.fnlwgt AND native-country = NEW.native-country AND occupation = NEW.occupation AND sex = NEW.sex
    LIMIT 1;
    
    IF existing_race IS NOT NULL AND (existing_race != NEW.race) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: education,fnlwgt,native-country,occupation,sex -> race';
    END IF;
END$$

CREATE TRIGGER enforce_Cover13_fd9_update
BEFORE UPDATE ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_race VARCHAR(255);
    
    SELECT race INTO existing_race
    FROM Cover13
    WHERE education = NEW.education AND fnlwgt = NEW.fnlwgt AND native-country = NEW.native-country AND occupation = NEW.occupation AND sex = NEW.sex
    LIMIT 1;
    
    IF existing_race IS NOT NULL AND (existing_race != NEW.race) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: education,fnlwgt,native-country,occupation,sex -> race';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover13_fd10_insert
BEFORE INSERT ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_education VARCHAR(255);
    
    SELECT education INTO existing_education
    FROM Cover13
    WHERE education-num = NEW.education-num
    LIMIT 1;
    
    IF existing_education IS NOT NULL AND (existing_education != NEW.education) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: education-num -> education';
    END IF;
END$$

CREATE TRIGGER enforce_Cover13_fd10_update
BEFORE UPDATE ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_education VARCHAR(255);
    
    SELECT education INTO existing_education
    FROM Cover13
    WHERE education-num = NEW.education-num
    LIMIT 1;
    
    IF existing_education IS NOT NULL AND (existing_education != NEW.education) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: education-num -> education';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover13_fd11_insert
BEFORE INSERT ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover13
    WHERE education-num = NEW.education-num AND fnlwgt = NEW.fnlwgt AND occupation = NEW.occupation AND relationship = NEW.relationship AND workclass = NEW.workclass
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: education-num,fnlwgt,occupation,relationship,workclass -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover13_fd11_update
BEFORE UPDATE ON Cover13
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover13
    WHERE education-num = NEW.education-num AND fnlwgt = NEW.fnlwgt AND occupation = NEW.occupation AND relationship = NEW.relationship AND workclass = NEW.workclass
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: education-num,fnlwgt,occupation,relationship,workclass -> sex';
    END IF;
END$$
DELIMITER ;

