-- Add 2 points just to those students whose last name contains a ‘Q’.
UPDATE AssignmentGrade
SET grade = grade + 2
WHERE assignmentId = 1
AND studentId IN (
  SELECT studentId FROM Student
  WHERE studentLastName LIKE '%Q%'
      OR studentLastName LIKE '%q%'
);