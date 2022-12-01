
-- default database DSD 2022
-- created by Mark Venn

-- CREATE THE DATABASE & CONNECT
CREATE DATABASE dsd_22;
\c dsd_22
-- CREATE tables

-- have to start at the "outer" tables (on the ERD)

CREATE TABLE ROLE(
ROLE_ID SERIAL PRIMARY KEY,
ROLE_NAME VARCHAR(20)
);

CREATE TABLE CUSTOMER (
CUST_ID SERIAL PRIMARY KEY,
CUST_FNAME VARCHAR(25) NOT NULL,
CUST_LNAME VARCHAR(35) NOT NULL,
ADDR1 VARCHAR(50) NOT NULL,
ADDR2 VARCHAR(50),
TOWN VARCHAR(60) NOT NULL,
POSTCODE CHAR(9) NOT NULL,
EMAIL VARCHAR(255) NOT NULL
);



CREATE TABLE STAFF(
STAFF_ID SERIAL PRIMARY KEY,
STAFF_FNAME VARCHAR(25) NOT NULL,
STAFF_LNAME VARCHAR(35) NOT NULL,
ADDR1 VARCHAR(50) NOT NULL,
ADDR2 VARCHAR(50),
TOWN VARCHAR(60) NOT NULL,
POSTCODE CHAR(9) NOT NULL,
HOME_EMAIL VARCHAR(255) NOT NULL,
WORK_EMAIL VARCHAR(100) NOT NULL,
ROLE INT NOT NULL REFERENCES ROLE(ROLE_ID)
);


CREATE TABLE CUST_ORDER (
CUST_ORD_ID SERIAL PRIMARY KEY ,
STAFF_ID INT REFERENCES STAFF(STAFF_ID),
CUST_ID INT REFERENCES CUSTOMER(CUST_ID)
);

CREATE TABLE CATEGORY (
CAT_ID SERIAL PRIMARY KEY,
CAT_NAME VARCHAR(40));


CREATE TABLE PRODUCT(
PROD_ID SERIAL PRIMARY KEY,
PROD_NAME VARCHAR(50) NOT NULL,
PROD_CAT INT NOT NULL REFERENCES CATEGORY(CAT_ID));

CREATE TABLE MANIFEST (
MANIFEST_ID SERIAL PRIMARY KEY,
CUST_ORD_ID INT NOT NULL REFERENCES CUST_ORDER(CUST_ORD_ID),
PROD_ID INT NOT NULL REFERENCES PRODUCT(PROD_ID));




-- default database DSD 2022
-- created by Mark Venn
-- populate tables

-- have to start at the "outer" tables (on the ERD)
-- ROLE
INSERT INTO ROLE (ROLE_NAME) VALUES ('Order Picker');
INSERT INTO ROLE (ROLE_NAME) VALUES('Final Packer');
INSERT INTO ROLE (ROLE_NAME) VALUES('Post Sales');
INSERT INTO ROLE (ROLE_NAME) VALUES('Customer Retain');
INSERT INTO ROLE (ROLE_NAME) VALUES('Misc');

-- CUSTOMER
insert into customer (cust_fname, cust_lname, addr1, addr2, town, postcode, email) values ('Jobey', 'Boeter', '6 Claremont Park', 'Truax', 'La Mohammedia', 'CV42 3EF', 'jboeter0@mail.ru');
insert into customer (cust_fname, cust_lname, addr1, addr2, town, postcode, email) values ('York', 'O''Deegan', '882 Hooker Trail', null, 'Chemnitz', 'YA92 2OJ', 'yodeegan1@nydailynews.com');
insert into customer (cust_fname, cust_lname, addr1, addr2, town, postcode, email) values ('Penelope', 'Hexter', '25 Jackson Lane', null, 'Pingshan', 'LY32 8LN', 'phexter2@cbslocal.com');
insert into customer (cust_fname, cust_lname, addr1, addr2, town, postcode, email) values ('Chadd', 'Franz-Schoninger', '7 Division Point', 'Texas', 'Baojia', 'XA22 0UR', 'cfranzschoninger3@google.com.hk');
insert into customer (cust_fname, cust_lname, addr1, addr2, town, postcode, email) values ('Vikky', 'Eke', '293 Colorado Drive', 'Browning', 'Kamenný Přívoz', 'WQ12 3SF', 'veke4@elegantthemes.com');
insert into customer (cust_fname, cust_lname, addr1, addr2, town, postcode, email) values ('Marie-françoise', 'Currier', '032 Eagan Junction', 'Duke', 'Waekolong', 'NB52 4MV', 'acurrier0@economist.com');
insert into customer (cust_fname, cust_lname, addr1, addr2, town, postcode, email) values ('Bénédicte', 'Dozdill', '579 Dryden Terrace', null, 'Dawuhan', 'GY32 6GQ', 'cdozdill1@amazon.de');
insert into customer (cust_fname, cust_lname, addr1, addr2, town, postcode, email) values ('Görel', 'Douthwaite', '2946 Bluejay Parkway', 'Heath', 'Sunbu', 'PH02 3ZX', 'edouthwaite2@feedburner.com');
insert into customer (cust_fname, cust_lname, addr1, addr2, town, postcode, email) values ('Bérengère', 'Menendez', '06154 Jackson Way', 'Doe Crossing', 'Tsagaanders', 'HO82 5XL', 'amenendez3@dell.com');
insert into customer (cust_fname, cust_lname, addr1, addr2, town, postcode, email) values ('Pélagie', 'Hachard', '1777 Hauk Center', null, 'Jiantou', 'NA52 4LM', 'fhachard4@blinklist.com');
insert into customer (cust_fname, cust_lname, addr1, addr2, town, postcode, email) values ('Adaobi', 'Musa', '6 Clariss Ave', null, 'La Mohammedia', 'CV4 3F', 'amusa9@mail.ca');


-- STAFF
insert into staff (staff_fname, staff_lname, addr1, addr2, town, postcode, home_email, work_email, role) values ('Niel', 'Welsby', '69 Riverside Crossing', 'Maryland', 'Portsmouth', 'PO67 8AR', 'nwelsby0@rambler.ru', 'Niel.Welsby@dsd.com', 2);
insert into staff (staff_fname, staff_lname, addr1, addr2, town, postcode, home_email, work_email, role) values ('Nikoletta', 'Shrimpton', '38174 Russell Avenue', 'Eagle Crest', 'Fratton', 'PO83 3RV', 'nshrimpton1@unblog.fr', 'Nikoletta.Shrimpton@dsd.com', 4);
insert into staff (staff_fname, staff_lname, addr1, addr2, town, postcode, home_email, work_email, role) values ('Montgomery', 'Housegoe', '07274 Waywood Park', 'Arkansas', 'Southsea', 'PO06 2SL', 'mhousegoe2@ucoz.ru', 'Montgomery.Housegoe@dsd.com', 1);
insert into staff (staff_fname, staff_lname, addr1, addr2, town, postcode, home_email, work_email, role) values ('Hanan', 'Gloster', '959 Algoma Plaza', null, 'Fratton', 'PO99 5GF', 'hgloster3@blogger.com', 'Hanan.Gloster@dsd.com', 4);
insert into staff (staff_fname, staff_lname, addr1, addr2, town, postcode, home_email, work_email, role) values ('Janeva', 'Gillicuddy', '6999 Kings Park', 'Sachtjen', 'Portsmouth', 'PO05 5SF', 'jgillicuddy4@altervista.org', 'Janeva.Gillicuddy@dsd.com', 5);
insert into staff (staff_fname, staff_lname, addr1, addr2, town, postcode, home_email, work_email, role) values ('Aura', 'Clewlowe', '20397 Schlimgen Court', 'Drewry', 'Southsea', 'PO74 8RI', 'aclewlowe5@google.com.au', 'Aura.Clewlowe@dsd.com', 3);
insert into staff (staff_fname, staff_lname, addr1, addr2, town, postcode, home_email, work_email, role) values ('Nell', 'Olsson', '18424 Kenwood Court', 'Farmco', 'Havant', 'PO22 6DL', 'nolsson6@jiathis.com', 'Nell.Olsson@dsd.com', 5);
insert into staff (staff_fname, staff_lname, addr1, addr2, town, postcode, home_email, work_email, role) values ('Harriette', 'Fewster', '4 Banding Park', 'Crownhardt', 'Southsea', 'PO13 8TC', 'hfewster7@independent.co.uk', 'Harriette.Fewster@dsd.com', 3);
insert into staff (staff_fname, staff_lname, addr1, addr2, town, postcode, home_email, work_email, role) values ('Jillene', 'Revitt', '3 Fieldstone Point', 'Nancy', 'Fratton', 'PO56 0HI', 'jrevitt8@cornell.edu', 'Jillene.Revitt@dsd.com', 3);
insert into staff (staff_fname, staff_lname, addr1, addr2, town, postcode, home_email, work_email, role) values ('Tim', 'Illem', '85 Lillian Way', 'Farragut', 'Southsea', 'PO93 0CN', 'tillem9@dedecms.com', 'Tim.Illem@dsd.com', 5);

-- CUST_ORDER
insert into cust_order (staff_id, cust_id) values (6, 4);
insert into cust_order (staff_id, cust_id) values (5, 2);
insert into cust_order (staff_id, cust_id) values (2, 6);
insert into cust_order (staff_id, cust_id) values (5, 9);
insert into cust_order (staff_id, cust_id) values (6, 7);
insert into cust_order (staff_id, cust_id) values (4, 7);
insert into cust_order (staff_id, cust_id) values (6, 4);
insert into cust_order (staff_id, cust_id) values (3, 7);
insert into cust_order (staff_id, cust_id) values (6, 3);
insert into cust_order (staff_id, cust_id) values (5, 2);
insert into cust_order (staff_id, cust_id) values (6, 7);
insert into cust_order (staff_id, cust_id) values (4, 9);
insert into cust_order (staff_id, cust_id) values (4, 7);
insert into cust_order (staff_id, cust_id) values (4, 7);
insert into cust_order (staff_id, cust_id) values (4, 6);
insert into cust_order (staff_id, cust_id) values (5, 9);
insert into cust_order (staff_id, cust_id) values (5, 10);
insert into cust_order (staff_id, cust_id) values (3, 7);
insert into cust_order (staff_id, cust_id) values (3, 2);
insert into cust_order (staff_id, cust_id) values (6, 10);
insert into cust_order (staff_id, cust_id) values (1, 9);
insert into cust_order (staff_id, cust_id) values (5, 7);
insert into cust_order (staff_id, cust_id) values (3, 3);
insert into cust_order (staff_id, cust_id) values (3, 7);
insert into cust_order (staff_id, cust_id) values (4, 9);
insert into cust_order (staff_id, cust_id) values (3, 1);
insert into cust_order (staff_id, cust_id) values (3, 6);
insert into cust_order (staff_id, cust_id) values (1, 2);
insert into cust_order (staff_id, cust_id) values (2, 2);
insert into cust_order (staff_id, cust_id) values (5, 7);
insert into cust_order (staff_id, cust_id) values (2, 7);
insert into cust_order (staff_id, cust_id) values (1, 3);
insert into cust_order (staff_id, cust_id) values (4, 3);
insert into cust_order (staff_id, cust_id) values (4, 1);
insert into cust_order (staff_id, cust_id) values (4, 7);
insert into cust_order (staff_id, cust_id) values (5, 10);
insert into cust_order (staff_id, cust_id) values (2, 7);
insert into cust_order (staff_id, cust_id) values (3, 10);
insert into cust_order (staff_id, cust_id) values (4, 1);
insert into cust_order (staff_id, cust_id) values (4, 9);
insert into cust_order (staff_id, cust_id) values (4, 9);
insert into cust_order (staff_id, cust_id) values (6, 3);
insert into cust_order (staff_id, cust_id) values (3, 7);
insert into cust_order (staff_id, cust_id) values (5, 10);
insert into cust_order (staff_id, cust_id) values (1, 9);
insert into cust_order (staff_id, cust_id) values (3, 10);
insert into cust_order (staff_id, cust_id) values (3, 7);
insert into cust_order (staff_id, cust_id) values (2, 2);
insert into cust_order (staff_id, cust_id) values (6, 10);
insert into cust_order (staff_id, cust_id) values (6, 6);
insert into cust_order (staff_id, cust_id) values (4, 3);
insert into cust_order (staff_id, cust_id) values (3, 10);
insert into cust_order (staff_id, cust_id) values (4, 7);
insert into cust_order (staff_id, cust_id) values (5, 8);
insert into cust_order (staff_id, cust_id) values (5, 7);
insert into cust_order (staff_id, cust_id) values (6, 9);
insert into cust_order (staff_id, cust_id) values (2, 1);
insert into cust_order (staff_id, cust_id) values (3, 2);
insert into cust_order (staff_id, cust_id) values (4, 9);
insert into cust_order (staff_id, cust_id) values (2, 7);
insert into cust_order (staff_id, cust_id) values (1, 8);
insert into cust_order (staff_id, cust_id) values (3, 7);
insert into cust_order (staff_id, cust_id) values (6, 10);
insert into cust_order (staff_id, cust_id) values (2, 9);
insert into cust_order (staff_id, cust_id) values (1, 6);
insert into cust_order (staff_id, cust_id) values (3, 4);
insert into cust_order (staff_id, cust_id) values (3, 7);
insert into cust_order (staff_id, cust_id) values (3, 1);
insert into cust_order (staff_id, cust_id) values (2, 7);
insert into cust_order (staff_id, cust_id) values (6, 2);
insert into cust_order (staff_id, cust_id) values (2, 1);
insert into cust_order (staff_id, cust_id) values (4, 7);
insert into cust_order (staff_id, cust_id) values (1, 3);
insert into cust_order (staff_id, cust_id) values (1, 3);
insert into cust_order (staff_id, cust_id) values (4, 6);
insert into cust_order (staff_id, cust_id) values (3, 7);
insert into cust_order (staff_id, cust_id) values (4, 1);
insert into cust_order (staff_id, cust_id) values (1, 2);
insert into cust_order (staff_id, cust_id) values (4, 9);
insert into cust_order (staff_id, cust_id) values (5, 2);
insert into cust_order (staff_id, cust_id) values (5, 4);
insert into cust_order (staff_id, cust_id) values (1, 5);
insert into cust_order (staff_id, cust_id) values (5, 6);
insert into cust_order (staff_id, cust_id) values (4, 8);
insert into cust_order (staff_id, cust_id) values (5, 3);
insert into cust_order (staff_id, cust_id) values (5, 3);
insert into cust_order (staff_id, cust_id) values (3, 9);
insert into cust_order (staff_id, cust_id) values (5, 10);
insert into cust_order (staff_id, cust_id) values (4, 10);
insert into cust_order (staff_id, cust_id) values (6, 5);
insert into cust_order (staff_id, cust_id) values (1, 1);
insert into cust_order (staff_id, cust_id) values (6, 8);
insert into cust_order (staff_id, cust_id) values (1, 4);
insert into cust_order (staff_id, cust_id) values (2, 7);
insert into cust_order (staff_id, cust_id) values (6, 2);
insert into cust_order (staff_id, cust_id) values (6, 7);
insert into cust_order (staff_id, cust_id) values (6, 4);
insert into cust_order (staff_id, cust_id) values (3, 1);
insert into cust_order (staff_id, cust_id) values (5, 1);
insert into cust_order (staff_id, cust_id) values (3, 7);
insert into cust_order (staff_id, cust_id) values (1, 6);
insert into cust_order (staff_id, cust_id) values (3, 9);
insert into cust_order (staff_id, cust_id) values (1, 8);
insert into cust_order (staff_id, cust_id) values (2, 10);
insert into cust_order (staff_id, cust_id) values (1, 5);
insert into cust_order (staff_id, cust_id) values (1, 8);
insert into cust_order (staff_id, cust_id) values (4, 4);
insert into cust_order (staff_id, cust_id) values (2, 3);
insert into cust_order (staff_id, cust_id) values (2, 4);
insert into cust_order (staff_id, cust_id) values (4, 10);
insert into cust_order (staff_id, cust_id) values (6, 8);
insert into cust_order (staff_id, cust_id) values (1, 6);
insert into cust_order (staff_id, cust_id) values (5, 9);
insert into cust_order (staff_id, cust_id) values (4, 3);
insert into cust_order (staff_id, cust_id) values (3, 5);
insert into cust_order (staff_id, cust_id) values (3, 3);
insert into cust_order (staff_id, cust_id) values (3, 9);
insert into cust_order (staff_id, cust_id) values (5, 5);
insert into cust_order (staff_id, cust_id) values (6, 2);
insert into cust_order (staff_id, cust_id) values (6, 9);
insert into cust_order (staff_id, cust_id) values (2, 6);
insert into cust_order (staff_id, cust_id) values (1, 3);
insert into cust_order (staff_id, cust_id) values (2, 8);
insert into cust_order (staff_id, cust_id) values (6, 4);
insert into cust_order (staff_id, cust_id) values (4, 7);
insert into cust_order (staff_id, cust_id) values (1, 9);
insert into cust_order (staff_id, cust_id) values (1, 8);
insert into cust_order (staff_id, cust_id) values (4, 3);
insert into cust_order (staff_id, cust_id) values (2, 4);
insert into cust_order (staff_id, cust_id) values (1, 5);
insert into cust_order (staff_id, cust_id) values (6, 1);
insert into cust_order (staff_id, cust_id) values (2, 5);
insert into cust_order (staff_id, cust_id) values (1, 6);
insert into cust_order (staff_id, cust_id) values (1, 10);
insert into cust_order (staff_id, cust_id) values (1, 5);
insert into cust_order (staff_id, cust_id) values (6, 9);
insert into cust_order (staff_id, cust_id) values (3, 9);
insert into cust_order (staff_id, cust_id) values (2, 2);
insert into cust_order (staff_id, cust_id) values (2, 6);
insert into cust_order (staff_id, cust_id) values (3, 10);
insert into cust_order (staff_id, cust_id) values (4, 3);
insert into cust_order (staff_id, cust_id) values (6, 2);
insert into cust_order (staff_id, cust_id) values (5, 1);
insert into cust_order (staff_id, cust_id) values (1, 2);
insert into cust_order (staff_id, cust_id) values (3, 5);
insert into cust_order (staff_id, cust_id) values (3, 1);
insert into cust_order (staff_id, cust_id) values (6, 6);
insert into cust_order (staff_id, cust_id) values (3, 3);
insert into cust_order (staff_id, cust_id) values (6, 6);
insert into cust_order (staff_id, cust_id) values (3, 8);


-- CATEGORY
insert into category (cat_name) values ('Men''s Wear');
insert into category (cat_name) values ('Ladies Wear');
insert into category (cat_name) values ('Kid''s Wear');
insert into category (cat_name) values ('Outdoor');
insert into category (cat_name) values ('Sport');
insert into category (cat_name) values ('Health');

-- PRODUCT
insert into product (prod_name, prod_cat) values ('Multi-layered multi-tasking initiative', 2);
insert into product (prod_name, prod_cat) values ('Operative analyzing task-force', 1);
insert into product (prod_name, prod_cat) values ('Exclusive client-server array', 5);
insert into product (prod_name, prod_cat) values ('Balanced client-server product', 6);
insert into product (prod_name, prod_cat) values ('Exclusive background website', 5);
insert into product (prod_name, prod_cat) values ('Pre-emptive holistic intranet', 6);
insert into product (prod_name, prod_cat) values ('Re-engineered cohesive methodology', 1);
insert into product (prod_name, prod_cat) values ('Robust directional projection', 2);
insert into product (prod_name, prod_cat) values ('Inverse transitional infrastructure', 4);
insert into product (prod_name, prod_cat) values ('Multi-tiered explicit paradigm', 6);
insert into product (prod_name, prod_cat) values ('Re-engineered explicit software', 2);
insert into product (prod_name, prod_cat) values ('Cross-platform fresh-thinking core', 3);
insert into product (prod_name, prod_cat) values ('Diverse neutral emulation', 4);
insert into product (prod_name, prod_cat) values ('Up-sized composite challenge', 4);
insert into product (prod_name, prod_cat) values ('Intuitive directional complexity', 4);
insert into product (prod_name, prod_cat) values ('Universal encompassing conglomeration', 5);
insert into product (prod_name, prod_cat) values ('Multi-channelled well-modulated analyzer', 2);
insert into product (prod_name, prod_cat) values ('Re-engineered actuating capability', 4);
insert into product (prod_name, prod_cat) values ('Public-key interactive encoding', 2);
insert into product (prod_name, prod_cat) values ('Monitored asynchronous function', 6);
insert into product (prod_name, prod_cat) values ('Proactive methodical data-warehouse', 4);
insert into product (prod_name, prod_cat) values ('Balanced real-time info-mediaries', 1);
insert into product (prod_name, prod_cat) values ('Right-sized mission-critical pricing structure', 6);
insert into product (prod_name, prod_cat) values ('Synergistic homogeneous ability', 5);
insert into product (prod_name, prod_cat) values ('Open-source impactful archive', 5);
insert into product (prod_name, prod_cat) values ('Realigned 5th generation artificial intelligence', 2);
insert into product (prod_name, prod_cat) values ('Configurable methodical firmware', 5);
insert into product (prod_name, prod_cat) values ('Profound optimal encryption', 3);
insert into product (prod_name, prod_cat) values ('Vision-oriented user-facing framework', 2);
insert into product (prod_name, prod_cat) values ('Secured holistic hierarchy', 2);
insert into product (prod_name, prod_cat) values ('Assimilated regional instruction set', 2);
insert into product (prod_name, prod_cat) values ('Business-focused holistic help-desk', 3);
insert into product (prod_name, prod_cat) values ('Virtual stable Graphic Interface', 5);
insert into product (prod_name, prod_cat) values ('Implemented optimizing benchmark', 1);
insert into product (prod_name, prod_cat) values ('Adaptive static website', 1);
insert into product (prod_name, prod_cat) values ('Virtual impactful success', 2);
insert into product (prod_name, prod_cat) values ('Open-architected homogeneous concept', 6);
insert into product (prod_name, prod_cat) values ('Diverse reciprocal knowledge base', 1);
insert into product (prod_name, prod_cat) values ('Realigned homogeneous hub', 5);
insert into product (prod_name, prod_cat) values ('Switchable tangible product', 4);
insert into product (prod_name, prod_cat) values ('Universal global hub', 2);
insert into product (prod_name, prod_cat) values ('Enhanced discrete function', 4);
insert into product (prod_name, prod_cat) values ('Horizontal asynchronous intranet', 4);
insert into product (prod_name, prod_cat) values ('Quality-focused foreground analyzer', 5);
insert into product (prod_name, prod_cat) values ('Configurable analyzing solution', 3);
insert into product (prod_name, prod_cat) values ('Fully-configurable full-range interface', 6);
insert into product (prod_name, prod_cat) values ('Monitored non-volatile initiative', 3);
insert into product (prod_name, prod_cat) values ('Pre-emptive next generation infrastructure', 3);
insert into product (prod_name, prod_cat) values ('Switchable 5th generation parallelism', 4);
insert into product (prod_name, prod_cat) values ('Adaptive modular approach', 2);
insert into product (prod_name, prod_cat) values ('Synergistic zero defect info-mediaries', 2);
insert into product (prod_name, prod_cat) values ('Persevering empowering customer loyalty', 3);
insert into product (prod_name, prod_cat) values ('Robust foreground leverage', 1);
insert into product (prod_name, prod_cat) values ('Customizable cohesive capacity', 6);
insert into product (prod_name, prod_cat) values ('Progressive modular archive', 3);
insert into product (prod_name, prod_cat) values ('Reduced fresh-thinking process improvement', 2);
insert into product (prod_name, prod_cat) values ('Seamless optimal leverage', 6);
insert into product (prod_name, prod_cat) values ('Universal exuding protocol', 5);
insert into product (prod_name, prod_cat) values ('Realigned client-driven database', 6);
insert into product (prod_name, prod_cat) values ('Balanced hybrid portal', 5);
insert into product (prod_name, prod_cat) values ('Customizable well-modulated encryption', 5);
insert into product (prod_name, prod_cat) values ('Cross-group reciprocal firmware', 3);
insert into product (prod_name, prod_cat) values ('4th generation Graphical User Interface', 4);
insert into product (prod_name, prod_cat) values ('Business-focused solution-oriented moratorium', 5);
insert into product (prod_name, prod_cat) values ('Synergistic scalable capability', 5);
insert into product (prod_name, prod_cat) values ('Distributed uniform Graphic Interface', 5);
insert into product (prod_name, prod_cat) values ('Stand-alone composite Graphical User Interface', 2);
insert into product (prod_name, prod_cat) values ('Future-proofed leading edge customer loyalty', 4);
insert into product (prod_name, prod_cat) values ('Profound human-resource forecast', 6);
insert into product (prod_name, prod_cat) values ('Advanced neutral portal', 3);
insert into product (prod_name, prod_cat) values ('Customer-focused needs-based protocol', 3);
insert into product (prod_name, prod_cat) values ('User-friendly encompassing array', 6);
insert into product (prod_name, prod_cat) values ('Decentralized human-resource infrastructure', 2);
insert into product (prod_name, prod_cat) values ('Balanced modular website', 2);
insert into product (prod_name, prod_cat) values ('Horizontal explicit benchmark', 2);
insert into product (prod_name, prod_cat) values ('Re-engineered 24/7 knowledge base', 1);
insert into product (prod_name, prod_cat) values ('Innovative web-enabled extranet', 2);
insert into product (prod_name, prod_cat) values ('Exclusive analyzing open architecture', 2);
insert into product (prod_name, prod_cat) values ('Fundamental global archive', 3);
insert into product (prod_name, prod_cat) values ('Profound value-added intranet', 5);
insert into product (prod_name, prod_cat) values ('Networked global open system', 6);
insert into product (prod_name, prod_cat) values ('Persistent demand-driven complexity', 5);
insert into product (prod_name, prod_cat) values ('Focused secondary initiative', 5);
insert into product (prod_name, prod_cat) values ('Digitized tertiary groupware', 3);
insert into product (prod_name, prod_cat) values ('Enhanced homogeneous paradigm', 4);
insert into product (prod_name, prod_cat) values ('Inverse high-level attitude', 4);
insert into product (prod_name, prod_cat) values ('Quality-focused upward-trending throughput', 4);
insert into product (prod_name, prod_cat) values ('Team-oriented stable project', 6);
insert into product (prod_name, prod_cat) values ('Total intangible artificial intelligence', 3);
insert into product (prod_name, prod_cat) values ('Streamlined asynchronous functionalities', 5);
insert into product (prod_name, prod_cat) values ('Vision-oriented attitude-oriented core', 5);
insert into product (prod_name, prod_cat) values ('Integrated 24/7 interface', 2);
insert into product (prod_name, prod_cat) values ('Advanced didactic Graphic Interface', 1);
insert into product (prod_name, prod_cat) values ('Exclusive multimedia middleware', 6);
insert into product (prod_name, prod_cat) values ('Ameliorated next generation orchestration', 6);
insert into product (prod_name, prod_cat) values ('Front-line demand-driven utilisation', 5);
insert into product (prod_name, prod_cat) values ('Organic clear-thinking system engine', 3);
insert into product (prod_name, prod_cat) values ('Persistent incremental model', 3);
insert into product (prod_name, prod_cat) values ('Ergonomic solution-oriented local area network', 2);
insert into product (prod_name, prod_cat) values ('Robust mission-critical complexity', 5);

-- MANIFEST
insert into manifest (cust_ord_id, prod_id) values (1, 84);
insert into manifest (cust_ord_id, prod_id) values (2, 1);
insert into manifest (cust_ord_id, prod_id) values (3, 91);
insert into manifest (cust_ord_id, prod_id) values (4, 5);
insert into manifest (cust_ord_id, prod_id) values (5, 97);
insert into manifest (cust_ord_id, prod_id) values (6, 74);
insert into manifest (cust_ord_id, prod_id) values (7, 88);
insert into manifest (cust_ord_id, prod_id) values (8, 97);
insert into manifest (cust_ord_id, prod_id) values (9, 66);
insert into manifest (cust_ord_id, prod_id) values (10, 43);
insert into manifest (cust_ord_id, prod_id) values (11, 78);
insert into manifest (cust_ord_id, prod_id) values (12, 24);
insert into manifest (cust_ord_id, prod_id) values (13, 69);
insert into manifest (cust_ord_id, prod_id) values (14, 25);
insert into manifest (cust_ord_id, prod_id) values (15, 4);
insert into manifest (cust_ord_id, prod_id) values (16, 32);
insert into manifest (cust_ord_id, prod_id) values (17, 66);
insert into manifest (cust_ord_id, prod_id) values (18, 13);
insert into manifest (cust_ord_id, prod_id) values (19, 83);
insert into manifest (cust_ord_id, prod_id) values (20, 4);
insert into manifest (cust_ord_id, prod_id) values (21, 45);
insert into manifest (cust_ord_id, prod_id) values (22, 4);
insert into manifest (cust_ord_id, prod_id) values (23, 93);
insert into manifest (cust_ord_id, prod_id) values (24, 45);
insert into manifest (cust_ord_id, prod_id) values (25, 1);
insert into manifest (cust_ord_id, prod_id) values (26, 40);
insert into manifest (cust_ord_id, prod_id) values (27, 3);
insert into manifest (cust_ord_id, prod_id) values (28, 11);
insert into manifest (cust_ord_id, prod_id) values (29, 37);
insert into manifest (cust_ord_id, prod_id) values (30, 73);
insert into manifest (cust_ord_id, prod_id) values (31, 10);
insert into manifest (cust_ord_id, prod_id) values (32, 21);
insert into manifest (cust_ord_id, prod_id) values (33, 5);
insert into manifest (cust_ord_id, prod_id) values (34, 23);
insert into manifest (cust_ord_id, prod_id) values (35, 15);
insert into manifest (cust_ord_id, prod_id) values (36, 94);
insert into manifest (cust_ord_id, prod_id) values (37, 99);
insert into manifest (cust_ord_id, prod_id) values (38, 48);
insert into manifest (cust_ord_id, prod_id) values (39, 40);
insert into manifest (cust_ord_id, prod_id) values (40, 80);
insert into manifest (cust_ord_id, prod_id) values (41, 31);
insert into manifest (cust_ord_id, prod_id) values (42, 95);
insert into manifest (cust_ord_id, prod_id) values (43, 89);
insert into manifest (cust_ord_id, prod_id) values (44, 68);
insert into manifest (cust_ord_id, prod_id) values (45, 80);
insert into manifest (cust_ord_id, prod_id) values (46, 60);
insert into manifest (cust_ord_id, prod_id) values (47, 39);
insert into manifest (cust_ord_id, prod_id) values (48, 29);
insert into manifest (cust_ord_id, prod_id) values (49, 7);
insert into manifest (cust_ord_id, prod_id) values (50, 16);
insert into manifest (cust_ord_id, prod_id) values (51, 63);
insert into manifest (cust_ord_id, prod_id) values (52, 25);
insert into manifest (cust_ord_id, prod_id) values (53, 83);
insert into manifest (cust_ord_id, prod_id) values (54, 21);
insert into manifest (cust_ord_id, prod_id) values (55, 32);
insert into manifest (cust_ord_id, prod_id) values (56, 7);
insert into manifest (cust_ord_id, prod_id) values (57, 82);
insert into manifest (cust_ord_id, prod_id) values (58, 87);
insert into manifest (cust_ord_id, prod_id) values (59, 10);
insert into manifest (cust_ord_id, prod_id) values (60, 62);
insert into manifest (cust_ord_id, prod_id) values (61, 80);
insert into manifest (cust_ord_id, prod_id) values (62, 12);
insert into manifest (cust_ord_id, prod_id) values (63, 58);
insert into manifest (cust_ord_id, prod_id) values (64, 54);
insert into manifest (cust_ord_id, prod_id) values (65, 24);
insert into manifest (cust_ord_id, prod_id) values (66, 48);
insert into manifest (cust_ord_id, prod_id) values (67, 80);
insert into manifest (cust_ord_id, prod_id) values (68, 90);
insert into manifest (cust_ord_id, prod_id) values (69, 30);
insert into manifest (cust_ord_id, prod_id) values (70, 70);
insert into manifest (cust_ord_id, prod_id) values (71, 86);
insert into manifest (cust_ord_id, prod_id) values (72, 20);
insert into manifest (cust_ord_id, prod_id) values (73, 4);
insert into manifest (cust_ord_id, prod_id) values (74, 34);
insert into manifest (cust_ord_id, prod_id) values (75, 58);
insert into manifest (cust_ord_id, prod_id) values (76, 18);
insert into manifest (cust_ord_id, prod_id) values (77, 39);
insert into manifest (cust_ord_id, prod_id) values (78, 37);
insert into manifest (cust_ord_id, prod_id) values (79, 19);
insert into manifest (cust_ord_id, prod_id) values (80, 58);
insert into manifest (cust_ord_id, prod_id) values (81, 88);
insert into manifest (cust_ord_id, prod_id) values (82, 58);
insert into manifest (cust_ord_id, prod_id) values (83, 41);
insert into manifest (cust_ord_id, prod_id) values (84, 79);
insert into manifest (cust_ord_id, prod_id) values (85, 12);
insert into manifest (cust_ord_id, prod_id) values (86, 21);
insert into manifest (cust_ord_id, prod_id) values (87, 91);
insert into manifest (cust_ord_id, prod_id) values (88, 89);
insert into manifest (cust_ord_id, prod_id) values (89, 33);
insert into manifest (cust_ord_id, prod_id) values (90, 66);
insert into manifest (cust_ord_id, prod_id) values (91, 45);
insert into manifest (cust_ord_id, prod_id) values (92, 42);
insert into manifest (cust_ord_id, prod_id) values (93, 38);
insert into manifest (cust_ord_id, prod_id) values (94, 30);
insert into manifest (cust_ord_id, prod_id) values (95, 70);
insert into manifest (cust_ord_id, prod_id) values (96, 97);
insert into manifest (cust_ord_id, prod_id) values (97, 19);
insert into manifest (cust_ord_id, prod_id) values (98, 66);
insert into manifest (cust_ord_id, prod_id) values (99, 79);
insert into manifest (cust_ord_id, prod_id) values (100, 15);
insert into manifest (cust_ord_id, prod_id) values (101, 22);
insert into manifest (cust_ord_id, prod_id) values (102, 46);
insert into manifest (cust_ord_id, prod_id) values (103, 24);
insert into manifest (cust_ord_id, prod_id) values (104, 20);
insert into manifest (cust_ord_id, prod_id) values (105, 27);
insert into manifest (cust_ord_id, prod_id) values (106, 58);
insert into manifest (cust_ord_id, prod_id) values (107, 97);
insert into manifest (cust_ord_id, prod_id) values (108, 34);
insert into manifest (cust_ord_id, prod_id) values (109, 17);
insert into manifest (cust_ord_id, prod_id) values (110, 82);
insert into manifest (cust_ord_id, prod_id) values (111, 29);
insert into manifest (cust_ord_id, prod_id) values (112, 92);
insert into manifest (cust_ord_id, prod_id) values (113, 45);
insert into manifest (cust_ord_id, prod_id) values (114, 87);
insert into manifest (cust_ord_id, prod_id) values (115, 60);
insert into manifest (cust_ord_id, prod_id) values (116, 55);
insert into manifest (cust_ord_id, prod_id) values (117, 72);
insert into manifest (cust_ord_id, prod_id) values (118, 61);
insert into manifest (cust_ord_id, prod_id) values (119, 100);
insert into manifest (cust_ord_id, prod_id) values (120, 15);
insert into manifest (cust_ord_id, prod_id) values (121, 11);
insert into manifest (cust_ord_id, prod_id) values (122, 60);
insert into manifest (cust_ord_id, prod_id) values (123, 15);
insert into manifest (cust_ord_id, prod_id) values (124, 50);
insert into manifest (cust_ord_id, prod_id) values (125, 24);
insert into manifest (cust_ord_id, prod_id) values (126, 52);
insert into manifest (cust_ord_id, prod_id) values (127, 66);
insert into manifest (cust_ord_id, prod_id) values (128, 14);
insert into manifest (cust_ord_id, prod_id) values (129, 60);
insert into manifest (cust_ord_id, prod_id) values (130, 41);
insert into manifest (cust_ord_id, prod_id) values (131, 57);
insert into manifest (cust_ord_id, prod_id) values (132, 1);
insert into manifest (cust_ord_id, prod_id) values (133, 54);
insert into manifest (cust_ord_id, prod_id) values (134, 80);
insert into manifest (cust_ord_id, prod_id) values (135, 3);
insert into manifest (cust_ord_id, prod_id) values (136, 48);
insert into manifest (cust_ord_id, prod_id) values (137, 32);
insert into manifest (cust_ord_id, prod_id) values (138, 48);
insert into manifest (cust_ord_id, prod_id) values (139, 100);
insert into manifest (cust_ord_id, prod_id) values (140, 59);
insert into manifest (cust_ord_id, prod_id) values (141, 30);
insert into manifest (cust_ord_id, prod_id) values (142, 22);
insert into manifest (cust_ord_id, prod_id) values (143, 7);
insert into manifest (cust_ord_id, prod_id) values (144, 34);
insert into manifest (cust_ord_id, prod_id) values (145, 29);
insert into manifest (cust_ord_id, prod_id) values (146, 79);
insert into manifest (cust_ord_id, prod_id) values (147, 97);
insert into manifest (cust_ord_id, prod_id) values (148, 69);
insert into manifest (cust_ord_id, prod_id) values (149, 67);
insert into manifest (cust_ord_id, prod_id) values (150, 29);
