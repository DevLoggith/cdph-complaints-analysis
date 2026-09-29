-- This creates a new, typed table with the columns needed for queries used in this project.
-- Distinct complaint numbers were chosen arbitrarily as the only unique value between each one
-- was the dw_parcel values which are not needed in the scope of this project's analysis

DROP TABLE IF EXISTS complaints;

CREATE TABLE complaints AS 
SELECT DISTINCT ON (complaint_number)
    complaint_number::bigint AS complaint_number,
    complaint_status,
    to_timestamp(submit_datetime, 'MM/DD/YYYY HH12:MI:SS AM')::timestamp AS submit_datetime
FROM complaints_raw
ORDER BY complaint_number;

ALTER TABLE complaints ADD PRIMARY KEY (complaint_number);
