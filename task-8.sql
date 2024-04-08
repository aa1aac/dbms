-- Alter the AssignmentType table to change the typeWeight column
ALTER TABLE AssignmentType
ALTER COLUMN typeWeight FLOAT;

-- Update typeWeight for all rows
UPDATE AssignmentType
SET typeWeight = 
    CASE
      WHEN courseId = 1 THEN
        CASE 
          WHEN assignmentType = 'H' THEN 25.00
          WHEN assignmentType = 'Pr' THEN 25.00
          WHEN assignmentType = 'T' THEN 45.00
          WHEN assignmentType = 'Pa' THEN 5.00
        END
      ELSE typeWeight
    END;

SELECT * FROM AssignmentType;