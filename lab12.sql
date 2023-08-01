/*
James Liang
Lab 12
*/

/*
DROP VIEW OPEN_ITEMS;
DROP VIEW OPEN_ITEMS_SUMMARY;
DROP VIEW VENDOR_ADDRESS;
*/

--1.
CREATE VIEW OPEN_ITEMS AS
SELECT v.VENDOR_NAME, i.INVOICE_NUMBER, i.INVOICE_TOTAL, (i.INVOICE_TOTAL - i.PAYMENT_TOTAL - i.CREDIT_TOTAL) BALANCE_DUE 
FROM AP.VENDORS v, AP.INVOICES i 
WHERE v.VENDOR_ID = i.VENDOR_ID 
AND i.INVOICE_TOTAL - i.PAYMENT_TOTAL - i.CREDIT_TOTAL > 0 
ORDER BY v.VENDOR_NAME;

--2.
SELECT * FROM OPEN_ITEMS WHERE BALANCE_DUE >= 1000;

--3.
CREATE VIEW OPEN_ITEMS_SUMMARY AS 
SELECT VENDOR_NAME, COUNT(*) AS OPEN_ITEM_COUNT, SUM(INVOICE_TOTAL - CREDIT_TOTAL - PAYMENT_TOTAL) AS OPEN_ITEM_TOTAL 
FROM AP.VENDORS JOIN AP.INVOICES ON VENDORS.VENDOR_ID=INVOICES.VENDOR_ID 
WHERE INVOICE_TOTAL - CREDIT_TOTAL - PAYMENT_TOTAL > 0 
GROUP BY VENDOR_NAME 
ORDER BY 3 DESC;

--4.
SELECT * FROM OPEN_ITEMS_SUMMARY WHERE ROWNUM <= 5;

--5.
CREATE VIEW VENDOR_ADDRESS AS SELECT VENDOR_ID, VENDOR_ADDRESS1, VENDOR_ADDRESS2, VENDOR_CITY, VENDOR_STATE, VENDOR_ZIP_CODE FROM AP.VENDORS;
SELECT * FROM VENDOR_ADDRESS;

--6.
UPDATE VENDOR_ADDRESS SET VENDOR_ADDRESS2 = 'Ste 260', VENDOR_ADDRESS1 = REPLACE(VENDOR_ADDRESS1, 'Ste 260', '') WHERE VENDOR_ID = 4;