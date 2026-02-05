# Online-Retail-Analysis-SQL-PowerBI
“This project showcases an end-to-end data analysis workflow using PostgreSQL for data cleaning and transformation, and Power BI for visualization. Using the Online Retail dataset, it delivers clean, analysis-ready data and interactive dashboards that generate actionable business insights.”

# Online Retail Data Analysis & ETL Pipeline

## 📌 Project Overview
This project transforms raw e-commerce transactional data into an interactive business intelligence solution. I implemented a full data workflow: from ingestion and cleaning in **SQL (PostgreSQL)** using a staging-to-production architecture, to the creation of advanced dashboards in **Power BI**.

The primary goal was to resolve data quality issues—such as null values, incorrect date formats, and outliers—to provide reliable metrics on sales performance and customer behavior.

## 🛠️ Tech Stack
* **Database:** PostgreSQL (Staging -> Production Architecture).
* **BI Tool:** Power BI (Data Modeling, DAX, and Visualization).
* **Concepts:** ETL Process, Star Schema, Time Intelligence, and Business KPIs.

## 📁 Repository Structure
* `sql_scripts/`: Contains the full data cleansing and transformation pipeline.
* `power_bi/`: The `.pbix` file with the interactive dashboards.
* `images/`: Screenshots of the final reports.

---

## 🔍 Data Pipeline (SQL)
To ensure data integrity, I utilized a two-layer SQL architecture:

1. **Staging Phase:** Created an intermediate table where all fields were imported as `TEXT`. This allowed for successful ingestion of the original CSV despite formatting inconsistencies.
2. **Production Phase:** * **Cleaning:** Filtered out null `customer_id` records and removed transactions with negative prices or quantities.
   * **Type Casting:** Converted data types from text to numeric and date formats (`TO_TIMESTAMP`) to enable accurate calculations.
3. **Analytics Layer (Views):** Created an optimized `VIEW` that calculates `total_amount` at the server level, reducing the processing load on Power BI.

---

## 📊 Dashboard Insights

### 1. Executive Summary
* **Critical Seasonality: Identified a significant sales peak in November, consistently performing well above the annual monthly average. This trend is driven by the pre-Christmas campaign and highlights a high dependency on Q4 logistics.
* **Market Concentration:** The UK generates approximately 90% of revenue, indicating high geographical dependency.
* **Data Integrity Note:** Detected that December 2011 only contains 9 days of data. Insights were adjusted to avoid bias in annual growth conclusions.

### 2. Product & Customer Insights
* **Market Efficiency:** Countries like the **Netherlands and Australia** show a significantly higher **Average Ticket Size** than the UK, representing high-profitability opportunities.
* **Top Performance:** Identification of star products based on sales volume and contribution margin.



## 💡 How to Replicate
1. Clone this repository.
2. Run the `Script Sql Online_retail` script in your PostgreSQL environment.
3. Open the `.pbix` file in Power BI Desktop to explore the interactive visualizations.

---
**Contact:**
Let's connect! You can find me on [LinkedIn]([TU_URL_DE_LINKEDIN_AQUI](https://www.linkedin.com/in/daniel-cristians-a4b23b270/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BY5aWothPR9SQpMHE4gIcYg%3D%3D)).
