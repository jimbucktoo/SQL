/*
James Liang
Lab 4
*/

--1.
SELECT TO_CHAR(INVOICE_TOTAL, '$99,999.99') AS "Formatted" FROM AP.INVOICES FETCH FIRST 10 ROWS ONLY;

--2.
SELECT TO_CHAR(INVOICE_TOTAL, '9.99EEEE') AS "Scientific Notation" FROM AP.INVOICES FETCH FIRST 10 ROWS ONLY;

--3.
SELECT TO_CHAR(INVOICE_DATE, 'MM/DD/YYYY') AS "Formatted Invoice Date" FROM AP.INVOICES ORDER BY "Formatted Invoice Date" ASC FETCH FIRST 10 ROWS ONLY;

--4.
SELECT * FROM AP.INVOICES WHERE INVOICE_DATE='07-May-14';

--5.
SELECT stu.* FROM student.enrollment stu WHERE TRUNC(stu.enroll_date) = DATE '2007-01-30';

--6.
SELECT (CITY || ', ' || STATE || ' ' || ZIP) AS "All together with ||" FROM STUDENT.ZIPCODE ORDER BY CITY ASC FETCH FIRST 10 ROWS ONLY;

--7.
SELECT CITY, UPPER(CITY) AS "Upper", LOWER(city) AS "Lower", CITY AS "Mixed" FROM STUDENT.ZIPCODE ORDER BY CITY ASC FETCH FIRST 10 ROWS ONLY;

--8.
SELECT CITY FROM STUDENT.ZIPCODE WHERE LENGTH(CITY) >= 4 AND LENGTH(CITY) <= 9 ORDER BY CITY ASC FETCH FIRST 10 ROWS ONLY;

--9.
SELECT CITY, SUBSTR(CITY, 2, 3) AS "Two through Four" FROM STUDENT.ZIPCODE ORDER BY CITY ASC FETCH FIRST 10 ROWS ONLY;

--10.
SELECT CITY, SUBSTR(CITY, -3) AS "Last Three" FROM STUDENT.ZIPCODE ORDER BY CITY ASC FETCH FIRST 10 ROWS ONLY;

--11.
SELECT STUDENT_ID, NVL(MIDTERM_GRADE, 0) AS "No Grade Found", FINALEXAM_GRADE, QUIZ_GRADE FROM STUDENT.GRADE_SUMMARY;

--12.
SELECT * FROM (
SELECT STUDENT_ID, SALUTATION,
CASE
    WHEN SALUTATION IN('Dr.') THEN 'Doctor'
END AS "New Salutation"
FROM STUDENT.STUDENT
) 
WHERE "New Salutation" IS NOT NULL;

--13.
SELECT STREET_ADDRESS, RTRIM(STREET_ADDRESS) AS "Trimmed Address" FROM STUDENT.STUDENT ORDER BY STREET_ADDRESS FETCH FIRST 10 ROWS ONLY;

--14.
SELECT TO_NUMBER('123.45') AS "String to Number" FROM DUAL;

--15.
SELECT SQRT(4) AS "SQRT of 4", SQRT(0) AS "SQRT of 0" FROM DUAL;