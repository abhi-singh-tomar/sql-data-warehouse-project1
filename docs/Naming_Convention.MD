# Naming Conventions

This document outlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse.

## Table of Contents

- [General Principles](#general-principles)
- [Table Naming Conventions](#table-naming-conventions)
  - [Bronze Rules](#bronze-rules)
  - [Silver Rules](#silver-rules)
  - [Gold Rules](#gold-rules)
- [Column Naming Conventions](#column-naming-conventions)
  - [Surrogate Keys](#surrogate-keys)
  - [Technical Columns](#technical-columns)
- [Stored Procedures](#stored-procedures)

---

# General Principles

- **Naming Convention:** Use `snake_case` with lowercase letters and underscores (`_`) to separate words.
- **Language:** Use English for all object names.
- **Avoid Reserved Words:** Do not use SQL reserved keywords as object names.

---

# Table Naming Conventions

## Bronze Rules

All table names must start with the source system name. Table names should match the original source table names without renaming.

**Pattern**

```text
<sourcesystem>_<entity>
```

Where:

- `<sourcesystem>` = Source system name (e.g., `crm`, `erp`)
- `<entity>` = Original table name from the source system

**Example**

```text
crm_customer_info
```

> Customer information from the CRM system.

---

## Silver Rules

All table names must start with the source system name. Table names should match the original source table names without renaming.

**Pattern**

```text
<sourcesystem>_<entity>
```

Where:

- `<sourcesystem>` = Source system name (e.g., `crm`, `erp`)
- `<entity>` = Original table name from the source system

**Example**

```text
crm_customer_info
```

> Cleaned and standardized customer information from the CRM system.

---

## Gold Rules

Use meaningful, business-friendly table names with a category prefix.

**Pattern**

```text
<category>_<entity>
```

Where:

- `<category>` = Table type (`dim`, `fact`, `report`)
- `<entity>` = Business entity (e.g., `customers`, `products`, `sales`)

**Examples**

```text
dim_customers
fact_sales
report_sales_monthly
```

---

### Glossary of Category Prefixes

| Prefix | Meaning | Example |
|---------|---------|---------|
| `dim_` | Dimension table | `dim_customers`, `dim_products` |
| `fact_` | Fact table | `fact_sales` |
| `report_` | Reporting table | `report_customers`, `report_sales_monthly` |

---

# Column Naming Conventions

## Surrogate Keys

All primary keys in dimension tables must use the suffix `_key`.

**Pattern**

```text
<table_name>_key
```

Where:

- `<table_name>` = Entity name
- `_key` = Indicates a surrogate key

**Example**

```text
customer_key
```

> Surrogate key for the `dim_customers` table.

---

## Technical Columns

All system-generated metadata columns must start with the prefix `dwh_`.

**Pattern**

```text
dwh_<column_name>
```

Where:

- `dwh` = Data warehouse metadata prefix
- `<column_name>` = Descriptive technical column name

**Examples**

```text
dwh_load_date
dwh_create_date
dwh_update_date
```

---

# Stored Procedures

Stored procedures used for loading data into warehouse layers must follow this naming convention.

**Pattern**

```text
load_<layer>
```

Where:

- `<layer>` = Warehouse layer (`bronze`, `silver`, `gold`)

**Examples**

```text
load_bronze
load_silver
load_gold
```
