-- List all of the students in a course and all of their scores on every assignment;
SELECT * 
FROM Student
INNER JOIN assignmentGrade ON assignmentGrade.studentId = Student.studentId
WHERE assignmentGrade.assignmentGrade = 1;