-- DATA CLEANING
-- REMOVE DUPLICATES
-- STANDARDIZE THE DATA
-- NULL VALUES OR BLANK VALUES
-- REMOVE ANY COLUMNS OR ROWS

CREATE TABLE layoffs_backup
LIKE layoffs;

INSERT INTO layoffs_backup
SELECT *
FROM layoffs;

SELECT *
FROM layoffs_backup;

SELECT *
FROM layoffs;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 
`date`, stage, country, funds_raised_millions)
AS row_num
FROM layoffS_backup;

WITH Duplicate_CTE AS
(SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 
`date`, stage, country, funds_raised_millions)
AS row_num
FROM layoffS_backup
)	
SELECT *
FROM Duplicate_CTE
WHERE row_num > 1;

SELECT *
FROM layoffs_backup
WHERE company = 'Casper';

CREATE TABLE `layoffs_backup2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_backup2;

INSERT INTO layoffs_backup2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 
`date`, stage, country, funds_raised_millions)
AS row_num
FROM layoffS_backup;

SELECT *
FROM layoffs_backup2
WHERE row_num > 1;

DELETE
FROM layoffs_backup2
WHERE row_num > 1;

-- STANDARDIZING DATA

SELECT company, TRIM(company)
FROM layoffs_backup2;

UPDATE layoffs_backup2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_backup2;

SELECT DISTINCT industry
FROM layoffs_backup2
ORDER BY 1;

UPDATE layoffs_backup2
SET industry = 'Crypto Currency'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_backup2
ORDER BY 1;

UPDATE layoffs_backup2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT DISTINCT country
FROM layoffs_backup2
ORDER BY 1;

ALTER TABLE layoffs_backup2
MODIFY COLUMN `date` DATE;

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_backup2;

UPDATE layoffs_backup2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

SELECT `date`
FROM layoffs_backup2;

SELECT DISTINCT industry
FROM layoffs_backup2;

SELECT *
FROM layoffs_backup2
WHERE industry is NULL
OR industry = '';

SELECT *
FROM layoffs_backup2
WHERE company = 'Airbnb';

SELECT *
FROM layoffs_backup2 as tb1
JOIN layoffs_backup2 as tb2
	ON tb1.company = tb2.company
WHERE (tb1.industry is NULL OR tb1.industry = '')
AND tb2.industry IS NOT NULL;

SELECT tb1.industry, tb2.industry
FROM layoffs_backup2 as tb1
JOIN layoffs_backup2 as tb2
	ON tb1.company = tb2.company
WHERE (tb1.industry is NULL OR tb1.industry = '')
AND tb2.industry IS NOT NULL;

UPDATE layoffs_backup2
SET industry = NULL 
WHERE industry = '';

UPDATE layoffs_backup2 AS tb1
JOIN layoffs_backup2 AS tb2
	ON tb1.company = tb2.company
SET tb1.industry = tb2.industry
WHERE tb1.industry IS NULL
AND tb2.industry IS NOT NULL;

SELECT *
FROM layoffs_backup2
WHERE company = 'Airbnb';

DELETE
FROM layoffs_backup2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

ALTER TABLE layoffs_backup2
DROP COLUMN row_num;

SELECT industry
FROM layoffs_backup2
WHERE industry LIKE 'Health C%';

SELECT industry,
CONCAT('Health',' ','Care')
FROM layoffs_backup2
WHERE industry = 'HealthCare'
;

UPDATE layoffs_backup2
SET industry = CONCAT('Health',' ','Care')
WHERE industry = 'HealthCare';