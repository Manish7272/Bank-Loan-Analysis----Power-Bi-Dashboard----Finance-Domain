select (count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)* 100)/ count(id) as Good_loan_percentage
from bank_loan_data


select count(id) as Good_Loan_Applications from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'



select sum(loan_amount) as Good_Loan_Funded_Amount from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current' 



select sum(total_payment) as Good_Loan_received_Amount from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current' 