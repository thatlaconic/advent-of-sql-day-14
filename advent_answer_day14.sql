SELECT *
FROM santarecords;


SELECT record_date, element
FROM santarecords, jsonb_array_elements(cleaning_receipts) AS element
WHERE element ->>'color' = 'green' AND element ->>'garment' = 'suit'
ORDER BY record_date DESC
LIMIT 1
;