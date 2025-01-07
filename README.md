# [Where is Santa's green suit?](https://adventofsql.com/challenges/14)

## Description
Santa is in full panic mode, frantically digging through the chaotic mess of his workshop office, which is buried under centuries of receipts, invoices, and shopping tags. He's searching for his special green suit, determined to surprise everyone with it this Christmas. Papers fly everywhere as he shouts in frustration about filing systems and organization.

Mrs. Claus, standing in the doorway, tries to intervene with a mix of patience and exasperation. "Nicholas, it's at the dry cleaners. I told you—I dropped it off myself." But Santa is too consumed by his disorganized quest to listen, muttering about color-coding as he dives deeper into the paper avalanche, oblivious to her words.

## Challenge
[Download Challenge data](https://github.com/thatlaconic/advent-of-sql-day-14/blob/main/advent_of_sql_day_14.sql)

Mrs. Claus needs to find the receipt for Santa's green suit that was dry cleaned.

She needs to know when it was dropped off, so submit the drop off date.

Order by the latest drop off date

## Dataset
This dataset contains 1 table. 
### Using PostgreSQL
**input**
```sql
SELECT *
FROM santarecords ;
```
**output**

![](https://github.com/thatlaconic/advent-of-sql-day-14/blob/main/santarecords.PNG)

### Solution
[Download Solution Code](https://github.com/thatlaconic/advent-of-sql-day-14/blob/main/advent_answer_day14.sql)

**input**
```sql
SELECT record_date, element
FROM santarecords, jsonb_array_elements(cleaning_receipts) AS element
WHERE element ->>'color' = 'green' AND element ->>'garment' = 'suit'
ORDER BY record_date DESC
LIMIT 1 ;

```
**output**

![](https://github.com/thatlaconic/advent-of-sql-day-14/blob/main/d14.PNG)

