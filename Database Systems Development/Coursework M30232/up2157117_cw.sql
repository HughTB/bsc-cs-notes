-- Create and connect to database
CREATE DATABASE up2157117_cw;

\c up2157117_cw

-- Create tables
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    forename    VARCHAR(20) NOT NULL,
    surname     VARCHAR(20) NOT NULL,
    email       VARCHAR(254),
    phone       VARCHAR(20),
    address1    VARCHAR(40) NOT NULL,
    address2    VARCHAR(40),
    town        VARCHAR(60),
    postcode    CHAR(9) NOT NULL
);

CREATE TABLE boat(
    boat_id         SERIAL PRIMARY KEY,
    owner_id        INT NOT NULL REFERENCES customer(customer_id),
    builder         VARCHAR(30) NOT NULL,
    model           VARCHAR(30),
    name            VARCHAR(50) NOT NULL,
    engine_size     INT,
    engine_count    INT,
    fuel_type       VARCHAR(10),
    build_date      DATE
);

CREATE TABLE service(
    service_id      SERIAL PRIMARY KEY,
    description     VARCHAR(200),
    scheduled_datetime  TIMESTAMP NOT NULL,
    completed_datetime  TIMESTAMP,
    boat_id         INT NOT NULL REFERENCES boat(boat_id)
);

CREATE TABLE boatyard(
    boatyard_id SERIAL PRIMARY KEY,
    phone       VARCHAR(20) NOT NULL,
    address1    VARCHAR(40) NOT NULL,
    address2    VARCHAR(40),
    town        VARCHAR(60),
    postcode    CHAR(9) NOT NULL
);

CREATE TABLE staff(
    staff_id    SERIAL PRIMARY KEY,
    forename    VARCHAR(20) NOT NULL,
    surname     VARCHAR(20) NOT NULL,
    work_email  VARCHAR(254) NOT NULL,
    work_phone  VARCHAR(20),
    home_email  VARCHAR(254) NOT NULL,
    home_phone  VARCHAR(20),
    address1    VARCHAR(40) NOT NULL,
    address2    VARCHAR(40),
    town        VARCHAR(60),
    postcode    CHAR(9) NOT NULL,
    boatyard_id INT NOT NULL REFERENCES boatyard(boatyard_id)
);

CREATE TABLE staff_service(
    staff_id    INT NOT NULL REFERENCES staff(staff_id),
    service_id  INT NOT NULL REFERENCES service(service_id),
    work_hours  DECIMAL(4,1),

    PRIMARY KEY (staff_id, service_id)
);

CREATE TABLE role(
    role_id     SERIAL PRIMARY KEY,
    role_title  VARCHAR(30)
);

CREATE TABLE staff_role(
    role_id     INT NOT NULL REFERENCES role(role_id),
    staff_id    INT NOT NULL REFERENCES staff(staff_id),

    PRIMARY KEY (role_id, staff_id)
);

-- Insert roles
INSERT INTO role (role_title) VALUES
    ('Manager'),
    ('Glass Fibre Specialist'),
    ('Engine Technician'),
    ('General'),
    ('Electrician'),
    ('Technician');

-- Dummy customer data (Generated using generatedata.com)
INSERT INTO customer (forename,surname,email,phone,address1,town,postcode) VALUES
    ('Maryam','Hutchinson','m.hutchinson2000@google.edu',null,'Ap #649-7365 Risus, Avenue','Stourbridge','HD66 1QG'),
    ('Amir','Hampton','amirhampton8066@icloud.com','0800 185 8333','281-2470 Nec, Rd.','Hatfield','ET62 8ZT'),
    ('Olympia','Cunningham',null,'07876 670897','2165 Semper Rd.','Bridgnorth','E6 2DX'),
    ('Ferdinand','Randolph','randolph-ferdinand2091@outlook.com',null,'P.O. Box 852, 1015 Augue Av.','Armadale','WJ8A 3VN'),
    ('Briar','Pace',null,'(012362) 69310','Ap #834-8990 Sed Ave','Falmouth','PV5 3EM'),
    ('Honorato','Chang','c_honorato8263@google.edu','(0121) 136 5356','614-1040 In Av.','Chepstow','JD54 5OZ'),
    ('Athena','Carter','acarter@hotmail.net','07151 644536','792-2974 Penatibus Rd.','Helmsdale','AU88 4DA'),
    ('Riley','Peck','rpeck@hotmail.net',null,'Ap #821-6041 Feugiat St.','Inverness','BD78 9UD'),
    ('Erasmus','Velasquez',null,'0897 199 8365','Ap #347-8463 Enim. Road','Barrow-in-Furness','HX5K 8XX'),
    ('Kellie','Greene',null,'0800 125633','Ap #444-9573 Tempor Rd.','Macduff','IX5C 5IM'),
    ('MacKenzie','Young','young-mackenzie@yahoo.org','0843 728 6822','P.O. Box 337, 9474 Malesuada St.','Menai Bridge','L52 6AL'),
    ('MacKenzie','Dickson','d_mackenzie@yahoo.com','0800 1111','Ap #161-6726 Primis Av.','Marlborough','K05 3IK'),
    ('Ralph','Dorsey','ralph-dorsey3155@yahoo.com',null,'Ap #347-1023 Neque St.','Sherborne','E69 9WU'),
    ('Ishmael','Henry','i-henry8775@google.net','07624 758738','9596 Egestas St.','Abergavenny','K5 8DE'),
    ('Lilah','Campbell','c-lilah@aol.ca','(0119) 451 2823','838-8427 Maecenas Road','Wimborne Minster','P80 4SR'),
    ('Yoshio','Byers',null,'(01545) 25161','Ap #116-3461 Nunc Ave','Flint','T44 5RJ'),
    ('Castor','Meadows','cmeadows6821@protonmail.uk','0364 454 1615','P.O. Box 495, 2451 Fringilla Street','New Galloway','TM66 1GF'),
    ('Octavia','Quinn','quinnoctavia7656@outlook.edu',null,'6574 Eu St.','Coalville','X9 8OT'),
    ('Daria','Romero','rdaria9945@hotmail.net','076 3394 7320','P.O. Box 188, 102 Ultricies Rd.','Slough','MJ1 8ZY'),
    ('Reagan','Watkins','r-watkins@aol.org','(028) 2847 4294','P.O. Box 562, 899 Eu Rd.','Chatteris','BM98 6IY'),
    ('Dexter','Hansen',null,'0389 706 4481','411-1900 Est Avenue','Kelso','EF0 4KP'),
    ('Tallulah','Fuentes','f.tallulah@hotmail.org',null,'Ap #668-732 At Street','St. Asaph','I16 9RO'),
    ('Jack','Byrd','b-jack2829@protonmail.net','056 6296 3175','Ap #477-734 Non, St.','Morpeth','BP4W 8RG'),
    ('Hall','Fuentes',null,'(01420) 666864','429-2301 Bibendum Av.','Elgin','A17 9MI'),
    ('Simone','Hernandez','s_hernandez6593@icloud.edu','(0116) 744 3717','990-5073 Ac Rd.','Paisley','VY2 2CO'),
    ('Oscar','Ramos','ramososcar@icloud.com','07685 314628','6061 Fames Rd.','Darlington','IF2T 6LO'),
    ('Simon','Alvarado','s.alvarado@protonmail.net','0500 384150','Ap #499-6226 Tincidunt St.','Cromer','N4 4UJ'),
    ('Calvin','Douglas',null,'0500 869137','Ap #499-9213 Euismod Rd.','Milnathort','GH88 6DO'),
    ('Gabriel','Lawrence','l.gabriel@aol.com',null,'104-2198 Mollis. Rd.','Oban','GU7W 4MW'),
    ('Perry','Tanner','tannerperry8803@hotmail.net','055 8632 1467','107-1852 Vulputate Av.','Bury St. Edmunds','P34 5TW'),
    ('Indigo','Gomez',null,'055 5336 7689','P.O. Box 178, 6907 Porttitor Street','Auldearn','L7 3TI'),
    ('Hayden','Mcbride','hayden.mcbride@protonmail.com','(013541) 28515','124-212 Nunc Rd.','Milton Keynes','YD73 6YO'),
    ('Declan','Hensley','declanhensley858@protonmail.ca','0845 46 47','483-9659 Nec Ave','Hastings','A0U 6XR'),
    ('Sybil','Weaver',null,'056 3276 6633','Ap #842-6123 Quisque Rd.','Salisbury','US82 7UR'),
    ('Zenaida','Valentine','v.zenaida7166@hotmail.edu','07624 186777','897-5533 Consequat Rd.','Yeovil','S6 7IG');

-- Dummy boatyard data (Phone numbers generated using generatedata.com)
INSERT INTO boatyard (phone,address1,address2,town,postcode) VALUES
    ('(023) 8018 3735','10 Hazel Rd.',null,'Southampton','SO19 7GB'),
    ('(023) 8002 8907','12 Belvidere Rd.',null,'Southampton','SO14 5QY'),
    ('(023) 9002 0480','10 Captains Row','Old Portsmouth','Portsmouth','PO1 2TT'),
    ('(023) 9085 1649','Unit 2, Pounds Yard',null,'Portsmouth','PO2 8QA'),
    ('(023) 8049 7165','58 Shore Rd.','Hythe','Southampton','SO45 6HE');

-- Dummy staff data (Generated using generatedata.com)
INSERT INTO staff (forename,surname,work_email,work_phone,home_email,home_phone,address1,town,postcode,boatyard_id) VALUES
-- Boatyard id 1
    ('Mia','Thornton','mthornton@solentboats.com','0500 565991','thornton-mia2376@yahoo.com','0845 46 44','367-4573 Sapien Rd.','Bursledon','SO31 3PE',1),
    ('Tanisha','Dodson','tdodson@solentboats.com','070 1775 1753','tanishadodson@hotmail.org','0954 781 4307','Ap #797-9224 Vel, Road','Southampton','SO15 9FH',1),
    ('Evelyn','Fernandez','efernandez@solentboats.com','07436 118542','efernandez@outlook.org','0926 216 8835','504-4349 Nec St.','Netley','SO31 3JH',1),
    ('Dante','Booker','dbooker@solentboats.com','(0141) 865 5384','dbooker7544@icloud.org','0817 884 2015','P.O. Box 328, 5502 Tellus. St.','Eastleigh','SO21 9KF',1),
    ('Kimberley','Carter','kcarter@solentboats.com','070 8680 8782','carter_kimberley1847@outlook.edu','0348 087 2346','431-7380 Semper St.','Totton','SO40 5UN',1),
    ('Tasha','Kirk','tkirk@solentboats.com','(024) 5570 1038','kirk-tasha@yahoo.ca','0845 46 42','P.O. Box 480, 7122 Gravida St.','Bursledon','SO31 7IX',1),
-- id 2
    ('Byron','Beck','bbeck@solentboats.com','0845 46 40','beck_byron5270@google.org','(016977) 9656','240-2211 Cras St.','Totton','SO40 3WS',2),
    ('Valentine','Mullen','vmullen@solentboats.com','056 1569 2404','mvalentine@outlook.org','070 3335 5513','826-3509 Mollis Street','Netley','SO32 3CU',2),
    ('Wynne','Travis','wtravis@solentboats.com','0845 46 42','wynnetravis3340@yahoo.ca','070 6729 3241','8071 Massa. Avenue','Netley','SO40 6DS',2),
    ('Irma','Bolton','ibolton@solentboats.com','0800 942 0787','bolton.irma8781@icloud.ca','0800 1111','P.O. Box 537, 6796 Nulla Road','Netley','SO12 8XO',2),
    ('Cherokee','Patrick','cpatrick@solentboats.com','07448 632217','cpatrick1426@hotmail.org','056 1404 5569','6832 At, Avenue','Eastleigh','SO18 4UH',2),
-- id 3
    ('Melvin','Garcia','mgarcia@solentboats.com','(025) 7443 1255','garcia-melvin@icloud.couk','0940 312 7163','217-1494 Curabitur Av.','Portsmouth','PO23 6IG',3),
    ('Finn','Sharp','fsharp@solentboats.com','(0116) 683 2750','sharp-finn5181@hotmail.edu','0319 838 2890','P.O. Box 638, 577 Et, Rd.','Portsmouth','PO2 7XM',3),
    ('Stephen','Justice','sjustice@solentboats.com','0800 1111','justice.stephen@yahoo.edu','070 4710 1413','P.O. Box 904, 7072 Nunc Rd.','Fareham','PO32 6FW',3),
    ('Kerry','Woodward','kwoodward@solentboats.com','(023) 1481 5465','woodward-kerry@outlook.org','070 2388 3431','P.O. Box 272, 8772 Nascetur St.','Portsmouth','PO5 1FD',3),
    ('Kim','Barr','kbarr@solentboats.com','070 8659 7667','kbarr5297@hotmail.org','0942 314 0366','Ap #349-3690 Vitae, Rd.','Fareham','PO13 9MO',3),
    ('Susan','Craft','scraft@solentboats.com','07232 888856','c_susan@hotmail.net','055 3395 7981','Ap #319-3501 Ligula Avenue','Portsmouth','PO3 5CQ',3),
    ('Frances','Trujillo','ftrujillo@solentboats.com','(01044) 28354','f.trujillo2242@aol.edu','(0114) 182 8693','Ap #765-2045 Erat Street','Portsmouth','PO2 1CX',3),
-- id 4
    ('Mikayla','Patterson','mpatterson@solentboats.com','0362 162 6182','p.mikayla515@aol.edu','(01614) 77535','581-1363 Pretium St.','Portsmouth','PO6 4EP',4),
    ('Phelan','Baker','pbaker@solentboats.com','(015624) 51143','phelan_baker@hotmail.org','076 5512 3963','277-4645 Magna. Ave','Portsmouth','PO12 2EP',4),
    ('Phillip','Morse','pmorse@solentboats.com','(0151) 831 5552','pmorse2437@hotmail.ca','(0114) 495 6636','313-2191 Orci. St.','Fareham','PO32 6DL',4),
    ('Miriam','Foley','mfoley@solentboats.com','(016977) 6177','m.foley571@outlook.com','(0113) 748 1152','P.O. Box 874, 803 Aliquet. St.','Fareham','PO31 2GH',4),
    ('Linus','Neal','lneal@solentboats.com','0800 1111','neal.linus@icloud.net','0800 097751','P.O. Box 264, 1691 Morbi Road','Portsmouth','PO7 4WL',4),
-- id 5
    ('Amir','Coffey','acoffey@solentboats.com','056 2843 6835','amir_coffey9031@aol.com','0800 323 8126','Ap #184-759 Lorem, Avenue','Totton','SO40 6FR',5),
    ('Kadeem','Glover','kglover@solentboats.com','0500 009263','g-kadeem@google.net','(01721) 49965','3409 Tincidunt St.','Bursledon','SO31 4NF',5),
    ('Sybil','Rogers','srogers@solentboats.com','(01326) 365433','s_rogers909@protonmail.net','0362 057 0642','Ap #338-8375 Sit Road','Southampton','SO16 9IM',5),
    ('Inga','Preston','ipreston@solentboats.com','076 7241 2428','inga-preston538@yahoo.edu','07624 110750','Ap #483-5448 Erat. Ave','Southampton','SO14 1AI',5),
    ('Tatum','Bridges','tbridges@solentboats.com','(01026) 21277','bridges.tatum7224@google.com','(0171) 628 0965','781-2599 Sociis Road','Netley','SO23 8GT',5),
    ('Daniel','Montgomery','dmontgomery@solentboats.com','076 7472 7509','m_daniel4580@yahoo.couk','056 7531 8244','Ap #629-1759 Risus. Road','Eastleigh','SO21 5RC',5),
    ('Elaine','Mercado','emercado@solentboats.com','(01413) 47129','e-mercado7272@google.couk','(01764) 58327','P.O. Box 331, 9367 Aliquet Street','Southampton','SO13 1MT',5);

-- Dummy staff role data
INSERT INTO staff_role (staff_id, role_id) VALUES
-- Boatyard 1
    (1, 1),
    (2, 4),
    (3, 5),
    (4, 2),
    (5, 3),
    (6, 6),
-- 2
    (7, 1),
    (7, 3),
    (8, 2),
    (9, 4),
    (10, 5),
    (11, 6),
-- 3
    (12, 1),
    (13, 3),
    (14, 5),
    (15, 6),
    (16, 4),
    (17, 2),
    (18, 4),
-- 4
    (19, 1),
    (19, 5),
    (20, 2),
    (21, 3),
    (22, 6),
    (23, 4),
-- 5
    (24, 2),
    (25, 3),
    (26, 1),
    (27, 4),
    (28, 6),
    (29, 5),
    (30, 4);

-- Dummy boat data (Sourced mostly from berthoninternational.com)
INSERT INTO boat (owner_id, builder, model, name, engine_size, engine_count, fuel_type, build_date) VALUES
    (35, 'Sunseeker', 'Camargue 50', 'Abraxas', 3200, 2, 'Diesel', '2002-04-19'),
    (29, 'Back Cove', 'Back Cove 26', 'Sea Kestrel', 2993, 1, 'Diesel', '2008-12-09'),
    (7, 'Beneteau', 'Oceanis 361', 'Walkabout III', null, 0, 'Sail', '2000-07-10'),
    (3, 'Salona Yachts', 'KER 65', 'Dark Horse of England', 3455, 1, 'Diesel', '2014-08-19'),
    (10, 'Solaris Yachts', 'Solaris One 44', 'Alcibiades III', null, 0, 'Sail', '2011-01-21'),
    (5, 'Southern Ocean', 'Volvo 70', 'Telefonica Black', null, 0, 'Sail', '2008-06-24'),
    (18, 'Storebro Bruks', 'Solo Ruff IV', 'Beata', 1500, 1, 'Diesel', '1963-08-04'),
    (13, 'Pearl Yachts', 'Pearl 62', 'Cicero', 12780, 2, 'Diesel', '2020-05-12'),
    (8, 'Dashew Offshore', 'FPB 78', 'Cochise', 6800, 2, 'Diesel', '2016-10-26'),
    (32, 'Marlin Yachting', 'Trawler Class A', 'Soteria', 6700, 1, 'Diesel', '2017-11-16'),
    (20, 'Dashew Offshore', 'FPB 83', 'Wind Horse', 4500, 2, 'Diesel', '2005-04-28'),
    (11, 'Nautor', 'Swan 44', 'Astrid', null, 0, 'Sail', '1972-09-28'),
    (28, 'Dashew Offshore', 'FPB 78', 'Grey Wolf II', 6800, 2, 'Diesel', '2017-09-26'),
    (32, 'Discovery Yachts', 'Discovery 55', 'Vela Vee', 3455, 1, 'Petrol', '2003-01-30'),
    (16, 'Seaward Marine', 'Seaward 35', 'Gullfoss', 4460, 1, 'Diesel', '2011-05-21'),
    (4, 'Cara Marine', 'Cara 18M', 'Hound of Royal Clarence', 12100, 2, 'Diesel', '2004-06-07'),
    (30, 'Bristol Yachts', 'Bristol 60', 'Oasis', 4100, 1, 'Diesel', '1997-08-18'),
    (4, 'Princess Yachts', 'Princess 43', 'Anahita', 5500, 2, 'Diesel', '2018-02-12'),
    (12, 'Pegasus Yachts', 'Pegasus 50 Globe', 'Zulu II', 2200, 1, 'Diesel', '2023-01-02'),
    (25, 'Fairey Marine', 'Super Swordsman 33', 'La Grande Sword', 3500, 2, 'Diesel', '1974-04-27'),
    (34, 'Thore Berntsson', 'Jennipher', 'Serendipity', 3600, 1, 'Diesel', '2004-06-16'),
    (9, 'Oyster Marine', 'Oyster 655', 'Daena', 6000, 1, 'Diesel', '2009-11-28'),
    (25, 'Troy Marine', 'Motor Explorer', 'Mrs Robinson', 3400, 2, 'Diesel', '2002-11-22'),
    (2, 'Axopar Boats', 'XC Cross Cabin', 'Sisu', 3400, 2, 'Petrol', '2021-07-12'),
    (18, 'Swordsman Marine', 'Swordsman 30', 'Revelation', 11200, 1, 'Diesel', '2005-04-12'),
    (26, 'Hakes', 'Raichel / Pugh 45', 'Pterodactyl', 2100, 1, 'Petrol', '2006-05-22'),
    (33, 'Keith Dobson Boats', 'International 8', 'Mirabelle', null, 0, 'Sail', '2012-09-27'),
    (23, 'Bowman Watercraft', 'Bowman 48', 'Boandaro', null, 0, 'Sail', '1993-07-22'),
    (15, 'Windy', 'SR52 Blackbird', 'Gosta', 5500, 3, 'Diesel', '2016-02-19'),
    (17, 'Nautisme', 'Tyker Class 40', 'Impulse', 1100, 1, 'Diesel', '2007-03-18'),
    (21, 'CR Yachts', 'CR 400 DS', 'Kung Byxlos', null, 0, 'Sail', '2002-07-19'),
    (22, 'Mustang Yachts', 'Dawn 39', 'Findhorn', null, 0, 'Sail', '1986-03-18'),
    (6, 'Sea Sports Boats', 'Explorer 2400', 'Delfina', 5500, 1, 'Diesel', '2006-04-18'),
    (31, 'Windy', 'Windy 29 Coho', 'Mystere', 5500, 1, 'Diesel', '2017-02-21'),
    (27, 'Marex', '310 Sun Cruiser', 'Moira', 2400, 2, 'Diesel', '2021-11-19'),
    (14, 'Nimbus Watercraft', '380 Coupe', 'Flora Mae', 3600, 2, 'Diesel', '2005-09-15'),
    (1, 'Hardy', 'Hardy 50', 'Pasiphae', 12820, 2, 'Diesel', '2008-12-02'),
    (19, 'Iguana Yachts', 'X100', 'Trekker', 4600, 2, 'Diesel', '2020-10-15'),
    (24, 'Tartan Marine', 'Tartan 40', 'Rum Runner IV', 1760, 1, 'Petrol', '1985-10-29'),
    (12, 'Windy', 'Ghibli 28', 'Willowind', 2400, 2, 'Petrol', '2008-09-24');