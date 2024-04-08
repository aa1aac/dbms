-- Alter the AssignmentType table to change the typeWeight column
ALTER TABLE AssignmentType
ALTER COLUMN typeWeight FLOAT;

-- Update typeWeight for all rows
UPDATE AssignmentType
SET typeWeight = 
    CASE
        WHEN courseId = 1 AND assignmentType = 'H' THEN 25.00
        WHEN courseId = 1 AND assignmentType = 'Pr' THEN 25.00
        WHEN courseId = 1 AND assignmentType = 'T' THEN 45.00
        WHEN courseId = 1 AND assignmentType = 'Pa' THEN 5.00
        -- Add additional cases as needed
    END;

SELECT * FROM AssignmentType;