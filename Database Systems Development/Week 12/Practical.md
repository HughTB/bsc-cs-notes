# DSD - Practical 14:00 26/01/23

### Security Practical 1

1. Create a new role. Call this new role your first name. It must be given a password and the ability to login. Copy your code and response below:

```
up2157117=# create role hugh with login password 'qwerty';
CREATE ROLE
```

2. Try to use this new role by using the following code `psql -h localhost -p 5432 -U WHATEVER_YOU_CALLED_YOUR_NEW_ROLE`:

```
up2157117@up2157117:~$ psql -h localhost -p 5432 -U hugh
Password for user hugh:
psql: FATAL:  database "hugh" does not exist
```

3. As your normal user, create a new database that has the same name as your new role. This needs to be owned by the new user. Copy the code and response below:

```
up2157117=# create database hugh owner hugh;
CREATE DATABASE
```

4. Try to use this new role by using the following code `psql -h localhost -p 5432 -U WHATEVER_YOU_CALLED_YOUR_NEW_ROLE` Copy the response below:

```
up2157117@up2157117:~$ psql -h localhost -p 5432 -U hugh
Password for user hugh: 
psql (11.18 (Debian 11.18-0+deb10u1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

hugh=>
```

5. What does the prompt look like when you log in with your new role? Copy it below:

```
hugh=>
```

6. List the databases available. Copy the output below:

```
      Name      |     Owner      | Encoding | Collate |  Ctype  |   Access privileges   
----------------+----------------+----------+---------+---------+-----------------------
 carpark        | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 code_test      | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 dsd_22         | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 games          | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 hugh           | hugh           | UTF8     | C.UTF-8 | C.UTF-8 | 
 mongo-2021-fix | mongo-2021-fix | UTF8     | C.UTF-8 | C.UTF-8 | 
 postgres       | postgres       | UTF8     | C.UTF-8 | C.UTF-8 | 
 template0      | postgres       | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +
                |                |          |         |         | postgres=CTc/postgres
 template1      | postgres       | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +
                |                |          |         |         | postgres=CTc/postgres
 up2157117      | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 up2157117_cw   | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
```

7. Connect to a different database and list the tables. Copy the output below:

```
hugh=> \c dsd_22
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "dsd_22" as user "hugh".
dsd_22=> \dt
               List of relations
 Schema |       Name       | Type  |   Owner   
--------+------------------+-------+-----------
 public | category         | table | up2157117
 public | cust_order       | table | up2157117
 public | customer         | table | up2157117
 public | manifest         | table | up2157117
 public | product          | table | up2157117
 public | role             | table | up2157117
 public | staff            | table | up2157117
 public | staff_role       | table | up2157117
```

8. Select all of the data in one of the tables listed in T7. Copy the output below:

```
dsd_22=> select * from product;
ERROR:  permission denied for table product
```

9. As your normal user, make the new role a superuser with the following code `ALTER ROLE WHATEVER_YOU_CALLED_YOUR_NEW_ROLE WITH SUPERUSER;`:

```
up2157117=# alter role hugh with superuser;
ALTER ROLE
```

10. Make sure your new role is logged out with \q and then log in again. What does the prompt now look like? Copy this prompt below:

```
hugh=#
```

11. List the databases available. Copy the output below:

```
                                   List of databases
      Name      |     Owner      | Encoding | Collate |  Ctype  |   Access privileges   
----------------+----------------+----------+---------+---------+-----------------------
 carpark        | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 code_test      | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 dsd_22         | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 games          | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 hugh           | hugh           | UTF8     | C.UTF-8 | C.UTF-8 | 
 mongo-2021-fix | mongo-2021-fix | UTF8     | C.UTF-8 | C.UTF-8 | 
 postgres       | postgres       | UTF8     | C.UTF-8 | C.UTF-8 | 
 template0      | postgres       | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +
                |                |          |         |         | postgres=CTc/postgres
 template1      | postgres       | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +
                |                |          |         |         | postgres=CTc/postgres
 up2157117      | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
 up2157117_cw   | up2157117      | UTF8     | C.UTF-8 | C.UTF-8 | 
```

12. Connect to a different database and list the tables. Copy the output below:

```
               List of relations
 Schema |       Name       | Type  |   Owner   
--------+------------------+-------+-----------
 public | category         | table | up2157117
 public | cust_order       | table | up2157117
 public | customer         | table | up2157117
 public | manifest         | table | up2157117
 public | product          | table | up2157117
 public | role             | table | up2157117
 public | staff            | table | up2157117
 public | staff_role       | table | up2157117
```

13. Select all of the data in one of the tables listed in T7. Copy the output below:

```
 prod_id |                    prod_name                     | prod_cat 
---------+--------------------------------------------------+----------
       1 | Multi-layered multi-tasking initiative           |        2
       2 | Operative analyzing task-force                   |        1
       3 | Exclusive client-server array                    |        5
       4 | Balanced client-server product                   |        6
       5 | Exclusive background website                     |        5
       6 | Pre-emptive holistic intranet                    |        6
       7 | Re-engineered cohesive methodology               |        1
       8 | Robust directional projection                    |        2
       9 | Inverse transitional infrastructure              |        4
      10 | Multi-tiered explicit paradigm                   |        6
      11 | Re-engineered explicit software                  |        2
      12 | Cross-platform fresh-thinking core               |        3
      13 | Diverse neutral emulation                        |        4
      14 | Up-sized composite challenge                     |        4
      15 | Intuitive directional complexity                 |        4
      16 | Universal encompassing conglomeration            |        5
      17 | Multi-channelled well-modulated analyzer         |        2
      18 | Re-engineered actuating capability               |        4
      19 | Public-key interactive encoding                  |        2
      20 | Monitored asynchronous function                  |        6
      21 | Proactive methodical data-warehouse              |        4
      22 | Balanced real-time info-mediaries                |        1
      23 | Right-sized mission-critical pricing structure   |        6
      24 | Synergistic homogeneous ability                  |        5
      25 | Open-source impactful archive                    |        5
      26 | Realigned 5th generation artificial intelligence |        2
      27 | Configurable methodical firmware                 |        5
      28 | Profound optimal encryption                      |        3
```