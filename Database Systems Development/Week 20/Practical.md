# DSD - Practical 14:00 30/03/23

3. - Draw an ERD, (entity with primary and foreign keys only, attributes NOT needed), to cover the following business rules
   - A car can only be owned by one person
   - 1 person may have 1 or more cars
   - A car may have many services
   - Each service is for a single car
- See q3_erd.pdf
4. Using lib22, how many loans have been made by the library?

```sql
SELECT count(loanlibrarynumb) AS "Loans" FROM loan;
```
```
 Loans 
-------
    30
```

5. How many individual books have been lent out? (Think about the individual ISBNs in the loan table)

```sql
SELECT count(isbn) FROM loan;
```
```
 count 
-------
    30
```

6. What is the latest date that we have data for in the loan table?

```sql
SELECT loanstart FROM loan
ORDER BY loanstart DESC;
```
```
 loanstart  
------------
 2022-11-27
 2022-11-22
```

7. How many books were loaned on the date from Q6?

```sql
SELECT count(loanlibrarynumb) FROM loan
WHERE loanstart = '2022-11-27';
```
```
 count 
-------
     1
```

8. List the book titles that were loaned between 4th October 2022 and 10th October 2022 (inclusive)

```sql
SELECT b.title, l.loanstart FROM loan l
JOIN book b ON l.isbn = b.isbn
WHERE l.loanstart BETWEEN '2022-10-04' AND '2022-10-10';
```
```
                title                | loanstart  
-------------------------------------+------------
 FULLY-CONFIGURABLE OPTIMAL FUNCTION | 2022-10-06
```

9. How many books were loaned out between the dates in Q8?

```sql
SELECT count(loanstart) FROM loan
WHERE loanstart BETWEEN '2022-10-04' AND '2022-10-10';
```
```
 count 
-------
     1
```

10. Who wrote the book "De-Engineered Zero Tolerance Graphic Interface"?

```sql
SELECT b.title AS "Book Title", concat_ws(' ', a.authorfname, a.authorlname) AS "Author Name" FROM book b
JOIN wrote w ON b.isbn = w.wroteisbn
JOIN author a ON w.authorid = a.authorid
WHERE b.title LIKE '%DE-ENGINEERED%';
```
```
                   Book Title                   |  Author Name   
------------------------------------------------+----------------
 DE-ENGINEERED ZERO TOLERANCE GRAPHIC INTERFACE | Corbie Varga
 DE-ENGINEERED ZERO TOLERANCE GRAPHIC INTERFACE | Sara Hurll
 DE-ENGINEERED ZERO TOLERANCE GRAPHIC INTERFACE | Linet Aberhart
```

11. How many times has the book in Q10 been loaned out of the library?

```sql
SELECT l.loanlibrarynumb AS "Loan ID", b.title AS "Book Title" FROM loan l
JOIN book b ON l.isbn = b.isbn
WHERE b.title LIKE '%DE-ENGINEERED%';
```
```
 Loan ID | Book Title 
---------+------------
(0 rows)
```

12. List all users who have NOT loaned books out of the library. (It is up to you what data you need to display)

```sql
SELECT u.librarynumber AS "Library Number", concat_ws(' ', u.fname, u.lname) AS "Name", u.emailaddress AS "Email Address" FROM libuser u
LEFT JOIN loan l ON l.loanlibrarynumb = u.librarynumber
WHERE l.loanlibrarynumb IS NULL;
```
```
 Library Number |        Name        |        Email Address         
----------------+--------------------+------------------------------
 AAA96446120    | Germain Remmers    | aremmers9@google.pl
 AAA99434117    | Quincey Hazle      | fhazlea@gmpg.org
 AAB00495752    | Julieta Hardison   | ahardisonb@deliciousdays.com
 AAB22674949    | Gordon Farady      | ifaradyc@usgs.gov
 AAB23103554    | Sheelagh Ganforthe | tganforthed@angelfire.com
 AAB28160784    | Konstanze Tonge    | gtongee@techcrunch.com
 AAB34187675    | Cassie Dowgill     | jdowgillf@plala.or.jp
 AAB37618031    | Marshall Yeudall   | gyeudallg@ezinearticles.com
 AAB41518114    | Rodolfo Pinks      | zpinksh@multiply.com
 AAB46353589    | Drake New          | hnewi@cdc.gov
 AAB50949770    | Arron Loukes       | cloukesj@ftc.gov
 AAB55163014    | Madelina Sinkins   | asinkinsk@zimbio.com
 AAB59879074    | Elana Matthewes    | jmatthewesl@springer.com
 AAB69653142    | Zorine Sucre       | bsucrem@imgur.com
 AAB70670733    | Stewart Skill      | sskilln@jiathis.com
 AAB76970537    | Gibb Burgin        | aburgino@youku.com
 AAA87857654    | Lesya Harrison     | bharrison66@gov.uk
```

13. Which attribute forces an attribute to only have one version of a value in a table?

```sql
UNIQUE
```

14. Change the following code to enforce the behaviour in Q13 on the email attribute

```sql
create table test_table (test_id int primary key, fname varchar(30) not null, name varchar(30), lname varchar(50) not null, email varchar(70) not null);
```
```sql
create table test_table (test_id int primary key, fname varchar(30) not null, name varchar(30), lname varchar(50) not null, email varchar(70) not null unique);
```

15. - Using the following attribute names, constraints and datatypes, create a table that connects to the table in Q14. Call this table test_table2
    - test_id2 int primary key
    - linking_att int foreign key
    - notes text

```sql
CREATE TABLE test_table2 (
  test_id2 INT PRIMARY KEY,
  linking_att INT FOREIGN KEY REFERENCES test_table (test_id),
  notes TEXT
);
```