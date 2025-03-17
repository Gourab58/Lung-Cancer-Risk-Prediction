create database lung_cancer_db;

use lung_cancer_db;

select* from cancer;

-- 1. Is there a gender-based difference in lung cancer prevalence?

SELECT GENDER, 
       SUM(CASE WHEN LUNG_CANCER = 'Yes' THEN 1 ELSE 0 END) AS Lung_Cancer_Patients
FROM cancer
GROUP BY GENDER;

ALTER TABLE cancer ADD COLUMN AGE_GROUP VARCHAR(10);

SET SQL_SAFE_UPDATEs = 0;

UPDATE cancer
SET AGE_GROUP = 
    CASE 
        WHEN AGE BETWEEN 0 AND 20 THEN '0-20'
        WHEN AGE BETWEEN 21 AND 30 THEN '21-30'
        WHEN AGE BETWEEN 31 AND 40 THEN '31-40'
        WHEN AGE BETWEEN 41 AND 50 THEN '41-50'
        WHEN AGE BETWEEN 51 AND 60 THEN '51-60'
        WHEN AGE > 60 THEN '60+'
        ELSE 'Unknown'
    END;

-- 2. How does age correlate with the occurrence of lung cancer?

SELECT Age_Group, 
       SUM(CASE WHEN LUNG_CANCER = 'Yes' THEN 1 ELSE 0 END) AS Lung_Cancer_Patients
FROM cancer
GROUP BY AGE_Group
ORDER BY AGE_Group;

-- 3. What is the proportion of lung cancer among smokers vs. non-smokers?

SELECT SMOKING, 
       SUM(CASE WHEN LUNG_CANCER = 'Yes' THEN 1 ELSE 0 END) AS Lung_Cancer_Patients
FROM cancer
GROUP BY SMOKING;

-- 4. How prevalent is lung cancer among alcohol consumers?

SELECT `ALCOHOL CONSUMING`, 
       SUM(CASE WHEN LUNG_CANCER = 'Yes' THEN 1 ELSE 0 END) AS Lung_Cancer_Patients
FROM cancer
GROUP BY `ALCOHOL CONSUMING`;

-- 5. What is the impact of chronic diseases on lung cancer?

SELECT `CHRONIC DISEASE`, 
       SUM(CASE WHEN LUNG_CANCER = 'Yes' THEN 1 ELSE 0 END) AS Lung_Cancer_Patients
FROM cancer
GROUP BY `CHRONIC DISEASE`;

-- 6. What is the impact of multiple symptoms on lung cancer risk?

SELECT COUGHING, `SHORTNESS OF BREATH`, `CHEST PAIN`, 
       SUM(CASE WHEN LUNG_CANCER = 'Yes' THEN 1 ELSE 0 END) AS Lung_Cancer_Patients
FROM cancer
GROUP BY COUGHING, `SHORTNESS OF BREATH`, `CHEST PAIN`
ORDER BY Lung_Cancer_Patients DESC;

-- 7. Are anxiety and fatigue more common in lung cancer patients?

SELECT ANXIETY, FATIGUE, 
       SUM(CASE WHEN LUNG_CANCER = 'Yes' THEN 1 ELSE 0 END) AS Lung_Cancer_Patients
FROM cancer
GROUP BY ANXIETY, FATIGUE;

-- 8. Do yellow fingers indicate a higher risk of lung cancer?

SELECT YELLOW_FINGERS, 
       SUM(CASE WHEN LUNG_CANCER = 'Yes' THEN 1 ELSE 0 END) AS Lung_Cancer_Patients
FROM cancer
GROUP BY YELLOW_FINGERS;