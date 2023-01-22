-- Get all services scheduled in the next 3 months, including customer information and information about the service, ordered by the date they are scheduled
SELECT s.service_id AS "Service", TO_CHAR(s.scheduled_datetime, 'HH24:MI DD/MM/YY') AS "Scheduled", sc.category_title AS "Service Category", s.description AS "Description", b.boat_id AS "Boat", b.model AS "Boat Model", b.name AS "Boat Name", CONCAT_WS(' ', c.forename, c.surname) AS "Customer Name", c.email AS "Email Address", c.phone AS "Phone Number"
FROM service s
JOIN service_category sc ON s.category_id = sc.category_id
JOIN boat b ON s.boat_id = b.boat_id
JOIN customer c ON b.owner_id = c.customer_id
WHERE s.scheduled_datetime >= NOW()::TIMESTAMP
AND s.scheduled_datetime < NOW()::TIMESTAMP +INTERVAL '+90 DAYS'
ORDER BY s.scheduled_datetime;

-- At the time of writing, the output is as follows:

-- Service |   Scheduled    | Service Category |                                    Description                                    | Boat |     Boat Model     |    Boat Name    |   Customer Name   |         Email Address          |  Phone Number   
-----------+----------------+------------------+-----------------------------------------------------------------------------------+------+--------------------+-----------------+-------------------+--------------------------------+-----------------
--      21 | 13:00 04/02/23 | Hull Repair      | Fill leak in hull                                                                 |   10 | Trawler Class A    | Soteria         | Hayden Mcbride    | hayden.mcbride@protonmail.com  | (013541) 28515
--     103 | 14:30 09/02/23 | Annual Service   | Full Annual Service (Check fluids, inspect hull, inspect electrical systems, etc) |    9 | FPB 78             | Cochise         | Riley Peck        | rpeck@hotmail.net              | 
--     110 | 09:00 15/02/23 | Annual Service   | Full Annual Service (Check fluids, inspect hull, inspect electrical systems, etc) |   22 | Oyster 655         | Daena           | Erasmus Velasquez |                                | 0897 199 8365
--      49 | 11:30 18/02/23 | Hull Repair      | Fix collision damage                                                              |   20 | Super Swordsman 33 | La Grande Sword | Simone Hernandez  | s_hernandez6593@icloud.edu     | (0116) 744 3717
--       8 | 10:30 22/02/23 | Other            | Replace rigging                                                                   |   19 | Pegasus 50 Globe   | Zulu II         | MacKenzie Dickson | d_mackenzie@yahoo.com          | 0800 1111
--     119 | 10:00 26/02/23 | Annual Service   | Full Annual Service (Check fluids, inspect hull, inspect electrical systems, etc) |   28 | Bowman 48          | Boandaro        | Jack Byrd         | b-jack2829@protonmail.net      | 056 6296 3175
--       9 | 16:30 26/02/23 | Hull Repair      | Fibreglass repair                                                                 |   28 | Bowman 48          | Boandaro        | Jack Byrd         | b-jack2829@protonmail.net      | 056 6296 3175
--      62 | 16:30 05/03/23 | Engine Overhaul  | Replace engine heads                                                              |   13 | FPB 78             | Grey Wolf II    | Calvin Douglas    |                                | 0500 869137
--      57 | 12:30 08/03/23 | Engine Overhaul  | Replace engine heads                                                              |   27 | International 8    | Mirabelle       | Declan Hensley    | declanhensley858@protonmail.ca | 0845 46 47
--      12 | 09:30 24/03/23 | Hull Repair      | Repair through hull hole                                                          |   15 | Seaward 35         | Gullfoss        | Yoshio Byers      |                                | (01545) 25161
--      81 | 10:00 25/03/23 | Other            | Replace interior                                                                  |   11 | FPB 83             | Wind Horse      | Reagan Watkins    | r-watkins@aol.org              | (028) 2847 4294
--      33 | 12:30 02/04/23 | Engine Overhaul  | Replace engine heads                                                              |   12 | Swan 44            | Astrid          | MacKenzie Young   | young-mackenzie@yahoo.org      | 0843 728 6822
--     115 | 09:00 03/04/23 | Annual Service   | Full Annual Service (Check fluids, inspect hull, inspect electrical systems, etc) |   19 | Pegasus 50 Globe   | Zulu II         | MacKenzie Dickson | d_mackenzie@yahoo.com          | 0800 1111
--      27 | 09:30 14/04/23 | Repainting       | Replace antifouling paint                                                         |    5 | Solaris One 44     | Alcibiades III  | Kellie Greene     |                                | 0800 125633