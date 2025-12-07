CREATE TABLE R1 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shucked_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_R1_0 (diameter, height, length, rings, sex, shucked_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_R1_fd0_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_shucked_weight VARCHAR(255);
    
    SELECT shucked_weight INTO existing_shucked_weight
    FROM R1
    WHERE diameter = NEW.diameter AND height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shucked_weight IS NOT NULL AND (existing_shucked_weight != NEW.shucked_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,length,rings,whole_weight -> shucked_weight';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd0_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_shucked_weight VARCHAR(255);
    
    SELECT shucked_weight INTO existing_shucked_weight
    FROM R1
    WHERE diameter = NEW.diameter AND height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shucked_weight IS NOT NULL AND (existing_shucked_weight != NEW.shucked_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,length,rings,whole_weight -> shucked_weight';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R1_fd1_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R1
    WHERE diameter = NEW.diameter AND height = NEW.height AND length = NEW.length AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,length,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd1_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R1
    WHERE diameter = NEW.diameter AND height = NEW.height AND length = NEW.length AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,length,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R1_fd2_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM R1
    WHERE diameter = NEW.diameter AND height = NEW.height AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,shucked_weight,whole_weight -> length';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd2_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM R1
    WHERE diameter = NEW.diameter AND height = NEW.height AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,shucked_weight,whole_weight -> length';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R1_fd3_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM R1
    WHERE diameter = NEW.diameter AND height = NEW.height AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,shucked_weight,whole_weight -> rings';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd3_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM R1
    WHERE diameter = NEW.diameter AND height = NEW.height AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,shucked_weight,whole_weight -> rings';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R1_fd4_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM R1
    WHERE diameter = NEW.diameter AND length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shucked_weight,whole_weight -> height';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd4_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM R1
    WHERE diameter = NEW.diameter AND length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shucked_weight,whole_weight -> height';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R1_fd5_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM R1
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,shucked_weight,whole_weight -> height';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd5_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM R1
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,shucked_weight,whole_weight -> height';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R1_fd6_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM R1
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,shucked_weight,whole_weight -> length';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd6_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM R1
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,shucked_weight,whole_weight -> length';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R1_fd7_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R1
    WHERE diameter = NEW.diameter AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,shucked_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd7_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R1
    WHERE diameter = NEW.diameter AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,shucked_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R1_fd8_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R1
    WHERE height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,rings,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd8_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R1
    WHERE height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,rings,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R1_fd9_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM R1
    WHERE height = NEW.height AND length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,shucked_weight,whole_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd9_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM R1
    WHERE height = NEW.height AND length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,shucked_weight,whole_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R1_fd10_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R1
    WHERE height = NEW.height AND length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,shucked_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd10_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R1
    WHERE height = NEW.height AND length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,shucked_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R1_fd11_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM R1
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,whole_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd11_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM R1
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,whole_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R1_fd12_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM R1
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,whole_weight -> height';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd12_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM R1
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,whole_weight -> height';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R1_fd13_insert
BEFORE INSERT ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM R1
    WHERE length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shucked_weight,whole_weight -> rings';
    END IF;
END$$

CREATE TRIGGER enforce_R1_fd13_update
BEFORE UPDATE ON R1
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM R1
    WHERE length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shucked_weight,whole_weight -> rings';
    END IF;
END$$
DELIMITER ;


CREATE TABLE R2 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    sex VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_R2_0 (height, sex, viscera_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_R2_fd0_insert
BEFORE INSERT ON R2
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R2
    WHERE diameter = NEW.diameter AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,viscera_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_R2_fd0_update
BEFORE UPDATE ON R2
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R2
    WHERE diameter = NEW.diameter AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,viscera_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;


CREATE TABLE R3 (
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_R3_0 (height, length, sex, shell_weight, whole_weight)
,
    UNIQUE KEY unique_R3_1 (height, rings, sex, shell_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_R3_fd0_insert
BEFORE INSERT ON R3
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R3
    WHERE height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,rings,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_R3_fd0_update
BEFORE UPDATE ON R3
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R3
    WHERE height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,rings,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R3_fd1_insert
BEFORE INSERT ON R3
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R3
    WHERE length = NEW.length AND rings = NEW.rings AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,shell_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_R3_fd1_update
BEFORE UPDATE ON R3
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R3
    WHERE length = NEW.length AND rings = NEW.rings AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,shell_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;


CREATE TABLE R4 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_R4_0 (diameter, length, sex, shell_weight, viscera_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_R4_fd0_insert
BEFORE INSERT ON R4
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R4
    WHERE diameter = NEW.diameter AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,shell_weight,shucked_weight,viscera_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_R4_fd0_update
BEFORE UPDATE ON R4
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R4
    WHERE diameter = NEW.diameter AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,shell_weight,shucked_weight,viscera_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R4_fd1_insert
BEFORE INSERT ON R4
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM R4
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,viscera_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_R4_fd1_update
BEFORE UPDATE ON R4
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM R4
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,viscera_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R4_fd2_insert
BEFORE INSERT ON R4
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM R4
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,viscera_weight -> shell_weight';
    END IF;
END$$

CREATE TRIGGER enforce_R4_fd2_update
BEFORE UPDATE ON R4
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM R4
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,viscera_weight -> shell_weight';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R4_fd3_insert
BEFORE INSERT ON R4
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM R4
    WHERE length = NEW.length AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shell_weight,shucked_weight,viscera_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_R4_fd3_update
BEFORE UPDATE ON R4
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM R4
    WHERE length = NEW.length AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shell_weight,shucked_weight,viscera_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R4_fd4_insert
BEFORE INSERT ON R4
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R4
    WHERE length = NEW.length AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shell_weight,shucked_weight,viscera_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_R4_fd4_update
BEFORE UPDATE ON R4
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM R4
    WHERE length = NEW.length AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shell_weight,shucked_weight,viscera_weight -> sex';
    END IF;
END$$
DELIMITER ;


CREATE TABLE R5 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    shell_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_R5_0 (diameter, height, length, rings, whole_weight)
,
    UNIQUE KEY unique_R5_1 (diameter, height, rings, shell_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_R5_fd0_insert
BEFORE INSERT ON R5
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM R5
    WHERE diameter = NEW.diameter AND length = NEW.length AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shell_weight,whole_weight -> height';
    END IF;
END$$

CREATE TRIGGER enforce_R5_fd0_update
BEFORE UPDATE ON R5
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM R5
    WHERE diameter = NEW.diameter AND length = NEW.length AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shell_weight,whole_weight -> height';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R5_fd1_insert
BEFORE INSERT ON R5
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM R5
    WHERE diameter = NEW.diameter AND length = NEW.length AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shell_weight,whole_weight -> rings';
    END IF;
END$$

CREATE TRIGGER enforce_R5_fd1_update
BEFORE UPDATE ON R5
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM R5
    WHERE diameter = NEW.diameter AND length = NEW.length AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shell_weight,whole_weight -> rings';
    END IF;
END$$
DELIMITER ;


CREATE TABLE R6 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_R6_0 (diameter, length, shell_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_R6_fd0_insert
BEFORE INSERT ON R6
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM R6
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_R6_fd0_update
BEFORE UPDATE ON R6
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM R6
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_R6_fd1_insert
BEFORE INSERT ON R6
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM R6
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> length';
    END IF;
END$$

CREATE TRIGGER enforce_R6_fd1_update
BEFORE UPDATE ON R6
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM R6
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> length';
    END IF;
END$$
DELIMITER ;


CREATE TABLE R7 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_R7_0 (diameter, height, length, rings, viscera_weight)
,
    UNIQUE KEY unique_R7_1 (diameter, length, rings, shell_weight, viscera_weight)
);


CREATE TABLE R8 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_R8_0 (diameter, length, rings, shell_weight, viscera_weight)
,
    UNIQUE KEY unique_R8_1 (length, rings, sex, shell_weight, viscera_weight)
);


CREATE TABLE R9 (
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_R9_0 (height, length, viscera_weight, whole_weight)
,
    UNIQUE KEY unique_R9_1 (length, rings, viscera_weight, whole_weight)
);


CREATE TABLE R10 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_R10_0 (diameter, rings, viscera_weight, whole_weight)
,
    UNIQUE KEY unique_R10_1 (length, rings, viscera_weight, whole_weight)
);


CREATE TABLE R11 (
    diameter VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_R11_0 (diameter, rings, shucked_weight, viscera_weight)
,
    UNIQUE KEY unique_R11_1 (rings, sex, shucked_weight, viscera_weight)
);


CREATE TABLE R12 (
    diameter VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_R12_0 (diameter, shucked_weight, whole_weight)
,
    UNIQUE KEY unique_R12_1 (shucked_weight, viscera_weight, whole_weight)
);


CREATE TABLE R13 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_R13_0 (diameter, height, rings, shell_weight, viscera_weight)
,
    UNIQUE KEY unique_R13_1 (diameter, height, sex, shell_weight, viscera_weight)
);


CREATE TABLE R14 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    length VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_R14_0 (diameter, height, shucked_weight, viscera_weight)
,
    UNIQUE KEY unique_R14_1 (height, length, shucked_weight, viscera_weight)
);


CREATE TABLE R15 (
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255)
,
    UNIQUE KEY unique_R15_0 (height, length, rings, shell_weight, shucked_weight)
,
    UNIQUE KEY unique_R15_1 (height, length, sex, shell_weight, shucked_weight)
);


CREATE TABLE R16 (
    height VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_R16_0 (rings, sex, viscera_weight, whole_weight)
);


CREATE TABLE R17 (
    length VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_R17_0 (shell_weight, shucked_weight, whole_weight)
);


CREATE TABLE R18 (
    height VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_R18_0 (shell_weight, viscera_weight, whole_weight)
);


CREATE TABLE R19 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255)
,
    UNIQUE KEY unique_R19_0 (diameter, height, rings, shell_weight, shucked_weight)
);


CREATE TABLE R20 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_R20_0 (diameter, height, shell_weight, whole_weight)
);


CREATE TABLE R21 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255)
,
    UNIQUE KEY unique_R21_0 (diameter, length, rings, shell_weight, shucked_weight)
);


CREATE TABLE R22 (
    diameter VARCHAR(255),
    rings VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_R22_0 (diameter, rings, shucked_weight, viscera_weight)
);


CREATE TABLE R23 (
    height VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_R23_0 (height, rings, shucked_weight, viscera_weight)
);


CREATE TABLE R24 (
    height VARCHAR(255),
    length VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_R24_0 (height, shell_weight, shucked_weight, viscera_weight)
);


CREATE TABLE R25 (
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_R25_0 (length, rings, sex, shell_weight, viscera_weight)
);


CREATE TABLE R26 (
    length VARCHAR(255),
    rings VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_R26_0 (length, rings, shucked_weight, viscera_weight)
);

