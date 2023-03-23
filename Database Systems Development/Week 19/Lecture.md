# DSD - Lecture 13:00 23/03/23

## JSON in Postgres

- Postgres has support for JSON files
- There are a number of differences in the syntax between standard databases and JSON databases
- JSON stands for JavaScript Object Notation
  - It is an open standard which consists of key-value pairs
  - It can handle data of many different types

### The main differences

- We do not know the structure of each record
- There is not a standard schema
- The data types are arbitrary and are not known when defining the database

### Creating a table

- JSON is stored in tables similarly to a standard database
- They are just created in a different way
- As we do not know the layout of the database, we do not know the names of columns and their data types or sizes
- Every table still needs to have a unique identifier
- If the first column is to be called id, the code would be as follows<br>`CREATE TABLE json_data (id SERIAL PRIMARY KEY);`
- The second column will store the JSON data
  - The following code tells the DBMS that we want another column that will store JSON data<br>`CREATE TABLE json_data (id SERIAL PRIMARY KEY, data json NOT NULL);`
- To insert data into the table, we use the same syntax as a typical insert statement, but rather than individual values, we insert the JSON as one long variable
```sql
INSERT INTO json_data (data) VALUES 
('
    {
        "fname" : "John",
        "lname" : "Doe",
        "order" : {
            "item" : "IPA",
            "qty" : 6
        }
    }
');
```
- In JSON, the value of one key can be another JSON document

### Reading data from a JSON table

- This can be different from getting data from a normal database
- With the example above, the data is just returned as a JSON document

### How to get specific data from a JSON table

- It usually just returns the entire JSON document, but there are a few operators that you can use to get specific data from the JSON
  - The `->>` operator returns data by key
  - The `->` operator returns data by text
  - Which should be used depends upon what you want to do with the data
- For example, we could use the following example to get all of the records with the key 'customer'
```sql
SELECT data -> 'customer' FROM json_data;
```
This would return
```
data
----

"Lily Smith"
"Jade Davies"
"Josh Green-Gardner"
(4 rows)
```
- The issue with this is that any rows in the table that do not have the specified key, it returns a blank row, but still counts it, hence why this example says `(4 rows)`
- If we instead used the `->>` operator as below,
```sql
SELECT data ->> 'customer' FROM json_data;
```
it would return
```
data
----

Lily Smith
Jade Davies
Josh Green-Gardner
(4 rows)
```
- The reason why we may use the different operators depends upon what the data is going to be used for
  - If another application is going to use the values, you probably want `->`
  - If the data is going to just be used directly, `->>` is probably what you want
- You can use the `->>` operator to search inside of the data that gets returned
  - This may be useful if the value of a column is a JSON document in and of itself
  - For example, if the manifest of an order is stored as a separate JSON document inside of the order document
- The `WHERE` statement still works with JSON values, and works in a similar way, but rather than using table names, you have to give it information on how to get to the columns, using the `->` and `->>` operators
  - When using the `WHERE` statement, it finally only returns rows where the values actually exist

### Important things to remember

- Since the schema is unknown, values are stored only as text
  - If we need to use number values within the database, for example to order by a number or get values greater than others, you need to cast the text value into an integer or other number type before you can use it
- Since there is no set schema, there is also no ERD (annoyingly)
- The main reason to use this is to avoid setting up an entirely new DBMS if you need to handle JSON data
- Queries are typically much harder to understand than regular SQL queries, but since values are stored all at once rather than in entities, there is no need to join tables together to get all of the useful values