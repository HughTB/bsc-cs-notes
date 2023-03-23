# DSD - Practical 14:00 23/03/23

1. Write a query that puts the genre, the author's full name and the titles of the books they have written for all of the action books. The name and title must be displayed in a single column with the heading "Title and Author"

```sql
SELECT CONCAT_WS(' ', b.title, a.authorfname, a.authorlname) AS "Title and Author" FROM book b
JOIN bookgenre bg ON b.isbn = bg.isbn
JOIN wrote w ON b.isbn = w.wroteisbn
JOIN author a ON w.authorid = a.authorid
WHERE bg.genreid = 4;
```
```
                 Title and Author
---------------------------------------------------
 BALANCED ACTUATING INSTRUCTION SET Bobbye Valois
 RIGHT-SIZED LOCAL INTRANET Sara Hurll
 RIGHT-SIZED LOCAL INTRANET Brendin Amberger
 BALANCED ACTUATING INSTRUCTION SET Linet Aberhart
 RIGHT-SIZED LOCAL INTRANET Odelle Cannaway
 OPTIONAL VALUE-ADDED OPEN SYSTEM Gayelord Croom
```

2. There are some common first names in the author table. Write a query that would return only a single row of data for each individual name

```sql
SELECT DISTINCT(authorfname) FROM author;
```
```
 authorfname
-------------
 Roxie
 Fleming
 Faina
 Linet
 Serena
 Kearney
 Collen
 Phyllis
 Sherlock
 Noach
 ...
 ```

3. How many rows of data would be returned by the query in 2?

```sql
SELECT COUNT(DISTINCT(authorfname)) FROM author;
```
```
 count 
-------
    28
```

4. How many authors are there in total?

```sql
SELECT COUNT(authorid) FROM author;
```
```
 count 
-------
    30
```

5. How many customers have a middle name?

```sql
SELECT COUNT(mname) FROM libuser;
```
```
 count 
-------
    14
```

6. Do we have any authors in our system that do not appear to have written any book that we have on the shelves? List their full names, surname first with a comma as a separator using concatenation, giving the column the title of "Author but no books"

```sql
SELECT CONCAT_WS(',', a.authorlname, a.authorfname) AS "Author but no books" FROM author a
LEFT JOIN wrote w ON a.authorid = w.authorid
WHERE w.authorid IS NULL;
```
```
 Author but no books 
---------------------
 Trude,Roxie
 Burgan,Fleming
 Youens,Malinda
 Findlow,Wilmette
 O'Carroll,Phyllis
 Boxhall,Faina
```

7. List any library users full names and their email addresses that have never taken a book out of the library. Show another piece of data that proves that your query is giving exactly the answer you are asked for

```sql
SELECT CONCAT_WS(' ', u.fname, u.lname) AS "Name", u.emailaddress AS "Email Address" FROM libuser u
LEFT JOIN loan l ON u.librarynumber = l.loanlibrarynumb
WHERE l.loanlibrarynumb IS NULL;
```
```
        Name        |        Email Address
--------------------+------------------------------
 Germain Remmers    | aremmers9@google.pl
 Quincey Hazle      | fhazlea@gmpg.org
 Julieta Hardison   | ahardisonb@deliciousdays.com
 Gordon Farady      | ifaradyc@usgs.gov
 Sheelagh Ganforthe | tganforthed@angelfire.com
 Konstanze Tonge    | gtongee@techcrunch.com
 Cassie Dowgill     | jdowgillf@plala.or.jp
 Marshall Yeudall   | gyeudallg@ezinearticles.com
 Rodolfo Pinks      | zpinksh@multiply.com
 Drake New          | hnewi@cdc.gov
...
```

8. List the author's full names putting them into last name reverse alphabetical order

```sql
SELECT CONCAT_WS(' ', a.authorfname, a.authorlname) AS "Full name" FROM author a
ORDER BY a.authorlname DESC;
```
```
       Full name
-----------------------
 Malinda Youens        
 Corbie Varga
 Bobbye Valois
 Roxie Trude
 Gerti Shirtcliffe
 Zacharias Ransley
 Bear Oliphand
 Phyllis O'Carroll
 Shoshana Moutray Read
 Gerti McTerlagh
...
```

9. List the author’s full names whose first name begins with the letter B. Sort the results into the same order as in 8

```sql
SELECT CONCAT_WS(' ', a.authorfname, a.authorlname) AS "Full name" FROM author a
WHERE SUBSTRING(a.authorfname, 1, 1) = 'B'
ORDER BY a.authorlname DESC;
```

10. List the books that have a genre. Sort the books into alphabetical order

```sql
SELECT b.title, g.genre FROM book b
LEFT JOIN bookgenre bg ON b.isbn = bg.isbn
JOIN genre g ON bg.genreid = g.genreid
WHERE bg.isbn IS NOT NULL
ORDER BY g.genre ASC;
```
```
                     title                      |    genre
------------------------------------------------+-------------
 RIGHT-SIZED LOCAL INTRANET                     | Action
 OPTIONAL VALUE-ADDED OPEN SYSTEM               | Action
 VIRTUAL NEUTRAL CAPACITY                       | Action
 BALANCED ACTUATING INSTRUCTION SET             | Action
 SECURED MOTIVATING CONCEPT                     | Adult
 PROFIT-FOCUSED OBJECT-ORIENTED METHODOLOGY     | Anime
 DE-ENGINEERED ZERO TOLERANCE GRAPHIC INTERFACE | Comedy
 RE-ENGINEERED SYSTEM-WORTHY CORE               | Comedy
 SECURED 24/7 PRODUCT                           | Crime
 IMPLEMENTED INTERMEDIATE METHODOLOGY           | Horror
...
```

11. Now sort the output for 10 into descending genreid order

```sql
SELECT b.title, g.genre FROM book b
LEFT JOIN bookgenre bg ON b.isbn = bg.isbn
JOIN genre g ON bg.genreid = g.genreid
WHERE bg.isbn IS NOT NULL
ORDER BY g.genreid DESC;
```
```
                     title                      |    genre
------------------------------------------------+-------------
 PROFIT-FOCUSED OBJECT-ORIENTED METHODOLOGY     | Anime
 SECURED MOTIVATING CONCEPT                     | Adult
 SECURED 24/7 PRODUCT                           | Crime
 MONITORED MULTI-STATE CONGLOMERATION           | Music
 FUNDAMENTAL BIFURCATED ARTIFICIAL INTELLIGENCE | Romance
 FULLY-CONFIGURABLE OPTIMAL FUNCTION            | Romance
 FRONT-LINE EVEN-KEELED APPROACH                | Sci-Fi
 IMPLEMENTED INTERMEDIATE METHODOLOGY           | Horror
 MULTI-TIERED RESPONSIVE UTILISATION            | Thriller
 DEVOLVED EXUDING APPROACH                      | Thriller
...
```

12. Sort the output from 10 into alphabetical genre order and reversed title order

```sql
SELECT b.title, g.genre FROM book b
LEFT JOIN bookgenre bg ON b.isbn = bg.isbn
JOIN genre g ON bg.genreid = g.genreid
WHERE bg.isbn IS NOT NULL
ORDER BY g.genre ASC, b.title DESC;
```
```
                     title                      |    genre
------------------------------------------------+-------------
 VIRTUAL NEUTRAL CAPACITY                       | Action
 RIGHT-SIZED LOCAL INTRANET                     | Action
 OPTIONAL VALUE-ADDED OPEN SYSTEM               | Action
 BALANCED ACTUATING INSTRUCTION SET             | Action
 SECURED MOTIVATING CONCEPT                     | Adult
 PROFIT-FOCUSED OBJECT-ORIENTED METHODOLOGY     | Anime
 RE-ENGINEERED SYSTEM-WORTHY CORE               | Comedy
 DE-ENGINEERED ZERO TOLERANCE GRAPHIC INTERFACE | Comedy
 SECURED 24/7 PRODUCT                           | Crime
 IMPLEMENTED INTERMEDIATE METHODOLOGY           | Horror
...
```

13. List all of the genres that the author Corbie Varga has written books in

```sql
SELECT g.genre FROM genre g
JOIN bookgenre bg ON g.genreid = bg.genreid
JOIN book b ON bg.isbn = b.isbn
JOIN wrote w ON b.isbn = w.wroteisbn
JOIN author a ON w.authorid = a.authorid
WHERE a.authorfname = 'Corbie' AND a.authorlname = 'Varga';
```
```
    genre    
-------------
 Noir
 Adult
 Non-Fiction
 Comedy
 Anime
```

14. Write a view named loans that will allow a user to list the user's first and last names, the book titles and the author last names of all books that were loaned out between Feb 28th 2022 and Oct 30th 2022

```sql
CREATE VIEW loans AS
SELECT CONCAT_WS(' ', u.fname, u.lname) AS "User Name", b.title AS "Title", a.authorlname AS "Author Surname" FROM libuser u
JOIN loan l ON u.librarynumber = l.loanlibrarynumb
JOIN book b ON l.isbn = b.isbn
JOIN wrote w ON b.isbn = w.wroteisbn
JOIN author a ON w.authorid = a.authorid
WHERE l.loanstart BETWEEN '2022-02-28' AND '2022-10-30';
```
```sql
SELECT * FROM loans;
```
```
       User Name       |                     Title                      | Author Surname
-----------------------+------------------------------------------------+----------------
 Olympia Chasle        | SECURED MOTIVATING CONCEPT                     | Varga
 Rossy Studd           | SECURED MOTIVATING CONCEPT                     | Varga
 Ethel Calcott         | FRONT-LINE EVEN-KEELED APPROACH                | Amberger
 Baryram Postlethwaite | DEVOLVED EXUDING APPROACH                      | Aslett
 Rossy Studd           | DEVOLVED EXUDING APPROACH                      | Aslett
 Olympia Chasle        | SECURED MOTIVATING CONCEPT                     | Harley
 Rossy Studd           | SECURED MOTIVATING CONCEPT                     | Harley
 Olympia Chasle        | FUNDAMENTAL BIFURCATED ARTIFICIAL INTELLIGENCE | Bing
 Olympia Chasle        | PROGRAMMABLE CLEAR-THINKING PORTAL             | Aslett
 Ethel Calcott         | FRONT-LINE EVEN-KEELED APPROACH                | Mallebone
...
```