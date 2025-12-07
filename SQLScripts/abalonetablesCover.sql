CREATE TABLE Cover1 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover1_0 (diameter, height, length, rings, viscera_weight)
,
    UNIQUE KEY unique_Cover1_1 (diameter, height, length, rings, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Cover1_fd0_insert
BEFORE INSERT ON Cover1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Cover1
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,viscera_weight,whole_weight -> height';
    END IF;
END$$

CREATE TRIGGER enforce_Cover1_fd0_update
BEFORE UPDATE ON Cover1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Cover1
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,viscera_weight,whole_weight -> height';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover1_fd1_insert
BEFORE INSERT ON Cover1
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Cover1
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,viscera_weight,whole_weight -> length';
    END IF;
END$$

CREATE TRIGGER enforce_Cover1_fd1_update
BEFORE UPDATE ON Cover1
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Cover1
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,viscera_weight,whole_weight -> length';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover1_fd2_insert
BEFORE INSERT ON Cover1
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover1
    WHERE height = NEW.height AND length = NEW.length AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,viscera_weight,whole_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_Cover1_fd2_update
BEFORE UPDATE ON Cover1
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover1
    WHERE height = NEW.height AND length = NEW.length AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,viscera_weight,whole_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover1_fd3_insert
BEFORE INSERT ON Cover1
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Cover1
    WHERE height = NEW.height AND length = NEW.length AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,viscera_weight,whole_weight -> rings';
    END IF;
END$$

CREATE TRIGGER enforce_Cover1_fd3_update
BEFORE UPDATE ON Cover1
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Cover1
    WHERE height = NEW.height AND length = NEW.length AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,viscera_weight,whole_weight -> rings';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover1_fd4_insert
BEFORE INSERT ON Cover1
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover1
    WHERE length = NEW.length AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,viscera_weight,whole_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_Cover1_fd4_update
BEFORE UPDATE ON Cover1
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover1
    WHERE length = NEW.length AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,viscera_weight,whole_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover1_fd5_insert
BEFORE INSERT ON Cover1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Cover1
    WHERE length = NEW.length AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,viscera_weight,whole_weight -> height';
    END IF;
END$$

CREATE TRIGGER enforce_Cover1_fd5_update
BEFORE UPDATE ON Cover1
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Cover1
    WHERE length = NEW.length AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,viscera_weight,whole_weight -> height';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Cover2 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    length VARCHAR(255),
    sex VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover2_0 (diameter, height, length, whole_weight)
);


CREATE TABLE Cover3 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover3_0 (diameter, height, rings, shell_weight, shucked_weight)
);


CREATE TABLE Cover4 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover4_0 (diameter, height, rings, shell_weight, viscera_weight)
,
    UNIQUE KEY unique_Cover4_1 (diameter, height, sex, shell_weight, viscera_weight)
);


CREATE TABLE Cover5 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover5_0 (diameter, height, shell_weight, whole_weight)
);


CREATE TABLE Cover6 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    length VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover6_0 (diameter, height, shucked_weight, viscera_weight)
,
    UNIQUE KEY unique_Cover6_1 (height, length, shucked_weight, viscera_weight)
);


CREATE TABLE Cover7 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover7_0 (diameter, length, rings, shell_weight, shucked_weight)
);


CREATE TABLE Cover8 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover8_0 (diameter, length, rings, shell_weight, viscera_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Cover8_fd0_insert
BEFORE INSERT ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Cover8
    WHERE diameter = NEW.diameter AND length = NEW.length AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shell_weight,whole_weight -> rings';
    END IF;
END$$

CREATE TRIGGER enforce_Cover8_fd0_update
BEFORE UPDATE ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Cover8
    WHERE diameter = NEW.diameter AND length = NEW.length AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shell_weight,whole_weight -> rings';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover8_fd1_insert
BEFORE INSERT ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_viscera_weight VARCHAR(255);
    
    SELECT viscera_weight INTO existing_viscera_weight
    FROM Cover8
    WHERE diameter = NEW.diameter AND length = NEW.length AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_viscera_weight IS NOT NULL AND (existing_viscera_weight != NEW.viscera_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shell_weight,whole_weight -> viscera_weight';
    END IF;
END$$

CREATE TRIGGER enforce_Cover8_fd1_update
BEFORE UPDATE ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_viscera_weight VARCHAR(255);
    
    SELECT viscera_weight INTO existing_viscera_weight
    FROM Cover8
    WHERE diameter = NEW.diameter AND length = NEW.length AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_viscera_weight IS NOT NULL AND (existing_viscera_weight != NEW.viscera_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,length,shell_weight,whole_weight -> viscera_weight';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover8_fd2_insert
BEFORE INSERT ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Cover8
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,viscera_weight,whole_weight -> length';
    END IF;
END$$

CREATE TRIGGER enforce_Cover8_fd2_update
BEFORE UPDATE ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Cover8
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,viscera_weight,whole_weight -> length';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover8_fd3_insert
BEFORE INSERT ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM Cover8
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,viscera_weight,whole_weight -> shell_weight';
    END IF;
END$$

CREATE TRIGGER enforce_Cover8_fd3_update
BEFORE UPDATE ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM Cover8
    WHERE diameter = NEW.diameter AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,rings,viscera_weight,whole_weight -> shell_weight';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover8_fd4_insert
BEFORE INSERT ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover8
    WHERE length = NEW.length AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,viscera_weight,whole_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_Cover8_fd4_update
BEFORE UPDATE ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover8
    WHERE length = NEW.length AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,viscera_weight,whole_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover8_fd5_insert
BEFORE INSERT ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM Cover8
    WHERE length = NEW.length AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,viscera_weight,whole_weight -> shell_weight';
    END IF;
END$$

CREATE TRIGGER enforce_Cover8_fd5_update
BEFORE UPDATE ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM Cover8
    WHERE length = NEW.length AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,viscera_weight,whole_weight -> shell_weight';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover8_fd6_insert
BEFORE INSERT ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover8
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_Cover8_fd6_update
BEFORE UPDATE ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover8
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover8_fd7_insert
BEFORE INSERT ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Cover8
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> length';
    END IF;
END$$

CREATE TRIGGER enforce_Cover8_fd7_update
BEFORE UPDATE ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Cover8
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> length';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover8_fd8_insert
BEFORE INSERT ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Cover8
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> rings';
    END IF;
END$$

CREATE TRIGGER enforce_Cover8_fd8_update
BEFORE UPDATE ON Cover8
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Cover8
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> rings';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Cover9 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover9_0 (diameter, length, sex, shell_weight, viscera_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Cover9_fd0_insert
BEFORE INSERT ON Cover9
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover9
    WHERE diameter = NEW.diameter AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,shell_weight,shucked_weight,viscera_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover9_fd0_update
BEFORE UPDATE ON Cover9
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover9
    WHERE diameter = NEW.diameter AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,shell_weight,shucked_weight,viscera_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover9_fd1_insert
BEFORE INSERT ON Cover9
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover9
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,viscera_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_Cover9_fd1_update
BEFORE UPDATE ON Cover9
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover9
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,viscera_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover9_fd2_insert
BEFORE INSERT ON Cover9
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM Cover9
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,viscera_weight -> shell_weight';
    END IF;
END$$

CREATE TRIGGER enforce_Cover9_fd2_update
BEFORE UPDATE ON Cover9
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM Cover9
    WHERE length = NEW.length AND sex = NEW.sex AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,sex,shucked_weight,viscera_weight -> shell_weight';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover9_fd3_insert
BEFORE INSERT ON Cover9
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover9
    WHERE length = NEW.length AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shell_weight,shucked_weight,viscera_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_Cover9_fd3_update
BEFORE UPDATE ON Cover9
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover9
    WHERE length = NEW.length AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shell_weight,shucked_weight,viscera_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover9_fd4_insert
BEFORE INSERT ON Cover9
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover9
    WHERE length = NEW.length AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shell_weight,shucked_weight,viscera_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover9_fd4_update
BEFORE UPDATE ON Cover9
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover9
    WHERE length = NEW.length AND shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shell_weight,shucked_weight,viscera_weight -> sex';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Cover10 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover10_0 (diameter, length, shell_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Cover10_fd0_insert
BEFORE INSERT ON Cover10
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover10
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> diameter';
    END IF;
END$$

CREATE TRIGGER enforce_Cover10_fd0_update
BEFORE UPDATE ON Cover10
FOR EACH ROW
BEGIN
    DECLARE existing_diameter VARCHAR(255);
    
    SELECT diameter INTO existing_diameter
    FROM Cover10
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_diameter IS NOT NULL AND (existing_diameter != NEW.diameter) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> diameter';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover10_fd1_insert
BEFORE INSERT ON Cover10
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Cover10
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> length';
    END IF;
END$$

CREATE TRIGGER enforce_Cover10_fd1_update
BEFORE UPDATE ON Cover10
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Cover10
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> length';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Cover11 (
    diameter VARCHAR(255),
    rings VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover11_0 (diameter, rings, shucked_weight, viscera_weight)
);


CREATE TABLE Cover12 (
    diameter VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover12_0 (diameter, shell_weight, shucked_weight, viscera_weight)
);


CREATE TABLE Cover13 (
    diameter VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover13_0 (diameter, shucked_weight, whole_weight)
,
    UNIQUE KEY unique_Cover13_1 (shucked_weight, viscera_weight, whole_weight)
);


CREATE TABLE Cover14 (
    diameter VARCHAR(255),
    sex VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover14_0 (diameter, viscera_weight, whole_weight)
);


CREATE TABLE Cover15 (
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover15_0 (height, length, rings, shell_weight, shucked_weight)
,
    UNIQUE KEY unique_Cover15_1 (height, length, sex, shell_weight, shucked_weight)
);


CREATE TABLE Cover16 (
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover16_0 (height, length, rings, whole_weight)
);


CREATE TABLE Cover17 (
    height VARCHAR(255),
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover17_0 (height, length, sex, shell_weight, whole_weight)
,
    UNIQUE KEY unique_Cover17_1 (height, rings, sex, shell_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Cover17_fd0_insert
BEFORE INSERT ON Cover17
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover17
    WHERE height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,rings,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover17_fd0_update
BEFORE UPDATE ON Cover17
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover17
    WHERE height = NEW.height AND length = NEW.length AND rings = NEW.rings AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: height,length,rings,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover17_fd1_insert
BEFORE INSERT ON Cover17
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover17
    WHERE length = NEW.length AND rings = NEW.rings AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,shell_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover17_fd1_update
BEFORE UPDATE ON Cover17
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover17
    WHERE length = NEW.length AND rings = NEW.rings AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,shell_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Cover18 (
    height VARCHAR(255),
    length VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover18_0 (height, length, shucked_weight, whole_weight)
,
    UNIQUE KEY unique_Cover18_1 (height, length, viscera_weight, whole_weight)
,
    UNIQUE KEY unique_Cover18_2 (height, shucked_weight, viscera_weight, whole_weight)
,
    UNIQUE KEY unique_Cover18_3 (length, shucked_weight, viscera_weight, whole_weight)
);


CREATE TABLE Cover19 (
    height VARCHAR(255),
    rings VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover19_0 (height, rings, shucked_weight, viscera_weight)
,
    UNIQUE KEY unique_Cover19_1 (height, shucked_weight, viscera_weight, whole_weight)
,
    UNIQUE KEY unique_Cover19_2 (rings, shucked_weight, viscera_weight, whole_weight)
);


CREATE TABLE Cover20 (
    diameter VARCHAR(255),
    height VARCHAR(255),
    sex VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover20_0 (height, sex, viscera_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Cover20_fd0_insert
BEFORE INSERT ON Cover20
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover20
    WHERE diameter = NEW.diameter AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,viscera_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover20_fd0_update
BEFORE UPDATE ON Cover20
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover20
    WHERE diameter = NEW.diameter AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: diameter,viscera_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Cover21 (
    height VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover21_0 (height, shell_weight, shucked_weight, viscera_weight)
,
    UNIQUE KEY unique_Cover21_1 (height, shucked_weight, viscera_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Cover21_fd0_insert
BEFORE INSERT ON Cover21
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Cover21
    WHERE shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,shucked_weight,whole_weight -> height';
    END IF;
END$$

CREATE TRIGGER enforce_Cover21_fd0_update
BEFORE UPDATE ON Cover21
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Cover21
    WHERE shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,shucked_weight,whole_weight -> height';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover21_fd1_insert
BEFORE INSERT ON Cover21
FOR EACH ROW
BEGIN
    DECLARE existing_viscera_weight VARCHAR(255);
    
    SELECT viscera_weight INTO existing_viscera_weight
    FROM Cover21
    WHERE shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_viscera_weight IS NOT NULL AND (existing_viscera_weight != NEW.viscera_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,shucked_weight,whole_weight -> viscera_weight';
    END IF;
END$$

CREATE TRIGGER enforce_Cover21_fd1_update
BEFORE UPDATE ON Cover21
FOR EACH ROW
BEGIN
    DECLARE existing_viscera_weight VARCHAR(255);
    
    SELECT viscera_weight INTO existing_viscera_weight
    FROM Cover21
    WHERE shell_weight = NEW.shell_weight AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_viscera_weight IS NOT NULL AND (existing_viscera_weight != NEW.viscera_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,shucked_weight,whole_weight -> viscera_weight';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover21_fd2_insert
BEFORE INSERT ON Cover21
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Cover21
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> height';
    END IF;
END$$

CREATE TRIGGER enforce_Cover21_fd2_update
BEFORE UPDATE ON Cover21
FOR EACH ROW
BEGIN
    DECLARE existing_height VARCHAR(255);
    
    SELECT height INTO existing_height
    FROM Cover21
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_height IS NOT NULL AND (existing_height != NEW.height) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> height';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover21_fd3_insert
BEFORE INSERT ON Cover21
FOR EACH ROW
BEGIN
    DECLARE existing_shucked_weight VARCHAR(255);
    
    SELECT shucked_weight INTO existing_shucked_weight
    FROM Cover21
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shucked_weight IS NOT NULL AND (existing_shucked_weight != NEW.shucked_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> shucked_weight';
    END IF;
END$$

CREATE TRIGGER enforce_Cover21_fd3_update
BEFORE UPDATE ON Cover21
FOR EACH ROW
BEGIN
    DECLARE existing_shucked_weight VARCHAR(255);
    
    SELECT shucked_weight INTO existing_shucked_weight
    FROM Cover21
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shucked_weight IS NOT NULL AND (existing_shucked_weight != NEW.shucked_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> shucked_weight';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Cover22 (
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover22_0 (length, rings, sex, shell_weight, viscera_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Cover22_fd0_insert
BEFORE INSERT ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover22
    WHERE length = NEW.length AND rings = NEW.rings AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,shell_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover22_fd0_update
BEFORE UPDATE ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover22
    WHERE length = NEW.length AND rings = NEW.rings AND shell_weight = NEW.shell_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,shell_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover22_fd1_insert
BEFORE INSERT ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover22
    WHERE length = NEW.length AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,viscera_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover22_fd1_update
BEFORE UPDATE ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover22
    WHERE length = NEW.length AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,viscera_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover22_fd2_insert
BEFORE INSERT ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM Cover22
    WHERE length = NEW.length AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,viscera_weight,whole_weight -> shell_weight';
    END IF;
END$$

CREATE TRIGGER enforce_Cover22_fd2_update
BEFORE UPDATE ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM Cover22
    WHERE length = NEW.length AND rings = NEW.rings AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,rings,viscera_weight,whole_weight -> shell_weight';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover22_fd3_insert
BEFORE INSERT ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Cover22
    WHERE rings = NEW.rings AND sex = NEW.sex AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: rings,sex,viscera_weight,whole_weight -> length';
    END IF;
END$$

CREATE TRIGGER enforce_Cover22_fd3_update
BEFORE UPDATE ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Cover22
    WHERE rings = NEW.rings AND sex = NEW.sex AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: rings,sex,viscera_weight,whole_weight -> length';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover22_fd4_insert
BEFORE INSERT ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM Cover22
    WHERE rings = NEW.rings AND sex = NEW.sex AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: rings,sex,viscera_weight,whole_weight -> shell_weight';
    END IF;
END$$

CREATE TRIGGER enforce_Cover22_fd4_update
BEFORE UPDATE ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_shell_weight VARCHAR(255);
    
    SELECT shell_weight INTO existing_shell_weight
    FROM Cover22
    WHERE rings = NEW.rings AND sex = NEW.sex AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_shell_weight IS NOT NULL AND (existing_shell_weight != NEW.shell_weight) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: rings,sex,viscera_weight,whole_weight -> shell_weight';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover22_fd5_insert
BEFORE INSERT ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Cover22
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> length';
    END IF;
END$$

CREATE TRIGGER enforce_Cover22_fd5_update
BEFORE UPDATE ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_length VARCHAR(255);
    
    SELECT length INTO existing_length
    FROM Cover22
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_length IS NOT NULL AND (existing_length != NEW.length) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> length';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover22_fd6_insert
BEFORE INSERT ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Cover22
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> rings';
    END IF;
END$$

CREATE TRIGGER enforce_Cover22_fd6_update
BEFORE UPDATE ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Cover22
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> rings';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER enforce_Cover22_fd7_insert
BEFORE INSERT ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover22
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover22_fd7_update
BEFORE UPDATE ON Cover22
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover22
    WHERE shell_weight = NEW.shell_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shell_weight,viscera_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Cover23 (
    length VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover23_0 (length, rings, shell_weight, whole_weight)
);


CREATE TABLE Cover24 (
    length VARCHAR(255),
    rings VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover24_0 (length, rings, shucked_weight, viscera_weight)
,
    UNIQUE KEY unique_Cover24_1 (length, rings, viscera_weight, whole_weight)
,
    UNIQUE KEY unique_Cover24_2 (rings, shucked_weight, viscera_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Cover24_fd0_insert
BEFORE INSERT ON Cover24
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Cover24
    WHERE length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shucked_weight,whole_weight -> rings';
    END IF;
END$$

CREATE TRIGGER enforce_Cover24_fd0_update
BEFORE UPDATE ON Cover24
FOR EACH ROW
BEGIN
    DECLARE existing_rings VARCHAR(255);
    
    SELECT rings INTO existing_rings
    FROM Cover24
    WHERE length = NEW.length AND shucked_weight = NEW.shucked_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_rings IS NOT NULL AND (existing_rings != NEW.rings) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: length,shucked_weight,whole_weight -> rings';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Cover25 (
    length VARCHAR(255),
    sex VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover25_0 (length, sex, shucked_weight, viscera_weight)
,
    UNIQUE KEY unique_Cover25_1 (length, shell_weight, shucked_weight, viscera_weight)
);


CREATE TABLE Cover26 (
    length VARCHAR(255),
    sex VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover26_0 (length, sex, shucked_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Cover26_fd0_insert
BEFORE INSERT ON Cover26
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover26
    WHERE shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shucked_weight,viscera_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover26_fd0_update
BEFORE UPDATE ON Cover26
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover26
    WHERE shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shucked_weight,viscera_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Cover27 (
    diameter VARCHAR(255),
    length VARCHAR(255),
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover27_0 (length, shell_weight, shucked_weight, viscera_weight)
);


CREATE TABLE Cover28 (
    length VARCHAR(255),
    rings VARCHAR(255),
    shucked_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover28_0 (length, shucked_weight, whole_weight)
);


CREATE TABLE Cover29 (
    diameter VARCHAR(255),
    rings VARCHAR(255),
    sex VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover29_0 (diameter, rings, shucked_weight, viscera_weight)
,
    UNIQUE KEY unique_Cover29_1 (rings, sex, shucked_weight, viscera_weight)
);


CREATE TABLE Cover30 (
    rings VARCHAR(255),
    sex VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover30_0 (rings, sex, viscera_weight, whole_weight)
);

DELIMITER $$
CREATE TRIGGER enforce_Cover30_fd0_insert
BEFORE INSERT ON Cover30
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover30
    WHERE shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shucked_weight,viscera_weight,whole_weight -> sex';
    END IF;
END$$

CREATE TRIGGER enforce_Cover30_fd0_update
BEFORE UPDATE ON Cover30
FOR EACH ROW
BEGIN
    DECLARE existing_sex VARCHAR(255);
    
    SELECT sex INTO existing_sex
    FROM Cover30
    WHERE shucked_weight = NEW.shucked_weight AND viscera_weight = NEW.viscera_weight AND whole_weight = NEW.whole_weight
    LIMIT 1;
    
    IF existing_sex IS NOT NULL AND (existing_sex != NEW.sex) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FD Violation: shucked_weight,viscera_weight,whole_weight -> sex';
    END IF;
END$$
DELIMITER ;


CREATE TABLE Cover31 (
    shell_weight VARCHAR(255),
    shucked_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover31_0 (shell_weight, shucked_weight, whole_weight)
,
    UNIQUE KEY unique_Cover31_1 (shell_weight, viscera_weight, whole_weight)
);


CREATE TABLE Cover32 (
    height VARCHAR(255),
    shell_weight VARCHAR(255),
    viscera_weight VARCHAR(255),
    whole_weight VARCHAR(255)
,
    UNIQUE KEY unique_Cover32_0 (shell_weight, viscera_weight, whole_weight)
);

