use bank_loan;
select * from financial_loan;

-- Total Loan Application
select count(id) as Total_application from financial_loan;

-- Month wise loan applicatio n  
select count(id) total_application from financial_loan where month(issue_date) = 12 ;

-- Total_Funded Amount
select sum(loan_amount) as Total_funded_amount,
	   min(loan_amount) as min_funded_amount,
       max(loan_amount) as max_funded_amount,
       avg(loan_amount) as avg_funded_amount
 from financial_loan;

-- month wise total funded amount
select sum(loan_amount) as total_funded_amount from financial_loan
where month(issue_date) = 12;

-- Total Resive Amount
select sum(total_payment) as Total_Resive_amount,
min(total_payment) as min_resived_amount,
max(total_payment) as max_resived_amount,
avg(total_payment) as ave_resived_amount
 from financial_loan;

-- month wise resive amount
select sum(total_payment) as month_wise_resive from financial_loan
where month(issue_date)  = 12;

-- average intrest rate
select avg(int_rate)*100 as avg_intrest_rate from financial_loan;

--  avg DTI 
select avg(dti)*100 as avg_dti from financial_loan;

-- Good Loan Percentage
select (count(case when loan_status = "Fully Paid" or loan_status = "Current" then id end) * 100)/count(id) as Good_loan_per
from financial_loan;

-- Bad Loan Percentage
select (count(case when loan_status ="Charged Off" then id end) *100)/count(id) as Bed_loan_per from financial_loan;

-- Good Loan Application
select count(id) as Good_loan_application from financial_loan
where loan_status = "Fully Paid" or loan_status = "Current";

-- Good Loan Funded Amount
select sum(loan_amount) as Good_loan_amount from financial_loan
where loan_status = "Fully Paid" or loan_status = "Current";  

-- Good Loan amount Received
select sum(total_payment) as Good_loan_amount_resived from financial_loan
where loan_status = "Fully Paid" or loan_status = "Current";

-- Bad Loan Application
select count(id) as Bad_loan_application from financial_loan
where loan_status ="Charged Off";

-- Bad Loan funded
select sum(loan_amount) as Bad_loan_funded from financial_loan
where loan_status = "Charged Off";

-- Bad Loan Resived
select sum(total_payment) as Bad_loan_resived from financial_loan
where loan_status = "Charged Off"; 

--  Loan status
select loan_status as Loan_status,
count(id) as Total_application,
sum(loan_amount) as Total_loan_amt,
sum(total_payment) as Total_payment,
AVG(int_rate * 100) AS Interest_Rate
from financial_loan
group by loan_status;


-- Bank Loan Report Overview
SELECT 
    MONTH(issue_date) AS Month, 
    MONTHNAME(issue_date) AS Month_name,
    COUNT(id) AS Total_application,
    SUM(loan_amount) AS total_Loan_amount,
    SUM(total_payment) AS Total_received
FROM 
    financial_loan
GROUP BY 
    MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY 
    MONTH(issue_date);


-- State wise 
select 
	address_state as State,
    count(id) as Total_application,
    sum(loan_amount) as Total_funded_amount,
    sum(total_payment) as Total_amount_resived
    from financial_loan
    group by address_state
    order by address_state;

-- Term
select term as Term,
count(id) as Total_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_resived
from financial_loan
group by term
order by term;


-- Employee Lenght
select emp_length as Emp_Length,
count(id) as Total_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_resived_amount
from financial_loan 
group by emp_length
order by emp_length;

-- Purpose
select 
purpose as Purpose,
count(id) as Total_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_resived_amount
from financial_loan 
group by purpose
order by purpose; 


-- Home Ownership
  SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership;









