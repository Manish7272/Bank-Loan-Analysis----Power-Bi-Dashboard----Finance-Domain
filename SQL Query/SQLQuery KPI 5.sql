use [Bank Loan Database]

select round(avg(dti),4) * 100 as Avg_DTI from bank_loan_data

select round(avg(dti),4) * 100 as MTD_Avg_DTI from bank_loan_data
where month(issue_date) = 12 and year(issue_date)= 2021


select round(avg(dti),4) * 100 as PMTD_Avg_DTI from bank_loan_data
where month(issue_date) = 11 and year(issue_date)= 2021