-- Average Interest Rate
SELECT round(AVG(int_rate),4) *100 AS Avg_Interest_Rate FROM bank_loan_data
 
-- MTD Average Interest
SELECT round(AVG(int_rate),4) *100 AS MTD_Avg_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 and year(issue_date) = 2021
 
-- PMTD Average Interest

SELECT round(AVG(int_rate),4) *100 AS PMTD_Avg_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11 and year(issue_date) = 2021
