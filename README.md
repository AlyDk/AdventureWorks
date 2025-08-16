# 🚲 AdventureWorks Sales Analysis (SQL + Python + Excel)

This project delivers a complete data workflow for cleaning, analyzing, and reporting on the AdventureWorks dataset using **MySQL**, **Python**, and **Excel**. It mirrors real-world BI tasks like data validation, SQL-based transformations, and visual reporting preparation.

---

## 🎯 Project Goal

To simulate a business-focused data analysis pipeline that:
- Identifies and cleans raw sales data
- Prepares analysis-ready tables using SQL and Python
- Generates KPIs and reusable SQL views
- Exports data for Excel-based reporting and visualization

---

## 🧰 Tools & Technologies

- **SQL (MySQL Workbench)** — cleaning, joining, and view creation
- **Python (Pandas, OpenPyXL)** — data preprocessing, CSV manipulation, Excel exports
- **Excel** — for pivot charts and dashboard-style insights

---

## 🗂 Project Structure

| Component | Description |
|----------|-------------|
| `01_AdventureWorks_Detecting&Identifying.sql` | SQL diagnostics for data issues and structure |
| `02_AdventureWorks_Cleaning.sql` | SQL-based cleaning, key correction, and date conversions |
| `03_AdventureWorks_Analysis.sql` | Reusable views for metrics like sales trends and top customers |
| `AdventureWorks_Data_Cleaning.ipynb` | Python script to inspect and clean the original Excel dataset |
| `Export_CSV_Files.ipynb` | Python script to export each Excel sheet as an individual `.csv` |
| `Combined_CSV_for_Visuals.ipynb` | Python script to merge `.csv` exports into a single `.xlsx` for visualization |
| `Exports/` | Folder containing `.csv` files generated from SQL views |
| `Combined_for_Visuals.xlsx` | Final Excel file for reporting, with multiple KPI sheets |

---

## 📊 Key Views & Metrics

| View | Description |
|------|-------------|
| `vw_total_sales` | Total revenue |
| `vw_sales_by_category` | Sales and quantity by product category |
| `vw_monthly_sales_trend` | Month-by-month sales evolution |
| `vw_yoy_sales_growth` | Year-over-year sales growth (%) |
| `vw_top_resellers` | Top 5 resellers by sales and AOV |
| `vw_top_customers` | Top 5 customers by sales and AOV |

---

## 📤 Output Workflow

| Step | Tool | Output |
|------|------|--------|
| Data cleaning | Python (`.ipynb`) | Cleaned `.xlsx` file |
| SQL analysis | MySQL Workbench | Materialized SQL views |
| View export | SQL or Python | Individual `.csv` files |
| Report assembly | Python | Combined Excel report: `Combined_for_Visuals.xlsx` |

---

## 📌 Key Notes

- Invalid foreign keys (`-1`) replaced with dummy entries: `CustomerKey = 10999`, `ResellerKey = 0`
- Dates originally in `YYYYMMDD` int format converted to SQL `DATE`
- Final analysis is portable via `.csv` or `.xlsx` and ready for BI or Excel dashboards

---

## 🔗 Data Source

This project uses the Microsoft Power BI AdventureWorks Sales Sample:  
[AdventureWorks Sales.xlsx](https://github.com/microsoft/powerbi-desktop-samples/blob/main/AdventureWorks%20Sales%20Sample/AdventureWorks%20Sales.xlsx?utm_source=chatgpt.com)

---

## ✅ Ideal For

- SQL and ETL portfolio demonstration
- Excel + SQL dashboard integration practice
- Learning how to bridge SQL and Python for BI reporting

---

## 🧑‍💻 Author

Ali Dakak
- https://cutt.ly/ali-resume-linkedin
- https://cutt.ly/ali-resume-dsportfolio
- https://cutt.ly/ali-resume-tableau
- https://cutt.ly/ali-resume-github
