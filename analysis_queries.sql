-- ==========================================
-- BANK TRANSACTION ANALYSIS PROJECT
-- File: analysis_queries.sql
-- ==========================================

-- 1. Find customers having more than one account.
SELECT CUSTOMER_ID, COUNT(*) AS TOTAL_ACCOUNTS
FROM ACCOUNTS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) > 1;

-- 2. Find the total balance of each customer.
SELECT CUSTOMER_ID, SUM(BALANCE) AS TOTAL_BALANCE
FROM ACCOUNTS
GROUP BY CUSTOMER_ID;

-- 3. Find the customer having the highest total balance.
SELECT CUSTOMER_ID, SUM(BALANCE) AS TOTAL_BALANCE
FROM ACCOUNTS
GROUP BY CUSTOMER_ID
ORDER BY TOTAL_BALANCE DESC;

-- 4. Find customers who have both SAVINGS and CURRENT accounts.
SELECT CUSTOMER_ID
FROM ACCOUNTS
GROUP BY CUSTOMER_ID
HAVING COUNT(DISTINCT ACCOUNT_TYPE) = 2;

-- 5. Find the total balance in each branch.
SELECT BRANCH_ID, SUM(BALANCE) AS TOTAL_BALANCE
FROM ACCOUNTS
GROUP BY BRANCH_ID;

-- 6. Find the branch having the maximum number of accounts.
SELECT BRANCH_ID, COUNT(*) AS TOTAL_ACCOUNTS
FROM ACCOUNTS
GROUP BY BRANCH_ID
ORDER BY TOTAL_ACCOUNTS DESC;

-- 7. Find the total deposit amount.
SELECT SUM(AMOUNT) AS TOTAL_DEPOSITS
FROM TRANSACTIONS
WHERE TRANSACTION_TYPE = 'DEPOSIT';

-- 8. Find the total withdrawal amount.
SELECT SUM(AMOUNT) AS TOTAL_WITHDRAWALS
FROM TRANSACTIONS
WHERE TRANSACTION_TYPE = 'WITHDRAWAL';

-- 9. Find the account having the highest balance.
SELECT *
FROM ACCOUNTS
WHERE BALANCE = (SELECT MAX(BALANCE)
                 FROM ACCOUNTS);

-- 10. Find all customers from Chennai.
SELECT *
FROM CUSTOMERS
WHERE CITY = 'CHENNAI';

-- 11. Find customers who do not have multiple accounts.
SELECT CUSTOMER_ID
FROM ACCOUNTS
GROUP BY CUSTOMER_ID
HAVING COUNT(*) = 1;

-- 12. Find the average account balance.
SELECT AVG(BALANCE) AS AVG_BALANCE
FROM ACCOUNTS;

-- 13. Find accounts whose balance is greater than the average balance.
SELECT *
FROM ACCOUNTS
WHERE BALANCE >
      (SELECT AVG(BALANCE)
       FROM ACCOUNTS);

-- 14. Find the number of accounts in each account type.
SELECT ACCOUNT_TYPE, COUNT(*) AS TOTAL_ACCOUNTS
FROM ACCOUNTS
GROUP BY ACCOUNT_TYPE;

-- 15. Find the highest transaction amount.
SELECT *
FROM TRANSACTIONS
WHERE AMOUNT = (SELECT MAX(AMOUNT)
                FROM TRANSACTIONS);

-- 16. Find the lowest transaction amount.
SELECT *
FROM TRANSACTIONS
WHERE AMOUNT = (SELECT MIN(AMOUNT)
                FROM TRANSACTIONS);

-- 17. Find the number of transactions in each month.
SELECT TO_CHAR(TRANSACTION_DATE,'MON-YYYY') AS MONTH,
       COUNT(*) AS TOTAL_TRANSACTIONS
FROM TRANSACTIONS
GROUP BY TO_CHAR(TRANSACTION_DATE,'MON-YYYY');

-- 18. Find the total transaction amount for each account.
SELECT ACCOUNT_NO,
       SUM(AMOUNT) AS TOTAL_AMOUNT
FROM TRANSACTIONS
GROUP BY ACCOUNT_NO;

-- 19. Find customers having accounts in Chennai branch.
SELECT C.CUSTOMER_NAME
FROM CUSTOMERS C, ACCOUNTS A
WHERE C.CUSTOMER_ID = A.CUSTOMER_ID
AND A.BRANCH_ID = 1;

-- 20. Find customer names and their total balances.
SELECT C.CUSTOMER_NAME,
       SUM(A.BALANCE) AS TOTAL_BALANCE
FROM CUSTOMERS C, ACCOUNTS A
WHERE C.CUSTOMER_ID = A.CUSTOMER_ID
GROUP BY C.CUSTOMER_NAME;

-- 21. Find the top 3 customers by total balance.
SELECT CUSTOMER_ID,
       SUM(BALANCE) AS TOTAL_BALANCE
FROM ACCOUNTS
GROUP BY CUSTOMER_ID
ORDER BY TOTAL_BALANCE DESC;

-- 22. Find branch-wise average balance.
SELECT BRANCH_ID,
       AVG(BALANCE) AS AVG_BALANCE
FROM ACCOUNTS
GROUP BY BRANCH_ID;

-- 23. Find customers whose total balance is above average.
SELECT CUSTOMER_ID,
       SUM(BALANCE)
FROM ACCOUNTS
GROUP BY CUSTOMER_ID
HAVING SUM(BALANCE) >
       (SELECT AVG(BALANCE)
        FROM ACCOUNTS);

-- 24. Find the account having the maximum number of transactions.
SELECT ACCOUNT_NO,
       COUNT(*) AS TOTAL_TRANSACTIONS
FROM TRANSACTIONS
GROUP BY ACCOUNT_NO
ORDER BY TOTAL_TRANSACTIONS DESC;

-- 25. Find all deposits made in February.
SELECT *
FROM TRANSACTIONS
WHERE TRANSACTION_TYPE = 'DEPOSIT'
AND TO_CHAR(TRANSACTION_DATE,'MON') = 'FEB';
