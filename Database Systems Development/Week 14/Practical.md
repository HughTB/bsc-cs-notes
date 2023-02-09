# DSD - Practical 14:00 09/02/23

1. Make sure you are up to date with the practicals! - I am :)
2. Create a new database called sec3
```sql
CREATE DATABASE sec3;
```
3. Turn on encryption in this new database
```sql
CREATE EXTENSION IF NOT EXISTS pgcrypto;
```
4. Using the Tutor Task above, create a new table called member and add 5 rows of data. This table must hold first and last names along with the member’s date of birth, (stored as a date datatype), a postcode and an encrypted password
```sql
CREATE TABLE member(
    member_id   SERIAL PRIMARY KEY,
    first_name  VARCHAR(25),
    last_name   VARCHAR(25),
    dob         DATE,
    postcode    CHAR(9),
    password    BYTEA
);

-- Insert data
INSERT INTO member(first_name, last_name, dob, postcode, password) VALUES
    ('Hugh', 'Baldwin', '2004-03-12', 'SO15 7FX', encrypt('Gaming123', 'qwerty', 'aes')),
    ('Ben', 'Farmer', '2003-02-13', 'SO14 WXR', encrypt('Very Poggers', 'qwerty', 'aes')),
    ('John', 'Smith', '1995-06-29', 'PO2 9XF', encrypt('G@mer69420', 'qwerty', 'aes')),
    ('Bob', 'Apple', '1969-09-24', 'PO8 1PF', encrypt('I L0ve SQL!', 'qwerty', 'aes')),
    ('Bill', 'Microsoft', '1985-11-02', 'SO32 1XD', encrypt('Ph1l@nthropist', 'qwerty', 'aes'));
```
5. Once stored, print out the data for all of the rows
```
sec3=# SELECT * FROM member;
 member_id | first_name | last_name |    dob     | postcode  |              password              
-----------+------------+-----------+------------+-----------+------------------------------------
         1 | Hugh       | Baldwin   | 2004-03-12 | SO15 7FX  | \xc3064a1e127c51010abdb4bb031421a7
         2 | Ben        | Farmer    | 2003-02-13 | SO14 WXR  | \x256c1ed049760ac69c976704c0f94892
         3 | John       | Smith     | 1995-06-29 | PO2 9XF   | \xb615c9f07a8aa16a767f7a457e696608
         4 | Bob        | Apple     | 1969-09-24 | PO8 1PF   | \x8b03517348717564c37d4a51786ccfdd
         5 | Bill       | Microsoft | 1985-11-02 | SO32 1XD  | \x7dc3ce1e3ab259f01ad5a84be16516e7
```
6. Decrypt the values stored in the encrypted password attribute for all 5 rows
```sql
SELECT member_id, first_name, last_name, dob, postcode, convert_from(decrypt(password, 'qwerty', 'aes'), 'utf-8') AS "password" FROM member;
```
```
sec3=# SELECT member_id, first_name, last_name, dob, postcode, convert_from(decrypt(password, 'qwerty', 'aes'), 'utf-8') AS "password" FROM member;
 member_id | first_name | last_name |    dob     | postcode  |    password    
-----------+------------+-----------+------------+-----------+----------------
         1 | Hugh       | Baldwin   | 2004-03-12 | SO15 7FX  | Gaming123
         2 | Ben        | Farmer    | 2003-02-13 | SO14 WXR  | Very Poggers
         3 | John       | Smith     | 1995-06-29 | PO2 9XF   | G@mer69420
         4 | Bob        | Apple     | 1969-09-24 | PO8 1PF   | I L0ve SQL!
         5 | Bill       | Microsoft | 1985-11-02 | SO32 1XD  | Ph1l@nthropist
```
7. Connect to dsd_22 and add a unique constraint to the customer table on the town column
```sql
ALTER TABLE customer ADD CONSTRAINT town_unique UNIQUE (town);
```
```
dsd_22=# ALTER TABLE customer ADD CONSTRAINT town_unique UNIQUE (town);
ERROR:  could not create unique index "town_unique"
DETAIL:  Key (town)=(La Mohammedia) is duplicated.
```
8. Using the manifest table, how many prod_id are there?
```sql
SELECT count(DISTINCT prod_id) FROM manifest;
```
```
dsd_22=# SELECT count(DISTINCT prod_id) FROM manifest;
 count 
-------
    76
```
9. How many distinct prod_id are there?
```sql
SELECT count(DISTINCT prod_id) FROM product;
```
```
dsd_22=# SELECT count(DISTINCT prod_id) FROM product;
 count 
-------
   100
```
10. How many orders in the manifest table include the product with the id of 24?
```sql
SELECT count(manifest_id) FROM manifest WHERE prod_id = 24;
```
```
dsd_22=# SELECT count(manifest_id) FROM manifest WHERE prod_id = 24;
 count 
-------
     4
```
11. How many orders in the manifest table include the product with the id of 2?
```sql
SELECT count(manifest_id) FROM manifest WHERE prod_id = 2;
```
```
dsd_22=# SELECT count(manifest_id) FROM manifest WHERE prod_id = 2;
 count 
-------
     0
```
12. Again in the manifest table, what code could be used to give the following output:
```
prod_id 
---------
     100
      99
      97
      95
      94
      93
      92
      91
```
```sql
SELECT DISTINCT prod_id FROM manifest WHERE prod_id > 90 AND prod_id < 101 ORDER BY prod_id DESC;
```
```
dsd_22=# SELECT DISTINCT prod_id FROM manifest WHERE prod_id > 90 AND prod_id < 101 ORDER BY prod_id DESC;
 prod_id 
---------
     100
      99
      97
      95
      94
      93
      92
      91
```
13. Using alter table, add a check constraint to the dsd_22 staff table. The check must check that the length of a postcode is over 5 characters long
```sql
ALTER TABLE staff ADD CONSTRAINT staff_postcode CHECK (length(postcode) > 5);
```
```
dsd_22=# ALTER TABLE staff ADD CONSTRAINT staff_postcode CHECK (length(postcode) > 5);
ALTER TABLE
```
14. Now add a new staff member to the table using the insert code snippet below:
```sql
INSERT INTO staff (staff_fname, staff_lname, addr1, addr2, town, postcode, home_email, work_email, ROLE) VALUES
('Tiny', 'Smith', '85 Lilly Way', 'Off Pole Lane', 'Southsea', 'PO98', 'tsmith@smiths.com', 'Tiny.Smith@dsd.com', 5);
```
```
dsd_22=# INSERT INTO staff (staff_fname, staff_lname, addr1, addr2, town, postcode, home_email, work_email, ROLE) VALUES
dsd_22-# ('Tiny', 'Smith', '85 Lilly Way', 'Off Pole Lane', 'Southsea', 'PO98', 'tsmith@smiths.com', 'Tiny.Smith@dsd.com', 5);
ERROR:  new row for relation "staff" violates check constraint "staff_postcode"
DETAIL:  Failing row contains (12, Tiny, Smith, 85 Lilly Way, Off Pole Lane, Southsea, PO98     , tsmith@smiths.com, Tiny.Smith@dsd.com, 5).
```
16. Select the last names and the date they joined and copy the results below:
```sql
SELECT last_name, joined FROM date_check;
```
```
  last_name  |   joined   
-------------+------------
 Harling     | 2022-04-28
 Brennans    | 2022-04-08
 Matijasevic | 2022-09-25
 Kleinhausen | 2022-08-13
 Womack      | 2022-06-19
 MacCallam   | 2023-02-05
 Flitcroft   | 2022-07-12
 Gasquoine   | 2022-07-22
 Ninnoli     | 2022-10-10
 Glassford   | 2022-08-26
 Boggish     | 2022-03-31
 Timmons     | 2022-11-23
 Nielson     | 2022-10-10
 Ellens      | 2022-06-15
 Larcombe    | 2022-06-28
 Wickenden   | 2022-06-15
 Dymoke      | 2022-07-19
 Haughey     | 2022-07-31
 Neem        | 2022-05-08
 Gras        | 2022-03-19
```
17. Now sort them into last_name order
```sql
SELECT last_name, joined FROM date_check ORDER BY last_name;
```
```
  last_name  |   joined   
-------------+------------
 Boggish     | 2022-03-31
 Brennans    | 2022-04-08
 Dymoke      | 2022-07-19
 Ellens      | 2022-06-15
 Flitcroft   | 2022-07-12
 Gasquoine   | 2022-07-22
 Glassford   | 2022-08-26
 Gras        | 2022-03-19
 Harling     | 2022-04-28
 Haughey     | 2022-07-31
 Kleinhausen | 2022-08-13
 Larcombe    | 2022-06-28
 MacCallam   | 2023-02-05
 Matijasevic | 2022-09-25
 Neem        | 2022-05-08
 Nielson     | 2022-10-10
 Ninnoli     | 2022-10-10
 Timmons     | 2022-11-23
 Wickenden   | 2022-06-15
 Womack      | 2022-06-19
```
18. What happens if we sort by a column we are not displaying?
```sql
SELECT last_name, joined FROM date_check ORDER BY first_name;
```
```
  last_name  |   joined   
-------------+------------
 Timmons     | 2022-11-23
 Larcombe    | 2022-06-28
 Womack      | 2022-06-19
 Harling     | 2022-04-28
 Wickenden   | 2022-06-15
 MacCallam   | 2023-02-05
 Brennans    | 2022-04-08
 Neem        | 2022-05-08
 Matijasevic | 2022-09-25
 Gras        | 2022-03-19
 Glassford   | 2022-08-26
 Haughey     | 2022-07-31
 Ninnoli     | 2022-10-10
 Boggish     | 2022-03-31
 Flitcroft   | 2022-07-12
 Gasquoine   | 2022-07-22
 Nielson     | 2022-10-10
 Dymoke      | 2022-07-19
 Ellens      | 2022-06-15
 Kleinhausen | 2022-08-13
```
19. How would you get a list of people who joined after October 1st 2022?
```sql
SELECT first_name, last_name, joined FROM date_check WHERE joined > '2022-10-01';
```
```
 first_name | last_name |   joined   
------------+-----------+------------
 Cross      | MacCallam | 2023-02-05
 Kermit     | Ninnoli   | 2022-10-10
 Amelie     | Timmons   | 2022-11-23
 Portia     | Nielson   | 2022-10-10
```
20. Order the output by joined date order
```sql
SELECT first_name, last_name, joined FROM date_check WHERE joined > '2022-10-01' ORDER BY joined;
```
```
 first_name | last_name |   joined   
------------+-----------+------------
 Kermit     | Ninnoli   | 2022-10-10
 Portia     | Nielson   | 2022-10-10
 Amelie     | Timmons   | 2022-11-23
 Cross      | MacCallam | 2023-02-05
```
21. Now order the output from 20 so that the joined date is the first order then try to order by the last_name
```sql
SELECT first_name, last_name, joined FROM date_check WHERE joined > '2022-10-01' ORDER BY joined, last_name;
```
```
 first_name | last_name |   joined   
------------+-----------+------------
 Portia     | Nielson   | 2022-10-10
 Kermit     | Ninnoli   | 2022-10-10
 Amelie     | Timmons   | 2022-11-23
 Cross      | MacCallam | 2023-02-05
```
22. We can use the `BETWEEN` keyword to find results that fall between two dates. Output all data for the people who joined between April 20th 2022 and November 30th 2022
```sql
SELECT first_name, last_name, joined FROM date_check WHERE joined BETWEEN '2022-04-20' AND '2022-11-30';
```
```
 first_name |  last_name  |   joined   
------------+-------------+------------
 Carie      | Harling     | 2022-04-28
 Devon      | Matijasevic | 2022-09-25
 Wald       | Kleinhausen | 2022-08-13
 Cammie     | Womack      | 2022-06-19
 Maris      | Flitcroft   | 2022-07-12
 Peggy      | Gasquoine   | 2022-07-22
 Kermit     | Ninnoli     | 2022-10-10
 Frieda     | Glassford   | 2022-08-26
 Amelie     | Timmons     | 2022-11-23
 Portia     | Nielson     | 2022-10-10
 Sara-ann   | Ellens      | 2022-06-15
 Bob        | Larcombe    | 2022-06-28
 Celestyn   | Wickenden   | 2022-06-15
 Rina       | Dymoke      | 2022-07-19
 Isadora    | Haughey     | 2022-07-31
 Demetria   | Neem        | 2022-05-08
```