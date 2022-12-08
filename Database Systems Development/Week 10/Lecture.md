# DSD - Lecture 13:00 08/12/22

### Security

- What security do we need?
- Why do we need security?
- How can we make our databases more secure?
- PostgreSQL Security
    - Superusers have access to everything
    - No one else has access to anything
    - By default, only the localhost has access to the database
        - Any other IP address cannot access the database
        - You *can* allow other IP addresses to access the database, but you should only allow specific addresses, and only if absolutely necessary
    - Users do not have write access to databases
    - Users ***must*** have an entry in a table (pg_user)
    - PostgreSQL uses host-based access control
        - This is used to determine which clients and systems can access the database
        - You can enforce password authentication
        - In PostgreSQL, Roles are the same as users
        - Before a user can log in, there has to be a username in the DBMS
        - Names are case sensitive, as they are on *nix systems
    - As well as needing a role, there are other things that users *should* have
        - Users should have a password, which is set when the role is created
        - Users should have the ability to log in (Yes you can create users who cannot log in)
        - The following code creates a new **role** with a very bad password: ```create role t2 with login password 'qwerty';```
        - The following code creates a new **user** with a very bad password: ```create user t3 with password 'qwerty' login;```
        - Both of these snippets of code create a new *role* (regardless of whether you use user or role)
    - Once you create a role, they still cannot log in as there is no database linked to the role
    - If you try to log in using a username that does not exist, it will return a generic ```password authentication failed for user``` error, which is more secure than telling the potential attacker that the user does not exist
    - If the system admin has not specified the permissions that a user has, they start with no permissions whatsoever
    - When a new table is created, the owner is automatically set to the user who ran the command
    - A user whose connection is to a database they don't own, they are not able to do anything other than list all of the databases on the server (for whatever reason)
        - If this user tries to connect to another database, they will be able to connect, but cannot do anything with the database

### Views

- A view is a pre-written query
- For example, if you wanted to get all of the information about the user with id 30, you could use ```select * from customer where cust_id = 30```
    - What if you only wanted to get the first and last names? You could use ```select cust_fname, cust_lname from customer;```
    - This is great, as it gives only the information that we want, but it is possible to change the query and get other data
    - We can create a view that defines exactly what the query should be, and then permit users to use defined views, rather than querying the database
    - To create a view for that query, we would use ```create view cust_names as select cust_fname, cust_lname from customer```
    - Then when we need to use this view, we would run ```select * from cust_names;```, which would return cust_names and cust_fname