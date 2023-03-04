# DSD - Practical 04/03/23

### Using dsd_22
1. Write a query that will combine the customer's first name, their last name and the email address in a single column. Give this column a sensible name

```sql
SELECT concat_ws(' ', cust_fname, cust_lname, email) AS "Contact Details" FROM customer;
```
```
                    Contact Details
--------------------------------------------------------
 Jobey Boeter jboeter0@mail.ru
 York O'Deegan yodeegan1@nydailynews.com
 Penelope Hexter phexter2@cbslocal.com
 Chadd Franz-Schoninger cfranzschoninger3@google.com.hk
 Vikky Eke veke4@elegantthemes.com
```
2. - Find all products which have the character 5 in their product name
   - For each product, find the position of the 5 in the name
```sql
SELECT prod_name FROM product WHERE prod_name LIKE '%5%';
```
```
                    prod_name
--------------------------------------------------
 Realigned 5th generation artificial intelligence
 Switchable 5th generation parallelism
```
```sql
SELECT POSITION('5' IN prod_name) FROM product;
```
```
 position
----------
        0
        0
        0
        0
        0
```
3. Can you write a query that combines the queries of 2 and 2a?
```sql
SELECT prod_name, POSITION('5' in prod_name) FROM product WHERE prod_name LIKE '%5%';
```
```
                    prod_name                     | position 
--------------------------------------------------+----------
 Realigned 5th generation artificial intelligence |       11
 Switchable 5th generation parallelism            |       12
```
4. Write a query that returns the first and last names of the staff members. You need to put the word "Dear" in front of the names
```sql
SELECT FORMAT('Dear %s %s', staff_fname, staff_lname) FROM staff;
```
```
          format
--------------------------
 Dear Niel Welsby
 Dear Nikoletta Shrimpton
 Dear Montgomery Housegoe
 Dear Hanan Gloster
 Dear Janeva Gillicuddy
```
### Using the users2 table from Week 16
5. The company is ten years old in November and are looking to send an email to all users who also have birthdays in November to celebrate this anniversary. Using one of the date functions we discussed last week, extract the first and last names of users who have birthdays in November. The output should put the first and last names of the users together in a useful format
```sql
SELECT concat_ws(' ', first_name, last_name) AS "Name", dob FROM users2 WHERE DATE_PART('month', dob) = 11;
```
```
       Name        |    dob     
-------------------+------------
 Zaria Coot        | 2002-11-07
 Shelba Riach      | 2002-11-09
 Joseph Lynn       | 2003-11-25
 Fidelio Lindeboom | 2003-11-01
 Sheryl Kubat      | 2001-11-07
```
6. - Which function will give the ascii value of the character "!"
   - What is the value?
```sql
SELECT ASCII('!');
```
```
33
```
7. What character does the ascii value 300 define?
```sql
SELECT CHR(300);
```
```
Ĭ
```
8. What character does the ascii value 5000 define?
```sql
SELECT CHR(5000);
```
```
ᎈ
```
9. Calculate the age of all users in the users2 table. Write a query that will return their first and last name along with their age. Put the results into age order with the eldest at the top
```sql
SELECT first_name AS "Forename", last_name AS "Surname", AGE(dob) AS "Age" FROM users2 ORDER BY AGE(dob) DESC;
```
```
 Forename  |   Surname    |           Age
-----------+--------------+--------------------------
 Sonya     | Beck         | 62 years 9 mons 16 days
 Cheyenne  | Stark        | 47 years 2 mons 14 days
 Savannah  | Dawson       | 30 years 18 days
 India     | Juarez       | 24 years 1 mon 8 days
 Lucho     | Holbie       | 22 years 11 mons 26 days
```
10. What is the current time according to Postgres?
11. What is the current date and time according to Postgres?
```sql
SELECT NOW()
```
```
              now
-------------------------------
 2023-03-04 23:12:02.200854+00
```