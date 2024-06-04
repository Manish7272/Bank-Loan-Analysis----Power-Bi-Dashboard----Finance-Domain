# DEX Queries:

![Screenshot 2024-06-04 162520](https://github.com/Manish7272/Bank-Loan-Analysis----Power-Bi-Dashboard----Finance-Domain/assets/71213166/b83cfcf1-0d80-4739-bda9-56d6e078dfbe)
![Screenshot 2024-06-04 162542](https://github.com/Manish7272/Bank-Loan-Analysis----Power-Bi-Dashboard----Finance-Domain/assets/71213166/821dc6cd-16bf-4747-8a3b-c78f4d899f6a)

<br>
    
    total_received_amt = sum(financial_loan[total_payment])
    
    total_loan_appl = count(financial_loan[id])
    
    total_funded_amt = sum(financial_loan[loan_amount])
    
<br>
    
    PMTD_received_amt = CALCULATE([total_received_amt],DATESMTD(DATEADD('Date Table'[Date],-1,MONTH)))
    
    PMTD_loan_appl = CALCULATE([total_loan_appl],DATESMTD(DATEADD('Date Table'[Date],-1,MONTH)))
    
    PMTD_Interest_rate = CALCULATE([avg_interest_rate],DATESMTD(DATEADD('Date Table'[Date],-1,MONTH)))
    
    PMTD_funded_amt = CALCULATE([total_funded_amt],DATESMTD(DATEADD('Date Table'[Date],-1,MONTH)))
    
    PMTD_avg_DTI = CALCULATE([avg_DTI],DATESMTD(DATEADD('Date Table'[Date],-1,MONTH)))
    
<br>
    
    MTD_received_amt = CALCULATE(TOTALMTD([total_received_amt], 'Date Table'[Date]))
    
    MTD_loan_appl = CALCULATE(TOTALMTD([total_loan_appl], 'Date Table'[Date]))
    
    MTD_interest_rate = CALCULATE(TOTALMTD([avg_interest_rate], 'Date Table'[Date]))
    
    MTD_funded_amt = CALCULATE(TOTALMTD([total_funded_amt], 'Date Table'[Date]))
    
    MTD_avg_DTI = CALCULATE(TOTALMTD([avg_DTI], 'Date Table'[Date]))
    
<br>
    
    MOM_received_amt = ([MTD_received_amt]-[PMTD_received_amt])/[PMTD_received_amt]
    
    MOM_loan_appl = ([MTD_loan_appl]-[PMTD_loan_appl])/[PMTD_loan_appl]
    
    MOM_interest_rate = ([MTD_interest_rate]-[PMTD_Interest_rate])/[PMTD_Interest_rate]
    
    MOM_funded_amt = ([MTD_funded_amt]-[PMTD_funded_amt])/[PMTD_funded_amt]
    
    MOM_avg_DTI = ([MTD_avg_DTI]-[PMTD_avg_DTI])/[PMTD_avg_DTI]
    
<br>
    
    good_loan_received_amt = (CALCULATE([total_received_amt], financial_loan[Good vs Bad Loan]="Good Loan"))
    
    good_loan_per = (CALCULATE([total_loan_appl],financial_loan[Good vs Bad Loan] = "Good Loan")) / [total_loan_appl]
    
    good_loan_funded_amt = (CALCULATE([total_funded_amt], financial_loan[Good vs Bad Loan]="Good Loan"))
    
    good_loan_appl = (CALCULATE([total_loan_appl], financial_loan[Good vs Bad Loan]="Good Loan"))
    
<br>
    
    bad_loan_received_amt = (CALCULATE([total_received_amt], financial_loan[Good vs Bad Loan]="Bad Loan"))
    
    bad_loan_per = (CALCULATE([total_loan_appl],financial_loan[Good vs Bad Loan] = "Bad Loan")) / [total_loan_appl]
    
    bad_loan_funded_amt = (CALCULATE([total_funded_amt], financial_loan[Good vs Bad Loan]="Bad Loan"))
    
    bad_loan_appl = (CALCULATE([total_loan_appl], financial_loan[Good vs Bad Loan]="Bad Loan"))
    
    avg_interest_rate = AVERAGE(financial_loan[int_rate])
    
    avg_DTI = AVERAGE(financial_loan[dti])
