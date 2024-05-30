select sum(loan_amount) as Total_Funded_Amount from bank_loan_data


select sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021



select sum(loan_amount) as PMTD_Total_Funded_Amount from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021