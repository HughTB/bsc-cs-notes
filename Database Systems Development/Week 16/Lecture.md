# DSD - Lecture 13:00 23/02/23

## More in depth functions

### Text Functions

- The `ASCII()` function returns the ASCII value of a character
  - The function expects only 1 character
  - Any other characters will be ignored
- The `CHR()` function converts ASCII values into characters
  - Once again, this expects only one value
- The `INITCAP()` function returns the value in title case
  - e.g. "i am a student" would be converted to "I Am A Student"
- The `POSITION()` function returns the location of a substring within a string
  - e.g. `SELECT POSITION('B' in 'A B C');` would return the value `3`
  - This returns only the position of the first instance of the substring in the string
- The `FORMAT()` function formats a string in a similar way to the `printf()` function in C
  - e.g. `SELECT FORMAT('Hello, %s', cust_fname)` would return a string for every customer with the value `Hello, Hugh`
- The `CONCAT()` function concatenates multiple values into one string
  - e.g. `SELECT CONCAT(cust_fname, ' ', cust_lname)` would return a string along the lines of `Hugh Baldwin`
  - For each column of data you need to specify a separator individually
- The `CONCAT_WS()` function is almost identical to the `CONCAT()` function, but only needs one separator to be specified
  - e.g. `SELECT CONCAT_WS(' ', cust_fname, cust_lname)` would return a string along the lines of `Hugh Baldwin`
- With functions, you can use the output of one function as the input to another function. This is useful for more complex functionality

### Date Functions

- The `NOW()` function returns the date and time that the command was sent as a timestamp
- The `CURRENT_DATE` function returns only the current date as a date
- The `DATE_PART()` function can be used to extract part of a date or timestamp
  - e.g. we might want to use `SELECT DATE_PART('year', dob)` to get the year of people's dates of birth 
  - The different parts we can get out of the date are as follows:
    - decade
    - year
    - month
    - day
    - hour
    - minute
    - second
    - day of week
- The `AGE()` function returns the age from a date or timestamp, assuming it's a date of birth
- the `DATE_TRUNC()` function is used to truncate a date or timestamp to a specific level, e.g year, decade, etc