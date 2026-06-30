# Bank-Transaction-Analysis-SQL
A SQL-based banking database project using Oracle SQL for customer, account, and transaction analysis.
# Bank Transaction Analysis using Oracle SQL

## 📌 Project Overview
This project simulates a banking database system using Oracle SQL. It analyzes customer, account, branch, and transaction data to generate business insights and answer real-world banking questions.

## 🎯 Objective
Analyze customer, account, and transaction data to generate meaningful business insights using SQL queries.

## 🛠️ Technologies Used
- Oracle Database 10g
- SQL*Plus
- SQL

## 🗂️ Database Schema

### Tables Used
1. CUSTOMERS
2. BRANCHES
3. ACCOUNTS
4. TRANSACTIONS

## 🔗 Entity Relationship

CUSTOMERS → ACCOUNTS → TRANSACTIONS  
BRANCHES → ACCOUNTS

## 🧠 SQL Concepts Used
- Joins
- Subqueries
- Aggregate Functions
- GROUP BY
- HAVING
- Date Functions
- Window Functions
- Constraints (Primary Key & Foreign Key)

## 📊 Business Questions Solved
- Find customers having multiple accounts.
- Find top customers by total balance.
- Calculate branch-wise deposits and balances.
- Analyze monthly transaction trends.
- Identify inactive customers.
- Find customers having both savings and current accounts.

## 📈 Key Insights
- Chennai branch has the highest deposits.
- Customer RAM has the highest total balance.
- Savings accounts are more than current accounts.
- Most transactions occurred during February.

## 📁 Project Files
- `create_tables.sql`
- `insert_data.sql`
- `analysis_queries.sql`
- `ER_Diagram.png`
- `Project_Report.pdf`

## 🚀 Learning Outcomes
- Database design and normalization
- Writing complex SQL queries
- Working with joins and subqueries
- Performing business analysis using SQL
- Building a portfolio-ready SQL project
