# E-commerce Data Analysis Project

This repository contains a complete, end-to-end data analysis project performed on a large-scale Brazilian e-commerce dataset. The project encompasses the entire business intelligence workflow, from raw data ingestion and database creation in SQL Server to building an interactive, multi-page dashboard in Power BI.

---

## Power BI Dashboard Showcase

This project culminates in a three-page interactive Power BI dashboard designed to provide a comprehensive overview of the business's performance.

### **Page 1: Executive Performance Dashboard**
A high-level summary of key performance indicators (KPIs), monthly trends, and top product categories.

### **Page 2: Customer Analysis Deep Dive**
A detailed look at customer geography, retention rates, and top-spending customers.

### **Page 3: Product & Seller Analysis**
An analysis of product and seller performance, including revenue, profitability, and the correlation between delivery times and customer satisfaction.

---

## Tools Used

* **Database:** Microsoft SQL Server
* **Business Intelligence:** Microsoft Power BI
* **Version Control:** Git & GitHub

---

## Repository Structure

The project is organized into the following directories:

* **`/Power BI`**: Contains the main Power BI project file (`.pbix`) and a subfolder with screenshots of the final dashboards.
    * `/Dashboards`: Screenshots of the three dashboard pages.
* **`/Result Matrix`**: Contains the final summary of all business questions, findings, and actionable insights in an Excel file.
* **`/SQL Files`**: Contains all the T-SQL scripts used in the project, organized by function.
    * `Creating Tables.sql`: Scripts to create the database schema.
    * `Basic alterations.sql`: Scripts for foreign keys and data validation.
    * `Business Questions.sql`: The complete set of analytical queries.

---

##  Project Workflow

This project followed a structured, end-to-end business intelligence workflow:

1.  **Database Design & Creation:**
    * Inspected raw CSV files to understand the data entities and relationships.
    * Designed a relational database schema.
    * Created the tables with appropriate data types and primary keys in SQL Server using the `Creating Tables.sql` script.

2.  **Data Ingestion & Cleaning:**
    * Imported data from the source CSVs into the SQL Server database.
    * Performed data validation and cleaning. Identified and handled significant data integrity issues, particularly with unassigned seller IDs.

3.  **Relational Modeling:**
    * Established foreign key relationships between the tables to enforce data integrity using the `Basic alterations.sql` script.

4.  **SQL Analysis:**
    * Authored complex T-SQL queries to answer a comprehensive list of business questions. These queries are documented in the `Business Questions.sql` script.

5.  **Dashboard Development in Power BI:**
    * Connected Power BI directly to the SQL Server database.
    * Created a data model and established relationships within Power BI.
    * Developed DAX measures to calculate key business metrics.
    * Designed and built a three-page interactive dashboard to visualize the findings from the SQL analysis.

---

## How to Use This Repository

To explore this project:

1.  **Set up the Database:**
    * Create a new database in SQL Server (e.g., `Ecom`).
    * Run the script from `/SQL Files/Creating Tables.sql` to create the table schema.
    * Import the raw data from the original Kaggle dataset into the corresponding tables.
    * Run the script from `/SQL Files/Basic alterations.sql` to create the foreign keys.

2.  **View the Power BI Report:**
    * Open the `/Power BI/Ecommerce PowerBI Project.pbix` file.
    * You may need to update the data source credentials to point to your local SQL Server instance.

3.  **Explore the Findings:**
    * Review the final summary in `/Result Matrix/Result.xlsx`.
    * Examine the analytical queries in `/SQL Files/Business Questions.sql`.
