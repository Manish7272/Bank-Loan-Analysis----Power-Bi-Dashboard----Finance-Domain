# BANK LOAN REPORT | SUMMARY

<br>

![kaggle_to_powerbi](https://github.com/Manish7272/Bank-Loan-Analysis----Power-Bi-Dashboard----Finance-Domain/assets/71213166/7273a5e9-461e-4800-b310-c9e27da3eb36)

<br>

## KPI’s:

### Total Loan Applications
```sql
SELECT COUNT(id) AS Total_Loan_Applications 
FROM bank_loan_data
```

### MTD Loan Applications
```sql
SELECT COUNT(id) AS MTD_Total_Loan_Applications 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
```

### PMTD Loan Applications
```sql
SELECT COUNT(id) AS PMTD_Total_Loan_Applications 
FROM bank_loan_data
WHERE MONTH(issue_date) = 11
```

________________________________________

### Total Funded Amount
```sql
SELECT SUM(loan_amount) AS Total_Funded_Amount 
FROM bank_loan_data
```

### MTD Total Funded Amount
```sql
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
```

### PMTD Total Funded Amount
```sql
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
```

________________________________________

### Total Amount Received
```sql
SELECT SUM(total_payment) AS Total_Amount_Received 
FROM bank_loan_data
```

### MTD Total Amount Received
```sql
SELECT SUM(total_payment) AS MTD_Total_Amount_Received 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
```

### PMTD Total Amount Received
```sql
SELECT SUM(total_payment) AS PMTD_Total_Amount_Received 
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
```

________________________________________

### Average Interest Rate
```sql
SELECT ROUND(AVG(int_rate), 4) * 100 AS Avg_Interest_Rate 
FROM bank_loan_data
```

### MTD Average Interest
```sql
SELECT ROUND(AVG(int_rate), 4) * 100 AS MTD_Avg_Interest_Rate 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
```

### PMTD Average Interest
```sql
SELECT ROUND(AVG(int_rate), 4) * 100 AS PMTD_Avg_Interest_Rate 
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
```

________________________________________

### Avg DTI
```sql
SELECT ROUND(AVG(dti), 4) * 100 AS Avg_DTI 
FROM bank_loan_data
```

### MTD Avg DTI
```sql
SELECT ROUND(AVG(dti), 4) * 100 AS MTD_Avg_DTI 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
```

### PMTD Avg DTI
```sql
SELECT ROUND(AVG(dti), 4) * 100 AS PMTD_Avg_DTI 
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021
```

________________________________________

## GOOD LOAN ISSUED

### Good Loan Percentage
```sql
SELECT (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100) / COUNT(id) AS Good_loan_percentage 
FROM bank_loan_data
```

### Good Loan Applications
```sql
SELECT COUNT(id) AS Good_Loan_Applications 
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
```

### Good Loan Funded Amount
```sql
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount 
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
```

### Good Loan Amount Received
```sql
SELECT SUM(total_payment) AS Good_Loan_received_Amount 
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
```

## BAD LOAN ISSUED

### Bad Loan Percentage
```sql
SELECT (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / COUNT(id) AS Bad_Loan_Percentage 
FROM bank_loan_data
```

### Bad Loan Applications
```sql
SELECT COUNT(id) AS Bad_Loan_Applications 
FROM bank_loan_data
WHERE loan_status = 'Charged Off'
```

### Bad Loan Funded Amount
```sql
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount 
FROM bank_loan_data
WHERE loan_status = 'Charged Off'
```

### Bad Loan Amount Received
```sql
SELECT SUM(total_payment) AS Bad_Loan_amount_received 
FROM bank_loan_data
WHERE loan_status = 'Charged Off'
```

________________________________________

## LOAN STATUS
```sql
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
```

### MTD Loan Status
```sql
SELECT 
    loan_status, 
    SUM(total_payment) AS MTD_Total_Amount_Received, 
    SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status
```

________________________________________

## BANK LOAN REPORT | OVERVIEW

### MONTH
```sql
SELECT 
    MONTH(issue_date) AS month_number,
    DATENAME(MONTH, issue_date) AS Month_name, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)
```

### STATE
```sql
SELECT 
    address_state,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY COUNT(id) DESC
```

### TERM
```sql
SELECT 
    term,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term
```

### EMPLOYEE LENGTH
```sql
SELECT 
    emp_length AS Employee_Length, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length
```

### PURPOSE
```sql
SELECT 
    purpose AS PURPOSE, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC
```

### HOME OWNERSHIP
```sql
SELECT 
    home_ownership AS Home_Ownership, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(id) DESC
```

### Grade A Loans
```sql
SELECT 
    purpose AS PURPOSE, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose
```
