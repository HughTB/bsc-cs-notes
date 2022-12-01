# DSD - Practical 14:00 24/11/22

- The ```GROUP BY``` keyword aggregates data into groups, based on the table stated, for example, ```GROUP BY city_name``` would group all rows that have the same city name
- The ```HAVING``` keyword filters the aggregated data, allowing you to get more specific data from the groups, for example, you could group small, medium and large apples, and then filter down to only apples with a diameter of less than 10cm
- The ```ORDER BY``` keyword sorts the data based on the table stated, for example, ```ORDER BY dob``` would sort the rows by the recorded date of birth
- The ```LIMIT``` keyword restricts the number of rows that will be displayed, for example, ```LIMIT 10``` would display the top 10 records
- A query must be in the following order:
    - SELECT {attribute name(s)}
    - FROM {table name(s)}
        - JOIN {table name} on {PK FK pair}
    - GROUP BY {table name}
        - HAVING {filter(s)}
    - ORDER BY {table name}
    - LIMIT {number of rows}

### Task 1
- See Google Doc / LucidChart

### Task 2

1. Write a query to retrieve the first and last names of the customers in the customer table
```sql
SELECT cust_fname, cust_lname FROM customer;
```
```
   cust_fname    |    cust_lname    
-----------------+------------------
 Jobey           | Boeter
 York            | O'Deegan
 Penelope        | Hexter
 Chadd           | Franz-Schoninger
 Vikky           | Eke
 Marie-françoise | Currier
 Bénédicte       | Dozdill
 Görel           | Douthwaite
 Bérengère       | Menendez
 Pélagie         | Hachard
 Adaobi          | Musa
```
2. Write a query to retrieve the first and last names and the towns they live in of the customers in the customer table
```sql
SELECT cust_fname, cust_lname, town FROM customer;
```
```
dsd_22=# SELECT cust_fname, cust_lname, town FROM customer;
   cust_fname    |    cust_lname    |      town      
-----------------+------------------+----------------
 Jobey           | Boeter           | La Mohammedia
 York            | O'Deegan         | Chemnitz
 Penelope        | Hexter           | Pingshan
 Chadd           | Franz-Schoninger | Baojia
 Vikky           | Eke              | Kamenný Přívoz
 Marie-françoise | Currier          | Waekolong
 Bénédicte       | Dozdill          | Dawuhan
 Görel           | Douthwaite       | Sunbu
 Bérengère       | Menendez         | Tsagaanders
 Pélagie         | Hachard          | Jiantou
 Adaobi          | Musa             | La Mohammedia
```
3. Print out the first and last name of the customer(s) who live in La Mohammedia
```sql
SELECT cust_fname, cust_lname FROM customer WHERE town = 'La Mohammedia';
```
```
 cust_fname | cust_lname 
------------+------------
 Jobey      | Boeter
 Adaobi     | Musa
```
5.  - In customer, cust_id is the primary key
    - In cust_order, cust_ord_id is the primary key
    - In cust_order, cust_id is a foreign key that references cust_id from customer
6. List all of the categories
```
  cat_name   
-------------
 Men's Wear
 Ladies Wear
 Kid's Wear
 Outdoor
 Sport
 Health
```
7. What is the id number for the category Sport?
```sql
SELECT cat_id FROM category WHERE cat_name = 'Sport';
```
```
 cat_id 
--------
      5
```
8. Write a query that joins the product table and the category table and prints out the prod_name and the appropriate category
```sql
SELECT p.prod_name, c.cat_name FROM product p JOIN category c ON p.prod_cat = c.cat_id;
```
```
                    prod_name                     |  cat_name   
--------------------------------------------------+-------------
 Multi-layered multi-tasking initiative           | Ladies Wear
 Operative analyzing task-force                   | Men's Wear
 Exclusive client-server array                    | Sport
 Balanced client-server product                   | Health
 Exclusive background website                     | Sport
 Pre-emptive holistic intranet                    | Health
 Re-engineered cohesive methodology               | Men's Wear
 Robust directional projection                    | Ladies Wear
 Inverse transitional infrastructure              | Outdoor
 Multi-tiered explicit paradigm                   | Health
 Re-engineered explicit software                  | Ladies Wear
 Cross-platform fresh-thinking core               | Kid's Wear
 Diverse neutral emulation                        | Outdoor
 Up-sized composite challenge                     | Outdoor
 Intuitive directional complexity                 | Outdoor
 Universal encompassing conglomeration            | Sport
 Multi-channelled well-modulated analyzer         | Ladies Wear
 Re-engineered actuating capability               | Outdoor
 Public-key interactive encoding                  | Ladies Wear
 Monitored asynchronous function                  | Health
```
9. Write a query that will list each staff member’s first and last name along with their work email and the role name that they hold
```sql
SELECT s.staff_fname, s.staff_lname, s.work_email, r.role_name FROM staff s JOIN role r ON s.role = r.role_id;
```
```
 staff_fname | staff_lname |         work_email          |    role_name    
-------------+-------------+-----------------------------+-----------------
 Montgomery  | Housegoe    | Montgomery.Housegoe@dsd.com | Order Picker
 Niel        | Welsby      | Niel.Welsby@dsd.com         | Final Packer
 Jillene     | Revitt      | Jillene.Revitt@dsd.com      | Post Sales
 Harriette   | Fewster     | Harriette.Fewster@dsd.com   | Post Sales
 Aura        | Clewlowe    | Aura.Clewlowe@dsd.com       | Post Sales
 Hanan       | Gloster     | Hanan.Gloster@dsd.com       | Customer Retain
 Nikoletta   | Shrimpton   | Nikoletta.Shrimpton@dsd.com | Customer Retain
 Tim         | Illem       | Tim.Illem@dsd.com           | Misc
 Nell        | Olsson      | Nell.Olsson@dsd.com         | Misc
 Janeva      | Gillicuddy  | Janeva.Gillicuddy@dsd.com   | Misc
```
10. Write a query that will show the last name and the role of staff members who put together orders from the customer whose last name is Eke. Include the cust_order_id and the customer’s first and last names
```sql
SELECT c.cust_fname, c.cust_lname, co.cust_ord_id, s.staff_lname, r.role_name
FROM customer c
JOIN cust_order co ON c.cust_id = co.cust_id
JOIN staff s ON s.staff_id = co.staff_id 
JOIN role r ON s.role = r.role_id
WHERE c.cust_lname = 'Eke';
```
```
 cust_fname | cust_lname | cust_ord_id | staff_lname |    role_name    
------------+------------+-------------+-------------+-----------------
 Vikky      | Eke        |          82 | Welsby      | Final Packer
 Vikky      | Eke        |          90 | Clewlowe    | Post Sales
 Vikky      | Eke        |         105 | Welsby      | Final Packer
 Vikky      | Eke        |         115 | Housegoe    | Order Picker
 Vikky      | Eke        |         118 | Gillicuddy  | Misc
 Vikky      | Eke        |         130 | Welsby      | Final Packer
 Vikky      | Eke        |         132 | Shrimpton   | Customer Retain
 Vikky      | Eke        |         135 | Welsby      | Final Packer
 Vikky      | Eke        |         145 | Housegoe    | Order Picker
```
11. Write a query that lists only the category names and the customer’s last names for orders that have been placed by people who live in Sunbu
```sql
SELECT c.cust_lname, cat.cat_name
FROM customer c
JOIN cust_order co ON c.cust_id = co.cust_id
JOIN manifest m ON co.cust_ord_id = m.cust_ord_id
JOIN product p ON m.prod_id = p.prod_id
JOIN category cat ON p.prod_cat = cat.cat_id
WHERE c.town = 'Sunbu';
```
```
 cust_lname |  cat_name   
------------+-------------
 Douthwaite | Outdoor
 Douthwaite | Sport
 Douthwaite | Kid's Wear
 Douthwaite | Outdoor
 Douthwaite | Sport
 Douthwaite | Sport
 Douthwaite | Ladies Wear
 Douthwaite | Outdoor
 Douthwaite | Sport
 Douthwaite | Ladies Wear
```
12. Try to group the orders and count the number of orders in each category for the results from q11. (hint - this might be a bit difficult. Grouping does not allow a ```WHERE```, use ```HAVING``` instead)
```sql
SELECT count(co.cust_ord_id), cat.cat_name
FROM customer c
JOIN cust_order co ON c.cust_id = co.cust_id
JOIN manifest m ON co.cust_ord_id = m.cust_ord_id
JOIN product p ON m.prod_id = p.prod_id
JOIN category cat ON p.prod_cat = cat.cat_id
GROUP BY cat.cat_id, c.town
HAVING c.town = 'Sunbu';
```
```
#count |  cat_name   
-------+-------------
     2 | Ladies Wear
     1 | Kid's Wear
     3 | Outdoor
     4 | Sport
```