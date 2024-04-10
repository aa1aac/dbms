SELECT
    student.studentId,
    student.studentFirstName,
    student.studentLastName,
    assignment.courseId,
    SUM(assignmentGrade.grade / assignment.assignmentPoint * assignmentType.typeWeight) AS overallGrade
FROM
    Student student
JOIN
    AssignmentGrade assignmentGrade ON student.studentId = assignmentGrade.studentId
JOIN
    Assignment assignment ON assignmentGrade.assignmentId = assignment.assignmentId
JOIN
    AssignmentType assignmentType ON assignment.courseId = assignmentType.courseId AND assignment.assignmentType = assignmentType.assignmentType
WHERE 
    student.studentId = 1
GROUP BY
    student.studentId,
    student.studentFirstName,
    student.studentLastName,
    assignment.courseId;