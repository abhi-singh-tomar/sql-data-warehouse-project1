# 🏢 Data Warehouse Project

A complete SQL Data Warehouse solution built using the Medallion Architecture (Bronze → Silver → Gold) to transform raw business data into analytics-ready datasets.

---

## 📌 Project Overview

This project demonstrates how to design and build an end-to-end Data Warehouse using SQL Server.

The pipeline extracts raw data from multiple source systems, cleans and standardizes it, creates dimensional models, and prepares business-ready datasets for reporting and analytics.

---

## 🎯 Objectives

Develop a scalable SQL Data Warehouse to:

- ✅ Integrate data from multiple sources
- ✅ Clean and standardize raw datasets
- ✅ Build Star Schema data models
- ✅ Create analytical tables for reporting
- ✅ Support Business Intelligence dashboards

---

## 🏗️ Architecture

The project follows the **Medallion Architecture**.

```
        Source Systems
              │
              ▼
        🥉 Bronze Layer
     (Raw Data Ingestion)
              │
              ▼
        🥈 Silver Layer
   (Cleaning & Transformation)
              │
              ▼
         🥇 Gold Layer
     (Business Data Models)
              │
              ▼
     Power BI / SQL Analytics
```

---

## 📂 Project Structure

```
Data-Warehouse-Project/

│
├── datasets/
│   ├── crm/
│   └── erp/
│
├── scripts/
│   ├── Bronze/
│   ├── Silver/
│   ├── Gold/
│   └── Stored Procedures/
│
├── documentation/
│   ├── Data_Model.png
│   ├── Architecture.png
│   └── Data_Flow.png
│
├── README.md
└── LICENSE
```

---

## ⚙️ Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- ETL Pipeline
- Star Schema
- Data Modeling
- Git & GitHub

---

## 🔄 ETL Workflow

### 🥉 Bronze Layer
- Import raw CRM & ERP datasets
- Preserve original data
- No transformations

### 🥈 Silver Layer
- Handle NULL values
- Remove duplicates
- Standardize formats
- Apply business rules
- Improve data quality

### 🥇 Gold Layer
- Build Dimension Tables
- Build Fact Tables
- Create Star Schema
- Prepare analytics-ready datasets

---

## 📊 Business Analytics

The Data Warehouse enables analysis such as:

- 📈 Sales Performance
- 👥 Customer Behavior
- 💰 Revenue Trends
- 📦 Product Performance
- 🌍 Regional Sales Analysis
- 📅 Time-based Reporting

---

## ⭐ Key Features

- Modular ETL pipeline
- Layered architecture
- Clean SQL coding practices
- Scalable data model
- Analytics-ready design
- Easy maintenance

---

## 🚀 Future Improvements

- SQL Agent Automation
- Incremental Loading
- Slowly Changing Dimensions (SCD)
- Data Quality Reports
- Power BI Dashboard Integration
- Performance Optimization

---

## 📸 Project Preview

(Add screenshots here)

Example:

- Data Model
- Star Schema
- ETL Execution
- SQL Queries
- Power BI Dashboard

---

## 📜 License

This project is licensed under the MIT License.

---

## 👨‍💻 About Me

Hi, I'm **Abhishek Tomar**.

I Want to start my journey as professional Data Analysts about **Data Analytics**, **Business Intelligence**, **SQL**, **Power BI**, and **Data Engineering**.

This project is part of my journey toward becoming a Data Analyst.



---
