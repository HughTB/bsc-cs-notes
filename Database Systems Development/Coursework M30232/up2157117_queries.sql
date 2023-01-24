-- Query 1: Get all services scheduled in the next 3 months, including customer information and information about the service, ordered by the date they are scheduled, e.g. to allow for customers to be contacted to confirm future service appointments
SELECT s.service_id AS "Service", TO_CHAR(s.scheduled_datetime, 'HH24:MI DD/MM/YY') AS "Scheduled", sc.category_title AS "Service Category", s.description AS "Description", b.boat_id AS "Boat", b.model AS "Boat Model", b.name AS "Boat Name", CONCAT_WS(' ', c.forename, c.surname) AS "Customer Name", c.email AS "Email Address", c.phone AS "Phone Number"
FROM service s
JOIN service_category sc ON s.category_id = sc.category_id
JOIN boat b ON s.boat_id = b.boat_id
JOIN customer c ON b.owner_id = c.customer_id
WHERE s.scheduled_datetime >= NOW()::TIMESTAMP
AND s.scheduled_datetime < NOW()::TIMESTAMP +INTERVAL '+90 DAYS'
ORDER BY s.scheduled_datetime;

-- At the time of writing (24/01/23), the output is as follows (This may change, as it is based upon the date the query is run):
/*
 Service |   Scheduled    | Service Category |                                    Description                                    | Boat |     Boat Model     |    Boat Name    |   Customer Name   |         Email Address          |  Phone Number   
---------+----------------+------------------+-----------------------------------------------------------------------------------+------+--------------------+-----------------+-------------------+--------------------------------+-----------------
      21 | 13:00 04/02/23 | Hull Repair      | Fill leak in hull                                                                 |   10 | Trawler Class A    | Soteria         | Hayden Mcbride    | hayden.mcbride@protonmail.com  | (013541) 28515
     103 | 14:30 09/02/23 | Annual Service   | Full Annual Service (Check fluids, inspect hull, inspect electrical systems, etc) |    9 | FPB 78             | Cochise         | Riley Peck        | rpeck@hotmail.net              | 
     110 | 09:00 15/02/23 | Annual Service   | Full Annual Service (Check fluids, inspect hull, inspect electrical systems, etc) |   22 | Oyster 655         | Daena           | Erasmus Velasquez |                                | 0897 199 8365
      49 | 11:30 18/02/23 | Hull Repair      | Fix collision damage                                                              |   20 | Super Swordsman 33 | La Grande Sword | Simone Hernandez  | s_hernandez6593@icloud.edu     | (0116) 744 3717
       8 | 10:30 22/02/23 | Other            | Replace rigging                                                                   |   19 | Pegasus 50 Globe   | Zulu II         | MacKenzie Dickson | d_mackenzie@yahoo.com          | 0800 1111
     119 | 10:00 26/02/23 | Annual Service   | Full Annual Service (Check fluids, inspect hull, inspect electrical systems, etc) |   28 | Bowman 48          | Boandaro        | Jack Byrd         | b-jack2829@protonmail.net      | 056 6296 3175
       9 | 16:30 26/02/23 | Hull Repair      | Fibreglass repair                                                                 |   28 | Bowman 48          | Boandaro        | Jack Byrd         | b-jack2829@protonmail.net      | 056 6296 3175
      62 | 16:30 05/03/23 | Engine Overhaul  | Replace engine heads                                                              |   13 | FPB 78             | Grey Wolf II    | Calvin Douglas    |                                | 0500 869137
      57 | 12:30 08/03/23 | Engine Overhaul  | Replace engine heads                                                              |   27 | International 8    | Mirabelle       | Declan Hensley    | declanhensley858@protonmail.ca | 0845 46 47
      12 | 09:30 24/03/23 | Hull Repair      | Repair through hull hole                                                          |   15 | Seaward 35         | Gullfoss        | Yoshio Byers      |                                | (01545) 25161
      81 | 10:00 25/03/23 | Other            | Replace interior                                                                  |   11 | FPB 83             | Wind Horse      | Reagan Watkins    | r-watkins@aol.org              | (028) 2847 4294
      33 | 12:30 02/04/23 | Engine Overhaul  | Replace engine heads                                                              |   12 | Swan 44            | Astrid          | MacKenzie Young   | young-mackenzie@yahoo.org      | 0843 728 6822
     115 | 09:00 03/04/23 | Annual Service   | Full Annual Service (Check fluids, inspect hull, inspect electrical systems, etc) |   19 | Pegasus 50 Globe   | Zulu II         | MacKenzie Dickson | d_mackenzie@yahoo.com          | 0800 1111
      27 | 09:30 14/04/23 | Repainting       | Replace antifouling paint                                                         |    5 | Solaris One 44     | Alcibiades III  | Kellie Greene     |                                | 0800 125633
*/

-- Query 2: Get all engine services performed in October or November 2022 on diesel boats, including owner's contact details, e.g. so that affected customers can be contacted in the event that, for example, a batch of contaminated fuel was used during services
SELECT s.service_id AS "Service", TO_CHAR(s.completed_datetime, 'HH24:MI DD/MM/YY') AS "Completed", sc.category_title AS "Service Category", s.description AS "Service Description", b.boat_id as "Boat", b.model AS "Boat Model", b.name AS "Boat Name", b.fuel_type AS "Fuel Type", CONCAT_WS(' ', c.forename, c.surname) AS "Customer Name", c.email AS "Email Address", c.phone AS "Phone Number"
FROM service s
JOIN service_category sc ON s.category_id = sc.category_id
JOIN boat b ON s.boat_id = b.boat_id
JOIN customer c on b.owner_id = c.customer_id
WHERE s.completed_datetime <= '2022-11-30'
AND s.completed_datetime >= '2022-10-01'
AND b.fuel_type LIKE 'Diesel'
AND sc.category_title LIKE '%Engine%'
ORDER BY s.completed_datetime;

-- The output is as follows:
/*
 Service |   Completed    | Service Category | Service Description | Boat |   Boat Model    | Boat Name | Fuel Type | Customer Name  |         Email Address         |  Phone Number  
---------+----------------+------------------+---------------------+------+-----------------+-----------+-----------+----------------+-------------------------------+----------------
      91 | 16:30 27/10/22 | Engine Overhaul  | Replace engine      |   10 | Trawler Class A | Soteria   | Diesel    | Hayden Mcbride | hayden.mcbride@protonmail.com | (013541) 28515
      42 | 16:30 01/11/22 | Engine Overhaul  | Oil change          |    8 | Pearl 62        | Cicero    | Diesel    | Ralph Dorsey   | ralph-dorsey3155@yahoo.com    | 
*/

-- Query 3: Get all services performed for a specific customer (In this case, the customer with id 4), including the hours of work broken down by service, e.g. so that an invoice can be created for the work time of any services (assuming that the cost of parts will be calculated using the existing parts database)
SELECT s.service_id AS "Service", TO_CHAR(s.completed_datetime, 'HH24:MI DD/MM/YY') AS "Completed", sc.category_title AS "Service Category", s.description AS "Service Description", SUM(ss.work_hours) AS "Total Work Hours", b.boat_id AS "Boat", b.model AS "Boat Model", b.name AS "Boat Name", CONCAT_WS(' ', c.forename, c.surname) AS "Customer Name"
FROM service s
JOIN staff_service ss ON s.service_id = ss.service_id
JOIN service_category sc ON s.category_id = sc.category_id
JOIN boat b ON s.boat_id = b.boat_id
JOIN customer c ON b.owner_id = c.customer_id
WHERE c.customer_id = 32
AND s.completed_datetime IS NOT NULL
GROUP BY s.service_id, ss.service_id, sc.category_title, b.boat_id, c.forename, c.surname
ORDER BY s.completed_datetime;

-- The output is as follows:
/*
 Service |   Completed    | Service Category |                                Service Description                                | Total Work Hours | Boat |   Boat Model    | Boat Name | Customer Name  
---------+----------------+------------------+-----------------------------------------------------------------------------------+------------------+------+-----------------+-----------+----------------
      54 | 10:30 10/06/21 | Hull Repair      | Fix collision damage                                                              |             80.5 |   14 | Discovery 55    | Vela Vee  | Hayden Mcbride
      59 | 11:00 10/07/22 | Annual Service   | Full Annual Service (Check fluids, inspect hull, inspect electrical systems, etc) |             20.8 |   10 | Trawler Class A | Soteria   | Hayden Mcbride
      91 | 16:30 27/10/22 | Engine Overhaul  | Replace engine                                                                    |             44.2 |   10 | Trawler Class A | Soteria   | Hayden Mcbride
*/

-- Query 4: Get all services performed by a specific memeber of staff (In this case, the member of staff with id 8) in the last 3 months, e.g. 
SELECT s.service_id AS "Service", TO_CHAR(s.completed_datetime, 'HH24:MI DD/MM/YY') AS "Completed", CONCAT_WS(' ', st.forename, st.surname) AS "Staff Name", sc.category_title AS "Service Category", ss.work_hours AS "Work Hours", b.boat_id AS "Boat", b.model AS "Boat Model", b.name AS "Boat Name"
FROM service s
JOIN staff_service ss ON s.service_id = ss.service_id
JOIN staff st ON ss.staff_id = st.staff_id
JOIN boat b ON s.boat_id = b.boat_id
JOIN service_category sc ON s.category_id = sc.category_id
WHERE st.staff_id = 8
AND s.completed_datetime <= NOW()::TIMESTAMP
AND s.completed_datetime >= NOW()::TIMESTAMP +INTERVAL '-90 DAYS'
ORDER BY s.service_id;

-- At the time of writing (24/01/23), the output is as follows (This may change, as it is based upon the date the query is run):
/*
 Service |   Completed    |    Staff Name    | Service Category | Work Hours | Boat | Boat Model  |   Boat Name   
---------+----------------+------------------+------------------+------------+------+-------------+---------------
       6 | 12:00 21/11/22 | Valentine Mullen | Repainting       |       40.0 |   32 | Dawn 39     | Findhorn
      47 | 13:30 23/11/22 | Valentine Mullen | Annual Service   |       46.2 |    3 | Oceanis 361 | Walkabout III
*/

-- Query 5: Find all members of staff with the role of 'General' (Role id 4), including names and contact details, sorted alphabetically by name, e.g. So that an email about optional additional specialisation training can be sent out
SELECT st.staff_id AS "Staff ID", by.boatyard_id AS "Boatyard", CONCAT_WS(' ', st.forename, st.surname) AS "Name", st.work_email AS "Work Email", st.work_phone AS "Work Phone", r.role_title AS "Role"
FROM staff st
JOIN staff_role sr ON st.staff_id = sr.staff_id
JOIN role r ON sr.role_id = r.role_id
JOIN boatyard by ON st.boatyard_id = by.boatyard_id
WHERE r.role_id = 4
ORDER BY st.surname, st.forename;

-- The output is as follows:
/*
 Staff ID | Boatyard |       Name       |        Work Email         |  Work Phone   |  Role   
----------+----------+------------------+---------------------------+---------------+---------
       16 |        3 | Kim Barr         | kbarr@solentboats.com     |               | General
        2 |        1 | Tanisha Dodson   | tdodson@solentboats.com   | 070 1775 1753 | General
       30 |        5 | Elaine Mercado   | emercado@solentboats.com  | (01413) 47129 | General
       23 |        4 | Linus Neal       | lneal@solentboats.com     |               | General
       27 |        5 | Inga Preston     | ipreston@solentboats.com  | 076 7241 2428 | General
        9 |        2 | Wynne Travis     | wtravis@solentboats.com   |               | General
       18 |        3 | Frances Trujillo | ftrujillo@solentboats.com | (01044) 28354 | General
*/