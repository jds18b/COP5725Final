CREATE TABLE Conf1 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shucked_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf1_0 (diameter, height, length, rings, sex, shucked_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd0_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_shucked_weight VARCHAR(255);
    
    SELECT shucked_weight INTO existing_shucked_weight
    FROM Conf1
    WHERE diameter = NEW.diameter AND height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shucked_weight IS NOT NULL AND (existing_shucked_weight != NEW.shucked_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,length,rings,whole_weight -> shucked_weight';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd0_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_shucked_weight VARCHAR(255);
    
    SELECT shucked_weight INTO existing_shucked_weight
    FROM Conf1
    WHERE diameter = NEW.diameter AND height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shucked_weight IS NOT NULL AND (existing_shucked_weight != NEW.shucked_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,length,rings,whole_weight -> shucked_weight';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd1_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf1
    WHERE diameter = NEW.diameter AND height = NEW.height AND length = NEW.length AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,length,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd1_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf1
    WHERE diameter = NEW.diameter AND height = NEW.height AND length = NEW.length AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,length,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd2_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Conf1
    WHERE diameter = NEW.diameter AND height = NEW.height AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,shucked_weight,whole_weight -> length';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd2_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Conf1
    WHERE diameter = NEW.diameter AND height = NEW.height AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,shucked_weight,whole_weight -> length';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd3_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Conf1
    WHERE diameter = NEW.diameter AND height = NEW.height AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,shucked_weight,whole_weight -> rings';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd3_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Conf1
    WHERE diameter = NEW.diameter AND height = NEW.height AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,height,shucked_weight,whole_weight -> rings';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd4_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Conf1
    WHERE diameter = NEW.diameter AND length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shucked_weight,whole_weight -> height';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd4_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Conf1
    WHERE diameter = NEW.diameter AND length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shucked_weight,whole_weight -> height';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd5_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Conf1
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,shucked_weight,whole_weight -> height';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd5_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Conf1
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,shucked_weight,whole_weight -> height';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd6_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Conf1
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,shucked_weight,whole_weight -> length';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd6_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Conf1
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,shucked_weight,whole_weight -> length';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd7_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf1
    WHERE diameter = NEW.diameter AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,shucked_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd7_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf1
    WHERE diameter = NEW.diameter AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,shucked_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd8_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf1
    WHERE height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,rings,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd8_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf1
    WHERE height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,rings,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd9_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Conf1
    WHERE height = NEW.height AND length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,shucked_weight,whole_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd9_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Conf1
    WHERE height = NEW.height AND length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,shucked_weight,whole_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd10_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf1
    WHERE height = NEW.height AND length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,shucked_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd10_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf1
    WHERE height = NEW.height AND length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,shucked_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd11_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Conf1
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,whole_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd11_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Conf1
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,whole_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd12_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Conf1
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,whole_weight -> height';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd12_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Conf1
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,whole_weight -> height';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf1_fd13_insert
BEFORE INSERT ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Conf1
    WHERE length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shucked_weight,whole_weight -> rings';
    END IF;
END$$

CREATE TRIGGER enforce_Conf1_fd13_update
BEFORE UPDATE ON Conf1
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Conf1
    WHERE length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shucked_weight,whole_weight -> rings';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Conf2 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf2_0 (diameter, length, sex, shell_weight, viscera_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Conf2_fd0_insert
BEFORE INSERT ON Conf2
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf2
    WHERE diameter = NEW.diameter AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,shell_weight,shucked_weight,viscera_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Conf2_fd0_update
BEFORE UPDATE ON Conf2
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf2
    WHERE diameter = NEW.diameter AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,shell_weight,shucked_weight,viscera_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf2_fd1_insert
BEFORE INSERT ON Conf2
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Conf2
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,viscera_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_Conf2_fd1_update
BEFORE UPDATE ON Conf2
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Conf2
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,viscera_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf2_fd2_insert
BEFORE INSERT ON Conf2
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM Conf2
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,viscera_weight -> shell_weight';
    END IF;
END$$

CREATE TRIGGER enforce_Conf2_fd2_update
BEFORE UPDATE ON Conf2
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM Conf2
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,viscera_weight -> shell_weight';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf2_fd3_insert
BEFORE INSERT ON Conf2
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Conf2
    WHERE length = NEW.length AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shell_weight,shucked_weight,viscera_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_Conf2_fd3_update
BEFORE UPDATE ON Conf2
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Conf2
    WHERE length = NEW.length AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shell_weight,shucked_weight,viscera_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf2_fd4_insert
BEFORE INSERT ON Conf2
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf2
    WHERE length = NEW.length AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shell_weight,shucked_weight,viscera_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Conf2_fd4_update
BEFORE UPDATE ON Conf2
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf2
    WHERE length = NEW.length AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shell_weight,shucked_weight,viscera_weight -> sex';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Conf3 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    shell_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf3_0 (diameter, height, length, rings, whole_weight)
,
    UNIQUE KEY unique_Conf3_1 (diameter, height, rings, shell_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Conf3_fd0_insert
BEFORE INSERT ON Conf3
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Conf3
    WHERE diameter = NEW.diameter AND length = NEW.length AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shell_weight,whole_weight -> height';
    END IF;
END$$

CREATE TRIGGER enforce_Conf3_fd0_update
BEFORE UPDATE ON Conf3
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Conf3
    WHERE diameter = NEW.diameter AND length = NEW.length AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shell_weight,whole_weight -> height';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf3_fd1_insert
BEFORE INSERT ON Conf3
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Conf3
    WHERE diameter = NEW.diameter AND length = NEW.length AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shell_weight,whole_weight -> rings';
    END IF;
END$$

CREATE TRIGGER enforce_Conf3_fd1_update
BEFORE UPDATE ON Conf3
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Conf3
    WHERE diameter = NEW.diameter AND length = NEW.length AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shell_weight,whole_weight -> rings';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Conf4 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf4_0 (diameter, length, shell_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Conf4_fd0_insert
BEFORE INSERT ON Conf4
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Conf4
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_Conf4_fd0_update
BEFORE UPDATE ON Conf4
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Conf4
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf4_fd1_insert
BEFORE INSERT ON Conf4
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Conf4
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> length';
    END IF;
END$$

CREATE TRIGGER enforce_Conf4_fd1_update
BEFORE UPDATE ON Conf4
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Conf4
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> length';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Conf5 (
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf5_0 (height, length, sex, shell_weight, whole_weight)
,
    UNIQUE KEY unique_Conf5_1 (height, rings, sex, shell_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Conf5_fd0_insert
BEFORE INSERT ON Conf5
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf5
    WHERE height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,rings,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Conf5_fd0_update
BEFORE UPDATE ON Conf5
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf5
    WHERE height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,rings,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Conf5_fd1_insert
BEFORE INSERT ON Conf5
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf5
    WHERE length = NEW.length AND rings = NEW.rings AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,shell_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Conf5_fd1_update
BEFORE UPDATE ON Conf5
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf5
    WHERE length = NEW.length AND rings = NEW.rings AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,shell_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Conf6 (
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf6_0 (height, length, viscera_weight, whole_weight)
,
    UNIQUE KEY unique_Conf6_1 (length, rings, viscera_weight, whole_weight)
);


CREATE TABLE Conf7 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    sex VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf7_0 (height, sex, viscera_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Conf7_fd0_insert
BEFORE INSERT ON Conf7
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf7
    WHERE diameter = NEW.diameter AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,viscera_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Conf7_fd0_update
BEFORE UPDATE ON Conf7
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Conf7
    WHERE diameter = NEW.diameter AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,viscera_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Conf8 (
    diameter VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf8_0 (diameter, rings, shucked_weight, viscera_weight)
,
    UNIQUE KEY unique_Conf8_1 (rings, sex, shucked_weight, viscera_weight)
);


CREATE TABLE Conf9 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf9_0 (diameter, length, rings, shell_weight, viscera_weight)
,
    UNIQUE KEY unique_Conf9_1 (length, rings, sex, shell_weight, viscera_weight)
);


CREATE TABLE Conf10 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf10_0 (diameter, rings, viscera_weight, whole_weight)
,
    UNIQUE KEY unique_Conf10_1 (length, rings, viscera_weight, whole_weight)
);


CREATE TABLE Conf11 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf11_0 (diameter, height, rings, shell_weight, viscera_weight)
,
    UNIQUE KEY unique_Conf11_1 (diameter, height, sex, shell_weight, viscera_weight)
);


CREATE TABLE Conf12 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    length VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf12_0 (diameter, height, shucked_weight, viscera_weight)
,
    UNIQUE KEY unique_Conf12_1 (height, length, shucked_weight, viscera_weight)
);


CREATE TABLE Conf13 (
    diameter VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf13_0 (diameter, shucked_weight, whole_weight)
,
    UNIQUE KEY unique_Conf13_1 (shucked_weight, viscera_weight, whole_weight)
);


CREATE TABLE Conf14 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf14_0 (diameter, height, length, rings, viscera_weight)
,
    UNIQUE KEY unique_Conf14_1 (diameter, length, rings, shell_weight, viscera_weight)
);


CREATE TABLE Conf15 (
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf15_0 (height, length, rings, shell_weight, shucked_weight)
,
    UNIQUE KEY unique_Conf15_1 (height, length, sex, shell_weight, shucked_weight)
);


CREATE TABLE Conf16 (
    height VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf16_0 (shell_weight, viscera_weight, whole_weight)
);


CREATE TABLE Conf17 (
    height VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf17_0 (rings, sex, viscera_weight, whole_weight)
);


CREATE TABLE Conf18 (
    diameter VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf18_0 (shell_weight, shucked_weight, whole_weight)
);


CREATE TABLE Conf19 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf19_0 (diameter, height, rings, shell_weight, shucked_weight)
);


CREATE TABLE Conf20 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf20_0 (diameter, height, shell_weight, whole_weight)
);


CREATE TABLE Conf21 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf21_0 (diameter, length, rings, shell_weight, shucked_weight)
);


CREATE TABLE Conf22 (
    diameter VARCHAR(255),
    rings VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf22_0 (diameter, rings, shucked_weight, viscera_weight)
);


CREATE TABLE Conf23 (
    height VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf23_0 (height, rings, shucked_weight, viscera_weight)
);


CREATE TABLE Conf24 (
    height VARCHAR(255),
    length VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf24_0 (height, shell_weight, shucked_weight, viscera_weight)
);


CREATE TABLE Conf25 (
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf25_0 (length, rings, sex, shell_weight, viscera_weight)
);


CREATE TABLE Conf26 (
    length VARCHAR(255),
    rings VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Conf26_0 (length, rings, shucked_weight, viscera_weight)
);

