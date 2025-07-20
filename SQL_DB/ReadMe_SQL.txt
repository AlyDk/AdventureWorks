# 🧠 AdventureWorks SQL Data Analysis

This project showcases a complete SQL-based data cleaning and analytical workflow using Microsoft's AdventureWorks dataset. It includes issue detection, data cleaning, view creation, and metric extraction — all performed in MySQL Workbench and exported for Excel visualization.

---

## 📁 Repository Structure

| File | Description |
|------|-------------|
| `01_AdventureWorks_Detecting&Identifying.sql` | Scripts to explore the raw data and identify data quality issues, placeholders (`-1`, `NA`, etc.), and check date formats |
| `02_AdventureWorks_Cleaning.sql` | SQL transformations to clean the data: replace `-1` keys, add placeholder rows, convert date formats, and create clean tables |
| `03_AdventureWorks_Analysis.sql` | SQL views that calculate KPIs like Total Sales, YoY Growth, and Top Resellers/Customers — optimized for Excel export |

---

## 🧹 Cleaning Steps Performed

1. Replaced invalid `CustomerKey = -1` with `10999`, and `ResellerKey = -1` with `0`
2. Added dummy records in `customer_data` and `reseller_data` for those placeholder keys
3. Converted `OrderDateKey`, `DueDateKey`, and `ShipDateKey` (int format) to proper `DATE` format
4. Created clean tables: `customer_data_cleaned`, `reseller_data_cleaned`, `sales_data_cleaned`

---

## 📊 SQL Views for Analysis

| View Name | Description |
|-----------|-------------|
| `vw_total_sales` | Overall total sales amount |
| `vw_sales_by_category` | Sales and quantity broken down by product category |
| `vw_monthly_sales_trend` | Monthly trend of total sales |
| `vw_yoy_sales_growth` | Year-over-year sales comparison with % growth |
| `vw_top_resellers` | Top 5 resellers by sales and average order value |
| `vw_top_customers` | Top 5 customers by sales and average order value |

Each view was designed to be easily exportable to Excel for pivot tables and visual reporting.

---

## 📤 Exporting Results

After running the views, you can:
- Use `SELECT * FROM view_name;` and export from MySQL Workbench as .csv
- Used Python then to combine all the .csv files into one .xlsx file with multiple sheets
- Added Quick visual charts for each Sheet.

---

## 🧰 Technologies Used

- MySQL Workbench
- SQL (MySQL 8+)
- Excel (for pivot visuals)

---

## 📌 Notes

- Dummy customer and reseller entries (for `-1` records) use IDs `10999` and `0`
- Views exclude placeholder rows (`Customer = 'NA'`, `Reseller = 'NA'`) from top analyses

---

## 📈 Ideal For

- SQL portfolio projects
- ETL practice
- Dashboard prototyping (via Excel, Power BI, Tableau)
- Demonstrating business KPI reporting logic

---

## 🧑‍💻 Author

Ali Dakak
https://www.linkedin.com/in/ali-dakak-2a003087
https://github.com/AlyDk
 
