# Database Systems Development - Lecture 20/10/22

### Coursework

- Can be found in the "Assessments & Support Material" section on [Moodle](https://moodle.port.ac.uk/pluginfile.php/3961195/mod_resource/content/0/Coursework_V1.pdf)
- *This is important as it makes up 50% of the final grade for the Database module*
- Due at 23:00 on the 1st February 2023, and the ECF / Late deadline is 23:00 on the 15th February 2023
- Focus only on the backend database - You don't need to worry about creating a user interface or similar
- You need to submit a PDF with a digitally created ERD (A hand-drawn but correct ERD will get 0 marks) and a text or SQL file containing your queries, with comments explaining what they do and why, and the code used to create the database
- It's a good idea to use a dummy data generator to populate your database, as it will take far too long to manually create all of the data needed
  
### ERD (Entity Relationship Diagram)

- An ERD is a diagram which shows how entities are related, how the relations relate to entities, etc
- Business rules
 - How does the company who will use the database use the data?
 - How will the company need to relate the data to each other?
 - An example of a business rule is that one student cannot be on multiple degrees at the same time, but one degree can have multiple students
 - These rules determine how entities will be related to each other
- At UoP we will always use Crow's Foot notation, but once in industry you may end up using other notations
- ![Crow's Foot Notation](/Week%204/Crowsfoot%20Notation.png)
- We can have different types of relation
 - One to Many
 - One to One
 - Many to Many (This is not actually possible to represent in a database, and must be split into two One to Many relations)
- Within these, we may need to represent a One to (one or zero) or a One to (many or zero) relation, for example if a new course is created for next year, but no students are enrolled for the course yet.
  
### Constraints

- A constraint is a rule that protects the data, to make sure it is always valid
- Alternatively, a rule could enforce a certain behaviour
- Some examples are:
 - NOT NULL - Means that an attribute in a table must have a value when a row is inserted into a table, if a value is not specified, an error is returned and the row is not added
 - Keys are constraints - A primary key must be not null, and must be unique
 - Unique - A value cannot appear more than once in a table, this is often used for email addresses as multiple users cannot have the same email
 - Default - A value that an attribute will default to if a value is not supplied, for example a stock level for a product could be set to 0 unless specified otherwise
 - Check - Another constraint that can be used to make sure something is correct, for example to check that a price is not 0 or negative