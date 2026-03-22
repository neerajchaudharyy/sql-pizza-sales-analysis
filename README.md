# 🍕 Pizza Sales SQL Analysis

## 📌 Project Overview

This project focuses on analyzing pizza sales data using SQL. It includes database schema design, establishing relationships using primary and foreign keys, and performing data analysis to extract meaningful insights.

---

## 🛠️ Tools & Technologies

* SQL (MySQL)
* MySQL Workbench
* CSV Dataset

---

## 🗂️ Project Structure

```
pizza-sales-sql-analysis/
│
├── data/
│   ├── orders.csv
│   ├── order_details.csv
│   ├── pizzas.csv
│   └── pizza_types.csv
|
├── images/
│   └── er-diagram.png
│
├── sql/
│   ├── schema.sql
│   └── analysis.sql
│
│
└── README.md
```

---

## 🧱 Database Design

* Created relational schema using multiple tables
* Implemented **Primary Keys** and **Foreign Keys**
* Established relationships between:

  * orders ↔ order_details
  * pizzas ↔ order_details
  * pizza_types ↔ pizzas

---

## 📊 Key Analysis Performed

* Total number of orders
* Total revenue generated
* Most popular pizza types and sizes
* Category-wise sales analysis
* Orders distribution by time
* Top pizzas based on revenue
* Cumulative revenue trends
* Percentage contribution of each pizza type

---

## 🧠 Skills Demonstrated

* SQL Joins (INNER JOIN)
* Aggregation functions (SUM, COUNT, AVG)
* GROUP BY & ORDER BY
* Subqueries
* Window Functions (RANK, SUM OVER)
* Data Cleaning & Transformation
* Database Schema Design

---

## 🚀 Conclusion

This project demonstrates how SQL can be used to design a relational database and analyze business data to generate actionable insights.

---

## 📎 Author

Neeraj Chaudhary
