TRUNCATE TABLE complaints_raw;
\copy complaints_raw FROM 'data/raw/public-health-complaints.csv' CSV HEADER
