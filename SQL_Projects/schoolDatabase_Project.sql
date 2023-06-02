CREATE DATABASE dbSchool
USE dbSchool

-- TABLES
CREATE TABLE tblClasses (
	classID int NOT NULL PRIMARY KEY IDENTITY (1,1),
	className varchar(50) NOT NULL
);

CREATE TABLE tblStudents (
	studentID int NOT NULL PRIMARY KEY IDENTITY (1,1),
	classID int NOT NULL,
	instructorID int NOT NULL,
	studentName varchar(50) NOT NULL
);

CREATE TABLE tblInstructors (
	instructorID int NOT NULL PRIMARY KEY IDENTITY (1,1),
	instructorName varchar(50) NOT NULL
);

-- ALTERS
ALTER TABLE tblStudents
ADD FOREIGN KEY (classID) REFERENCES tblClasses(classID);

ALTER TABLE tblStudents
ADD FOREIGN KEY (instructorID) REFERENCES tblInstructors(instructorID);

-- INSERTS
INSERT INTO tblClasses
	VALUES
	('Software Developer Boot Camp'),
	('C# Boot Camp')
;

SELECT * FROM tblClasses;

INSERT INTO tblStudents
	VALUES
	(2, 1, 'Bill Joe'),
	(2, 1, 'Abigail Scarcello'),
	(1, 2, 'Homer Simpson'),
	(2, 1, 'Samus Aran'),
	(1, 2, 'Mr. Clean'),
	(1, 2, 'Jimmy Neutron')
;

SELECT * FROM tblStudents;

INSERT INTO tblInstructors
	VALUES
	('Garth Brooks'),
	('Mary Poppins')
;

SELECT * FROM tblInstructors

-- QUERIES
-- Selects all instructors names from tblInstructors
SELECT instructorName FROM tblInstructors;

-- Selects all student names from tblStudents in alphabetical order
SELECT studentName FROM tblStudents
ORDER BY studentName;

-- Selects all classes, with the students and instructors assigned to each
SELECT className, studentName, instructorName 
FROM tblClasses
	INNER JOIN tblStudents ON tblClasses.classID = tblStudents.classID
	INNER JOIN tblInstructors ON tblStudents.instructorID = tblInstructors.instructorID;
