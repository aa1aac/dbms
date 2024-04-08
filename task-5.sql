-- List all of the students in a given course;
SELECT Student.studentFirstName, Student.studentLastName, Student.studentDateOfBirth
FROM Student
INNER JOIN Enrollment ON Enrollment.studentId=Student.studentId
WHERE Enrollment.courseId=1;