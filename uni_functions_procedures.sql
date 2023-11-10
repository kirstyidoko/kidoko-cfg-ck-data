USE uni;

-- Creating a stored procedure to add new students to the database

DELIMITER //
CREATE PROCEDURE insert_student(
IN s_id INT, 
IN s_forename VARCHAR(50),
IN s_surname VARCHAR(50),
IN dob DATE,
IN enrol_year INT,
IN fee_status VARCHAR(4),
IN c_id VARCHAR(8))

BEGIN
INSERT INTO students(s_id, s_forename, s_surname, dob, enrol_year, fee_status, c_id)
VALUES (s_id, s_forename, s_surname, dob, enrol_year, fee_status, c_id);
END

//
DELIMITER ;

CALL insert_student(15, "Jacob", "Latimer", STR_TO_DATE("2004-07-13", "%Y-%m-%d"), 2023, "Home", "B540");

SELECT * FROM students;

-- Creating a stored function to determine a student's current year of study

DELIMITER //
CREATE FUNCTION year_of_study(date1 INT) RETURNS INT DETERMINISTIC
BEGIN
 DECLARE date2 INT;
  SELECT 2023 INTO date2;
  RETURN date2 - date1 + 1;
END

//

DELIMITER ;

-- Creating a stored function to determine academic standing of students

DELIMITER // 
CREATE FUNCTION academic_standing(pc_grade INT) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN 
	DECLARE ac_standing VARCHAR(50); 
    IF pc_grade >= 70 THEN
		SET ac_standing = "Good Standing";
	elseif (pc_grade >= 40 AND pc_grade < 70) THEN 
		SET ac_standing = "Academic Probation";
	elseif pc_grade < 40 THEN
		SET ac_standing = "At Risk of Academic Dismissal";
	END IF;
    RETURN (ac_standing); 
END // pc_grade 
DELIMITER ;

SELECT s_forename, s_surname, c_id, enrol_year, year_of_study(enrol_year) AS "study_year",
pc_grade, academic_standing(pc_grade) AS "ac_standing" FROM students;