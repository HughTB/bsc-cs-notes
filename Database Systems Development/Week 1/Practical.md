# Database Systems Development - Practical 29/09/22

- PostgreSQL (psql) prompt changes from =# to -# when it's waiting for you to finish a command (e.g. if you've forgotten the ;)
- You should write commands in VSCode or other code editor and then copy into SSH prompt, rather than writing directly into the prompt
- Useful commands:
 - \l (Lists all databases on the system)
 - \d (Lists everything in the database)
 - \dt (Lists only the tables in the database)
 - \c {database} (Connects to the database specified)
 - \i {filename} (Runs all commands in the file {filename} on the system psql is running on)
 - \! {command} (Runs {command} in the shell of the system psql is running on)