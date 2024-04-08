SELECT 
    Student.studentId,
    Student.studentFirstName,
    Student.studentLastName,
    Assignment.assignmentName,
    AssignmentGrade.grade
FROM 
    Student
JOIN 
    Enrollment ON Student.studentId = Enrollment.studentId
JOIN 
    Assignment ON Enrollment.courseId = Assignment.courseId
LEFT JOIN 
    AssignmentGrade ON Assignment.assignmentId = AssignmentGrade.assignmentId 
                    AND Student.studentId = AssignmentGrade.studentId
WHERE Enrollment.courseId = 1;