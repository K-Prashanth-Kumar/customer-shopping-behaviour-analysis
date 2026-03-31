# Python

This folder shows how raw data was cleaned and transformed into a usable dataset.

The main goal here was to convert raw, unstructured data into a clean and reliable dataset that can be used for analysis without errors.

### Work Done

- Loaded dataset using pandas  
- Handled missing values in review_rating using median approach  
- Standardized column names for consistency across tools  
- Converted data types where required  
- Created a new column "age_group" to segment customers  
- Removed duplicate and unnecessary columns  

### Why This Step Matters

Raw data often contains errors and inconsistencies. Without cleaning, analysis results can be misleading.

This step ensures:
- Accurate calculations  
- Consistent analysis across SQL and Power BI  
- Better segmentation for insights  

### Outcome

- Clean and structured dataset  
- Ready for SQL analysis and visualization  

### Files

- customer_shopping_eda.py → Cleaning and preprocessing script  
- customer_shopping_eda.pdf → Output summary  
