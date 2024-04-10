-- -- Compute the grade for a student, where the lowest score for a given category is dropped.
WITH LowestGrades AS (
    SELECT
        studentId,
        a.courseId,
        a.assignmentType,
        MIN(grade) AS lowestGrade
    FROM
        AssignmentGrade ag
    JOIN
        Assignment a ON ag.assignmentId = a.assignmentId
    JOIN
        AssignmentType at ON a.courseId = at.courseId AND a.assignmentType = at.assignmentType
    GROUP BY
        studentId, a.courseId, a.assignmentType
),
TypesCount AS (
    SELECT
    courseId,
    assignmentType,
    COUNT(*) AS numAssignments
    FROM
        Assignment
    GROUP BY
        courseId, assignmentType
)