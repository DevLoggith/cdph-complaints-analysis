-- This creates a new, typed table with the columns needed for queries used in this project.

-- Multiple rows shared the same complaint numbers and all other data only varying in `dw_parcel`
-- values. Because of this, distinct complaint numbers were chosen arbitrarily as dw_parcel values
-- are not needed in the scope of this project's analysis.

DROP TABLE IF EXISTS complaints;

CREATE TABLE complaints AS 
SELECT DISTINCT ON (complaint_number)
    complaint_number::bigint AS complaint_number,
    complaint_type,
    complaint_status,
    to_timestamp(submit_datetime, 'MM/DD/YYYY HH12:MI:SS AM')::timestamp AS submit_datetime
FROM complaints_raw
WHERE complaint_type IS NOT NULL
ORDER BY complaint_number;

ALTER TABLE complaints ADD PRIMARY KEY (complaint_number);
