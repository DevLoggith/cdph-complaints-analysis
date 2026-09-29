DROP TABLE IF EXISTS complaints;

CREATE TABLE complaints AS 
SELECT
    complaint_type,
    complaint_status,
    to_timestamp(submit_datetime, 'MM/DD/YYYY HH12:MI:SS AM')::timestamp AS submit_datetime
FROM complaints_raw;
