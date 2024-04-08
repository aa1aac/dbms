-- List all of the students in a course and all of their scores on every assignment;
SELECT Student.studentId, Student.studentFirstName, Student.studentLastName, Student.studentDateOfBirth, AssignmentGrade.grade
FROM Student
INNER JOIN Enrollment ON Enrollment.studentId=Student.studentId
INNER JOIN AssignmentGrade ON AssignmentGrade.studentId = Student.studentId
WHERE Enrollment.courseId=1;