# DSD - Lecture 13:00 02/02/23

### The `DISTINCT` Keyword
- This is useful if we want to see all of the *different* things in the database
- For example, if we want to see people's names in the database
- Or if we wanted to see which towns customers are ordering from, we could put `DISTINCT` before the town column so that each is only shown once
- However, this will cause the table to be unordered, so we need to use `ORDER BY` to get it back into an order
- You can also use `DISTINCT` on more than one column
- This is more useful as it allows us to see everywhere that there is a unique combination of two columns
- You can combine `DISTINCT` with `COUNT` to see the number of distinct items in a table, e.g. the number of different towns that customers have ordered from

### The `UNIQUE` Keyword

- You can add the `UNIQUE` keyword to any attribute of a table, which will prevent you from adding multiple entities with the same value for that column
  - This can be useful for ensuring people cannot sign up for a service twice with the same email, for example