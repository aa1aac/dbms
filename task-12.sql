WITH RankedGrades AS (
    SELECT
        ag.studentId,
        a.courseId,
        at.assignmentType,
        ag.grade,
        COUNT(*) OVER (PARTITION BY ag.studentId, a.courseId, at.assignmentType) AS numAssignments,
        ROW_NUMBER() OVER (PARTITION BY ag.studentId, a.courseId, at.assignmentType ORDER BY ag.grade ASC) AS rank
    FROM
        AssignmentGrade ag
    JOIN
        Assignment a ON ag.assignmentId = a.assignmentId
    JOIN
        AssignmentType at ON a.courseId = at.courseId AND a.assignmentType = at.assignmentType
)
SELECT
    s.studentId,
    s.studentFirstName,
    s.studentLastName,
    rg.courseId,
    SUM(
        CASE
            WHEN rg.numAssignments = 1 THEN rg.grade / a.assignmentPoint * at.typeWeight
            WHEN rg.rank > 1 THEN rg.grade / a.assignmentPoint * at.typeWeight / (rg.numAssignments - 1)
            ELSE 0
        END
    ) AS overallGrade
FROM
    Student s
JOIN
    RankedGrades rg ON s.studentId = rg.studentId
JOIN
    Assignment a ON rg.courseId = a.courseId
JOIN
    AssignmentType at ON a.courseId = at.courseId AND a.assignmentType = at.assignmentType
WHERE 
    s.studentId = 1
GROUP BY
    s.studentId,
    s.studentFirstName,
    s.studentLastName,
    rg.courseId;
