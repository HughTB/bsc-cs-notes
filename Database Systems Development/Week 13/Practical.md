# DSD - Practical 14:00 02/02/23

1. Create 2 new roles and give them both login ability and passwords. You can choose the role names.
2. Log in with one of the new roles. Get a list of all the databases with `\l`. Can you see other databases?
```
user1=> \l
                                   List of databases
      Name      |     Owner      | Encoding | Collate |  Ctype  |   Access privileges   
----------------+----------------+----------+---------+---------+-----------------------
 carpark        | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 code_test      | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 dsd_22         | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 games          | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 hugh           | hugh           | UTF8     | C.UTF-8 | C.UTF-8 | 
 mongo-2021-fix | mongo-2021-fix | UTF8     | C.UTF-8 | C.UTF-8 | 
 postgres       | postgres       | UTF8     | C.UTF-8 | C.UTF-8 | 
 template0      | postgres       | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +
                |                |          |         |         | postgres=CTc/postgres
 template1      | postgres       | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +
                |                |          |         |         | postgres=CTc/postgres
 up2157117      | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 up2157117_cw   | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 user1          | user1          | UTF8     | C.UTF-8 | C.UTF-8 | 
 user2          | user2          | UTF8     | C.UTF-8 | C.UTF-8 | 
```
3. Connect to dsd_22 and list the tables with `\dt`. Can you see all the tables in the dsd_22 database?
```
dsd_22=> \dt
               List of relations
 Schema |       Name       | Type  |   Owner   
--------+------------------+-------+-----------
 public | boatyard         | table | up2157117
 public | category         | table | up2157117
 public | cust_order       | table | up2157117
 public | customer         | table | up2157117
 public | manifest         | table | up2157117
 public | product          | table | up2157117
 public | role             | table | up2157117
 public | service_category | table | up2157117
 public | staff            | table | up2157117
 public | staff_role       | table | up2157117
```
4. Run a SELECT statement on the product table. Use the following command: `SELECT * FROM PRODUCT WHERE PROD_ID <= 10;`
```
dsd_22=> SELECT * FROM PRODUCT WHERE PROD_ID <= 10;
ERROR:  permission denied for table product
```
5. As your normal user, the `upxxxxxx` user, grant the new role the ability to run SELECT commands on the product table
```
dsd_22=# GRANT SELECT ON product TO user1;
GRANT
```
6. As the new role, can you now run the command you ran in step 4?
```
dsd_22=> SELECT * FROM PRODUCT WHERE PROD_ID <= 10;
 prod_id |               prod_name                | prod_cat 
---------+----------------------------------------+----------
       1 | Multi-layered multi-tasking initiative |        2
       2 | Operative analyzing task-force         |        1
       3 | Exclusive client-server array          |        5
       4 | Balanced client-server product         |        6
       5 | Exclusive background website           |        5
       6 | Pre-emptive holistic intranet          |        6
       7 | Re-engineered cohesive methodology     |        1
       8 | Robust directional projection          |        2
       9 | Inverse transitional infrastructure    |        4
      10 | Multi-tiered explicit paradigm         |        6
```
7. Run the following code to INSERT a new product: `INSERT INTO PRODUCT (PROD_NAME,PROD_CAT) VALUES ('The Amazing New Thingy',3);`
```
dsd_22=> INSERT INTO PRODUCT (PROD_NAME,PROD_CAT) VALUES ('The Amazing New Thingy',3);
ERROR:  permission denied for table product
```
8. Run the following code: `SELECT PROD_NAME, PROD_ID, PROD_CAT FROM PRODUCT WHERE PROD_NAME = 'The Amazing New Thingy';` Does this return the new product?
```
dsd_22=> SELECT PROD_NAME, PROD_ID, PROD_CAT FROM PRODUCT WHERE PROD_NAME = 'The Amazing New Thingy';
 prod_name | prod_id | prod_cat 
-----------+---------+----------
```
9. 
```
dsd_22=# GRANT UPDATE ON role TO user1, user2;
GRANT
```
10. List the role_names that are stored in the role table.
```
dsd_22=> SELECT role_name FROM role;
ERROR:  permission denied for table role
```
11. Run the following command as the second new role. (Not the one you did the initial tests on) `UPDATE ROLE SET ROLE_NAME = 'Hygiene Expert' where role_name = 'Cleaner';`
```
dsd_22=> UPDATE ROLE SET ROLE_NAME = 'Hygiene Expert' where role_name = 'Cleaner';
ERROR:  permission denied for table role
```
12. List the role_names that are stored in the role table. Do you have a new role? Is this the same role_id value?
```
dsd_22=# select role_name from role;
    role_name    
-----------------
 Order Picker
 Final Packer
 Post Sales
 Customer Retain
 Misc
 Cleaner
 Pre Sales
```
13. As your normal user, (the superuser), create a view that selects the customer first and last names and their email addresses. Call the view cust_email
```sql
CREATE VIEW cust_email AS SELECT cust_fname, cust_lname, email FROM customer;
```
```
dsd_22=# CREATE VIEW cust_email AS SELECT cust_fname, cust_lname, email FROM customer;
CREATE VIEW
```
14. As the first new role, run a SELECT on this new role
```
dsd_22=> select * from cust_email;
ERROR:  permission denied for view cust_email
```
15. GRANT the ability for the 2nd new role to run the view
```
dsd_22=# GRANT SELECT ON cust_email TO user2;
GRANT
```
16. Run the `SELECT * `on the view for both of your new roles
```
user1:
dsd_22=> SELECT * FROM cust_email;
ERROR:  permission denied for view cust_email

user2:
   cust_fname    |    cust_lname    |               email               
-----------------+------------------+-----------------------------------
 Jobey           | Boeter           | jboeter0@mail.ru
 York            | O'Deegan         | yodeegan1@nydailynews.com
 Penelope        | Hexter           | phexter2@cbslocal.com
 Chadd           | Franz-Schoninger | cfranzschoninger3@google.com.hk
 Vikky           | Eke              | veke4@elegantthemes.com
 Marie-françoise | Currier          | acurrier0@economist.com
 Bénédicte       | Dozdill          | cdozdill1@amazon.de
 Görel           | Douthwaite       | edouthwaite2@feedburner.com
 Bérengère       | Menendez         | amenendez3@dell.com
 Pélagie         | Hachard          | fhachard4@blinklist.com
(35 rows)
```
17. Using REVOKE, remove the ability for the new user to run SELECT * on the view
```
dsd_22=# REVOKE SELECT ON cust_email FROM user1, user2;
REVOKE
```
18. Try running the `SELECT *` as both users again
```
user1:
dsd_22=> SELECT * FROM cust_email;
ERROR:  permission denied for view cust_email

user2:
dsd_22=> select * from cust_email;
ERROR:  permission denied for view cust_email
```
19. When logged in as the first new role, remove the 2nd new role
```
dsd_22=> DROP ROLE user1;
ERROR:  permission denied to drop role
```
20. As your normal user, the upxxxxxx one, remove both of the new roles
```
dsd_22=# DROP ROLE user1;
ERROR:  role "user1" cannot be dropped because some objects depend on it
DETAIL:  privileges for table role
privileges for table product
owner of database user1

dsd_22=# DROP ROLE user2;
ERROR:  role "user2" cannot be dropped because some objects depend on it
DETAIL:  privileges for table role
owner of database user2
```
This doesn't work as we need to remove all permissions from the users and remove their databases before they can be removed, this can be done as follows:
```
dsd_22=# REVOKE ALL ON product, role FROM user1; -- Revoke all permissions from the user
REVOKE
dsd_22=# DROP DATABASE user1; -- Drop or reassign any databases owned by the user
DROP DATABASE
dsd_22=# DROP ROLE user1; -- Drop the user
DROP ROLE
-- Same again for user2
dsd_22=# REVOKE ALL ON product, role FROM user2;
REVOKE
dsd_22=# DROP DATABASE user2;
DROP DATABASE
dsd_22=# DROP ROLE user2;
DROP ROLE
```