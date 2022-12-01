# DSD - Practical 14:00 01/12/22

### Tutor Demo

Insert 2 new roles into the Role table
```sql
INSERT INTO role (role_name) VALUES ('Cleaner');
INSERT INTO role (role_name) VALUES ('Pre Sales');
```
Before adding the new roles, there were 5 records, after adding the new roles, there are 7 records

### Student Tasks

1. Write a query that correctly displays the staff members' first and last names, their email addresses and their roles. Use the method that uses the ```JOIN``` keyword
```sql
SELECT staff_fname, staff_lname, work_email, role_name
FROM staff
JOIN role ON staff.role = role.role_id;
```
| staff_fname | staff_lname |         work_email          |    role_name    |
|-------------|-------------|-----------------------------|-----------------|
| Montgomery  | Housegoe    | Montgomery.Housegoe@dsd.com | Order Picker|
| Niel        | Welsby      | Niel.Welsby@dsd.com         | Final Packer|
| Jillene     | Revitt      | Jillene.Revitt@dsd.com      | Post Sales|
| Harriette   | Fewster     | Harriette.Fewster@dsd.com   | Post Sales|
| Aura        | Clewlowe    | Aura.Clewlowe@dsd.com       | Post Sales|
| Hanan       | Gloster     | Hanan.Gloster@dsd.com       | Customer Retain|
| Nikoletta   | Shrimpton   | Nikoletta.Shrimpton@dsd.com | Customer Retain|
| Tim         | Illem       | Tim.Illem@dsd.com           | Misc|
| Nell        | Olsson      | Nell.Olsson@dsd.com         | Misc|
| Janeva      | Gillicuddy  | Janeva.Gillicuddy@dsd.com   | Misc|

2. Rewrite the query created in 1 but this time use the ```WHERE``` keyword
```sql
SELECT staff_fname, staff_lname, work_email, role_name
FROM staff, role
WHERE staff.role = role.role_id;
```
(This returns the same result)  
3. List the customers' first and last names with their email addresses and the product names of the products they have ordered. But only for the customers who live in Waekolong
```sql
SELECT c.cust_fname, c.cust_lname, c.email, p.prod_name
FROM customer c
JOIN cust_order co ON c.cust_id = co.cust_id
JOIN manifest m ON co.cust_ord_id = m.cust_ord_id
JOIN product p ON m.prod_id = p.prod_id
WHERE town = 'Waekolong';
```
|   cust_fname    | cust_lname |          email          |                   prod_name                    |
|-----------------|------------|-------------------------|------------------------------------------------|
| Marie-françoise | Currier    | acurrier0@economist.com | Vision-oriented attitude-oriented core|
| Marie-françoise | Currier    | acurrier0@economist.com | Balanced client-server product|
| Marie-françoise | Currier    | acurrier0@economist.com | Exclusive client-server array|
| Marie-françoise | Currier    | acurrier0@economist.com | Universal encompassing conglomeration|
| Marie-françoise | Currier    | acurrier0@economist.com | Synergistic homogeneous ability|
| Marie-françoise | Currier    | acurrier0@economist.com | Universal exuding protocol|
| Marie-françoise | Currier    | acurrier0@economist.com | Universal global hub|
| Marie-françoise | Currier    | acurrier0@economist.com | Balanced real-time info-mediaries|
| Marie-françoise | Currier    | acurrier0@economist.com | Integrated 24/7 interface|
| Marie-françoise | Currier    | acurrier0@economist.com | Re-engineered explicit software|
| Marie-françoise | Currier    | acurrier0@economist.com | Customizable cohesive capacity|
| Marie-françoise | Currier    | acurrier0@economist.com | Robust mission-critical complexity|
| Marie-françoise | Currier    | acurrier0@economist.com | Organic clear-thinking system engine|
| Marie-françoise | Currier    | acurrier0@economist.com | Stand-alone composite Graphical User Interface|

4. Write a query that returns all categories and the product names and order the output into category order
```sql
SELECT c.cat_name, p.prod_name
FROM product p
JOIN category c ON p.prod_cat = c.cat_id
ORDER BY c.cat_name;
```
|  cat_name   |                    prod_name                     |
|-------------|--------------------------------------------------|
| Health      | Exclusive multimedia middleware|
| Health      | Pre-emptive holistic intranet|
| Health      | Ameliorated next generation orchestration|
| Health      | Monitored asynchronous function|
| Health      | Right-sized mission-critical pricing structure|
| Health      | Profound human-resource forecast|
| Health      | Realigned client-driven database|
| Health      | Seamless optimal leverage|
| Health      | User-friendly encompassing array|
| Health      | Customizable cohesive capacity|

5. Rewrite the query for Q4 so that the output is ordered by category, and then the product id
```sql
SELECT c.cat_name, p.prod_name
FROM product p
JOIN category c ON p.prod_cat = c.cat_id
ORDER BY c.cat_name, p.prod_id;
```
|  cat_name   |                    prod_name                     |
|-------------|--------------------------------------------------|
| Health      | Ameliorated next generation orchestration|
| Health      | Balanced client-server product|
| Health      | Customizable cohesive capacity|
| Health      | Exclusive multimedia middleware|
| Health      | Fully-configurable full-range interface|
| Health      | Monitored asynchronous function|
| Health      | Multi-tiered explicit paradigm|
| Health      | Networked global open system|
| Health      | Open-architected homogeneous concept|
| Health      | Pre-emptive holistic intranet|

7. Write a query that will list all staff members' first and last names along with their email addresses who are cleaners
```sql
SELECT s.staff_fname, s.staff_lname, s.work_email
FROM staff s
JOIN role r ON s.role = r.role_id
WHERE r.role_name = 'Cleaner';
```
| staff_fname | staff_lname | work_email |
|-------------|-------------|------------|
(There are no cleaners in the database)

8. How many staff are there who have the role "Misc"?
```sql
SELECT count(*)
FROM staff s
JOIN role r ON s.role = r.role_id
WHERE r.role_name = 'Misc';
```
Count: 3
9. What are the addresses of the staff that are returned by the query for Q8? You should output their first and last names too
```sql
SELECT s.staff_fname AS "First Name", s.staff_lname AS "Surname", concat_ws(', ', s.addr1, s.addr2, s.town, s.postcode) AS "Address"
FROM staff s
JOIN role r ON s.role = r.role_id
WHERE r.role_name = 'Misc';
```
| First Name |  Surname   |                     Address                      
|------------|------------|--------------------------------------------------|
| Janeva     | Gillicuddy | 6999 Kings Park, Sachtjen, Portsmouth, PO05 5SF| 
| Nell       | Olsson     | 18424 Kenwood Court, Farmco, Havant, PO22 6DL| 
| Tim        | Illem      | 85 Lillian Way, Farragut, Southsea, PO93 0CN|

10. List the product id numbers with their names that start with the letters Re
```sql
SELECT p.prod_id, p.prod_name
FROM product p
WHERE prod_name LIKE 'Re%';
```
| prod_id |                    prod_name                     |
|---------|--------------------------------------------------|
|       7 | Re-engineered cohesive methodology|
|      11 | Re-engineered explicit software|
|      18 | Re-engineered actuating capability|
|      26 | Realigned 5th generation artificial intelligence|
|      39 | Realigned homogeneous hub|
|      56 | Reduced fresh-thinking process improvement|
|      59 | Realigned client-driven database|
|      76 | Re-engineered 24/7 knowledge base|

11. List the product id numbers with their names that have the word "value" in the name somewhere
```sql
SELECT p.prod_id, p.prod_name
FROM product p
WHERE prod_name LIKE '%value%';
```
| prod_id |           prod_name          |
|---------|------------------------------|
|      80 | Profound value-added intranet|

12. List the product names along with their id numbers that have "Value" somewhere in their name
```sql
SELECT p.prod_id, p.prod_name
FROM product p
WHERE prod_name LIKE '%Value%';
```
| prod_id | prod_name |
|---------|-----------|
(There are no values in this table)

13. List the customers' first and last names along with their email addresses, the customer order id, the category names and the product names for orders that have been placed for all products that have the word able in the name. (The case matters). Order by category and product name. The output should have the category names in alphabetical order then within each category the products should be ordered in alphabetical order
```sql
SELECT c.cust_fname, c.cust_lname, c.email, co.cust_ord_id, cat.cat_name, p.prod_name
FROM customer c
JOIN cust_order co ON c.cust_id = co.cust_id
JOIN manifest m ON co.cust_ord_id = m.cust_ord_id
JOIN product p ON m.prod_id = p.prod_id
JOIN category cat ON p.prod_cat = cat.cat_id
WHERE p.prod_name LIKE '%able%'
ORDER BY cat.cat_name, p.prod_name;
```
|   cust_fname    |    cust_lname    |              email              | cust_ord_id |  cat_name  |                prod_name                |
|-----------------|------------------|---------------------------------|-------------|------------|-----------------------------------------|
| Bérengère       | Menendez         | amenendez3@dell.com             |          64 | Health     | Customizable cohesive capacity|
| Marie-françoise | Currier          | acurrier0@economist.com         |         133 | Health     | Customizable cohesive capacity|
| Bérengère       | Menendez         | amenendez3@dell.com             |         102 | Health     | Fully-configurable full-range interface|
| Chadd           | Franz-Schoninger | cfranzschoninger3@google.com.hk |           7 | Health     | Team-oriented stable project|
| Chadd           | Franz-Schoninger | cfranzschoninger3@google.com.hk |          81 | Health     | Team-oriented stable project|
| Bénédicte       | Dozdill          | cdozdill1@amazon.de             |          24 | Kid's Wear | Configurable analyzing solution|
| Bérengère       | Menendez         | amenendez3@dell.com             |          21 | Kid's Wear | Configurable analyzing solution|
| Bérengère       | Menendez         | amenendez3@dell.com             |         113 | Kid's Wear | Configurable analyzing solution|
| Jobey           | Boeter           | jboeter0@mail.ru                |          91 | Kid's Wear | Configurable analyzing solution|
| Jobey           | Boeter           | jboeter0@mail.ru                |          39 | Outdoor    | Switchable tangible product|
| Jobey           | Boeter           | jboeter0@mail.ru                |          26 | Outdoor    | Switchable tangible product|
| Vikky           | Eke              | veke4@elegantthemes.com         |         105 | Sport      | Configurable methodical firmware|
| Vikky           | Eke              | veke4@elegantthemes.com         |         118 | Sport      | Customizable well-modulated encryption|
| Pélagie         | Hachard          | fhachard4@blinklist.com         |          89 | Sport      | Virtual stable Graphic Interface|