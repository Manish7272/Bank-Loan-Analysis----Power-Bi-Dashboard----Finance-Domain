select sum(total_payment) as Total_Amount_Received from bank_loan_data



select sum(total_payment) as MTD_Total_Amount_Received from bank_loan_data
where month(issue_date)=12 and year(issue_date)=2021



select sum(total_payment) as PMTD_Total_Amount_Received from bank_loan_data
where month(issue_date)=11 and year(issue_date)=2021