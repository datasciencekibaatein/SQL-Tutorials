# 🗄️ SQL Introduction Tutorial

This tutorial provides a foundational overview of **data**, **databases**, and **Structured Query Language (SQL)**, with a focus on **MySQL** as a relational database management system.

---

## 1️⃣ Understanding Data

### 📌 What is Data?
**Data** is a collection of raw facts, figures, or observations.

### 📊 Forms of Data
Data can exist in various forms, including:
- Text
- Numbers
- Images
- Audio
- Video

### 🔄 Data vs. Information
- **Data**: Raw and unprocessed facts  
- **Information**: Processed, organized, and meaningful data  

**Example**:  
- `100` → Data  
- `Sales for today = 100 units` → Information

---

## 2️⃣ What is a Database?

### 📌 Definition
A **database** is an organized collection of structured data.

### 🎯 Purpose
- Efficient storage  
- Fast retrieval  
- Easy management of data  

### 🗂️ Analogy
Think of a database as a **digital filing cabinet**:
- **Database** → Library  
- **Records** → Books  

### ✅ Key Benefit
Transforms a messy pile of files into a **searchable and efficient system**.

---

## 3️⃣ File System vs. DBMS

A **Database Management System (DBMS)** offers significant advantages over traditional file systems such as Excel files or folders.

| Feature | File System (Excel / Folders) | DBMS (SQL Database) |
|-------|------------------------------|---------------------|
| **Data Redundancy** | High (duplicate data common) | Low (minimal duplication) |
| **User Access** | Usually single-user | Multi-user |
| **Search Speed** | Slow for large data | Very fast (indexing) |
| **Security** | Minimal | Strong and granular |
| **Data Volume** | Small to Medium | Massive (TBs of data) |

---

## 4️⃣ Introduction to SQL

### 🧠 What is SQL?
- **SQL** stands for **Structured Query Language**
- It is the standard language used to communicate with databases

### 🎯 Purpose of SQL
SQL is used to:
- Query (retrieve) data
- Insert, update, and delete data
- Manage database structures

### 🌍 Standardization
- Core SQL commands remain mostly the same across all database systems

### 🔊 Pronunciation
SQL can be pronounced as:
- **S-Q-L**
- **Sequel**

---

## 5️⃣ Logical Organization of Data

Databases store data in a **structured and logical** manner.

### 📋 Tables
- Hold data related to a specific subject  
  *(e.g., Customers, Orders)*

### 🧱 Columns (Fields)
- Vertical components of a table  
- Define the type of data stored  
  *(e.g., Name, Date, Price)*

### 📄 Rows (Records)
- Horizontal components  
- Each row represents one unique entry

---

## 6️⃣ Relational Database Management System (RDBMS)

An **RDBMS** follows specific rules to manage data efficiently.

### 🔑 Key Characteristics
- **Tabular Structure**: Data stored in rows and columns
- **Primary Key**: Unique identifier for each record
- **Relationships**: Links between tables to reduce duplication
- **Data Integrity**: Rules ensure accuracy and consistency

### ⭐ Popular RDBMS Examples
- **MySQL** – Open-source, beginner-friendly, widely used
- **Oracle** – Powerful, enterprise-level database
- **Microsoft SQL Server** – Enterprise-focused, Windows-based
- **PostgreSQL** – Advanced open-source database

---

## 7️⃣ Deep Dive: MySQL

### 🐬 What is MySQL?
MySQL is one of the most popular **Relational Database Management Systems** in the world.

### ✅ Benefits
- Free and open-source
- Fast and reliable
- Easy to install and learn

### 🏢 Ownership
- Maintained by **Oracle Corporation**

### 🌐 Popular Users
Used by companies such as:
- Facebook
- YouTube
- Pinterest

---

## 📦 Databases vs. Tables in MySQL

### 🗃️ Database (Container)
- A **Database** is a container for related tables
- Think of it as a **Folder**
- You must create or select a database before creating tables

### 📊 Table (Data Grid)
- A **Table** stores the actual data
- Defined using:
  - Columns
  - Data types

### 🔢 Common Data Types
- Text (VARCHAR, CHAR)
- Numbers (INT)
- Dates (DATE)



---
# MySQL Fundamentals Tutorial

This tutorial combines **DDL Commands**, **Primary & Foreign Keys**, and **SQL Data Types in MySQL** into a single, structured guide. It is suitable for beginners and interview preparation, and can be directly used as **markdown for blogs, GitHub, or course notes**.

---

## 1. DDL (Data Definition Language)

DDL commands are used to **define, create, modify, and delete database structures**.

> Think of DDL as the *architect* of a database — it builds the structure, not the data.

### 1.1 Database-Level Commands

#### Create Database

Creates a new database.

```sql
CREATE DATABASE tech_store;
```

#### Drop Database

Deletes the database permanently (structure + data).

```sql
DROP DATABASE tech_store;
```

> ⚠️ Use with extreme caution.

> ❌ MySQL does **not** support `RENAME DATABASE` directly.

---

### 1.2 Table Creation

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    hire_date DATE
);
```

Each column must define:

* Column name
* Data type
* Optional constraints

---

### 1.3 ALTER TABLE (Modify Structure)

#### Add Column

```sql
ALTER TABLE employees ADD COLUMN email VARCHAR(100);
```

#### Modify Column

```sql
ALTER TABLE employees MODIFY COLUMN salary FLOAT;
```

#### Rename Column

```sql
ALTER TABLE employees RENAME COLUMN emp_name TO full_name;
```

#### Rename Table

```sql
ALTER TABLE employees RENAME TO staff_members;
```

---

### 1.4 DROP vs TRUNCATE

#### Drop Table

Deletes table structure and data.

```sql
DROP TABLE staff_members;
```

#### Truncate Table

Deletes all rows but keeps structure.

```sql
TRUNCATE TABLE staff_members;
```

---

### 1.5 DDL Summary

| Command  | Purpose           | Impact            |
| -------- | ----------------- | ----------------- |
| CREATE   | Create DB/Table   | Adds structure    |
| ALTER    | Modify structure  | Structure change  |
| DROP     | Delete everything | Permanent         |
| TRUNCATE | Remove all rows   | Structure remains |

---

## 2. Primary Keys & Foreign Keys

Relational databases use **keys** to uniquely identify records and maintain relationships.

---

### 2.1 Primary Key (PK)

A **Primary Key** uniquely identifies each row in a table.

#### Rules

* Must be **unique**
* Cannot be **NULL**
* Only **one per table**

Example:

```sql
author_id INT PRIMARY KEY
```

---

### 2.2 Foreign Key (FK)

A **Foreign Key** connects one table to another table’s primary key.

#### Rules

* Ensures **referential integrity**
* Can have duplicates
* Can be NULL (unless restricted)

---

### 2.3 One-to-Many Relationship Example

#### Parent Table

```sql
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100)
);
```

#### Child Table

```sql
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
```

---

### 2.4 Cascading Actions

```sql
FOREIGN KEY (author_id)
REFERENCES Authors(author_id)
ON DELETE CASCADE;
```

If a parent record is deleted, related child records are deleted automatically.

---

### 2.5 Practical Integrity Tests

#### Insert Valid Parent

```sql
INSERT INTO Authors VALUES (1, 'J.K. Rowling');
```

#### Invalid Child Insert (Fails)

```sql
INSERT INTO Books VALUES (101, 'Fake Book', 99);
```

#### Cascade Delete

```sql
DELETE FROM Authors WHERE author_id = 1;
```

All related books are removed automatically.

---

## 3. SQL Data Types in MySQL

Data types define **what kind of data** a column can store.

---

### 3.1 Numeric Data Types

#### Integer Types

| Type      | Size    | Range       |
| --------- | ------- | ----------- |
| TINYINT   | 1 byte  | -128 to 127 |
| SMALLINT  | 2 bytes | -32K to 32K |
| MEDIUMINT | 3 bytes | -8M to 8M   |
| INT       | 4 bytes | -2B to 2B   |
| BIGINT    | 8 bytes | Very large  |

Example:

```sql
age INT
```

---

#### Decimal & Floating Types

| Type         | Use                 |
| ------------ | ------------------- |
| DECIMAL(p,s) | Money, exact values |
| FLOAT        | Approximate         |
| DOUBLE       | Large decimals      |

```sql
salary DECIMAL(10,2)
```

---

### 3.2 String Data Types

| Type       | Description     |
| ---------- | --------------- |
| CHAR(n)    | Fixed length    |
| VARCHAR(n) | Variable length |
| TEXT       | Long text       |
| ENUM       | One value       |
| SET        | Multiple values |

```sql
name VARCHAR(50)
gender ENUM('Male','Female','Other')
skills SET('Python','SQL','PowerBI','ML')
```

---

### 3.3 Date & Time Data Types

| Type      | Format      |
| --------- | ----------- |
| DATE      | YYYY-MM-DD  |
| TIME      | HH:MM:SS    |
| DATETIME  | Date + Time |
| TIMESTAMP | Auto-update |
| YEAR      | YYYY        |

---

### 3.4 Boolean Type

MySQL stores BOOLEAN as `TINYINT(1)`

| Value | Meaning |
| ----- | ------- |
| 0     | FALSE   |
| 1     | TRUE    |

---

### 3.5 Binary & JSON Types

* **BLOB** → Images, files
* **JSON** → Structured data

```sql
extra_details JSON
```

---

## 4. Final Comprehensive Table Demo

```sql
CREATE TABLE demo_all_datatypes (
    user_id INT PRIMARY KEY AUTO_INCREMENT,

    age TINYINT,
    experience_years SMALLINT,
    salary DECIMAL(10,2),
    rating FLOAT,

    full_name VARCHAR(100),
    bio TEXT,
    gender ENUM('Male','Female','Other'),
    skills SET('Python','SQL','PowerBI','ML'),

    birth_date DATE,
    login_time TIME,
    registered_at DATETIME,
    last_updated TIMESTAMP,
    passing_year YEAR,

    is_active BOOLEAN,
    profile_image BLOB,
    extra_details JSON
);
```

---

### Insert Sample Data

```sql
INSERT INTO demo_all_datatypes (
    age, experience_years, salary, rating,
    full_name, bio, gender, skills,
    birth_date, login_time, registered_at, passing_year,
    is_active, extra_details
)
VALUES (
    22, 2, 45000.50, 4.5,
    'Amit Sharma', 'Data Science Student',
    'Male', 'Python,SQL',
    '2003-05-10', '10:30:00',
    '2025-01-10 09:00:00', 2024,
    TRUE,
    '{"course":"Data Science","mode":"Online"}'
);
```

---
## 5. DML (Data Manipulation Language)

DML is used to **insert, update, delete, and retrieve data** inside tables created using DDL.

---

### 6.1 INSERT – Adding Data

Single Row Insert:

```sql
INSERT INTO employees (emp_id, emp_name, salary)
VALUES (101, 'John Doe', 55000.00);
```

Multiple Rows Insert:

```sql
INSERT INTO employees (emp_id, emp_name, salary)
VALUES
(102, 'Jane Smith', 62000.00),
(103, 'Mike Ross', 48000.00);
```

---

### 6.2 UPDATE – Modifying Data

⚠ Always use a WHERE clause.

```sql
UPDATE employees
SET salary = 65000.00
WHERE emp_id = 101;
```

Multiple Column Update:

```sql
UPDATE employees
SET salary = salary * 1.10, emp_name = 'Jane A. Smith'
WHERE emp_id = 102;
```

---

### 6.3 DELETE – Removing Data

Delete Specific Row:

```sql
DELETE FROM employees
WHERE emp_id = 103;
```

Delete All Rows:

```sql
DELETE FROM employees;
```

---

### 6.4 SELECT – Retrieving Data

```sql
SELECT * FROM employees;
```

Filtered Query:

```sql
SELECT emp_name, salary
FROM employees
WHERE salary > 50000;
```

---

### 6.5 Safe Update Mode (MySQL Workbench)

Disable Safe Mode:

```sql
SET SQL_SAFE_UPDATES = 0;
```

Enable Safe Mode:

```sql
SET SQL_SAFE_UPDATES = 1;
```

---

## 6. SQL Constraints

Constraints are rules applied to columns to **ensure data accuracy, consistency, and reliability**. If data violates a constraint, MySQL rejects the operation.

---

### 5.1 Common MySQL Constraints

| Constraint  | Purpose                    |
| ----------- | -------------------------- |
| NOT NULL    | Prevents NULL values       |
| UNIQUE      | Prevents duplicate values  |
| PRIMARY KEY | Uniquely identifies rows   |
| FOREIGN KEY | Maintains relationships    |
| CHECK       | Enforces custom conditions |
| DEFAULT     | Assigns default value      |

---

### 5.2 Practical Example: Members Table

```sql
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 13),
    membership_type VARCHAR(20) DEFAULT 'Standard',
    join_date DATE NOT NULL
);
```

---

### 5.3 Constraint Validation Examples

✔ Valid Insert:

```sql
INSERT INTO Members (first_name, email, age, join_date)
VALUES ('Alice', 'alice@email.com', 25, '2026-01-16');
```

❌ CHECK Constraint Failure:

```sql
INSERT INTO Members (first_name, email, age, join_date)
VALUES ('Bob', 'bob@email.com', 10, '2026-01-16');
```

❌ UNIQUE Constraint Failure:

```sql
INSERT INTO Members (first_name, email, age, join_date)
VALUES ('Charlie', 'alice@email.com', 30, '2026-01-16');
```

---


### 6.6 DDL vs DML Comparison

| Feature  | DDL                 | DML                    |
| -------- | ------------------- | ---------------------- |
| Works On | Structure           | Data                   |
| Commands | CREATE, ALTER, DROP | INSERT, UPDATE, DELETE |
| Rollback | Auto-commit         | Transaction-based      |

---
