# 🚕 Uber Ride Analytics (Python Part)

## 📌 Project Overview

This project performs an end-to-end **Uber Ride Analytics** workflow using Python, SQL, & Power BI. This document provides an overview of the analysis done in Python. The analysis works with a relational dataset containing **150,000 booking records** and supporting bookings, customer, calendar, vehicle, location, payment, and cancellation tables.

This part of the project focuses on **data cleaning, data quality validation, exploratory data analysis (EDA), outlier detection, statistical analysis, and business insight generation**.

---

## 🎯 Business Objectives

The analysis aims to answer key business questions such as:

- How many bookings were generated and what was their total booking value?
- What proportion of bookings were completed, cancelled, or incomplete?
- Which vehicle types and payment methods are most popular?
- Which vehicle types generate the most revenue?
- Which pickup and drop locations have the highest booking activity and revenue?
- What are the most common customer and driver cancellation reasons?
- Is booking value related to operational and customer experience metrics?
- Does vehicle type significantly affect booking value?
- Is there a significant difference between weekday and weekend booking values?
- Is booking status associated with payment method?

---

## 🗂️ Dataset Structure

The project uses seven related tables:

| Table | Description |
|---|---|
| `Bookings` | Booking-level information including status, value, distance, wait times, and driver rating |
| `Customers` | Customer IDs and customer ratings |
| `Calendar` | Date, month, quarter, weekday, and weekend information |
| `Vehicles` | Vehicle IDs and vehicle types |
| `Locations` | Location IDs and location names |
| `Payments` | Payment IDs and payment methods |
| `Cancellation` | Customer/driver cancellations and incomplete-ride reasons |

The main `Bookings` table contains **150,000 rows**. The analysis identifies **148,767 unique booking IDs**.

---

## 🛠️ Tools & Technologies

- **Python**
- **Pandas** — data manipulation and analysis
- **NumPy** — numerical operations
- **Matplotlib** — visualization
- **Seaborn** — statistical visualization
- **SciPy** — hypothesis testing
- **Jupyter Notebook**

### Key techniques used

- Data profiling
- Missing-value analysis
- Duplicate detection and removal
- Data type validation and conversion
- Data standardization
- Data merging
- GroupBy aggregations
- IQR-based outlier detection
- Correlation analysis
- ANOVA
- Independent samples t-test
- Chi-square test
- Business-oriented EDA

---

# 🧪 Most Important Part: Statistical Analysis

## 1. One-Way ANOVA

### Question
**Does booking value differ significantly across vehicle types?**

- F-statistic: **0.640**
- p-value: **0.699**

Since p > 0.05, the analysis does **not** find a statistically significant difference in booking value across vehicle types.

---

## 2. Independent Samples T-Test

### Question
**Is there a significant difference in booking value between weekdays and weekends?**

- t-statistic: **-66.46**
- p-value: **≈ 0**

The result indicates a **statistically significant difference** between weekday and weekend booking values.

---

## 3. Chi-Square Test of Independence

### Question
**Is booking status associated with payment method?**

- Chi-square statistic: **0.905**
- Degrees of freedom: **4**
- p-value: **0.924**

Since p > 0.05, the analysis does **not** find evidence of an association between booking status and payment method.

---

# 🔍 Key Business Insights

- **62% of bookings were completed**, making successful rides the majority of all bookings.
- **Auto** was the most popular vehicle type and generated the highest total revenue.
- **UPI** dominated payment usage and generated the highest total booking value.
- **Wrong Address** was the most common customer cancellation reason.
- **Customer related issue** was the most common driver cancellation reason.
- **Barakhamba Road** was the highest-revenue pickup location analyzed.
- **Narsinghpur** was the highest-revenue drop location analyzed.
- Vehicle type did not show a statistically significant effect on booking value.
- Weekday and weekend booking values showed a statistically significant difference.
- Booking status and payment method were found to be statistically independent in the chi-square test.

---

# 💡 Skills Demonstrated

This project demonstrates practical experience in:

**Python | Pandas | NumPy | Matplotlib | Seaborn | SciPy | Data Cleaning | Data Validation | Exploratory Data Analysis | Data Visualization | Statistical Analysis | Hypothesis Testing | Outlier Detection | Data Transformation | Data Merging | Business Insights**

---

## 👤 Author

**Aish Joon**

Data Analyst | SQL | Python | Power BI | Excel