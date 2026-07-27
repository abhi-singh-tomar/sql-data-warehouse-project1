Naming Conventions
This document outlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse.
Table of Contents
General Principles
Table Naming Conventions
Bronze Rules
Silver Rules
Gold Rules
Column Naming Conventions
Surrogate Keys
Technical Columns
Stored Procedure
---
General Principles
Naming Conventions: Use snake_case, with lowercase letters and underscores (`\_`) to separate words.
Language: Use English for all names.
Avoid Reserved Words: Do not use SQL reserved words as object names.
Table Naming Conventions
Bronze Rules
All names must start with the source system name, and table names must match their original names without renaming.
`<sourcesystem>\_<entity>`
`<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).
`<entity>`: Exact table name from the source system.
Example: `crm\_customer\_info` → Customer information from the CRM system.
Silver Rules
All names must start with the source system name, and table names must match their original names without renaming.
`<sourcesystem>\_<entity>`
`<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).
`<entity>`: Exact table name from the source system.
Example: `crm\_customer\_info` → Customer information from the CRM system.
Gold Rules
All names must use meaningful, business-aligned names for tables, starting with the category prefix.
`<category>\_<entity>`
`<category>`: Describes the role of the table, such as `dim` (dimension) or `fact` (fact table).
`<entity>`: Descriptive name of the table, aligned with the business domain (e.g., `customers`, `products`, `sales`).
Examples:
`dim\_customers` → Dimension table for customer data.
`fact\_sales` → Fact table containing sales transactions.
Glossary of Category Patterns
Pattern	Meaning	Example(s)
`dim\_`	Dimension table	`dim\_customer`, `dim\_product`
`fact\_`	Fact table	`fact\_sales`
`report\_`	Report table	`report\_customers`, `report\_sales\_monthly`
Column Naming Conventions
Surrogate Keys
All primary keys in dimension tables must use the suffix `\_key`.
`<table\_name>\_key`
`<table\_name>`: Refers to the name of the table or entity the key belongs to.
`\_key`: A suffix indicating that this column is a surrogate key.
Example: `customer\_key` → Surrogate key in the `dim\_customers` table.
Technical Columns
All technical columns must start with the prefix `dwh\_`, followed by a descriptive name indicating the column's purpose.
`dwh\_<column\_name>`
`dwh`: Prefix exclusively for system-generated metadata.
`<column\_name>`: Descriptive name indicating the column's purpose.
Example: `dwh\_load\_date` → System-generated column used to store the date when the record was loaded.
Stored Procedure
All stored procedures used for loading data must follow the naming pattern:
`load\_<layer>`.
`<layer>`: Represents the layer being loaded, such as `bronze`, `silver`, or `gold`.
Example:
`load\_bronze` → Stored procedure for loading data into the Bronze layer.
`load\_silver` → Stored procedure for loading data into the Silver layer.
