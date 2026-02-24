# 📊 **Sales Performance Dashboard – SQL + Power BI**

## 📌 Project Overview



This project demonstrates an end-to-end Business Intelligence workflow using S**QL Server and Power BI**.



The objective was to clean raw sales data, transform it for analysis, and develop an interactive dashboard to evaluate:



* Revenue trends



* Regional performance



* Profitability



* Business risk areas (loss-making products \& low margins)



This project simulates a real-world data analyst task from data preparation to executive reporting.



### 

### 🛠 Tools \& Technologies Used



* SQL Server Management Studio (SSMS)



* Power BI Desktop



* DAX (basic measures)



* GitHub (version control \& documentation)







### 🗄 Data Preparation (SQL)



Raw data from the Superstore dataset was cleaned and transformed using SQL.



###### 🔹 Key Data Cleaning Steps



* Created a structured analysis table (sales\_data)
* Converted date columns using TRY\_CAST
* Standardized numeric data types (DECIMAL, INT)
* Checked for missing and invalid values
* Identified negative and null records
* Validated sales and profit consistency



###### 🔹 Business Analysis Queries Performed



The following KPIs were calculated in SQL:



* 📅 Monthly Revenue Trend
* 👥 Top 10 Customers by Total Spend
* 📊 Profit Margin Percentage by Category
* ⚠ Identification of Loss-Making Products
* 🌍 Revenue \& Profit by Region



###### 📂 SQL Script:

/sql/sales\_data\_cleaning\_and\_analysis.sql





### 📈 Power BI Dashboard



After cleaning the data in SQL, the structured dataset was imported into Power BI to build an interactive dashboard with three analytical pages:



###### 1️⃣ Executive Overview



* Total Revenue
* Total Profit
* Monthly Revenue Trend
* Overall Performance Summary



###### 2️⃣ Regional Performance



* Revenue by Region
* Profit by Region
* Comparative Regional Analysis





###### 3️⃣ Risk \& Loss Analysis



* Loss-Making Products
* Low Margin Categories
* Identification of Profitability Risks







### 🎯 Key Insights Generated



* Identified regions contributing the highest revenue and profit
* Detected products generating consistent losses
* Highlighted categories with low profit margins
* Provided data-driven insights for strategic decision-making





### 📷 Dashboard Preview



(Add screenshots in the images folder and reference them like below)



###### Executive Overview

###### 

###### Regional Performance

###### 

###### Risk \& Loss Analysis



### 💼 Business Value

### 

This project demonstrates the ability to:



* Clean and transform raw data using SQL
* Apply business logic to generate KPIs
* Build interactive dashboards in Power BI
* Translate data into actionable insights
* Structure and document projects professionally using GitHub



### 

### 🚀 Project Structure

sales-performance-dashboard/

│

├──data/sample-Superstore.csv

|

|

├── sql/

│   └── sales\_data\_cleaning\_and\_analysis.sql

│

├── powerbi/

│   └── Sales\_Performance\_Dashboard.pbix

│

├── images/

│   ├── overview.png

│   ├── regional.png

│   └── risk.png

│

└── README.md

