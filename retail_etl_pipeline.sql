-- =================================================================
-- PROJECT: Online Retail End-to-End Data Pipeline
-- ARCHITECTURE: Staging -> Production -> View
-- PURPOSE: Data ingestion, cleaning, and type formatting
-- =================================================================

-- 1. STAGING PHASE
-- I created a 'staging' table with all columns as TEXT/VARCHAR 
-- to ensure a successful import from the raw CSV regardless of formatting.

/* CREATE TABLE online_retail_staging (
    invoiceno VARCHAR(255),
    stockcode VARCHAR(255),
    description VARCHAR(255),
    quantity VARCHAR(255),
    invoicedate VARCHAR(255),
    unitprice VARCHAR(255),
    customerid VARCHAR(255),
    country VARCHAR(255)
);
-- Data was imported into 'online_retail_staging' using pgAdmin Import Wizard.
*/

-- 2. DATA AUDIT (Inside Staging)
-- Identifying nulls and anomalies before moving to Production
SELECT COUNT(*) FROM online_retail_staging WHERE customerid IS NULL;
SELECT COUNT(*) FROM online_retail_staging WHERE CAST(quantity AS DECIMAL) <= 0;

-- 3. PRODUCTION PHASE (CLEAN TABLE)
-- Transitioning data from Staging to a Clean Table with proper data types.
-- We fix date formats and filter out records that compromise data integrity.

CREATE TABLE online_retail_clean AS
SELECT 
    invoiceno,
    stockcode,
    description,
    CAST(quantity AS INTEGER) AS quantity,
    TO_TIMESTAMP(invoicedate, 'MM/DD/YYYY HH24:MI') AS invoice_timestamp,
    CAST(unitprice AS DECIMAL) AS unit_price,
    CAST(customerid AS INTEGER) AS customer_id,
    country
FROM online_retail_staging
WHERE customerid IS NOT NULL 
  AND CAST(quantity AS DECIMAL) > 0 
  AND CAST(unitprice AS DECIMAL) > 0;

-- 4. ANALYTICS LAYER (VIEW CREATION)
-- Creating a light-weight View for Power BI connection.
-- Includes the business logic for Total Amount.

CREATE OR REPLACE VIEW vw_online_retail_final AS
SELECT 
    invoiceno,
    stockcode,
    description,
    quantity,
    invoice_timestamp,
    unit_price,
    (quantity * unit_price) AS total_amount, 
    customer_id,
    country
FROM online_retail_clean;

-- 5. FINAL QUALITY CHECK
SELECT * FROM vw_online_retail_final LIMIT 10;