# 🏦 Bank Marketing SQL Project

This project analyzes a bank's telemarketing campaign data using SQL. The goal is to uncover insights about customer behavior, campaign success, and marketing effectiveness through well-structured queries involving joins, subqueries, window functions, and aggregate logic.

---

## 📌 Project Objective

To use SQL to:
- Analyze customer and campaign data
- Identify patterns and performance metrics
- Solve 10 real business questions with advanced SQL functions

---

## 🗃️ Table Used

This project is based on a single unified table named `bank_marketing` with the following sample fields:
- `age`, `job`, `marital`, `education`, `housing`, `loan`, `contact`
- `month`, `day_of_week`, `duration`, `campaign`, `pdays`, `previous`
- `poutcome`, `emp_var_rate`, `euribor3m`, `nr_employed`, `response`

---

## ❓ Business Questions Answered

1. Which product received the most 'yes' responses?
2. Rank customers by total campaign duration
3. Which job types have the highest campaign success rate?
4. Customers who said "yes" and were contacted more than once
5. Average campaign duration per contact month
6. Customers with above-average campaign durations
7. Rank customers by duration within each product
8. Compare average duration for 'yes' vs 'no' responses
9. Products needing the most contacts for success
10. Rank successful customers by euribor3m rate

---

## 🧠 Sample Query

```sql
SELECT c.job,
       ROUND(AVG(CASE WHEN r.response = 'yes' THEN 1 ELSE 0 END) * 100, 2) AS success_rate
FROM customers c
JOIN campaigns cp ON c.customer_id = cp.customer_id
JOIN responses r ON cp.campaign_id = r.campaign_id
GROUP BY c.job
ORDER BY success_rate DESC;


🔧 Tools Used :

MySQL 
GitHub


📈 Key Learnings:

How to analyze marketing data using SQL

Practical use of JOIN, GROUP BY, CASE, RANK(), and subqueries

Business thinking + SQL logic = insight-driven storytelling

Writing clean, modular queries for real business questions















