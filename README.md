# 🚕 Uber Ride Analytics: Project Overview

Developed an end-to-end data analytics project using Python, SQL, and Power BI to analyze 150K+ ride-booking records and generate actionable business insights. Used Python (Pandas, NumPy, Matplotlib, Seaborn, and SciPy) for data cleaning, validation, exploratory data analysis, outlier detection, and statistical hypothesis testing. Utilized MySQL for relational data analysis, KPI development, multi-table joins, CTEs, aggregations, and window functions. Built an interactive Power BI dashboard suite with data modelling, DAX calculated measures, a dedicated Date table, slicers, and four dashboards covering Executive Overview, Operations & Vehicle Performance, Customer & Location Analysis, and Cancellation & Root Cause Analysis. The project evaluates booking performance, revenue, vehicle performance, customer behavior, locations, payment methods, and cancellation patterns to support data-driven decision-making. 

## Python Analysis:

The analysis works with a relational dataset containing **150,000 booking records** and supporting bookings, customer, calendar, vehicle, location, payment, and cancellation tables.
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

# SQL Analysis:

The SQL analysis focuses on **business-oriented data analysis**, including booking performance, revenue, time trends, vehicle performance, payment behavior, location analysis, customer analysis, and cancellation patterns.
The project demonstrates practical SQL skills ranging from basic aggregations to **JOINs, CTEs, CASE statements, window functions, ranking, conditional aggregation, and business KPI calculations**.

---

## 🎯 Business Objectives

The SQL analysis is designed to answer questions such as:

- How many total bookings were made?
- What is the booking success rate?
- What is the total and average booking value?
- Which booking statuses are most common?
- Which vehicle types generate the most bookings and revenue?
- Which payment methods are most commonly used and generate the highest revenue?
- How does booking volume and revenue change over time?
- Which pickup and drop locations have the highest booking activity?
- Which routes generate the highest booking volume and revenue?
- Which locations have high cancellation rates?
- Who are the highest-value and highest-frequency customers?
- Are high-frequency customers also high-revenue customers?
- How does monthly revenue change compared with the previous month?
- How do vehicle types rank by monthly revenue?

---

# 🗂️ Database Schema

The database is named:

```sql
uber_ride_analytics
```

The project creates seven relational tables:

| Table | Purpose |
|---|---|
| `bookings` | Core booking-level information, including status, booking value, ride distance, wait times, ratings, and foreign keys |
| `customers` | Customer IDs and customer ratings |
| `calendar` | Date, month, quarter, year, weekday, and weekend information |
| `vehicles` | Vehicle IDs and vehicle types |
| `locations` | Location IDs and location names |
| `payments` | Payment IDs and payment methods |
| `cancellation` | Customer/driver cancellation and incomplete-ride information |

### Main relationships

The `bookings` table acts as the central transactional table and connects to:

- `customers` through `Customer_ID`
- `calendar` through `Calendar_ID`
- `vehicles` through `Vehicle_ID`
- `payments` through `Payment_ID`
- `locations` through `Pickup_Location_ID` and `Drop_Location_ID`
- `cancellation` through `Booking_ID`

For pickup and drop analysis, the `locations` table is joined twice using different aliases.

---

# 🛠️ Tools & Technologies

- **MySQL**
- MySQL Workbench
- SQL

### SQL concepts demonstrated

- `CREATE DATABASE`
- `CREATE TABLE`
- `LOAD DATA LOCAL INFILE`
- `SELECT`
- `WHERE`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `LIMIT`
- `CASE WHEN`
- `DISTINCT`
- Aggregate functions: `COUNT`, `SUM`, `AVG`
- `ROUND`
- `JOIN`
- Multiple table joins
- **CTEs (`WITH`)**
- **Window functions**
- `LAG()`
- `RANK()`
- `DENSE_RANK()`
- Conditional aggregation
- Percentage calculations
- Month-over-month growth calculations

---

# 📊 Business Analysis

## 1. Booking Performance Analysis

# 2. Time-Based Analysis

The SQL analysis investigates booking and revenue trends over time.

### Questions answered

- How does booking volume vary by month?
- Which weekday has the highest booking volume?
- Which quarter generates the highest revenue?
- What is the monthly revenue trend?
- What is the month-over-month revenue growth?

### SQL techniques used

The monthly booking analysis uses a **CTE** together with the `LAG()` window function to compare current-month bookings with the previous month.

The revenue-growth analysis follows the same approach:

```sql
LAG(Monthly_Revenue) OVER (
    ORDER BY Year, Month
)
```

This enables calculation of:

**MoM Revenue Growth % =**

```text
(Current Month Revenue - Previous Month Revenue)
÷ Previous Month Revenue × 100
```

---

# 🚗 3. Vehicle Analysis

The project evaluates vehicle performance from several perspectives.

### Questions answered

- Which vehicle type has the highest number of bookings?
- Which vehicle type generates the highest revenue?
- Which vehicle type has the highest average booking value?
- Which vehicle type has the highest average ride distance?
- Which vehicle types have the highest cancellation rates?
- How does each vehicle type rank by revenue within each month?
- What percentage of total revenue does each vehicle type contribute?

### Advanced SQL

Monthly vehicle revenue ranking is calculated using:

```sql
RANK() OVER (
    PARTITION BY Year, Month
    ORDER BY SUM(Booking_Value) DESC
)
```

Revenue contribution is calculated using a windowed aggregation:

```sql
SUM(Booking_Value) * 100.0
/
SUM(SUM(Booking_Value)) OVER ()
```

This allows vehicle types to be compared not only by absolute revenue but also by their contribution to overall revenue.

---

# 💳 4. Payment Analysis

The project analyzes payment behavior by examining:

- Most commonly used payment method
- Payment method generating the highest revenue
- Average booking value by payment method

The analysis joins `bookings` with `payments` using `Payment_ID`.

This provides a business view of customer payment preferences and their relationship with booking value.

---

# 📍 5. Location Analysis

Location-level analysis is performed using the `locations` table.

### Questions answered

- Which pickup location has the most bookings?
- Which drop location receives the most bookings?
- Which locations have the highest cancellation rates?
- Which pickup locations generate the most revenue each month?
- Which routes have the highest booking volume?
- Which routes generate the highest revenue?

The project performs separate joins for pickup and drop locations:

```sql
JOIN locations AS pickup
ON b.Pickup_Location_ID = pickup.Location_ID

JOIN locations AS dropoff
ON b.Drop_Location_ID = dropoff.Location_ID
```

### Monthly top locations

A `DENSE_RANK()` window function is used to identify the **top 3 pickup locations by revenue in every month**.

---

# 👥 6. Customer Analysis

Customer-level analysis focuses on customer value, frequency, and ratings.

### Questions answered

- Who are the highest-value customers?
- Which customers have made the most bookings?
- Which customers have the highest ratings?
- Are high-frequency customers also high-revenue customers?

The analysis calculates:

- Number of bookings per customer
- Total booking value per customer
- Customer rating
- Ranking based on booking activity and value

This helps identify high-value and high-frequency customer segments.

---

# ❌ 7. Cancellation Analysis

Cancellation behavior is analyzed at the vehicle and location levels.

### Questions answered

- Which vehicle types have the highest cancellation rates?
- Which pickup locations have the highest cancellation rates?
- Which locations have unusually high cancellation rates?

The cancellation rate is calculated using conditional aggregation:

```sql
COUNT(DISTINCT CASE
    WHEN Booking_Status IN (
        'Cancelled by Customer',
        'Cancelled by Driver'
    )
    THEN Booking_ID
END)
* 100.0
/
COUNT(DISTINCT Booking_ID)
```

A minimum booking-volume threshold is also applied in selected analyses to focus on locations with sufficient activity.

---

# Advanced SQL Analysis

This project goes beyond basic SQL queries and demonstrates several advanced analytical techniques.

### Common Table Expressions (CTEs)

Used for:

- Monthly booking calculations
- Vehicle cancellation calculations
- Monthly location revenue
- Monthly revenue growth

### Window Functions

Used for:

- Previous-month comparison with `LAG()`
- Monthly vehicle revenue ranking with `RANK()`
- Top-location ranking with `DENSE_RANK()`
- Overall revenue contribution calculations

### Conditional Aggregation

Used for:

- Booking success rate
- Cancellation rate
- Cancelled booking counts

### Multi-table Joins

Used extensively to combine transactional data with:

- Customer information
- Vehicle information
- Calendar attributes
- Payment methods
- Pickup locations
- Drop locations

---

# 💡 Business Insights Supported by the SQL Analysis

The SQL analysis is structured to identify insights such as:

- Overall booking performance and success rate
- Revenue contribution across vehicle types
- Differences in payment-method usage and value
- Monthly and quarterly booking/revenue trends
- High-demand pickup and drop locations
- High-performing routes
- Locations with elevated cancellation rates
- High-value and high-frequency customers
- Monthly revenue growth
- Vehicle-level operational performance

The exact numerical results are generated when the SQL script is executed against the project dataset.

---

# 🎓 Skills Demonstrated

This project demonstrates practical experience in:

**MySQL | SQL | Data Analysis | Relational Databases | Data Aggregation | Data Cleaning/Validation | JOINs | CTEs | Window Functions | RANK | DENSE_RANK | LAG | CASE Statements | KPI Analysis | Revenue Analysis | Customer Analysis | Vehicle Analysis | Location Analysis | Time-Series Analysis | Business Intelligence**

---

# Power BI Analysis:

This project presents an interactive **Power BI dashboard suite for Uber Ride Analytics**, built to transform a relational ride-booking dataset into actionable business insights.
The Power BI solution includes **four analytical dashboards** covering:

1. **Executive Overview**
2. **Operations & Vehicle Performance**
3. **Customer & Location Analysis**
4. **Cancellation & Root Cause Analysis**

The project also demonstrates practical use of **DAX, calculated tables, measures & columns, data modelling, relationships, slicers, KPI cards, and interactive visualizations**.

---

# 🎯 Business Objectives

The Power BI report was designed to answer key business questions across four areas:

### Executive Performance
- What is the overall booking volume and booking value?
- How many bookings are successful?
- How is booking activity changing over time?
- What is the distribution of booking status?
- How do weekday and weekend bookings compare?

### Operations & Vehicle Performance
- Which vehicle types generate the highest booking value?
- Which vehicle types have the highest success rate?
- Which vehicle types have higher cancellation rates?
- How do VTAT and CTAT vary by vehicle type?

### Customer & Location Analysis
- How many unique customers are served?
- What is the average customer rating?
- What is the average booking value?
- Which pickup/drop-off locations generate high booking volume and value?
- How does booking value vary by payment method?

### Cancellation & Root Cause Analysis
- What are the customer and driver cancellation rates?
- What is the value of cancelled bookings?
- What are the major reasons for customer cancellations?
- What are the major reasons for incomplete rides?
- How does cancellation rate vary across months?

---

# 🗂️ Data Model

The report uses a relational model consisting of the following tables:

| Table | Role |
|---|---|
| `Bookings` | Central transactional/fact table containing booking-level information |
| `Customers` | Customer information and customer ratings |
| `Calendar` | Calendar attributes used for time-based analysis |
| `Vehicles` | Vehicle IDs and vehicle types |
| `Payments` | Payment IDs and payment methods |
| `Cancellation` | Cancellation and incomplete-ride information |
| `Pickup_Locations` | Location dimension used for pickup analysis |
| `DropOff_Locations` | Location dimension used for drop-off analysis |
| `Date` | Dedicated DAX calculated date table for time intelligence |

### Data Modelling Approach

The report uses **Data Model relationships** in Power BI's Model View to connect the transactional `Bookings` table with the supporting dimension tables.

The location dimension is represented separately as:

- `Pickup_Locations`
- `DropOff_Locations`

This avoids ambiguity caused by using the same location table for two different roles in the `Bookings` table.

A dedicated **`Date` calculated table** was also created using DAX and used for time-based reporting, particularly the cancellation analysis.

I initially designed the Power BI model using a star-schema approach to maintain simplicity and performance. However, where the data required further normalization, such as separating location dimensions into role-specific pickup and drop-off tables, I adapted the model accordingly. This approach balanced performance, clarity, and data integrity without forcing a rigid star-schema structure.

---

# 📅 Date Table

A dedicated Date table was created using Power BI's **New Table / calculated table functionality in DAX**.

The Date table is used to support:

- Month-based analysis
- Month Name slicers
- Cancellation-rate analysis over time
- Time-based filtering and interaction

The report also uses a separate `Calendar` table containing calendar-related attributes used in the Executive Overview.

---

# DAX & Calculated Measures

The report uses DAX measures to create reusable business KPIs rather than relying only on raw columns.
Key measures used across the dashboards include:

### Booking & Revenue Measures

- **Total Bookings**
- **Successful Bookings**
- **Total Booking Value**
- **Successful Booking Value**

### Operational Measures

- **Success Rate**
- **Cancellation Rate**
- **Average VTAT**
- **Average CTAT**

### Cancellation Measures

- **Customer Cancellations**
- **Driver Cancellation Rate**
- **Cancelled Booking Value**
- **Incomplete Rides**
- **Incomplete Ride Rate**

These measures are used across KPI cards, charts, and interactive report elements.

---

# 🎨 Power BI Visualization Techniques

The report uses a variety of Power BI visuals, including:

- KPI/Card visuals
- Bar charts
- Clustered bar charts
- Clustered column charts
- Donut charts
- Area/line charts
- Tables
- Slicers
- Interactive date filters

The dashboards use consistent formatting, titles, KPI cards, borders, spacing, and visual hierarchy to create a unified reporting experience.

---

# 🔄 Report Workflow

The Power BI component follows this workflow:

```text
Raw Relational Data
        ↓
Data Preparation / Power Query
        ↓
Data Modelling
        ↓
Relationships
        ↓
DAX Calculated Table
        ↓
DAX Measures
        ↓
KPI & Visualization Development
        ↓
Interactive Dashboards
        ↓
Business Insights
```

---

# 🔍 Key Business Insights

The Power BI dashboards provide several high-level observations:

- Approximately **149K bookings** are represented in the report.
- Approximately **93K bookings were successful**.
- Total booking value is approximately **52M**, with successful booking value of approximately **47M**.
- **Auto** has the highest booking volume and highest displayed total booking value among vehicle types.
- **Uber XL** has the highest displayed vehicle-level success rate.
- **Go Sedan** has the highest displayed cancellation rate among vehicle types.
- **UPI** contributes the largest share of total booking value among payment methods.
- **Narsinghpur** is the highest-valued drop-off location among the highlighted locations.
- **Wrong Address** is the leading displayed customer cancellation reason.
- Cancellation rates vary across months, with the displayed values remaining within a relatively narrow range.

---

# 🛠️ Tools & Technologies

- **Power BI Desktop**
- **Power Query**
- **DAX**
- **Data Modelling**
- **Power BI Visualizations**
- **Relational Data Modelling**
- **Interactive Dashboard Development**

### Core skills demonstrated

**DAX | Calculated Tables | Measures | Data Modelling | Relationships | Power Query | Data Transformation | KPI Development | Data Visualization | Dashboard Design | Business Intelligence | Interactive Reporting**

---

# 🎓 Skills Demonstrated

This Power BI project demonstrates practical experience in:

**Power BI | Power Query | DAX | Data Modelling | Calculated Tables | DAX Measures | Data Visualization | Dashboard Development | KPI Analysis | Business Intelligence | Interactive Reporting | Relational Data Models | Time-Based Analysis | Customer Analysis | Location Analysis | Vehicle Performance Analysis | Cancellation Analysis**

---

## 👤 Author

**Aish Joon**

Data Analyst | SQL | Python | Power BI | Excel