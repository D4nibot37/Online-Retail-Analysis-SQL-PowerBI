# 🛒 Online Retail Analytics – End-to-End BI Project

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Data Modeling](https://img.shields.io/badge/Data_Modeling-Star_Schema-brightgreen?style=for-the-badge)
![DAX](https://img.shields.io/badge/DAX-Advanced-blue?style=for-the-badge)

## 🎯 Business Objective
The goal of this project is to analyze transactional data from a UK-based online retail company to uncover sales trends, customer behavior, and product performance. The project demonstrates an **end-to-end analytics pipeline**, from raw data extraction and transformation in PostgreSQL to dimensional modeling and interactive visualization in Power BI.



## 📊 Dashboard Previews

### 1. Executive Summary
*Provides a high-level overview of KPIs, revenue trends, and geographical distribution.*
![Executive Summary Dashboard](images/executive_summary.png) 


### 2. Product & Customer Insights
*Deep dive into basket analysis, customer segmentation, and product profitability.*
![Product & Customer Insights Dashboard](images/product_customer_insights.png)

---

## 💡 Key Business Insights

- **Seasonality & Campaigns:** Strong sales seasonality with a significant revenue peak in **November** driven by pre-Christmas campaigns.
- **Market Concentration:** The **UK generates ~90% of total revenue**, indicating a highly concentrated core market.
- **Expansion Opportunities:** Despite lower overall volume, the **Netherlands and Australia** show a significantly higher *Average Ticket Size* compared to the UK, presenting high-profit opportunities for targeted marketing.
- **Product Concentration:** Identified the Top 10 products driving the majority of the sales volume, visualized through a Quantity vs. Total Sales scatter plot.
- *(Data Quality Note: December 2011 contains only 9 days of data, which was handled using Time Intelligence DAX functions to prevent skewed YoY comparisons).*

---

## ⚙️ Technical Architecture & Data Model

The data was processed using an ELT approach. Raw data was staged in **PostgreSQL**, cleaned, and transformed into analytics-ready views before being loaded into Power BI.

### Dimensional Model (Star Schema)
The Power BI data model was strictly designed following Kimball's Star Schema methodology to ensure optimal performance and DAX simplicity.

![Star Schema Data Model](images/star_schema.png)
*Fact_sales table connected via 1-to-many relationships to Dim_date, Dim_customer, Dim_product, and Dim_geography.*

### 🛠️ Skills Highlighted
- **ETL/SQL:** Staging → Production architecture, window functions, data cleansing.
- **Data Modeling:** Star schema creation, relationship cardinality, handling slowly changing dimensions (SCD).
- **Advanced DAX:** - Time Intelligence (`SAMEPERIODLASTYEAR`, `YTD`).
  - Context Transition (`CALCULATE`, `FILTER`).
  - Dynamic measures for slicers.
- **Data Visualization:** UX/UI best practices, custom tooltips, drill-throughs, and interactive storytelling.

---

## 💻 How to Replicate This Project

1. **Clone the repository:**
   ```bash
   git clone https://github.com/D4nibot37/online-retail-analytics.git
