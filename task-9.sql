-- Add 2 points to the score of each student on an assignment;
UPDATE AssignmentGrade
SET grade = grade + 2
WHERE assignmentId = 8;