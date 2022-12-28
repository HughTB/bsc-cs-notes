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
    name            VARCHAR(30) NOT NULL,
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
INSERT INTO role (role_title) values ('Manager');
INSERT INTO role (role_title) values ('Glass Fibre Specialist');
INSERT INTO role (role_title) values ('Engine Technician');
INSERT INTO role (role_title) values ('General');
INSERT INTO role (role_title) values ('Electrician');
INSERT INTO role (role_title) values ('Technician');

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
    ('Zenaida','Valentine','v.zenaida7166@hotmail.edu','07624 186777','897-5533 Consequat Rd.','Yeovil','S6 7IG'),
    ('Kadeem','Rocha',null,'(0114) 542 6677','3505 Non, Street','Dumfries','XF5 3QO'),
    ('Briar','Mathis','briar.mathis3647@google.org','070 7735 7782','4048 Eu Av.','Falmouth','J2 7WG'),
    ('Ronan','Winters','w-ronan@aol.uk',null,'6649 Ut, Road','Inverness','BY66 8BP'),
    ('Tanner','Flynn','flynn.tanner3248@hotmail.ca','055 6871 2664','Ap #152-5484 Tristique Avenue','Great Yarmouth','GU2 3PQ'),
    ('Rahim','Mcmahon',null,'0845 46 40','118-3260 Lacinia Road','Kinross','WB1 7YO'),
    ('Naomi','Benson','naomi_benson6257@outlook.net','0801 976 2754','Ap #772-6357 Curabitur Rd.','Blairgowrie','N59 6BI'),
    ('Neil','Leon','nleon@google.com',null,'Ap #868-5661 Dolor, Avenue','Solihull','SC3D 7DR'),
    ('Faith','Mclaughlin','f_mclaughlin@protonmail.org','056 7663 0820','Ap #169-3889 Vestibulum Ave','Durness','UL7 1BF'),
    ('Shana','Sanchez',null,'(016078) 26067','5616 Cursus Road','Bathgate','YK4 4LY'),
    ('Holmes','Banks','banksholmes@hotmail.edu','055 6352 1840','975-4941 Id Street','Kirkby Lonsdale','RN7M 9PO'),
    ('Jaquelyn','Cook','cookjaquelyn@google.uk','0956 037 4421','Ap #503-3919 Amet Street','Bicester','H30 6UU'),
    ('Derek','Mcconnell','mcconnell_derek@aol.edu','0800 734 8739','Ap #113-7712 Velit St.','Newtonmore','DH45 3TA'),
    ('Edan','Lindsey',null,'(0171) 607 7943','Ap #635-2180 Tellus Road','Ruthin','KB6Z 1PY'),
    ('Lana','Cobb','cobb-lana8075@hotmail.uk',null,'Ap #849-5928 Pellentesque Street','Lancaster','W51 6AD'),
    ('Holmes','Carey',null,'0914 715 2533','636-5909 Sodales St.','Rugby','H1 8WN');