# Database Systems Development - Lecture 17/11/22

### Joins

- Joins are used to join (no way) the data from two or more tables together
- This allows for much more complex queries that can give data spread across the database
- For example, you could use ```SELECT * FROM CUSTOMER;``` to get all of the data from the customer table, but that's not really all of the information that is stored about that customer
- This is because you might have another table such as ```ORDERS``` or something similar, which contains every order made, which you could then join to the table of customer information, giving you much more information than you could get otherwise
- It would be much more helpful to specify only the columns that you actually need, such as a name, email or address, as otherwise there will be too much information for you to process
- We can narrow down the output using a WHERE clause, for example to find all customers who live in Portsmouth
  - This is ok if we want to find all of the customers who live in Portsmouth, but still only gives data from one table
- What if we want to get data from multiple tables?
  - This is where we use Joins
  - A join can be used to match data in multiple tables, as long as they share an attribute, e.g. the primary key in one table is a foreign key in the other
- Important things to remember:
  - The names of the primary key and foreign key don't need to share the same name
  - The data types of the primary and foreign key have to match
    - A serial primary key is actually of type integer, and the serial data type is just a way for the DBMS to know that it needs to automatically increment the ID
    - Because of this, you should make the foreign key that references a serial primary key of type integer
  - You need to match attributes like for like, e.g. must be the same attribute but not necessarily the same name
  - Just because the DBMS returns some sort of data, does not mean that it's correct so double check that it's returning what you actually wanted

### So how do we join the tables?

- There are two correct ways to join the tables, and many more ways to get it completely wrong
- For example, the following code looks like it should give us the customer order ids and their order id numbers
```sql
SELECT CUSTOMER.CUST_ID, CUST_ORD_ID FROM CUSTOMER, CUST_ORDER;
```
- However, this returns 1650 rows, even though there are only 150 orders belonging to 11 customers
- This is because that code actually returns the cartesian product of the two attributes
- This returns each customer's id joined with every order id, being 11 * 150 = 1650 rows
- The correct way of joining tables is as follows:
  - You need to tell the DBMS which attributes match, and so where the rows should be joined
  - The following code is the correct way to join these tables:
```sql
SELECT customer.cust_id, cust_ord_id FROM customer JOIN cust_order ON customer.cust_id = cust_order.cust_id;
```
- This returns the correct values, 150 rows containing the customer ids and order ids, matched upon which customer created which order
- Always make sure that the attributes you are joining on are the same, otherwise you will get garbage data as there is a chance that some of the data in the columns will match
- There are other valid ways of joining tables, without using the ```JOIN``` keyword
  - For example, using the ```WHERE``` keyword to match attributes in multiple tables
  - This once again gives us the 150 rows of data, but it is slower and more complex than using the ```JOIN``` keyword
```sql
SELECT cust_lname, cust_ord_id FROM customer, cust_order WHERE customer.cust_id = cust_order.cust_id;
```