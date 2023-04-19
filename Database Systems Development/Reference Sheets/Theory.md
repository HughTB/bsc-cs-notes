# DSD Reference Sheet - Theory

## Database Terminology

|Term|Meaning|
|-|-|
|Entity|An object about which data is stored<br>e.g. a Student, Lecturer, Product, etc.|
|Entity Set|A set of entities of the same type.<br>e.g. First Year Students, Database Lecturers, etc.|
|Attribute|A property of an entity.<br>e.g. An ID number, date of birth, forename, etc.|
|Table|The actual representation of an entity within a database|
|Relationship|A way of relating attributes in two or more tables|
|Relation,<br>Relational Table|A two dimensional representation of entities and/or relationships|
|Tuple,<br>Record|A row of a table|
|Domain|The set of legal values which an attribute can take.<br>e.g. 1-12 for an attribute which stores a month|
|Primary Key|An attribute or combination there of which could be used to uniquely identify a record within a table<br>e.g. An ID number|
|Candidate Key|An attribute or combination there of which could be used as a primary key|
|Alternate Key|An alternative attribute or combination there of which could be used to identify a record, but shouldn't be used as a primary key.<br>e.g. Your full name and address|
|Composite Key|A combination of two or more attributes which could be used as a primary key|
|Foreign Key|An attribute or combination there of which form the primary key in another table, which can be used to link the two tables with a join|
|Degree,<br>Arity|The number of attributes in a relation|

## Entity Relationship Diagrams

- An ERD is a diagram which shows all of the tables of a database and how they are related
- There are many different ways of showing the cardinality and ordinality of relationships on and ERD, but at UoP we use exclusively Crow's Foot Notation, which is shown below
  - <img alt="A diagram showing crow's foot notation" src="resources/crows-foot.png" width=50% height=auto/>
  - These are used to show the type of relationship between entities, any they can be any of the following:
    - One-to-One
    - One-to-Many
    - Many-to-One
    - Many-to-Many
  - However, it is impossible to represent a Many-to-Many relationship in a database, so it must be split into two One-to-Many relationships with a link table in between

## Normalisation

- There are up to 5 different levels of database normalisation, but we are only concerned with 0-3
- Ideally a database will be in 3rd Normal Form

### Zero Form

- No normalisation whatsoever
- Essentially just the data stored in some way, e.g. an Excel spreadsheet

### 1st Normal Form

- Each attribute should be atomic
  - This means that it only stores a single piece of information
  - e.g. A "name" attribute should instead be stored as the separate parts of a name, being "forename" and "surname"
  - This makes it easier to search and filter the data in a database
- Each attribute can only have one type of data
  - e.g. Every row in a column should always be an integer or always be a string
- Values stored in an attribute should be of the same domain
  - Essentially, the values should always be used for the same purpose
  - e.g. Don't use the same column to store data in different ways
- Every attribute of a table should have a unique name
  - They do not need to be universally unique, only within the table itself
- It should not matter what order the rows or columns are in, as this can be decided when the data is queried from the database

### 2nd Normal Form

- The database must already be in 1st Normal Form
- Each table must not have any partial dependencies
  - A partial dependency is an attribute that contains information about an entity, but is not unique to said entity
  - To remove a partial dependency, a new table must be created to hold the data
  - This reduces data redundancy and improves integrity as the data only needs to be updated once, rather than for every entity that contains it
  - e.g. We would not store information about a subject directly in a student table, instead we create a new table to store the subjects and then link to it with a foreign key. This way, if the subject needs to be updated, it is only stored in one location

### 3rd Normal Form

- The database must already be in 2nd Normal Form (And therefore also 1st Normal Form)
- Entities must not have any transitive dependencies
  - A transitive dependency is an attribute that is related to the entity, but does not depend upon the primary key
  - Having transitive dependencies increases data redundancy and greatly reduces integrity, as well as making it harder to query information
  - e.g. We should not store information about the author of a book directly in the book entity. If we did this, the same data might appear for many different books, and then the book entity would include irrelevant information, such as the nationality of an author. Instead, we should create a new entity to store information about the author, and then link to it using a foreign key

### Further Normal Forms

- There are two further normal forms, 4th and 5th Normal Forms, but these are generally unnecessary and actually end up introducing more issues than they solve
  - For example, once in 5th Normal Form, you may end up with each different part of an address stored in different tables, meaning that you might have to join 4 or 5 different tables together just to get an address
  - This obviously massively decreases performance, as the DBMS has to sort through every table multiple times just to get a simple piece of information such as an address
  - It also makes it much harder to actually write queries since you have to join so many different tables together