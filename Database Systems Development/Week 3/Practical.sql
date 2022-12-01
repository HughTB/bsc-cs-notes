select random(); -- Pick a random number between 0 and 1

select random() * 11; -- Pick a random number between 0 and 1 and multiply by 11 (essentially gets a random number between 0 and 11)

-- Create a table called numb1 and insert 10 random values
create table numb1(numb_id int primary key, ran_val decimal(17,15));

insert into numb1(numb_id, ran_val) values
(1,random()),(2,random()),(3,random()),(4,random()),(5,random()),(6,random()),(7,random()),(8,random()),(9,random()),(10,random());

-- Get the forename of the customer with customer id 3
select cust_fname from customer where cust_id = 3;

-- Get the id number of the Outdoor category
select cat_id, cat_name from category where cat_name like '%Outdoor%';

-- Get the number of orders made by the customer with id 15
select count(*) from cust_order where cust_id = 15;

-- Get the first and last name of all staff who live in Portsmouth
select staff_fname, staff_lname from staff where town = 'Portsmouth';

-- Get the values of addr1 and addr2 for the member of staff with id 4
select addr1, addr2 from staff where staff_id = 4;

-- Get the number of staff who have role number 3
select count(*) from staff where role = 3;

-- Get the number of products which are in category 2
select count(*) from product where prod_cat = 2;