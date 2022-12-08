# DSD - Practical 14:00 08/12/22

### Student tasks

1. Write a **left** join that joins the customer and cust_order tables
```sql
select * from customer left join cust_order on customer.cust_id = cust_order.cust_id;
```
This returns 252 rows of data

2. Write a **right** join that joins the customer and cust_order tables
```sql
select * from customer right join cust_order on customer.cust_id = cust_order.cust_id;
```
This returns 250 rows

3. Write an **inner** join that joins the customer and cust_order tables
```sql
select * from customer inner join cust_order on customer.cust_id = cust_order.cust_id;
```
This returns 250 rows

4. Write a **right** join that joins the customer and cust_order tables
```sql
select * from customer right join cust_order on customer.cust_id = cust_order.cust_id;
```
This returns 251 rows

5. Write an **inner** join that joins the customer and cust_order tables
```sql
select * from customer inner join cust_order on customer.cust_id = cust_order.cust_id;
```
This returns 251 rows

6. Write a **left** join that joins the customer and cust_order tables
```sql
select * from customer left join cust_order on customer.cust_id = cust_order.cust_id;
```
This returns 262 rows

7. Rewrite the query for number 6 but reverse the order of the tables. If you started with the customer table in the query and joined cust_order then rewrite starting with cust_order and join customer
```sql
select * from cust_order left join customer on cust_order.cust_id = customer.cust_id;
```
This returns 251 rows (This is different to the other way round, yay!)

8. Depending on the number of rows that are returned from questions 6 and 7, rewrite the one that has the highest number of results so that the result is sorted firstly by the cust_id and then the cust_ord_id
```sql
select * from customer c
left join cust_order co on c.cust_id = co.cust_id
order by co.cust_id, co.cust_ord_id;
```

```
 cust_id |   cust_fname    |    cust_lname    |          addr1           |     addr2     |                            town                            | postcode  |               email               | cust_ord_id | staff_id | cust_id 
---------+-----------------+------------------+--------------------------+---------------+------------------------------------------------------------+-----------+-----------------------------------+-------------+----------+---------
       1 | Jobey           | Boeter           | 6 Claremont Park         | Truax         | La Mohammedia                                              | CV42 3EF  | jboeter0@mail.ru                  |          26 |        3 |       1
       1 | Jobey           | Boeter           | 6 Claremont Park         | Truax         | La Mohammedia                                              | CV42 3EF  | jboeter0@mail.ru                  |          34 |        4 |       1
       1 | Jobey           | Boeter           | 6 Claremont Park         | Truax         | La Mohammedia                                              | CV42 3EF  | jboeter0@mail.ru                  |          39 |        4 |       1
       1 | Jobey           | Boeter           | 6 Claremont Park         | Truax         | La Mohammedia                                              | CV42 3EF  | jboeter0@mail.ru                  |          57 |        2 |       1
       1 | Jobey           | Boeter           | 6 Claremont Park         | Truax         | La Mohammedia                                              | CV42 3EF  | jboeter0@mail.ru                  |          68 |        3 |       1
       1 | Jobey           | Boeter           | 6 Claremont Park         | Truax         | La Mohammedia                                              | CV42 3EF  | jboeter0@mail.ru                  |          71 |        2 |       1
       1 | Jobey           | Boeter           | 6 Claremont Park         | Truax         | La Mohammedia                                              | CV42 3EF  | jboeter0@mail.ru                  |          77 |        4 |       1
       1 | Jobey           | Boeter           | 6 Claremont Park         | Truax         | La Mohammedia                                              | CV42 3EF  | jboeter0@mail.ru                  |          91 |        1 |       1
       1 | Jobey           | Boeter           | 6 Claremont Park         | Truax         | La Mohammedia                                              | CV42 3EF  | jboeter0@mail.ru                  |          98 |        3 |       1
       1 | Jobey           | Boeter           | 6 Claremont Park         | Truax         | La Mohammedia                                              | CV42 3EF  | jboeter0@mail.ru                  |          99 |        5 |       1
       1 | Jobey           | Boeter           | 6 Claremont Park         | Truax         | La Mohammedia                                              | CV42 3EF  | jboeter0@mail.ru                  |         131 |        6 |       1
       1 | Jobey           | Boeter           | 6 Claremont Park         | Truax         | La Mohammedia                                              | CV42 3EF  | jboeter0@mail.ru                  |         143 |        5 |       1
       1 | Jobey           | Boeter           | 6 Claremont Park         | Truax         | La Mohammedia                                              | CV42 3EF  | jboeter0@mail.ru                  |         146 |        3 |       1
       2 | York            | O'Deegan         | 882 Hooker Trail         |               | Chemnitz                                                   | YA92 2OJ  | yodeegan1@nydailynews.com         |           2 |        5 |       2
       2 | York            | O'Deegan         | 882 Hooker Trail         |               | Chemnitz                                                   | YA92 2OJ  | yodeegan1@nydailynews.com         |          10 |        5 |       2
       2 | York            | O'Deegan         | 882 Hooker Trail         |               | Chemnitz                                                   | YA92 2OJ  | yodeegan1@nydailynews.com         |          19 |        3 |       2
       2 | York            | O'Deegan         | 882 Hooker Trail         |               | Chemnitz                                                   | YA92 2OJ  | yodeegan1@nydailynews.com         |          28 |        1 |       2
       2 | York            | O'Deegan         | 882 Hooker Trail         |               | Chemnitz                                                   | YA92 2OJ  | yodeegan1@nydailynews.com         |          29 |        2 |       2
       2 | York            | O'Deegan         | 882 Hooker Trail         |               | Chemnitz                                                   | YA92 2OJ  | yodeegan1@nydailynews.com         |          48 |        2 |       2
       2 | York            | O'Deegan         | 882 Hooker Trail         |               | Chemnitz                                                   | YA92 2OJ  | yodeegan1@nydailynews.com         |          58 |        3 |       2
       2 | York            | O'Deegan         | 882 Hooker Trail         |               | Chemnitz                                                   | YA92 2OJ  | yodeegan1@nydailynews.com         |          70 |        6 |       2
       2 | York            | O'Deegan         | 882 Hooker Trail         |               | Chemnitz                                                   | YA92 2OJ  | yodeegan1@nydailynews.com         |          78 |        1 |       2
       2 | York            | O'Deegan         | 882 Hooker Trail         |               | Chemnitz                                                   | YA92 2OJ  | yodeegan1@nydailynews.com         |          80 |        5 |       2
       2 | York            | O'Deegan         | 882 Hooker Trail         |               | Chemnitz                                                   | YA92 2OJ  | yodeegan1@nydailynews.com         |          95 |        6 |       2
```

9. Write a query that uses outer joins on the **customer**, the **cust_order** table and the **staff** table. It must return the cust_id, cust_ord_id and the staff_id as well as the staff members' last name and their work email address
```sql
select c.cust_id, co.cust_ord_id, s.staff_id, s.staff_fname, s.staff_lname, s.work_email from customer c
full outer join cust_order co on c.cust_id = co.cust_id
full outer join staff s on co.staff_id = s.staff_id;
```
This returns 266 rows

10. Rewrite the query from 9 and filter the results to show only those customers who have **not** placed an order
```sql
select c.cust_id, co.cust_ord_id, s.staff_id, s.staff_fname, s.staff_lname, s.work_email from customer c
full outer join cust_order co on c.cust_id = co.cust_id
full outer join staff s on co.staff_id = s.staff_id
where co.cust_ord_id is null and c.cust_id is not null;
```
This returns 11 rows

11. Write a query that will display the staff's first and last names, their work email addresses, the customer order id, the customer id and the customer’s first and last names along with the products that are in the customer’s orders. The results must be ordered by customer's last name order
```sql
select s.staff_fname, s.staff_lname, s.work_email, co.cust_ord_id, c.cust_id, c.cust_fname, c.cust_lname, p.prod_name from customer c
join cust_order co on c.cust_id = co.cust_id
join staff s on co.staff_id = s.staff_id
join manifest m on co.cust_ord_id = m.cust_ord_id
join product p on m.prod_id = p.prod_id
order by c.cust_lname;
```

```
 staff_fname | staff_lname |         work_email          | cust_ord_id | cust_id |   cust_fname    |    cust_lname    |                   prod_name                    
-------------+-------------+-----------------------------+-------------+---------+-----------------+------------------+------------------------------------------------
 Hanan       | Gloster     | Hanan.Gloster@dsd.com       |          39 |       1 | Jobey           | Boeter           | Switchable tangible product
 Nikoletta   | Shrimpton   | Nikoletta.Shrimpton@dsd.com |          57 |       1 | Jobey           | Boeter           | Persistent demand-driven complexity
 Montgomery  | Housegoe    | Montgomery.Housegoe@dsd.com |          68 |       1 | Jobey           | Boeter           | Streamlined asynchronous functionalities
 Aura        | Clewlowe    | Aura.Clewlowe@dsd.com       |         131 |       1 | Jobey           | Boeter           | Seamless optimal leverage
 Janeva      | Gillicuddy  | Janeva.Gillicuddy@dsd.com   |          99 |       1 | Jobey           | Boeter           | Fundamental global archive
 Hanan       | Gloster     | Hanan.Gloster@dsd.com       |          34 |       1 | Jobey           | Boeter           | Right-sized mission-critical pricing structure
 Montgomery  | Housegoe    | Montgomery.Housegoe@dsd.com |          26 |       1 | Jobey           | Boeter           | Switchable tangible product
 Hanan       | Gloster     | Hanan.Gloster@dsd.com       |          77 |       1 | Jobey           | Boeter           | Realigned homogeneous hub
 Montgomery  | Housegoe    | Montgomery.Housegoe@dsd.com |         146 |       1 | Jobey           | Boeter           | Fundamental global archive
 Janeva      | Gillicuddy  | Janeva.Gillicuddy@dsd.com   |         143 |       1 | Jobey           | Boeter           | Re-engineered cohesive methodology
 Niel        | Welsby      | Niel.Welsby@dsd.com         |          91 |       1 | Jobey           | Boeter           | Configurable analyzing solution
 Nikoletta   | Shrimpton   | Nikoletta.Shrimpton@dsd.com |          71 |       1 | Jobey           | Boeter           | Inverse high-level attitude
 Montgomery  | Housegoe    | Montgomery.Housegoe@dsd.com |          98 |       1 | Jobey           | Boeter           | Distributed uniform Graphic Interface
 Niel        | Welsby      | Niel.Welsby@dsd.com         |         112 |       6 | Marie-françoise | Currier          | Integrated 24/7 interface
```
This returns 150 rows

12. Write a query that will show only the customer contact details who have NEVER placed an order. It is up to you to decide what we mean by contact details
```sql
select c.email as "Email Address", c.cust_fname as "Forename", c.cust_lname as "Surname" from customer c
full outer join cust_order co on c.cust_id = co.cust_id
where co.cust_ord_id is null
order by c.cust_lname;
```

|           Email Address           | Forename  |    Surname    |
|-----------------------------------|-----------|---------------|
| tajsik9@sfgate.com                | Theadora  | Ajsik         |
| tclopton5@typepad.com             | Tine      | Clopton       |
| fgrouer4@dion.ne.jp               | Falkner   | Grouer        |
| 3vi3@google.wh                    | Evie      | Jones         |
| mkillner2@cafepress.com           | Mireielle | Killner       |
| clago8@rambler.ru                 | Cody      | Lago          |
| klawford3@imdb.com                | Kaine     | Lawford       |
| lmacgilpatrick6@uiuc.edu          | Lonnie    | MacGilpatrick |
| fpetchell1@networkadvertising.org | Fawnia    | Petchell      |
| jsettle222@google.ca              | Jen       | Settle        |
| nstanley7@arstechnica.com         | Nealy     | Stanley       |

This returns 11 rows