# DSD - Lecture 13:00 15/12/22

### Santa Claus Delivery Service (SCDS) - ERD Development

- Entities:
    - Children (Nice, Naughty, Misunderstood)
    - Staff
    - Delivery
    - Gift
- Business Rules
    - Each delivery has many children
    - Each child has one delivery per year, but it might be useful to keep track of previous deliveries
    - Each delivery is the entire route around the world
    - The delivery_id can be a year, as only one delivery is made each year
- There is a many-to-many relationship between each delivery and each child
    - Because of this, we need to add another entity called "child_del" being used as the intersection table
    - This "child_del" uses a composite key, made up of the child_id and delivery_id
- For the misunderstood children, there is a one or zero relationship, as they may or may not get presents each year
  
### Coursework

- The "Correct" number of entities is between 8 and 11 for the coursework
- Make sure you don't break the problem down too far, e.g. don't separate the address into entities