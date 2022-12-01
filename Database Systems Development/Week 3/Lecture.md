# Database Systems Development - Lecture 13/10/22

### Database concepts

- Relational databases were originally designed based upon the work of mathematician Edgar Codd in the 1970s (In spite of this it's still one of the most commonly used systems)
  
|Term|Description|
|:---|:----------|
|Entity|An object about which data is stored, such as a student, lecturer, course or product|
|Attributes|Some properties of the entity, for example an ID number, name, date of birth, etc|
|Relation|A two-dimensional representation of entities and / or relationships (other names for this are "relational table" or "table")|
|Entity set|A set of entities of the same type, e.g. one year of students, lecturers of the same subject, etc|
|Relationship|A way of relating the attributes in two or more relations (tables), and are stored themselves as relations|
|Tuple|A row of a table or records in a relation (other names are "record" and "row")|
|Domain|The set of all legal (allowed) values which an attribute can take (e.g. which month of the year it is)|
|Primary Key|An attribute or combination or there of which uniquely identify a tuple in the relation (The primary key is chosen from a set of candidate keys)|
|Candidate Key|There may be more than one attribute that could be used as a primary key for a relation (another name is a "super key")|
|Alternate Key|Another attribute or set there of which could theoretically be used to pick out a record from the database, but shouldn't be used as the primary key, e.g. your name and address|
|Composite Key|A combination of attributes that form a candidate key. Each of the attributes that make up a composite key is known as a "simple key"|
|Foreign Key|An attribute or combination there of, which form the primary key of another relation in the database|
|Degree|The number of attributes in a relation (another name is the "arity")|
  
### Entities

- An entity is a thing - could be a person or specific type of person, and so on and so forth
- How do we identify how many entities we need?
 - Look at the information that you've been given about the requirements for the database
 - Look and highlight for nouns to give you ideas of what entities you need (but only an idea)
- How do we determine what attributes each entity should have?
 - Think about how you would describe the entity, for example a member of staff:
  - Name?
  - Age? (Never do this, just store the date of birth as otherwise it would need to be update every year)
  - Home address?
  - Work address - maybe there are multiple offices or similar?
  
### Keys

- Every single table needs something unique to identify records, known as a primary key, otherwise you will have problems with data integrity
- In some cases there is something obvious, such as the serial number of a car
- In other cases there are things that may be obvious but shouldn't be used, such as the reg number of a car, as these can be personalized, or plates can be cloned
  
- Some tables may need foreign keys, which are the primary key of another table that is in some way related