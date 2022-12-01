# Lecture - DSD 13:00 10/11/22

## Normalisation 

- Normalisation is designing a database in a way that is more efficient, and reduces data redundancy
- It is needed as part of deciding what data is stored in an entity, and then in a relation
- There are set rules to follow, but they make it seem more complex than it actually is (They were written by mathematicians)
  
- There are 5 levels of normalisation, known as normal forms
- Information that has not been normalised is known as zero form (0NF) - e.g. an excel spreadsheet with all of the information that will be stored in a database
- Ideally, a database should be in 3rd normal form (3NF)
- There are a set of processes to go from 0NF to 3NF
  
### 1st Normal Form

- Each attribute should only store a single (atomic) value
 - For example a name should be split into First and Last name
- Values stored in a column should be of the same domain
 - Each column should only store one datatype, e.g. only integers or only characters
- All the columns in a table should have unique names
 - There cannot be two columns or attributes with the same name within a table, but they can be reused in a database
- Order does not matter
 - It does not matter which order the columns or rows are in, for example, rows do not need to be stored in alphabetical order, as the order can be changed as needed when a query is made

|ID|Name|Subject|
|--|----|-------|
|10|Bob |CS     |
|11|Jan |SE,CS  |
|12|Jim |SE,ND  |

- This table is not in 1st Normal Form because it contains attributes with more than one value.

|ID|Name|Subject|
|--|----|-------|
|10|Bob |CS     |
|11|Jan |SE     |
|11|Jan |CS     |
|12|Jim |SE     |
|12|Jim |ND     |

- This table is now in 1st Normal Form, but it contains lots of duplicated data, which is bad both for data integrity, and for efficiency
- In this case, Subject is not a unique attribute for a student, and as such we should create a new entity to define Subjects

### 2nd Normal Form

- The table must already be in 1st Normal Form
- The table must then have no partial dependencies
 - A partial dependency is an attribute that contains information about an entity, but is not unique to that entity
 - If we have partial dependencies, we must create a new entity to hold the data, removing the partial dependencies and reducing data redundancy

### 3rd Normal Form

- The table must already be in 2nd Normal Form
- There must be no transitive dependencies
 - If an attribute is dependant on any attribute other than the primary key, then it is a transitive dependency

|Book|                |
|----|----------------|
|PK|book_id           |
|  |author_fname      |
|  |author_mname      |
|  |author_lname      |
|  |author_nationality|

- In this case, there is a direct link between the primary key, and the author's names, but there is no link between the book and the nationality of the author, and as such author_nationality is a transitive dependency
- Here we should create a new entity for the author, so that the nationality can still be stored, but in such a way that it's related only to the author, and not to the book
- This reduces data redundancy and increases the data integrity

### Further Normal Forms
- There are two further normal forms, but once put into 5th Normal Form, there are some inefficiencies that crop up
 - For example, having to store an address in multiple entities, such as Country, City, Street, House Number, Postcode, etc
 - This quickly becomes incredibly inefficient because you then have to use lots of joins for any query that needs to get a simple address, which increases the complexity of the query, and increases the time it takes for the DBMS to query the database