-- Add two points to each student's grade in an assignment
UPDATE AssignmentGrade
SET grade = grade + 2
WHERE assignmentId = 1;