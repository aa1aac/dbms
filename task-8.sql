-- Change the percentages of the categories for a course;
UPDATE AssignmentType
SET typeWeight = 
    CASE
      WHEN courseId = 1 THEN
        CASE 
          WHEN assignmentType = 'HW' THEN 25.00
          WHEN assignmentType = 'Pr' THEN 25.00
          WHEN assignmentType = 'Te' THEN 45.00
          WHEN assignmentType = 'Pa' THEN 5.00
        END
      ELSE typeWeight
    END;