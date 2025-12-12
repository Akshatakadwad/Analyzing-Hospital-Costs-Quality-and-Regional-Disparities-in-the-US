-- Data cleaning and transformation script
-- Includes column renaming, datatype fixes, missing value handling

-- Renaming columns to remove dots and spaces
-- and follow snake_case naming conventions.
-- This improves readability, consistency, and SQL compatibility.
ALTER TABLE hospitals
CHANGE `Facility.Name` Facility_Name VARCHAR(50);

ALTER TABLE hospitals
CHANGE `Facility.State` Facility_State Varchar(50);

ALTER TABLE hospitals
CHANGE `Facility.City` Facilty_City Varchar(50);

ALTER TABLE hospitals
CHANGE `Facility.Type` Facility_Type Varchar(50);

ALTER TABLE hospitals
CHANGE `Rating.Overall` Rating_Overall Varchar(50);

ALTER TABLE hospitals
CHANGE `Rating.Mortality` Rating_Mortality Varchar(50);

ALTER TABLE hospitals
CHANGE `Rating.Safety` Rating_Safety Varchar(50);

ALTER TABLE hospitals
CHANGE `Rating.Readmission` Rating_Readmission Varchar(50);

ALTER TABLE hospitals
CHANGE `Rating.Experience` Rating_Experience Varchar(50);

ALTER TABLE hospitals
CHANGE `Rating.Timeliness` Rating_Timeliness Varchar(50);

ALTER TABLE hospitals
CHANGE `Rating.Imaging` Rating_Imaging Varchar(50);

Alter Table hospitals
Change `Procedure.Heart Attack.Cost` Procedure_HeartAttack_Cost int;

Alter Table hospitals
Change `Procedure.Heart Attack.Quality` Procedure_HeartAttack_Quality Varchar(50);

Alter Table hospitals
Change `Procedure.Heart Attack.Value` Procedure_HeartAttack_Value Varchar(50);

Alter Table hospitals
Change `Procedure.Heart Failure.Cost` Procedure_HeartFailure_Cost int;

Alter Table hospitals
Change `Procedure.Heart Failure.Quality` Procedure_HeartFailure_Quality Varchar(50);

Alter Table hospitals
Change `Procedure.Heart Failure.Value` Procedure_HeartFailure_Value Varchar(50);

Alter Table hospitals
Change `Procedure.Pneumonia.Cost` Procedure_Pneumonia_Cost int;

Alter Table hospitals
Change `Procedure.Pneumonia.Quality` Procedure_Pneumonia_Quality Varchar(50);

Alter Table hospitals
Change `Procedure.Pneumonia.Value` Procedure_Pneumonia_Value Varchar(50);

Alter Table hospitals
Change `Procedure.Hip Knee.Cost` Procedure_HipKnee_Cost int;

Alter Table hospitals
Change `Procedure.Hip Knee.Quality` Procedure_HipKnee_Quality Varchar(50);

Alter Table hospitals
Change `Procedure.Hip Knee.Value`  Procedure_HipKnee_Value Varchar(50);

ALTER TABLE hospitals
CHANGE `Rating.Effectiveness` Rating_Effectiveness Varchar(50);

ALTER TABLE hospitals
CHANGE Facilty_City Facility_City Varchar(50);

-- Testing to check if the querry updated the database sucessfylly
SELECT * FROM hospitals
LIMIT 20;

-- Converting the Rating Overall column data type to int
ALTER TABLE hospitals
MODIFY COLUMN Rating_Overall int;

--  Replacing -1 with Null as it indicates no rating
UPDATE hospitals
SET Rating_Overall = Null
WHERE Rating_Overall < 0;


-- Any kind of hospital procedure cannot cost $0 in a real world setting
-- Repalcing 0 with Null
-- Heart Attack cost
UPDATE hospitals
SET  Procedure_HeartAttack_Cost = null
WHERE Procedure_HeartAttack_Cost = 0;

-- Heart Failure Cost
UPDATE hospitals
SET  Procedure_HeartFailure_Cost = null
WHERE Procedure_HeartFailure_Cost= 0;

-- Pneumonia Cost
UPDATE hospitals
SET  Procedure_Pneumonia_Cost = null
WHERE Procedure_Pneumonia_Cost = 0;

-- Hip Kneww Cost
UPDATE hospitals
SET   Procedure_HipKnee_Cost = null
WHERE  Procedure_HipKnee_Cost = 0;


-- Modifying the Ratings column
-- Converting the text rating into numeric ratings
-- Mortality Ratings
UPDATE hospitals
SET Rating_Mortality =
	CASE Rating_Mortality
		WHEN 'Above' then 3
        WHEN 'Same' then 2
        WHEN 'Below' then 1
        ELSE Null
	END;
    
-- Safety Ratings
UPDATE hospitals
SET Rating_Safety =
	CASE Rating_Safety
		WHEN 'Above' THEN 3
        WHEN 'Same' THEN 2
        WHEN 'Below' THEN 1
		ELSE Null
	END;
    
-- Readmission Ratings
UPDATE hospitals
SET Rating_Readmission =
	CASE Rating_Readmission
		WHEN 'Above' THEN 3
        WHEN 'Same' THEN 2
        WHEN 'Below' THEN 1
        ELSE Null
     END;

-- Experience Ratings
UPDATE hospitals
SET Rating_Experience =
	CASE Rating_Experience
		WHEN 'Above' THEN 3
        WHEN 'Same' THEN 2
        WHEN 'Below' THEN 1
        ELSE Null
     END;
     
-- Timeliness Ratings
UPDATE hospitals
SET Rating_Timeliness =
	CASE Rating_Timeliness
		WHEN 'Above' THEN 3
        WHEN 'Same' THEN 2
        WHEN 'Below' THEN 1
        ELSE Null
     END;
     
-- Imaging Ratings
UPDATE hospitals
SET Rating_Imaging =
	CASE Rating_Imaging
		WHEN 'Above' THEN 3
        WHEN 'Same' THEN 2
        WHEN 'Below' THEN 1
        ELSE Null
     END;
     
-- Effectiveness Ratings
UPDATE hospitals
SET Rating_Effectiveness =
	CASE Rating_Effectiveness
		WHEN 'Above' THEN 3
        WHEN 'Same' THEN 2
        WHEN 'Below' THEN 1
        ELSE Null
     END;


-- Changing the data type to int
-- Mortality Rating
ALTER TABLE hospitals
MODIFY COLUMN Rating_Mortality INT;

-- Safety Rating
ALTER TABLE hospitals
MODIFY COLUMN Rating_Safety INT;

-- Readmission Rating     
ALTER TABLE hospitals
MODIFY COLUMN Rating_Readmission INT;

-- Experience Rating     
ALTER TABLE hospitals
MODIFY COLUMN Rating_Experience INT;

-- Timeliness Rating
ALTER TABLE hospitals
MODIFY COLUMN Rating_Timeliness INT;

-- Imaging rating     
ALTER TABLE hospitals
MODIFY COLUMN Rating_Imaging INT;

-- Effectiveness Rating
ALTER TABLE hospitals
MODIFY COLUMN Rating_Effectiveness INT;


-- Converting procedure quality comparisons to numeric values
-- Better  = higher quality of care
-- Average = national average quality
-- Worse   = lower quality of care

-- Heart Attack Quality
UPDATE hospitals
SET Procedure_HeartAttack_Quality = 
	CASE Procedure_HeartAttack_Quality
		WHEN 'better' THEN 3
        WHEN 'Average' THEN 2
        WHEN 'Worse' THEN 1
        ELSE Null
     END;
     
ALTER TABLE hospitals
MODIFY COLUMN Procedure_HeartAttack_Quality INT;

-- Procedure Heart Failure Quality
UPDATE hospitals
SET Procedure_HeartFailure_Quality =
	CASE Procedure_HeartFailure_Quality
		WHEN 'Better' THEN 3
        WHEN 'Average' THEN 2
        WHEN 'Worse' THEN 1
        ELSE Null
     END;
     
ALTER TABLE hospitals
MODIFY COLUMN Procedure_HeartFailure_Quality INT;

-- Procedure Pneumonia Quality
UPDATE hospitals
SET Procedure_Pneumonia_Quality =
    CASE Procedure_Pneumonia_Quality
        WHEN 'Better'  THEN 3
        WHEN 'Average' THEN 2
        WHEN 'Worse'   THEN 1
        ELSE NULL
    END;
    
ALTER TABLE hospitals
MODIFY COLUMN Procedure_Pneumonia_Quality INT;

-- Procedure Hip Knee Quality
UPDATE hospitals
SET Procedure_HipKnee_Quality =
    CASE Procedure_HipKnee_Quality
        WHEN 'Better'  THEN 3
        WHEN 'Average' THEN 2
        WHEN 'Worse'   THEN 1
        ELSE NULL
    END;
    
ALTER TABLE hospitals
MODIFY COLUMN Procedure_HipKnee_Quality INT;


-- Converting procedure value comparisons to numeric scores
-- Lower cost = better value for patients
-- Higher cost = worse value

-- Heart Attack Value
UPDATE hospitals
SET Procedure_HeartAttack_Value =
	CASE Procedure_HeartAttack_Value
		WHEN 'Lower' THEN 3
        WHEN 'Average' THEN 2
        WHEN 'Higher' THEN 1
        ELSE Null
     END;
     
ALTER TABLE hospitals
MODIFY COLUMN Procedure_HeartAttack_Value INT;

-- Procedure Heart Failure Value
UPDATE hospitals
SET Procedure_HeartFailure_Value =
    CASE Procedure_HeartFailure_Value
        WHEN 'Lower'   THEN 3
        WHEN 'Average' THEN 2
        WHEN 'Higher'  THEN 1
        ELSE NULL
    END;

ALTER TABLE hospitals
MODIFY COLUMN Procedure_HeartFailure_Value INT;

-- Procedure Pneumonia Value
UPDATE hospitals
SET Procedure_Pneumonia_Value =
    CASE Procedure_Pneumonia_Value
        WHEN 'Lower'   THEN 3
        WHEN 'Average' THEN 2
        WHEN 'Higher'  THEN 1
        ELSE NULL
    END;

ALTER TABLE hospitals
MODIFY COLUMN Procedure_Pneumonia_Value INT;

-- Procedure Hip Knee Value
UPDATE hospitals
SET Procedure_HipKnee_Value =
    CASE Procedure_HipKnee_Value
        WHEN 'Lower'   THEN 3
        WHEN 'Average' THEN 2
        WHEN 'Higher'  THEN 1
        ELSE NULL
    END;
    
ALTER TABLE hospitals
MODIFY COLUMN Procedure_HipKnee_Value INT;

/* --------------------------------------------------------
   STATE LOOKUP TABLE
   Maps 2-letter state/territory codes to full names
   -------------------------------------------------------- */

-- Drop and recreate lookup table to ensure a clean rebuild
DROP TABLE IF EXISTS State;

CREATE TABLE State (
    State_Code CHAR(2) PRIMARY KEY,
    State_FullName VARCHAR(50)
);

-- Insert U.S States and Territories
INSERT INTO State (State_code, State_FullName) VALUES
('AL', 'Alabama'),
('AK', 'Alaska'), 
('AZ', 'Arizona'), 
('AR', 'Arkansas'),
('CA', 'California'), 
('CO', 'Colorado'), 
('CT', 'Connecticut'),
('DE', 'Delaware'),
('FL', 'Florida'), 
('GA', 'Georgia'),
('HI', 'Hawaii'),
('ID', 'Idaho'), 
('IL', 'Illinois'),
('IN', 'Indiana'), 
('IA', 'Iowa'), 
('KS', 'Kansas'),
('KY', 'Kentucky'),
('LA', 'Louisiana'), 
('ME', 'Maine'),
('MD', 'Maryland'),
('MA', 'Massachusetts'), 
('MI', 'Michigan'),
('MN', 'Minnesota'), 
('MS', 'Mississippi'),
('MO', 'Missouri'),
('MT', 'Montana'), 
('NE', 'Nebraska'), 
('NV', 'Nevada'),
('NH', 'New Hampshire'), 
('NJ', 'New Jersey'),
('NM', 'New Mexico'),
('NY', 'New York'), 
('NC', 'North Carolina'),
('ND', 'North Dakota'),
('OH', 'Ohio'), 
('OK', 'Oklahoma'), 
('OR', 'Oregon'),
('PA', 'Pennsylvania'), 
('RI', 'Rhode Island'),
('SC', 'South Carolina'), 
('SD', 'South Dakota'),
('TN', 'Tennessee'), 
('TX', 'Texas'),
('UT', 'Utah'),
('VT', 'Vermont'),
('VA', 'Virginia'),
('WA', 'Washington'),
('WV', 'West Virginia'), 
('WI', 'Wisconsin'), 
('WY', 'Wyoming'),
('DC', 'District of Columbia'),
('PR', 'Puerto Rico'), 
('VI', 'U.S. Virgin Islands'),
('GU', 'Guam'), 
('MP', 'Northern Mariana Islands'),
('AS', 'American Samoa');

-- Add State_FullName column to the hospitals table
ALTER TABLE hospitals
ADD COLUMN State_FullName VARCHAR(50);

-- Populate State Full Name column using join
UPDATE hospitals h
JOIN State s
	ON h.Facility_State = s.State_code
SET h.State_FullName = s.State_FullName;

-- Reposition column for readability
ALTER TABLE hospitals
MODIFY COLUMN State_FullName VARCHAR(50)
AFTER Facility_State;


/* --------------------------------------------------------
   VALIDATION: ensure all state codes are mapped
   --------------------------------------------------------*/

SELECT DISTINCT Facility_State
FROM hospitals
WHERE State_FullName IS NULL;

-- Identifying duplicate hospitals based on name, city, and state
-- Helps detect data duplication issues before analysis.
SELECT Facility_Name,
       Facility_City,
       Facility_State,
       COUNT(*) AS duplicate_count
FROM hospitals
GROUP BY Facility_Name, Facility_City, Facility_State
HAVING COUNT(*) > 1;




