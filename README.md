#Data Modelling

CSV Inspection

Currently we have 6 tables that have the following structure:

employees: emp_no, birth_date, first_name, last_name, gender, hire_date
titles: emp_no, title, from_date, to_date
salaries: emp_no, salary, from_date, to_date
dept_manager: dept_no, emp_no, from_date, to_date
dept_employee: emp_no, dept_no, from_date, to_date
departments dept_no, dept_name
  

RELATIONSHIPS BETWEEN TABLES

As can be seen, "employees" table seems to be the most important one, however, the table "department" also holds relevant data, in essence, those two tables have relationship with the rest in the following structure:

employees - to - titles (many to many): It is observed that employees may have different titles through the duration of their employment with P-H
employees - to - salaries (many to many): Equally, employees can have different salaries through their career at P-H
employees - to - dept_manager (many to one): Managers will have multiple employees within their reporting structure
employees - to - dept_employee (one to many): A Department can contain multiple employees
employees - to - departments (none): No direct relationship (connects via dept_manager and dept_employee through dept_no)


departments - to - dept_employee (one to many): Over time, employees can belong to multiple departments
departments - to - dept_manager (many to many): Managers can lead multiple departments over time. Departments may contain multiple managers
departments - to - titles (none)
departments - to - salaries (none)

DATA TYPES

Date columns - defined as "DATE" Type: (employees:hire_date, employees:birth_date), (titles:from_date, titles:to_date), (salaries:from_date, salaries:to_date) (dept_manager:from_date, dept_manager:to_date), (dept_employee:from_date, dept_employee:to_date)
Integer columns - defined as "INTEGER": (emp_no), (salaries:salary)
Variable character columns - defined as "VARCHAR" Type: (employees:first_name, employees:last_name, employees:gender), (titles:title), (dept_no), (departments:name)



ERD:

Text file  attached.

Image of result attached as well

SCHEMA CREATION

Documented within SQL

QUERY's

Documented within SQL file

Bonus Challenge

Uploades Jupyter Notebook with comments and markdown


