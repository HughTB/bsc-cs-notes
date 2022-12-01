# Database Systems Development - Lecture 13:00 06/10/22

- Coursework will be released Week 3 but is not due in until January 2023
  
- Data vs Information
 - The world is made up of information, but not all of this information is data
 - To store all of this information, we need to break it up into data
 - Data are facts and statistics collected together for reference or analysis
  - Data must be in some way related in order to be stored into a database
 - Information is the result of applying data processing to data, giving it a context and a meaning
 - The following are all pieces of data:
  - 1.99
  - A Cheeseburger
  - Bob's Midnight Burgers, 287 The Hard, Portsmouth
- The number 1.99 could mean anything without context, although we could make assumptions that it is for example the price of a burger, but we shouldn't make assumptions as they can lead to misunderstandings and misinformation
- These pieces of data mean nothing on their own, but if you put them into context, you can get a piece of information, such as that you can buy a Cheeseburger for £1.99 at Bob's Midnight Burgers
- Another example is that a word-search table is just data without context, but once you know that it's a word-search and you know which words you are looking for, it then becomes information and knowledge
  
### Database languages

- SQL (Structured Query Language) is made up of two main language types: DDL (Data Definition Language) and DML (Data Manipulation Language)
- DDL allows the user to describe and name entities, attributes and the relationships between them, which is required for applications to be able to link data together to form information, which can then be used or presented to the user
- DML allows the user to describe how data in the database should be manipulated (added, removed or modified)
- A Query is how other applications interact with the DBMS to add, remove, modify or retrieve data from the database
- The term "query" is somewhat of a misnomer as it suggests a question, but they can be used for all sorts of things, such as:
 - Adding data to the database
 - Removing data from the database
 - Modifying existing data in the database
 - Retrieving data from the database
 - Creating a database

### DDL (Data Definition Language)

- DDL is the set of SQL commands that can be used to create tables, entities and relations within a database
- Common DDL commands are as follows:
 - CREATE DATABASE
 - CREATE TABLE
 - ALTER TABLE
 - DROP DATABASE
 - DROP TABLE
 - RENAME TABLE
- You have to be careful with the commands to drop a table or database, as they will be permanently removed without any sort of conformation, if you are logged in as an administrator
  
- An example of a DDL query:  
  create table property_for_rent (  
    Property_id varchar(4) PRIMARY KEY, - A column that contains between 0 and 4 characters and is the primary key  
    Street varchar(14) not null,  
    City varchar(10) not null,  
    Postcode varchar(10) not null,  
    Type varchar(6) not null,  
    Rooms integer not null, - A column that contains an integer of any size that must be populated with data  
    Rent decimal(6,2) not null, - A column that contains a decimal number with 6 digits before and 2 after the decimal place  
    Owner_id varchar(4) not null REFERENCES private_owner(owner_id), 
    Staff_id varchar(4) REFERENCES staff(Staff_id),  
    branch_id varchar(4) REFERENCES branch(Branch_id)  
  );  
- This will be explained in depth in the lecture in Week 3

### DML (Data Manipulation Language)

- DML is the set of SQL commands that can be used to find, add, remove, and modify data in a database
- Common DML commands are as follows:
 - DELETE
 - INSERT
 - REPLACE
 - SELECT
 - UPDATE
- As with the DROP command you have to be careful with the DELETE command as this permanently removes data without conformation, and it's easy to accidentally delete all of the data in a table
  
- An example of a DML query:  
  select property_id, street, city, postcode, owner_id  
  from property_for_rent  
  where city = ‘Glasgow’;  
- This query would return the id, street, city, postcode and owner id for all properties in the table that are in Glasgow

- More examples:
 - SELECT CUSTOMER_ID FROM CUSTOMER; - This lists all of the Customer ID numbers from the table Customer
 - INSERT INTO ROLE (ROLE_ID, ROLE_NAME) VALUES (17, 'PILOT'); - Inserts a new entry into the Role table, with the ID 17 and Role name 'PILOT'
 - DELETE FROM PRODUCT WHERE PRODUCT_ID = 200; - Removes all of the products from the Product table with the ID of 200