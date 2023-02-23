# DSD - Practical 14:00 23/02/23

## More Security

0. Create a new table in your upxxxxxxx database called users with the following columns:
```
id - int primary key (user identifier)
first_name - varchar(30) (user first name)
last_name - varchar(40) (user last name)
email - varchar(100) (user email address)
password - text (user password - Will be stored encrypted)
```
```sql
create table users (
    id int primary key,
    first_name varchar(30) not null,
    last_name varchar(40),
    email varchar(100),
    password text not null
);
```
1. Transfer the CSV file onto your VM
2. Assuming you have transferred the CSV into your home directory, tun the following code from inside the PSQL client
```
\copy users(id, first_name, last_name, email, password) from '/home/upxxxxxx/users.csv' DELIMITER ',' CSV HEADER
```
3. You should get the response `COPY 500`. Check that the data has been entered correctly with
```sql
SELECT * FROM users LIMIT 5;
```
```
 id | first_name | last_name |           email            |  password  
----+------------+-----------+----------------------------+------------
  1 | Tomlin     | Hardage   | thardage0@chronoengine.com | lE50Tm63
  2 | Shea       | Bergeon   | sbergeon1@liveinternet.ru  | j5KTPP2z
  3 | Matilde    | Jendrusch | mjendrusch2@ftc.gov        | 9J5pKR6
  4 | Hillyer    | Machans   | hmachans3@fda.gov          | NXHF8K
  5 | Cassaundra | Michiel   | cmichiel4@vimeo.com        | EIvy2EUtD0
```
4. We now have unencrypted passwords in our database. We need to encrypt them with a random salt value. Run the following code:
```sql
CREATE EXTENSION PGCRYPTO;
UPDATE users SET password = crypt(password, gen_salt('bf'));
```
Now run
```sql
SELECT * FROM users LIMIT 5;
```
```
 id | first_name | last_name |           email            |                           password
----+------------+-----------+----------------------------+--------------------------------------------------------------
  1 | Tomlin     | Hardage   | thardage0@chronoengine.com | $2a$06$dh4xVQTqJW1s5.NJ5Itjj.PeWV13vWJgzuS4nHqZAWZLDohtB17rm
  2 | Shea       | Bergeon   | sbergeon1@liveinternet.ru  | $2a$06$rXNbustDB3wwj8R8MWzex.pv85.SKrj/.GwuqMNjWQNU/Wrx8KE.W
  3 | Matilde    | Jendrusch | mjendrusch2@ftc.gov        | $2a$06$UR8TyzRJzb978B/q3WUn6OMwjcKxmP.Luf9mYpfV7KrGRdPPfmsGi
  4 | Hillyer    | Machans   | hmachans3@fda.gov          | $2a$06$xDtvUfipHqhXd.TLeDJ8lumfLEFohbCkvM44gSIaaY6iFWyQ9/1FO
  5 | Cassaundra | Michiel   | cmichiel4@vimeo.com        | $2a$06$nBiTiJ8b5bd.TQwac14dN.X9rRMFiBHD78AoNy8qDQ6zfan/Udh2y
```
The passwords are now encrypted and there is no way to see the plaintext values. The safety here is that the passwords are hashed using a one-way hashing function
We can check if the user has entered the correct password using the following
5. Run the following command
```sql
SELECT id, first_name, last_name FROM users WHERE email = 'cpeaseman8f@simplemachines.org' AND password = crypt('nr4kjyxW', password);
```
```
 id  | first_name | last_name 
-----+------------+-----------
 304 | Corette    | Peaseman
```
In this case, the password was correct and so the data requested was returned. If the password was not correct, it would not return the data. This way, at no point do we see the plaintext value of the password
6. What do we get if we send an incorrect password?
```sql
SELECT id, first_name, last_name FROM users WHERE email = 'cpeaseman8f@simplemachines.org' AND password = crypt('nr4kjyxW!', password);
```
```
 id | first_name | last_name 
----+------------+-----------
(0 rows)
```
7. Add a new user to the table but send in an encrypted version of their password
```sql
INSERT INTO users VALUES (600, 'Flubby', 'Foster', 'f_f@fmail.com', crypt('thisismypassword1', gen_salt('bf')));
```
8. Now select the password that has just been entered
```sql
SELECT password FROM users WHERE id = 600;
```
```
                           password
--------------------------------------------------------------
 $2a$06$GugAIVSGEDmWi9.HBwob5OJ5ftYYEl8gBZzZeIfFY9LGjD351EzIe
```
Add another user with the id of 601 that uses the same password as above
```sql
INSERT INTO users VALUES (601, 'Ben', 'Farmer', 'bfarmer@email.com', crypt('thisismypassword1', gen_salt('bf')));
```
Now compare the encrypted passwords
```
                           password
--------------------------------------------------------------
 $2a$06$GugAIVSGEDmWi9.HBwob5OJ5ftYYEl8gBZzZeIfFY9LGjD351EzIe
 $2a$06$GieKS6F9LxCKFsPKQDqJJ.PIdlwl.HdnZU1OK3rBt0pdw.RGTLw0u
```

## Date Functions

Use the following code to set the style of dates that should be used when adding data
```sql
SET DATESTYLE TO EUROPEAN;
```

Use the following code to create a new table:
```sql
create table users2 (
	id INT primary key,
	first_name VARCHAR(20) not null,
	last_name VARCHAR(30) not null,
	email VARCHAR(55) not null,
	dob DATE not null
);

insert into users2 (id, first_name, last_name, email, dob) values (1, 'Zaria', 'Coot', 'zcoot0@baidu.com', '07-11-2002');
insert into users2 (id, first_name, last_name, email, dob) values (2, 'Lucho', 'Holbie', 'lholbie1@adobe.com', '09-03-2000');
insert into users2 (id, first_name, last_name, email, dob) values (3, 'Sherlock', 'Shoveller', 'sshoveller2@zdnet.com', '10-10-2002');
insert into users2 (id, first_name, last_name, email, dob) values (4, 'Shelba', 'Riach', 'sriach3@xing.com', '09-11-2002');
insert into users2 (id, first_name, last_name, email, dob) values (5, 'Joseph', 'Lynn', 'jlynn4@weather.com', '25-11-2003');
insert into users2 (id, first_name, last_name, email, dob) values (6, 'Haroun', 'De Haven', 'hdehaven5@vistaprint.com', '23-06-2003');
insert into users2 (id, first_name, last_name, email, dob) values (7, 'Fidelio', 'Lindeboom', 'flindeboom6@salon.com', '01-11-2003');
insert into users2 (id, first_name, last_name, email, dob) values (8, 'Sheryl', 'Kubat', 'skubat7@fc2.com', '07-11-2001');
insert into users2 (id, first_name, last_name, email, dob) values (9, 'Lisha', 'Skillern', 'lskillern8@goo.gl', '10-09-2003');
insert into users2 (id, first_name, last_name, email, dob) values (10, 'Aubrie', 'Sedgmond', 'asedgmond9@nymag.com', '02-01-2004');
insert into users2 (id, first_name, last_name, email, dob) values (11, 'Thorvald', 'Blincko', 'tblinckoa@mozilla.org', '21-11-2001');
insert into users2 (id, first_name, last_name, email, dob) values (12, 'Quincy', 'Keeltagh', 'qkeeltaghb@multiply.com', '04-12-2002');
insert into users2 (id, first_name, last_name, email, dob) values (13, 'Javier', 'Camel', 'jcamelc@weather.com', '15-11-2001');
insert into users2 (id, first_name, last_name, email, dob) values (14, 'Ann-marie', 'Scholtz', 'ascholtzd@hp.com', '03-07-2001');
insert into users2 (id, first_name, last_name, email, dob) values (15, 'Camel', 'Radmer', 'cradmere@about.com', '06-02-2001');
insert into users2 (id, first_name, last_name, email, dob) values (16, 'Friedrich', 'Truluck', 'ftruluckf@soup.io', '04-09-2000');
insert into users2 (id, first_name, last_name, email, dob) values (17, 'Nichole', 'Rowbottam', 'nrowbottamg@state.tx.us', '10-09-2001');
insert into users2 (id, first_name, last_name, email, dob) values (18, 'Kory', 'Agglio', 'kagglioh@i2i.jp', '20-04-2000');
insert into users2 (id, first_name, last_name, email, dob) values (19, 'Bella', 'O''Brallaghan', 'bobrallaghani@bravesites.com', '01-10-2002');
insert into users2 (id, first_name, last_name, email, dob) values (20, 'Francine', 'Rantoul', 'frantoulj@e-recht24.de', '24-08-2001');
```
9. Check the format of the dates stored in the table, display the dob for user with id 10
```sql
SELECT dob FROM users2 WHERE id = 10;
```
```
    dob
------------
 2004-01-02
```
10. How old is the user with id number 1 today? Use the age() function
```sql
SELECT dob AS "DoB", age(dob) AS "Age" FROM users2 WHERE id = 1;
```
```
    DoB     |           Age
------------+-------------------------
 2002-11-07 | 20 years 3 mons 16 days
```
11. How old will the same user be on the 30th of June, 2035?
```sql
SELECT dob AS "DoB", age('2035-06-30', dob) AS "Age" FROM users2 WHERE id = 1;
```
```
    DoB     |           Age
------------+-------------------------
 2002-11-07 | 32 years 7 mons 23 days
```

## More Date Functions

12. Run the following code to add a new column to users2
```sql
ALTER TABLE users2 ADD COLUMN joined date DEFAULT CURRENT_DATE;
```
This will add a new column called joined and will have a default value set as the current date. This means that if a user does not specify the date it will be set to the current date
13. The users2 table was created that the IDs will be inserted manually and as such is not SERIAL. How do you find the next free id number?
```sql
SELECT (max(id) + 1) AS "Next Free ID" FROM users2;
```
```
 Next Free ID 
--------------
           21
```
14. Add 5 new users to the users2 table. Put a value in for the joined attribute for 2 and do not put one in for the other 3. Copy the code below: 
```sql
INSERT INTO users2 (id, first_name, last_name, email, dob) VALUES
  (22, 'Sonya','Beck','congue.turpis@icloud.ca','19-05-1960'),
  (23, 'India','Juarez','libero.donec@outlook.com','27-01-1999'),
  (25, 'Cheyenne','Stark','aliquam@outlook.org','21-12-1975');

INSERT INTO users2 (id, first_name, last_name, email, dob, joined) VALUES
  (21, 'Savannah','Dawson','aenean.massa@protonmail.couk','14-02-1993', '06-03-2014'),
  (24, 'Lee','Beard','sed.malesuada@outlook.org','05-07-2004', '25-09-2012');
```
15. Retrieve all of the date in the users2 table. How many have today's date in the joined table? How many are blank?
```sql
SELECT * FROM users2;
```
(25 rows)
```sql
SELECT * FROM users2 WHERE joined = CURRENT_DATE;
```
(23 rows)
```sql
SELECT * FROM users2 WHERE joined = null;
```
(0 rows)<br>
16. You have been asked to find out how many users in the users2 table do not have a joined date. Copy your code below:
```sql
SELECT * FROM users2 WHERE joined = null;
```
(0 rows)<br>
17. Why do you get the result that you get?<br>
As the default value for joined is today's date, all users have a joined date

### Challenge

```sql
SELECT email AS "Email", substring(email, position('@' IN email) + 1) AS "Email Domain" FROM users2;
```