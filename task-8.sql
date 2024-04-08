-- Alter the AssignmentType table to change the typeWeight column
ALTER TABLE AssignmentType
ALTER COLUMN typeWeight FLOAT;

-- Update typeWeight for all rows
UPDATE AssignmentType
SET typeWeight = 
    CASE
        WHEN assignmentType = 'H' THEN 25
        WHEN assignmentType = 'Pr' THEN 25
        WHEN assignmentType = 'T' THEN 45
        WHEN assignmentType = 'Pa' THEN 5
        -- Add additional cases as needed
    END;

SELECT * FROM AssignmentType