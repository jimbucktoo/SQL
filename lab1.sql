/*
James Liang
Lab 1
*/

--1. 
/* The SELECT statement can not be used to alter data within a table. It is
specifically used to select data from a database and store it in a result table.
*/

--2.
SELECT * FROM STUDENT.EMPLOYEE;

--3.
SELECT LAST_NAME, FIRST_NAME FROM STUDENT.STUDENT WHERE ROWNUM < 21;

--4.
SELECT LAST_NAME as LN, FIRST_NAME as FN FROM STUDENT.STUDENT WHERE ROWNUM < 21;

--5.
SELECT DISTINCT ZIP FROM STUDENT.STUDENT WHERE ROWNUM < 21;

--6.
SELECT LAST_NAME, LOWER(LAST_NAME) as "no capitalization" FROM STUDENT.STUDENT;

--7.
SELECT DESCRIPTION, SUBSTR(DESCRIPTION, 1, 3) as "First Three" FROM STUDENT.COURSE;

--8.
SELECT DESCRIPTION, SUBSTR(DESCRIPTION, -3) as "Last Three" FROM STUDENT.COURSE;

--9.
SELECT DISTINCT EMPLOYER FROM STUDENT.STUDENT WHERE ROWNUM < 21 ORDER BY EMPLOYER ASC;

--10.
SELECT DESCRIPTION, COURSE_NO FROM STUDENT.COURSE ORDER BY DESCRIPTION;

--11.
SELECT DESCRIPTION as "Course Description", COURSE_NO as "Course #" FROM STUDENT.COURSE ORDER BY DESCRIPTION;

--12.
SELECT DISTINCT PREREQUISITE FROM STUDENT.COURSE;

--13.
/* The dual table is a dummy table used to evaluate expressions and call functions containing one row and one column.
*/

--14.
SELECT * FROM DUAL;

--15.
SELECT 2+4 FROM DUAL;

--16.
SELECT 5*3 as "5 times 3", 5-3 as "5 minus 3", 5/3 as "5 divided by 3" FROM DUAL;

--17.
SELECT 5/3 as "Not Rounded", ROUND(5/3,2) as "Rounded" FROM DUAL;

--18.
SELECT SYSDATE FROM DUAL;

--19.
SELECT CURRENT_DATE FROM DUAL;

--20.
SELECT SYSDATE-1 as "Yesterday" FROM DUAL;
