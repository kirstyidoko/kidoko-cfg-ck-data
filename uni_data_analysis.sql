USE uni;

-- Students and their respective courses and faculty
CREATE VIEW student_courses AS
SELECT s.s_id, s.s_forename, s.s_surname, s.enrol_year,
	CONCAT(LEFT(LOWER(s_surname),3),LEFT(LOWER(s_forename),3),RIGHT(enrol_year,2),"@student.uni.ac.uk") AS email_address,
	CONCAT(c.c_type, " ", c.c_name) AS c_title, f.f_name, s.pc_grade
FROM students s
INNER JOIN courses c ON s.c_id = c.c_id
LEFT JOIN faculty f ON c.f_id = f.f_id
ORDER BY s_id ASC;

SELECT * FROM student_courses;

-- Modules, their instructors + emails, and their faculty
CREATE VIEW mod_ins_fac AS
SELECT m.m_id, m.m_name, CONCAT(i.i_title, " ", i.i_forename, " ", i.i_surname) AS
m_instructor, CONCAT(LEFT(LOWER(i_forename),1),LOWER(i_surname),"@uni.ac.uk") AS email_address, f.f_name
FROM modules m
LEFT JOIN instructors i ON m.i_id = i.i_id
LEFT JOIN faculty f ON i.f_id = f.f_id;

SELECT * FROM mod_ins_fac;

-- Instructors who are paid higher than the average salary
SELECT i_forename, i_surname, salary FROM instructors WHERE salary > (SELECT AVG(salary) FROM instructors);

-- Students who study a course provided by a particular faculty
SELECT s_forename, s_surname, c_id FROM students 
WHERE c_id = ANY(SELECT c_id FROM courses WHERE f_id = "SocHum");
	-- ANY is used because subquery will find more than one course in SocHum
    -- ALL returns nothing as no student is enrolled in all of the SocHum courses

-- Counting no. of courses by degree type
SELECT c_type, COUNT(c_type) AS no_of_courses
FROM courses
GROUP BY c_type;

-- Counting no. of instructors by title in SciEng
SELECT i_title, COUNT(i_title) as title_count, f_id
FROM instructors
WHERE f_id = 'SciEng'
GROUP BY i_title, f_id;