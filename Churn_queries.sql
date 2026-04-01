CREATE DATABASE churn_project;
USE churn_project;

-- ============================================
-- DATA OVERVIEW
-- ============================================

-- Total Customers
DESCRIBE churn_data;
SELECT COUNT(*) AS total_customers
FROM churn_data;

-- Churn Distribution
SELECT churn, COUNT(*) AS total_customers
FROM churn_data
GROUP BY churn;

-- Churn Percentage
SELECT churn, COUNT(*) AS total_customers, (COUNT(*) *100 / SUM(COUNT(*)) OVER()) AS churn_percentage
FROM churn_data
GROUP BY churn;

-- ============================================
-- CATEGORICAL ANALYSIS
-- ============================================

-- Churn by Contract Type
SELECT churn, contract, COUNT(*) AS customer_count
FROM churn_data
GROUP BY contract, churn
ORDER BY contract, churn;

-- Churn by Payment Method
SELECT churn, payment_method, COUNT(*) AS customer_count
FROM churn_data
GROUP BY payment_method, churn
ORDER BY payment_method, churn DESC;

-- Churn by Partner Status
SELECT churn, partner, COUNT(*) AS customer_count
FROM churn_data
GROUP BY partner, churn
ORDER BY partner, churn;

-- Churn by Dependents
SELECT churn, dependents, COUNT(*) AS customer_count
FROM churn_data
GROUP BY dependents, churn
ORDER BY dependents, churn;

-- Churn by Senior Citizens
SELECT churn, senior_citizen, COUNT(*) AS customer_count
FROM churn_data
GROUP BY senior_citizen, churn
ORDER BY senior_citizen, churn;

-- ============================================
-- CUSTOMER BEHAVIOR ANALYSIS
-- ============================================

-- Churn by Tenure Group
SELECT churn, tenure_group, COUNT(*) AS customer_count
FROM churn_data
GROUP BY tenure_group, churn
ORDER BY tenure_group, churn;

-- Churn by Charges Group
SELECT churn, charges_group, COUNT(*) AS customer_count
FROM churn_data
GROUP BY charges_group, churn
ORDER BY charges_group, churn;


-- Churn by Total Services Used
SELECT churn, total_services, COUNT(*) AS customer_count
FROM churn_data
GROUP BY total_services, churn
ORDER BY total_services, churn;


-- ============================================
-- NUMERICAL ANALYSIS
-- ============================================

-- Average Tenure by Churn
SELECT churn, ROUND(AVG(tenure), 2) AS average_tenure
FROM churn_data
GROUP BY churn;

-- Average Monthly Charges by Churn
SELECT churn, ROUND(AVG(monthly_charges), 2) AS average_monthly_charges
FROM churn_data
GROUP BY churn;

-- Average Total Charges by Churn
SELECT churn, ROUND(AVG(total_charges), 2) AS avg_total_charges
FROM churn_data
GROUP BY churn;

-- Total Revenue by Churn
SELECT churn, ROUND(SUM(total_charges), 2) AS total_revenue
FROM churn_data
GROUP BY churn;

-- ============================================
-- ADVANCED ANALYSIS
-- ============================================

-- Highest Churn by Contract + Payment Method Combination
SELECT churn, contract, payment_method, COUNT(*) AS customer_count
FROM churn_data
WHERE churn="Yes"
GROUP BY contract, payment_method
ORDER BY customer_count DESC;


