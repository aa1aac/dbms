WITH LowestGrade AS (
    SELECT 
        studentId, 
        courseId, 
        assignmentType, 
        MIN(grade) AS minGrade, -- Using MIN() to aggregate the grade
        typeWeight,
        assignmentPoint
    FROM AssignmentGrade
    JOIN Student USING(studentId)
    JOIN Assignment USING(assignmentId)
    JOIN AssignmentType USING(courseId, assignmentType)
    WHERE assignmentType = 'Te' AND studentId = 1
    GROUP BY studentId, courseId, assignmentType, typeWeight, assignmentPoint
),

CurrentGrade AS (
    SELECT
    student.studentId,
    student.studentFirstName,
    student.studentLastName,
    assignment.courseId,
    ROUND(SUM(assignmentGrade.grade / assignment.assignmentPoint * assignmentType.typeWeight)::numeric, 2) AS obtainedGrade,
    ROUND(SUM(assignmentType.typeWeight)::numeric, 2) AS totalGrade,
    ROUND((SUM(assignmentGrade.grade / assignment.assignmentPoint * assignmentType.typeWeight) / SUM(assignmentType.typeWeight) * 100)::numeric, 2) AS finalGrade
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
        assignment.courseId
)

SELECT studentid, studentFirstName, studentLastName, courseId, (obtainedGrade - minGrade*typeWeight/assignmentPoint) AS finalObtainedDropped, ROUND((totalGrade - assignmentPoint*typeWeight/100)::numeric, 2) AS fullPointDropped, ROUND(((obtainedGrade - minGrade*typeWeight/assignmentPoint)/(totalGrade - assignmentPoint*typeWeight/100) * 100)::numeric, 2) AS finalGradeDropped
FROM LowestGrade
JOIN CurrentGrade USING(courseId, studentId);