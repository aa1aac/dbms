-- Write the commands for creating tables and inserting values

-- Create tables
-- Create Student Table
CREATE TABLE Student (
    studentId SERIAL NOT NULL,
    studentFirstName VARCHAR(255) NOT NULL,
    studentLastName VARCHAR(255) NOT NULL,
    studentDateOfBirth DATE NOT NULL,
    PRIMARY KEY (studentId)
);

-- create course table
CREATE TABLE Course (
    courseId SERIAL NOT NULL,
    departmentCode VARCHAR(20) NOT NULL,
    courseNumber VARCHAR(3) NOT NULL,
    courseName VARCHAR(100) NOT NULL,
    courseSemester VARCHAR(2) NOT NULL,
    courseYear VARCHAR(4) NOT NULL,
    PRIMARY KEY (courseId) 
);

-- Create enrollment table
CREATE TABLE Enrollment(
    enrollmentId SERIAL NOT NULL,
    studentId INTEGER REFERENCES Student(studentId),
    courseId INTEGER REFERENCES Course(courseId)
);

-- create assignment
CREATE TABLE Assignment (
    assignmentId SERIAL PRIMARY KEY,
    courseId INTEGER REFERENCES Course(courseId),
    assignmentName VARCHAR(100),
    assignmentDescription TEXT,
    assignmentPoint FLOAT, -- highest possible point
    assignmentType VARCHAR(2) REFERENCES AssignmentType(assignmentType),
    assignmentWeight FLOAT -- out of 100
);

CREATE TABLE AssignmentType (
    courseId INTEGER,
    assignmentType VARCHAR(2),
    typeWeight FLOAT,
    FOREIGN KEY (courseId) REFERENCES Course(courseId),
    PRIMARY KEY (courseId, assignmentType)
);

-- create assignmentGrade
CREATE TABLE AssignmentGrade (
    gradeId SERIAL PRIMARY KEY NOT NULL,
    assignmentId INTEGER REFERENCES Assignment(assignmentId) NOT NULL,
    studentId INTEGER REFERENCES Student(studentId) NOT NULL,
    grade FLOAT NOT NULL
);

-- Inserting values now
-- Insert into Student Table
INSERT INTO Student (studentFirstName, studentLastName, studentDateOfBirth)
VALUES ('Jon', 'Doe', '2011-12-12');

--Insert course table
INSERT INTO Course (departmentCode, courseNumber, courseName, courseSemester, courseYear)
VALUES ('CSCI', '401', 'Technical Elective', 'SP', '2024');

--Insert into enrollment table
INSERT INTO Enrollment(studentId, courseId)
VALUES (1, 1);

--Insert into assignment
INSERT INTO Assignment(courseId, assignmentName, assignmentDescription, assignmentPoint, assignmentType, assignmentWeight)
VALUES(1, 'Mid term', 'Mid term exam on chapter 1 to 5', 100, 'exam', 30);

-- Insert into assignmentGrade
INSERT INTO AssignmentGrade(assignmentId, studentId, grade)
VALUES(1, 1, 98);

-- Insert into assignmentType
INSERT INTO AssignmentType(courseId, assignmentType, typeWeight)
VALUES(1, 'H', 25),
    (1, 'Pr', 20);