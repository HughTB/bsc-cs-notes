-- Query 1: Get all services scheduled in the next 3 months, including customer information and information about the service, ordered by the date they are scheduled, e.g. to allow for customers to be contacted to confirm future service appointments
SELECT s.service_id AS "Service", TO_CHAR(s.scheduled_datetime, 'HH24:MI DD/MM/YY') AS "Scheduled", sc.category_title AS "Service Category", s.description AS "Description", b.boat_id AS "Boat", b.model AS "Boat Model", b.name AS "Boat Name", CONCAT_WS(' ', c.forename, c.surname) AS "Customer Name", c.email AS "Email Address", c.phone AS "Phone Number"
FROM service s
JOIN service_category sc ON s.category_id = sc.category_id
JOIN boat b ON s.boat_id = b.boat_id
JOIN customer c ON b.owner_id = c.customer_id
WHERE s.scheduled_datetime >= NOW()::TIMESTAMP
AND s.scheduled_datetime < NOW()::TIMESTAMP +INTERVAL '+90 DAYS'
ORDER BY s.scheduled_datetime;

-- At the time of writing, the output is as follows (This may change, as it is based upon the date the query is run):
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

-- Query 3: Get all services performed for a specific customer, including details of the boat, as well as the total work hours spent on each service, e.g. so that an invoice can be created for the work time of any services (assuming that parts will be calculated using the existing parts database)
SELECT s.service_id AS "Service", TO_CHAR(s.completed_datetime, 'HH24:MI DD/MM/YY') AS "Completed", sc.category_title AS "Service Category", s.description AS "Service Description", SUM(ss.work_hours) AS "Work Hours", b.boat_id AS "Boat", b.model AS "Boat Model", b.name AS "Boat Name", CONCAT_WS(' ', c.forename, c.surname) AS "Customer Name"
FROM service s
JOIN staff_service ss ON s.service_id = ss.service_id
JOIN service_category sc ON s.category_id = sc.category_id
JOIN boat b ON s.boat_id = b.boat_id
JOIN customer c ON b.owner_id = c.customer_id
WHERE c.customer_id = 4
GROUP BY s.service_id, ss.service_id
ORDER BY s.completed_datetime;
