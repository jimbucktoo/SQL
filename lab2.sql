/*
James Liang
Lab 2
*/

--1.
/* The WHERE statement is used to filter the records and return the ones that
meet the specified conditions.
*/

--2.
SELECT * FROM AP.INVOICES WHERE VENDOR_ID = 34;

--3.
SELECT INVOICE_ID FROM AP.INVOICES WHERE INVOICE_TOTAL = 356.48;

--4.
SELECT INVOICE_ID, INVOICE_NUMBER, INVOICE_DATE FROM AP.INVOICES WHERE INVOICE_ID IN(81, 82, 90);

--5.
SELECT INVOICE_ID, VENDOR_ID FROM AP.INVOICES WHERE VENDOR_ID <= 44;

--6.
SELECT INVOICE_ID, VENDOR_ID, CREDIT_TOTAL FROM AP.INVOICES WHERE CREDIT_TOTAL != 0;

--7.
SELECT INVOICE_ID, INVOICE_DATE FROM AP.INVOICES WHERE INVOICE_DATE = '01-MAY-14';

--8.
SELECT INVOICE_ID, INVOICE_DATE, PAYMENT_TOTAL FROM AP.INVOICES WHERE PAYMENT_TOTAL BETWEEN 100 AND 115;

--9.
SELECT INVOICE_ID, INVOICE_DATE FROM AP.INVOICES WHERE INVOICE_DATE BETWEEN '01-MAY-14' AND '08-MAY-14';

--10.
SELECT INVOICE_ID, INVOICE_NUMBER FROM AP.INVOICES WHERE INVOICE_NUMBER LIKE 'P%';

--11.
SELECT INVOICE_ID, INVOICE_NUMBER FROM AP.INVOICES WHERE INVOICE_NUMBER LIKE 'P-3%';

--12.
SELECT INVOICE_ID, INVOICE_NUMBER FROM AP.INVOICES WHERE INVOICE_NUMBER LIKE '%-X';

--13.
SELECT INVOICE_ID, INVOICE_NUMBER FROM AP.INVOICES WHERE INVOICE_NUMBER LIKE '%11%' AND INVOICE_NUMBER NOT LIKE '1%' AND INVOICE_NUMBER NOT LIKE '%1';

--14.
SELECT INVOICE_ID, INVOICE_NUMBER FROM AP.INVOICES WHERE INVOICE_NUMBER LIKE '_0_3%';

--15.
SELECT INVOICE_ID, PAYMENT_DATE FROM AP.INVOICES WHERE PAYMENT_DATE IS NULL FETCH FIRST 10 ROWS ONLY;

--16.
SELECT INVOICE_ID, PAYMENT_DATE FROM AP.INVOICES WHERE PAYMENT_DATE IS NOT NULL FETCH FIRST 10 ROWS ONLY;

--17.
SELECT INVOICE_ID, PAYMENT_TOTAL, INVOICE_TOTAL FROM AP.INVOICES WHERE PAYMENT_TOTAL = 0 AND INVOICE_TOTAL > 100;

--18.
SELECT INVOICE_ID, PAYMENT_TOTAL, INVOICE_TOTAL FROM AP.INVOICES WHERE PAYMENT_TOTAL BETWEEN 0 AND 25 OR PAYMENT_TOTAL > 100 FETCH FIRST 10 ROWS ONLY;

--19.
SELECT INVOICE_ID, TERMS_ID FROM AP.INVOICES WHERE TERMS_ID NOT IN(1,2,3,4);

--20.
SELECT INVOICE_ID, INVOICE_DATE, PAYMENT_TOTAL FROM AP.INVOICES WHERE INVOICE_DATE = '01-MAY-14' OR INVOICE_DATE = '17-MAY-14' AND PAYMENT_TOTAL = 0;