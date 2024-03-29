# DSD Revision Sheet - SQL

## Data Types

- The following are data types available in PostgreSQL, other DBMSs may use alternative names

|Name|Description|
|-|-|
|`INT`|32-bit integer|
|`BIGINT`|64-bit integer|
|`SERIAL`|32-bit integer, automatically increments if a row is inserted without this attribute being specified. Useful for IDs|
|`BIGSERIAL`|Same as `SERIAL`, but using 64-bit integer|
|`DECIMAL(m,n)`|Decimal number, m places in total, n places after the decimal place. e.g. `DECIMAL(5,3)` would have 2 places before and 3 after the decimal place|
|`MONEY`|Fixed-point decimal number, 2 places after the decimal place. Formats differently depending upon the locale settings of the DBMS, outputs in the format `£X.XX`|
|`CHAR(n)`|Fixed-length string, n characters with blank padding if the value has less than n characters|
|`VARCHAR(n)`|Variable-length string with limit, n|
|`TEXT`|Variable-length string with "no limit". Not advised as limit is defined by the operating system the DBMS is running on|
|`BYTEA`|Byte array of unlimited length|
|`TIMESTAMP`|Both date and time, defaults to ISO 8601 format (YYYY-MM-DDTHH:MI:SS) and UTC time zone|
|`DATE`|Just date, defaults to ISO 8601 format (YYYY-MM-DD)|
|`TIME`|Just time, defaults to ISO 8601 format (HH:MI:SS), may include time zone (HH:MI:SS +-HH:MM)|
|`BOOLEAN`|Boolean, can be input as true/false, yes/no, on/off, 1/0. All result in the same internal value|

## DDL (Data Definition Language) Commands

- `CREATE`
  - This is used to create parts of a database, such as the database itself, and tables within the database
  - ```sql
    CREATE DATABASE example_database;
    ```
    - This creates a new database with the name "example_database"
  - ```sql
    CREATE TABLE example_table (
      example_id INT PRIMARY KEY,
      [...]
    );
    ```
    - This example would create a new table with the name "example_table" and with one attribute, "example_id"
- `DROP`
  - This is used to remove databases from a DBMS or tables from a database
  - ```sql
    DROP DATABASE example_database;
    ```
    - This will remove the database "example_database"
    - If the user has permission over the database, *the database will be removed permanently and without confirmation*
  - ```sql
    DROP TABLE example_table;
    ```
    - This will remove the table "example_table"
    - If the user has permission over the database that contains the table, *the table will be removed permanently and without confirmation*
- `ALTER TABLE`
  - This can be used to change many different aspects of an existing table
  - ```sql
    ALTER TABLE example_table
    ADD email char(255);
    ```
    - This example would add a new column named "email" to the existing table "example_table"
  - ```sql
    ALTER TABLE example_table
    DROP COLUMN email;
    ```
    - This would drop or remove the column named "email" from the existing table "example_table"
    - If the user has permission over the database which contains the table, *the column will be removed permanently and without confirmation*
  - ```sql
    ALTER TABLE example_table
    RENAME COLUMN email TO customer_email;
    ```
    - This would rename the column "email" to "customer_email" in the existing table "example_table"
  - ```sql
    ALTER TABLE example_table
    RENAME TO new_example_table;
    ```
    - This would change the name of the table "example table" to "new_example_table"
  - ```sql
    ALTER TABLE example_table
    ALTER COLUMN customer_email TYPE varchar(255);
    ```
    - This would change the data type of the "customer_email" column in the table "example_table" to a `varchar(255)`
    - This syntax is specific to PostgreSQL, as it was not originally part of the SQL standard

## DML (Data Manipulation Language) Commands

- `SELECT`
  - Used to retrieve data from a database
  - ```sql
    SELECT * FROM example_table;
    ```
    - This would return every column of every record in the table "example_table"
  - ```sql
    SELECT id, email FROM example_table;
    ```
    - This would return only the "id" and "email" columns from every record in the table "example_table"
  - ```sql
    SELECT * FROM example_table
    WHERE id = 32;
    ```
    - This would return every column in the table "example_table", but only records where "id" is equal to 32
  - ```sql
    SELECT * FROM example_table
    WHERE email LIKE "%@gmail.com";
    ```
    - This would return every record from the table "example_table" where the email column ends with "@gmail.com"
  - ```sql
    SELECT * FROM example_table
    WHERE email LIKE "hugh.baldwin%";
    ```
    - This would return every record from the table "example_table" where the email column starts with "hugh.baldwin";
  - ```sql
    SELECT * FROM example_table
    LIMIT 5;
    ```
    - This would return every column of the first 5 records in the table "example_table"
  - ```sql
    SELECT DISTINCT email FROM example_table;
    ```
    - This would return every unique email address in the table "example_table"
  - ```sql
    SELECT id AS "User ID", email AS "Email Address" FROM example_table;
    ```
    - This would return the id and email columns from the table "example_table", but with their column headings changed to "User ID" and "Email Address respectively
  - ```sql
    SELECT u.id, u.email, u.address1 FROM user u;
    ```
    - This would return the id, email and address1 columns from the table "user". This query uses aliases to make it easier to reference columns from specific tables. While this is not needed in this query, it is useful when dealing with multiple tables, especially where columns in different tables have the same name
  - ```sql
    SELECT booking_id FROM booking
    WHERE booking_date BETWEEN NOW() AND NOW() +INTERVAL '+7 DAYS';
    ```
    - This query would return all booking ids from the table "booking" which are booked within the next week
    - In the case of dates, you can either use `date > AND date <` or `BETWEEN`
- `INSERT`
  - Used to insert new records into a database
  - ```sql
    INSERT INTO example_table (id, email) VALUES (420, "up2157117@myport.ac.uk");
    ```
    - This would insert a new record into the table "example_table", with the values 420 and "up2157117@myport.ac.uk" in columns id and email respectively
  - ```sql
    INSERT INTO example_table (id, email) VALUES
      (123, "example@example.com"),
      (456, "bob@bobbuildingco.com");
    ```
    - This would insert two new records into the table "example_table". Using this method, you can insert any number of records at one time without having to specify the columns for every new record
  - ```sql
    INSERT INTO example_table (email) VALUES
      ("example@example.com"),
      ("bob@bobbuildingco.com");
    ```
    - This would insert two new records into the table "example_table". Since the id column of example_table is of the type `SERIAL`, it is unnecessary to manually set the id, and would in fact cause issues as the DBMS would not know that the id number has already been used
- `UPDATE`
  - Used to update existing records in a database
  - ```sql
    UPDATE example_table
    SET email = "example2@example.com"
    WHERE id = 32;
    ```
    - This would set the email column of any records with the id 32 to "example2@example.com" in the table "example_table"
  - **Don't forget to specify a `WHERE` clause, else every record in the table will be changed to the new value *permanently and without confirmation***
- `DELETE`
  - Used to remove existing records from a database
  - ```sql
    DELETE FROM example_table
    WHERE id = 32;
    ```
    - This would remove every record with the id 32 from the table "example_table"
  - **Don't forget to specify a `WHERE` clause, else every record in the table will be deleted *permanently and without confirmation***
- `ORDER BY`
  - Used to sort the output of a query
  - ```sql
    SELECT forename, surname FROM user;
    ```
    - This example would return the full name of every user in the system, but it would not be in any particular order
  - ```sql
    SELECT forename, surname FROM user
    ORDER BY surname ASC;
    ```
    - This example would return the same data as the above, but this time sorted alphabetically by the users' surnames. If multiple users had the same surname, they would appear in a random order in a group, which is probably not what you want
  - ```sql
    SELECT forename, surname FROM user
    ORDER BY surname, forename ASC;
    ```
    - This example returns the same as above, but in the case of multiple users having the same surname, they would then be sorted by forename, which is most likely the desired behaviour in this circumstance
- `GROUP BY`
  - This can be used to group records which share an attribute
  - ```sql
    SELECT city, COUNT(city) FROM user;
    ```
    - This would not return the expected output, as it would count all of the times that a user has a city set. To get the correct output you must group the users by city, using `GROUP BY`
  - ```sql
    SELECT city, COUNT(city) FROM user
    GROUP BY city;
    ```
    - This query functions correctly, and returns the number of users from each city along with the name of each city
  - ```sql
    SELECT city, COUNT(city) FROM user
    GROUP BY city
    WHERE country = 'United Kingdom';
    ```
    - This query once again does not work, as you cannot use `GROUP BY` and `WHERE` in the same query. Instead, you must use `HAVING`, which has a very similar syntax but is specifically made to work with groups
  - ```sql
    SELECT city, COUNT(city) FROM user
    GROUP BY city
    HAVING country = 'United Kingdom';
    ```
    - This query now works as intended, returning a list of all cities in the United Kingdom which appear in the table, and how many users have an address in each city

## Joins

- A join is a method of "joining" two tables together
- This is useful if your database is fully normalised, and so you may need data from two or more tables for a single query
- `INNER JOIN` or `JOIN`
  - The default type of join, which is used when not specifying the type
  - Returns all records that have a matching value in both tables
  - Can be represented by the following venn diagram<br>
<img alt="Venn diagram, A and B, intersection of A and B is highlighted" src="resources/inner.png" width=50% height=auto/><br>
- `LEFT [OUTER] JOIN`
  - Returns all records in the left table, and any matching records from the right table
  - Can be represented by the following venn diagram<br>
<img alt="Venn diagram, A and B, all of A and intersection of B is highlighted" src="resources/left.png" width=50% height=auto/><br>
- `RIGHT [OUTER] JOIN`
  - Returns all records in the right table, and any matching records from the left table
  - Can be represented by the following venn diagram<br>
<img alt="Venn diagram, A and B, all of B and intersection of A is highlighted" src="resources/right.png" width=50% height=auto/><br>
- `FULL [OUTER] JOIN`
  - Returns all records which match the `WHERE` statement in either table
  - Can be represented by the following venn diagram<br>
<img alt="Venn diagram, A and B, all of A and B is highlighted, including the intersection" src="resources/full-outer.png" width=50% height=auto/><br>
- Join Syntax
  - ```sql
    SELECT user.forename, user.surname, car.regplate FROM user
    JOIN car ON user.id = car.owner_id;
    ```
    - In this example, there are two tables, "user" and "car". The user table stores information about users of the service, and the car table stores information about cars registered on this service. This should output all records in which there is both an owner and a car, as an inner join is being used
  - Regardless of which join you wish to use, the syntax is the same. The only difference is that you would replace `JOIN` with the type of join you wish to use (bearing in mind that `JOIN` is a synonym for `INNER JOIN`)

## Functions

### Date Functions

- `NOW()`
  - Returns a `TIMESTAMP` containing the current date and time according to the DBMS
- `CURRENT_DATE`
  - Returns a `DATE` containing the current date according to the DBMS
- `DATE_PART([part], [column])`
  - Returns the specified part of a `TIMESTAMP`
  - e.g. `SELECT DATE_PART('year', dob)` would return only the year part of the column dob
  - The different parts of a date that can be extracted are as follows:
    - decade
    - year
    - month
    - day
    - hour
    - minute
    - second
    - day of week
- `AGE([column])`
  - Returns the difference between the timestamp in the column specified and now, can be used to get a persons age given a date of birth
- `AGE([column1], [column2])`
  - Returns the difference between the timestamp in column1 and column2
  - column2 should be earlier than column1
- `DATE_TRUNC([part], [column])`
  - Returns a `TIMESTAMP`, truncated to the level specified. Levels of truncation are the same as those in the `DATE_PART()` function
- `BETWEEN [date1] AND [date2]`
  - Not really a function, but still to do with dates
  - Allows you to select all records with a date in a specific range, and is much easier and clearer than manually comparing the dates
- `+INTERVAL [time]`
  - This allows you to add time to a timestamp, date or time
  - e.g. `NOW() +INTERVAL '+7 days'` would return a timestamp 7 days after the current time and `NOW() +INTERVAL '-7 days'` would return a timestamp 7 days before the current time

### Text Functions

- `ASCII([character])`
  - Returns the ASCII value of the character specified
  - Expects only one character
- `CHR([integer])`
  - Returns the character represented by the ASCII code entered
  - Expects only one value
- `POSITION([character] IN [string])`
  - Returns the first occurrence of the character specified within the string
  - 1-indexed, for some reason
- `FORMAT([format], [token1], [token2], [...])`
  - Functions almost identically to the `printf()` function in C
  - e.g. `FORMAT('Hello, %s', user.forename)` would return "Hello, Hugh"
- `INITCAP([string])`
  - Returns the string formatted into title case
  - e.g. `INITCAP("i am a student at the university of portsmouth")` would return "I Am A Student At The University Of Portsmouth"
- `CONCAT([string1], [separator1], [string2], [separator2], [...])`
  - Returns a single string with all of the strings or columns concatenated together, with the separators specified
- `CONCAT_WS([separator], [string1], [string2], [...])`
  - Returns a single string with all of the strings or columns concatenated together, with the separator specified
  - Performs the same function as `CONCAT`, but you only need to specify one separator which is then reused for each additional string

### Mathematical Functions

- `COUNT([column])`
  - Returns the number of rows that have a non-NULL value in the column specified
- `MIN([column])`
  - Returns the minimum value in the column specified
- `MAX([column])`
  - Returns the maximum value in the column specified
- `AVG([column])`
  - Returns the mean average of every value in the column specified
- `RANDOM()`
  - Returns a single floating point value between 0 and 1
  - To get a value between certain numbers, you can multiply and add to the random value
    - e.g. A random number between 100 and 200 could be obtained using `RANDOM() * 100 + 100`

## Security

### Views

- Views can be used to limit users' access to the data stored within a table
- They do this by pre-defining a query that a user can run, which they can further refine if needed
- This means that you can grant access to specific columns without allowing access to all of the data in the table
- Syntax
  - ```sql
    CREATE [name] AS [query];
    ```
- Examples
  - ```sql
    CREATE contact_details AS
    SELECT forename, surname, email_address, phone_number FROM user;
    ```
    - This creates a new view that allows access to only the contact details of a user, without allowing access to other information stored in the table
  - ```sql
    SELECT * FROM contact_details
    WHERE user_id = 42;
    ```
    - This returns all of the columns that we've been given access to with the view "contact_details", but filtered to only show the user with id 42

### Users & Roles

- By adding users to the DBMS, we can give selective access to other people without them necessarily having access to all of the data in the database, or administrative privileges to add or remove data
- Creating a role (user)
  - In the case of PostgreSQL, a user and role are effectively the same thing
  - ```sql
    CREATE ROLE [username] WITH LOGIN PASSWORD [password];
    ```
  - ```sql
    CREATE ROLE hugh WITH LOGIN PASSWORD 'password123';
    ```
- Allowing a user to login
  - Even though the user exists, and has login permission (yes you can create a user that can't login), they still won't be able to login. This is because every user needs their own database
  - ```sql
    CREATE DATABASE [database name];
    GRANT ALL PRIVILEGES ON DATABASE [database] TO [username];
    ```
    - This creates a new database, and gives the new user all permissions over said database. Typically, the user and database will share the same name, as in the following example
  - ```sql
    CREATE DATABASE hugh;
    GRANT ALL PRIVILEGES ON DATABASE hugh TO hugh;
    ```
  - Alternatively, you can create a new database and set the new user as the owner
  - ```sql
    CREATE DATABASE hugh;
    ALTER DATABASE hugh OWNER TO hugh;
    ```
- Granting permissions
  - Permissions are granted on a table-by-table basis
  - You can grant permissions with the following command
  - ```sql
    GRANT [permission(s)] ON [table] TO [user(s)];
    ```
    - The available permissions are as follows: `ALL`, `SELECT`, `INSERT`, `UPDATE`, `DELETE` and `CREATE`
    - You can grant multiple permissions at the same time, to multiple users, as shown in the following
  - ```sql
    GRANT SELECT, INSERT, UPDATE ON user TO hugh, bob;
    ```
  - Alternatively, you can create a superuser, who has all permissions on all databases and tables in the DBMS
  - ```sql
    ALTER USER [username] WITH SUPERUSER;
    ```
    - This changes the user account to be a superuser, and therefore grants all permissions, everywhere
  - ```sql
    ALTER USER hugh WITH SUPERUSER;
    ```
- Revoking permissions
  - Permissions can be revoked individually or all at once, similarly to granting permissions
  - ```sql
    REVOKE [permission(s)] ON [table] FROM [user(s)];
    ```
    - This removes one or more permissions from the user(s) specified
    - The available permissions are the same as those for granting permissions
  - Additionally, you can revoke permissions from all users on a table at the same time
  - ```sql
    REVOKE [permission(s)] ON [table] FROM PUBLIC;
    ```
    - This revokes the specified permissions from all users on the specified table
- Removing a user
  - Before we can remove a user, we have to remove all of their permissions. We can do this with a single command
  - ```sql
    REVOKE ALL ON ALL TABLES IN SCHEMA public FROM [username];
    ```
  - Then we need to remove their user database
  - ```sql
    DROP DATABASE [username];
    ```
    - This assumes that the user and database have the same name
  - And finally, we can remove the user
  - ```sql
    DROP ROLE [username];
    ```

### Encryption

- Encryption is turned off by default, so first you must turn it on within your DBMS (This only needs to be done once per DBMS)
- ```sql
  CREATE EXTENSION IF NOT EXISTS pgcrypto;
  ```
  - This is specific to PostgreSQL, other DBMSs likely have a different command or set there of to enable encryption
- The encryption and decryption is handled by a function that you can use at any time, but the most likely time is when `INSERT`ing and `SELECT`ing values
- Encrypt data
  - ```sql
    ENCRYPT([data], [key], [method])
    ```
    - Acceptable values for the encryption method are `bf` and `aes`, being Blowfish and AES-128, -192 or -256 respectively
    - This returns the encrypted data as a bytea value, so any column intended to store encrypted data should be bytea
  - ```sql
    ENCRYPT('password123', 'this is a key', 'aes') -> ciphertext
    ```
- Decrypt data
  - ```sql
    DECRYPT([encrypted data], [key], [method])
    ```
    - This returns the decrypted data, providing that the same key and encryption method are specified as were used to encrypt it
  - ```sql
    DECRYPT(ciphertext, 'this is a key', 'aes') -> password123
    ```