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