# 🧹 Layoffs Data Cleaning Project

This project showcases a structured SQL-based data cleaning process applied to a global tech layoffs dataset. The main objective is to clean and standardize the data to prepare it for analysis.

## 📌 Key SQL Processes Used

• Created a backup table to preserve raw data  
• Used `ROW_NUMBER()` with `PARTITION BY` in a CTE to identify and remove duplicate rows  
• Standardized text fields using `TRIM()` and `LIKE` conditions (e.g., fixed inconsistent company, country, and industry names)  
• Converted `date` from text to proper `DATE` format using `STR_TO_DATE()`  
• Replaced missing `industry` values using a self `JOIN` based on matching company names  
• Removed rows where both `total_laid_off` and `percentage_laid_off` were `NULL`  
• Renamed inconsistent categorical values such as changing `HealthCare` to `Health Care`  

## 🛠️ Tools & Skills Used

- SQL (MySQL)
- Common Table Expressions (CTEs)
- Self Joins
- Window Functions
- String Functions (`TRIM`, `LIKE`, `CONCAT`)
- Date Conversion with `STR_TO_DATE()`
- Data Standardization & Deduplication

## 📁 Files Included

- `Layoffs Data Cleaning Queries.sql`: SQL script with all cleaning queries  
- `layoffs cleaned data.csv`:  cleaned version of the dataset  

## 📍 Repository Location

🔗 [Layoffs-Data-Cleaning GitHub Repository](https://github.com/charuzue/Layoffs-Data-Cleaning)



