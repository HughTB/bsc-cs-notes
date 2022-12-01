# DSD - 13:00 01/12/22

## More Joins

The basic type of joins talked about previously were inner joins, but there are also left right and outer joins

### Inner Joins

- This is the default type of join that will be used if you just put ```JOIN``` in a query
- An inner join returns all records which can be matched in the two tables, essentially the overlap
    - If you were to represent the tables in a Venn diagram, an inner join would return the intersection

### Left Joins

- A left join returns **all** records from the left table and any records from the right table that match
    - If you represented this as a Venn diagram, a left join would be the entire left circle and anything from the right circle which overlaps

### Right Joins

- A right join returns **all** records from the right table and any records from the left table which match
    - If the foreign key in the table on the right is a required field, there is no way for a record to exist in the right table and not the left, and therefore in this case a right join would return the same as an inner join

### Outer Joins

- An outer join returns **every** record from **both** tables
- Outer joins are not used very often, and if you don't know if you need them, you probably don't

### Column Concatenation

- You can use ```concat_ws()``` to concatenate the values from multiple columns, for example
```sql
SELECT concat_ws(' ', cust_fname, cust_lname) AS "Customer", cust_ord_id AS "Order Number"
FROM customer
JOIN cust_order ON customer.cust_id = cust_order.cust_rd;
```
Would return a table with the customer's first and last names in the same column under the name "Customer" and any orders they've placed in another column under the name "Order Number", e.g.

|Customer|Order Number|
|--------|------------|
|Hugh Baldwin|1|
|Bob Farmer|2|