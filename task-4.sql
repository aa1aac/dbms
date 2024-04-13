-- Compute the average/highest/lowest score of an assignment;
SELECT 
    AVG(AG.grade) AS Average,
    MAX(AG.grade) AS highest, 
    MIN(AG.grade) AS Lowest
FROM 
    AssignmentGrade AS AG
WHERE 
    AG.assignmentId = 6;