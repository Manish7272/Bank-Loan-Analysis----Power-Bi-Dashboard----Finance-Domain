SELECT 
	month(issue_date) as month_number,
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received

FROM bank_loan_data
GROUP BY month(issue_date),DATENAME(MONTH, issue_date)
ORDER BY month(issue_date) 






SELECT 
	term,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received

FROM bank_loan_data
GROUP BY term
ORDER BY term



SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received

FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length



SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received

FROM bank_loan_data
GROUP BY purpose
ORDER BY count(id) desc






SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received

FROM bank_loan_data
where grade = 'A'
GROUP BY home_ownership
ORDER BY count(id) desc


-- See the results when we hit the Grade A in the filters for dashboards.
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose
