/*
James Liang
Lab 12z
*/

/*
DROP TABLE TRIP_DETAILS;
DROP TABLE DESTINATION;
DROP TABLE CAPTAIN;
DROP TABLE BOAT;
DROP SEQUENCE PRIMARY_KEY_SEQUENCE;
DROP VIEW V_AVAILABLE_TRIPS;
*/

--1.
CREATE SEQUENCE PRIMARY_KEY_SEQUENCE
START WITH 1
INCREMENT BY 1
MINVALUE 0 
MAXVALUE 9999999;

--2.
CREATE TABLE BOAT (
ID NUMBER DEFAULT PRIMARY_KEY_SEQUENCE.NEXTVAL PRIMARY KEY, 
REGISTRATION_NUMBER VARCHAR2(20) NOT NULL UNIQUE,
NAME VARCHAR2(30) NOT NULL 
);

CREATE TABLE CAPTAIN (
ID NUMBER DEFAULT PRIMARY_KEY_SEQUENCE.NEXTVAL PRIMARY KEY, 
FIRST_NAME VARCHAR2(20) NOT NULL,
LAST_NAME VARCHAR2(20) NOT NULL,
MOBILE_PHONE_NUMBER NUMBER NOT NULL
);

CREATE TABLE DESTINATION (
ID NUMBER DEFAULT PRIMARY_KEY_SEQUENCE.NEXTVAL PRIMARY KEY, 
NAME VARCHAR2(50) NOT NULL
);

CREATE TABLE TRIP (
ID NUMBER DEFAULT PRIMARY_KEY_SEQUENCE.NEXTVAL PRIMARY KEY, 
BOAT_ID NUMBER REFERENCES BOAT(ID),
CAPTAIN_ID NUMBER REFERENCES CAPTAIN(ID),
DESTINATION_ID NUMBER REFERENCES DESTINATION(ID),
NUMBER_OF_GUESTS NUMBER NOT NULL
);

--3.
ALTER TABLE BOAT ADD CAPACITY NUMBER NOT NULL;
ALTER TABLE BOAT ADD REGISTRATION_EXP_DATE DATE NOT NULL;

ALTER TABLE CAPTAIN RENAME COLUMN MOBILE_PHONE_NUMBER TO PHONE_NUMBER;

ALTER TABLE TRIP ADD NUMBER_OF_CREW NUMBER NOT NULL;
ALTER TABLE TRIP ADD START_DATE DATE NOT NULL;

ALTER TABLE TRIP ADD CONSTRAINT NUMBER_OF_CREW_CHECK CHECK (NUMBER_OF_CREW > 0);

ALTER TABLE TRIP RENAME TO TRIP_DETAILS;

--4.
INSERT INTO BOAT VALUES(PRIMARY_KEY_SEQUENCE.NEXTVAL, 'FL-12345', 'PRANCING SEA HORSE', 6, '31-DEC-19');
INSERT INTO BOAT VALUES(PRIMARY_KEY_SEQUENCE.NEXTVAL, 'FL-54321', 'SLOW AND STADY', 11, '31-DEC-20');
INSERT INTO BOAT VALUES(PRIMARY_KEY_SEQUENCE.NEXTVAL, 'FL-10101', 'EAT MY BUBBLES', 3, '31-DEC-21');
INSERT INTO CAPTAIN VALUES(PRIMARY_KEY_SEQUENCE.NEXTVAL,'Becka', 'Swifterson', 1112221234);
INSERT INTO CAPTAIN VALUES(PRIMARY_KEY_SEQUENCE.NEXTVAL, 'Birdy', 'Bold', 2223331234);
INSERT INTO DESTINATION VALUES(PRIMARY_KEY_SEQUENCE.NEXTVAL, 'FANCY KEY');
INSERT INTO DESTINATION VALUES(PRIMARY_KEY_SEQUENCE.NEXTVAL, 'FUN CAY');

insert into trip_details (boat_id,captain_id,destination_id,number_of_guests,number_of_crew,start_date)
    select
        (select id from boat where name = 'EAT MY BUBBLES'),
        (select id from captain where first_name = 'Becka'),
        (select id from destination where name = 'FUN CAY'),
        2,
        1,
        sysdate+14
    from dual;
commit;

--5.
CREATE VIEW V_AVAILABLE_TRIPS AS 
SELECT DESTINATION.NAME AS DESTINATION, TRIP_DETAILS.START_DATE AS TRIP_LEAVES_ON, BOAT.NAME AS ON_BOAT, CAPTAIN.FIRST_NAME || ' ' || CAPTAIN.LAST_NAME AS WITH_CAPTAIN, TRIP_DETAILS.NUMBER_OF_GUESTS AS MAX_NUMBER_OF_GUESTS FROM TRIP_DETAILS 
INNER JOIN DESTINATION ON DESTINATION.ID = TRIP_DETAILS.DESTINATION_ID
INNER JOIN BOAT ON BOAT.ID = TRIP_DETAILS.BOAT_ID
INNER JOIN CAPTAIN ON CAPTAIN.ID = TRIP_DETAILS.CAPTAIN_ID;

--6.
SELECT * FROM BOAT WHERE ID NOT IN(SELECT BOAT_ID FROM TRIP_DETAILS);
SELECT * FROM CAPTAIN WHERE ID NOT IN(SELECT CAPTAIN_ID FROM TRIP_DETAILS);

--7.
CREATE INDEX FK_BOAT_ID_IX ON TRIP_DETAILS(BOAT_ID);

--8.
GRANT SELECT ON V_AVAILABLE_TRIPS TO PUBLIC;

--9.
CREATE PUBLIC SYNONYM TRIPS FOR V_AVAILABLE_TRIPS;

