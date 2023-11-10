-- Creating 'uni' database

CREATE DATABASE uni;
USE uni;

-- Creating and populating tables w/ primary keys

CREATE TABLE students
(s_id INT NOT NULL PRIMARY KEY,
s_forename VARCHAR(50),
s_surname VARCHAR(50),
dob DATE NOT NULL,		-- Date format is YYYY-MM-DD
enrol_year INT NOT NULL,
fee_status VARCHAR(4),	-- "Home" or "Int"
c_id VARCHAR(8),
pc_grade INT
);

INSERT INTO students
(s_id, s_forename, s_surname, dob, enrol_year, fee_status, c_id, pc_grade)
VALUES
(1, "Anna", "Hamilton", STR_TO_DATE("2002-05-13", "%Y-%m-%d"), 2020, "Home", "B540", 89),
(2, "Jean", "Richard", STR_TO_DATE("1998-02-26", "%Y-%m-%d"), 2022, "Intl", "C980", 72),
(3, "Ben", "Carson", STR_TO_DATE("2004-08-06", "%Y-%m-%d"), 2022, "Home", "D260", 37),
(4, "Rachel", "Watson", STR_TO_DATE("2001-01-22", "%Y-%m-%d"), 2021, "Home", "C900", 64),
(5, "Luke", "Brown", STR_TO_DATE("1999-11-13", "%Y-%m-%d"), 2023, "Intl", "A180", 69),
(6, "Sinead", "Ferguson", STR_TO_DATE("2003-04-29", "%Y-%m-%d"), 2021, "Home", "N320", 94),
(7, "Amit", "Gupta", STR_TO_DATE("2000-05-07", "%Y-%m-%d"), 2022, "Intl", "A100", 79),
(8, "Shaun", "Presley", STR_TO_DATE("2004-03-31", "%Y-%m-%d"), 2023, "Home", "N320", 48),
(9, "Maisie", "Sloan", STR_TO_DATE("2005-02-18", "%Y-%m-%d"), 2023, "Home", "C900", 85),
(10, "Andrew", "Chen", STR_TO_DATE("1996-09-27", "%Y-%m-%d"), 2020, "Intl", "N120", 87),
(11, "Christina", "Glenn", STR_TO_DATE("1997-03-15", "%Y-%m-%d"), 2023, "Home", "M290", 57),
(12, "Olena", "Marienkovic", STR_TO_DATE("2003-06-09", "%Y-%m-%d"), 2021, "Intl", "D260", 39),
(13, "Mark", "Greendale", STR_TO_DATE("2000-11-14", "%Y-%m-%d"), 2020, "Home", "A130", 62),
(14, "Grace", "Jackson", STR_TO_DATE("2004-09-16", "%Y-%m-%d"), 2022, "Intl", "N320", 96);

SELECT * FROM students;

CREATE TABLE instructors
(i_id INT NOT NULL PRIMARY KEY,
i_title VARCHAR(5),
i_forename VARCHAR(50),
i_surname VARCHAR(50),
i_qual VARCHAR(50),
f_id VARCHAR(10),
salary DECIMAL(8,2),
i_type VARCHAR(50)
);

INSERT INTO instructors
(i_id, i_title, i_forename, i_surname, i_qual, f_id, salary, i_type)
VALUES
(17, "Prof.", "Rebecca", "Mason", "MRes Molecular Biology", "SciEng", 67085.00, "Associate Professor"),
(18, "Prof.", "Christopher", "Conway", "MA Political Science", "SocHum", 55735.00, "Senior Lecturer"),
(19, "Dr", "Anette", "Schellenberg", "PhD German Studies", "ArtLang", 90800.00, "Professor"),
(20, "Prof.", "Anthony", "Stockton", "MSc Pharmacology", "SciEng", 64550.00, "Associate Professor"),
(21, "Dr", "Meghan", "Mitchell", "PhD Astrophysics", "SciEng", 92750.00, "Professor"),
(22, "Dr", "Peter", "Thomas", "PhD Chemical Engineering", "SciEng", 94420.00, "Professor"),
(23, "Prof.", "Andy", "Janssen", "MA Intl Business and Management", "SocHum", 73645.00, "Associate Professor"),
(24, "Prof.", "Richard", "Howe", "MA English Literature", "ArtLang", 58480.00, "Senior Lecturer"),
(25, "Dr", "Clarissa", "Davidson", "MBChB Medicine, MPH", "MedHlthSci", 108900.00, "Professor"),
(26, "Prof.", "Patricia", "Greyson", "MSc Pharmaceutical and Cosmetic Sciences", "SciEng", 49980.00, "Lecturer"),
(27, "Prof.", "Stephen", "Cole", "MSc Data Science", "CompTech", 57065.00, "Senior Lecturer"),
(28, "Dr", "Isla", "Preston", "PhD Pharmacy, Registered Pharmacist", "MedHlthSci", 79980.00, "Associate Professor"),
(29, "Prof.", "Ben", "Thompson", "MSc Computer Science", "CompTech", 51720.00, "Lecturer"),
(30, "Prof.", "Geoffrey", "Stevens", "MA Creative and Critical Writing", "ArtLang", 49980.00, "Lecturer");

SELECT * FROM instructors;

CREATE TABLE faculty
(f_id VARCHAR(10) PRIMARY KEY,
f_name VARCHAR(50),
i_id INT NOT NULL
);

INSERT INTO faculty
(f_id, f_name, i_id)
VALUES
("ArtLang", "Faculty of Arts and Languages", 19),
("MedHlthSci", "Faculty of Medicine and Health Sciences", 25),
("SciEng", "Faculty of Science and Engineering", 22),
("SocHum", "Faculty of Social Science and Humanities", 18),
("CompTech", "Faculty of Computing and Technology", 29);

SELECT * FROM faculty;

CREATE TABLE modules
(m_id VARCHAR(8) PRIMARY KEY,
m_name VARCHAR(50),
credit INT NOT NULL,
i_id INT NOT NULL,
no_enrolled INT
);

INSERT INTO modules
(m_id, m_name, credit, i_id, no_enrolled)
VALUES
("GERM1001", "Introductory German I", 30, 19, 115),
("POLI3111", "The Rise of American Populism", 30, 18, 20),
("BIOL2471", "Advances in Biotechnology", 30, 17, 109),
("CHEM2211", "Principles of Thermodynamics", 15, 22, 128),
("CHEM4891", "Formulation and Characterisation of Cosmetics", 15, 26, 30),
("BUSI4211", "Global Corporate Strategy", 30, 23, 56),
("ENGL3341", "Early Victorian Literature", 30, 24, 14),
("MEDI4061", "Epidemiology of COVID-19", 15, 25, 70),
("PHYS3021", "Life in the Universe", 30, 21, 28),
("PHAR3161", "Molecular Toxicology", 30, 20, 89),
("DATA2061", "Advanced Data Techniques", 30, 27, 52),
("MEDI2521", "Pharmacy Practice and Policy", 15, 28, 175);

SELECT * FROM modules;

CREATE TABLE courses
(c_id VARCHAR(8) PRIMARY KEY,
c_type VARCHAR(8),
c_name VARCHAR(50),
f_id VARCHAR(10),
cost INT,
no_enrolled INT
);

INSERT INTO courses
(c_id, c_type, c_name, f_id, cost, no_enrolled)
VALUES
("A100", "MBChB", "Medicine and Surgery", "MedHlthSci", 9000, 1546),
("N120", "MSc", "International Business with German (Int. Masters)", "SocHum", 15250, 493),
("C980", "MSc", "Formulation Science", "SciEng", 9860, 1381),
("B540", "BA", "Germanic Studies with Year Abroad", "ArtLang", 9000, 1197),
("D260", "BSc", "Physics", "SciEng", 9000, 1197),
("A180", "MPH", "Master of Public Health", "MedHlthSci", 17850, 852),
("N320", "BA", "International Relations with Business Studies", "SocHum", 9000, 1465),
("C900", "BSc", "Biochemistry with Year in Industry", "SciEng", 9000, 1602),
("A130", "MPharm", "Pharmacy", "MedHlthSci", 9000, 1493),
("M290", "MA", "Media, Data and Society", "ArtLang", 12500, 799);

SELECT * FROM courses;

-- Adding foreign keys

ALTER TABLE students
ADD CONSTRAINT fk_c_id_students -- Each constraint must have a unique name
FOREIGN KEY (c_id) REFERENCES courses(c_id);

ALTER TABLE instructors
ADD CONSTRAINT fk_f_id_instructors
FOREIGN KEY (f_id) REFERENCES faculty(f_id);

ALTER TABLE modules
ADD CONSTRAINT fk_i_id_modules
FOREIGN KEY (i_id) REFERENCES instructors(i_id);

ALTER TABLE courses
ADD CONSTRAINT fk_f_id_courses
FOREIGN KEY (f_id) REFERENCES faculty(f_id);