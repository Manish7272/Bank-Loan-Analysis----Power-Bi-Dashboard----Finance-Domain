BANK LOAN REPORT QUERY DOCUMENT
A.	BANK LOAN REPORT | SUMMARY

KPI’s:
Total Loan Applications
SELECT COUNT(id) AS Total_Loan_Applications FROM bank_loan_data
 

MTD Loan Applications
SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 12
 

PMTD Loan Applications
SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11
 

________________________________________
Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data
 

MTD Total Funded Amount
select sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021
 


PMTD Total Funded Amount
select sum(loan_amount) as PMTD_Total_Funded_Amount from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021
 

________________________________________


Total Amount Received
select sum(total_payment) as Total_Amount_Received from bank_loan_data

 


MTD Total Amount Received
select sum(total_payment) as MTD_Total_Amount_Received from bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021
 

PMTD Total Amount Received
select sum(total_payment) as PMTD_Total_Amount_Received from bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021
 


________________________________________




Average Interest Rate
SELECT round(AVG(int_rate),4) *100 AS Avg_Interest_Rate FROM bank_loan_data
 

MTD Average Interest

SELECT round(AVG(int_rate),4) *100 AS MTD_Avg_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 and year(issue_date) = 2021
 
PMTD Average Interest


SELECT round(AVG(int_rate),4) *100 AS PMTD_Avg_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11 and year(issue_date) = 2021
 

________________________________________

Avg DTI
select round(avg(dti),4) * 100 as Avg_DTI from bank_loan_data
 

MTD Avg DTI

select round(avg(dti),4) * 100 as MTD_Avg_DTI from bank_loan_data
where month(issue_date) = 12 and year(issue_date)= 2021
 

PMTD Avg DTI

select round(avg(dti),4) * 100 as PMTD_Avg_DTI from bank_loan_data
where month(issue_date) = 11 and year(issue_date)= 2021
 
________________________________________
GOOD LOAN ISSUED

Good Loan Percentage
select (count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)* 100)/ count(id) as Good_loan_percentage
from bank_loan_data
 

Good Loan Applications

select count(id) as Good_Loan_Applications from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

 

Good Loan Funded Amount

select sum(loan_amount) as Good_Loan_Funded_Amount from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'
 


Good Loan Amount Received

select sum(total_payment) as Good_Loan_received_Amount from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'
 



BAD LOAN ISSUED
Bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data
 


Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'
 

Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'
 

Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off'
 

________________________________________

LOAN STATUS
SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status
	
 


SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status
 

________________________________________

BANK LOAN REPORT | OVERVIEW
MONTH
SELECT 
	month(issue_date) as month_number,
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received

FROM bank_loan_data
GROUP BY month(issue_date),DATENAME(MONTH, issue_date)
ORDER BY month(issue_date) 
 


STATE

SELECT 
	address_state,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received

FROM bank_loan_data
GROUP BY address_state
ORDER BY count(id) desc
 

TERM

SELECT 
	term,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received

FROM bank_loan_data
GROUP BY term
ORDER BY term
 

EMPLOYEE LENGTH

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received

FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

 

PURPOSE


SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received

FROM bank_loan_data
GROUP BY purpose
ORDER BY count(id) desc
 
HOME OWNERSHIP


SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received

FROM bank_loan_data
GROUP BY home_ownership
ORDER BY count(id) desc
 

See the results when we hit the Grade A in the filters for dashboards.
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose

________________________________________

