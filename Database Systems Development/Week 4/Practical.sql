CREATE DATABASE code_test;

\c code_test

CREATE TABLE table_one (
    record_id INT PRIMARY KEY,
    att_1 VARCHAR(30),
    att_2 CHAR(10),
    att_3 DECIMAL(3,2)
);

ALTER TABLE table_one ADD COLUMN att_4 INT;

INSERT INTO table_one (record_id, att_1, att_2, att_3, att_4) VALUES (1, 'continent', '0olP$fguj', 9.99, 42);
INSERT INTO table_one (record_id, att_1, att_2, att_3, att_4) VALUES (2, 'Portsmouth University', 'Violet', 9.99, 99999);

UPDATE table_one SET att_4 = 66 WHERE record_id = 1;

SELECT * FROM table_one WHERE record_id = 1;