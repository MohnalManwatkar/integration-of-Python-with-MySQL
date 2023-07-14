# integration-of-Python-with-MySQL

![image](https://github.com/MohnalManwatkar/integration-of-Python-with-MySQL/assets/108139334/bf948454-c403-430c-82e2-d4f8e32b4427)

### 1. Data Definition Language (DDL)
o DDL changes the structure of the table like creating a table, deleting a table, altering a table, etc.
o All the command of DDL are auto-committed that means it permanently save all the changes in the database.
Here are some commands that come under DDL:

-  CREATE
-  ALTER
-  DROP
-  TRUNCATE
a. CREATE: It is used to create a new table in the database.
Syntax:
CREATE TABLE TABLE_NAME (COLUMN_NAME DATATYPES[,....]); 
Example:
1. CREATE TABLE EMPLOYEE(Name VARCHAR2(20), Email VARCHAR2(100), DOB DATE);
   
b. DROP: It is used to delete both the structure and record stored in the table.
Syntax
DROP TABLE ; 
Example
1. DROP TABLE EMPLOYEE;
   
c. ALTER: It is used to alter the structure of the database. This change could be either to modify the characteristics of an existing 
attribute or probably to add a new attribute.
Syntax:
To add a new column in the table
ALTER TABLE table_name ADD column_name COLUMN-definition; 
To modify existing column in the table:
ALTER TABLE MODIFY(COLUMN DEFINITION....); 
EXAMPLE
1. ALTER TABLE STU_DETAILS ADD(ADDRESS VARCHAR2(20)); 
2. ALTER TABLE STU_DETAILS MODIFY (NAME VARCHAR2(20));
   
d. TRUNCATE: It is used to delete all the rows from the table and free the space containing the table.
Syntax:
TRUNCATE TABLE table_name; 
Example:
1. TRUNCATE TABLE EMPLOYEE;


### 2. Data Manipulation Language (DML)
o DML commands are used to modify the database. It is responsible for all form of changes in the database.
o The command of DML is not auto-committed that means it can't permanently save all the changes in the database. 
They can be rollback.
Here are some commands that come under DML:
- INSERT
- UPDATE
- DELETE
a. INSERT: The INSERT statement is a SQL query. It is used to insert data into the row of a table.
Syntax:
INSERT INTO TABLE_NAME 
  (col1, col2, col3,.... col N) 
   VALUES (value1, value2, value3, .... valueN); 
Or
INSERT INTO TABLE_NAME 
VALUES (value1, value2, value3, .... valueN); 
For example:
   INSERT INTO javatpoint (Author, Subject) VALUES ("Sonoo", "DBMS");
   
b. UPDATE: This command is used to update or modify the value of a column in the table.
Syntax:
1. UPDATE table_name SET [column_name1= value1,...column_nameN = valueN] [WHERE CONDITION] 
For example:
   UPDATE students 
   SET User_Name = 'Sonoo' 
   WHERE Student_Id = '3'
   
c. DELETE: It is used to remove one or more row from a table.
Syntax:
DELETE FROM table_name [WHERE condition]; 
For example:
   DELETE FROM javatpoint 
   WHERE Author="Sonoo";

   
### 3. Data Control Language (DCL)
DCL commands are used to grant and take back authority from any database user.
Here are some commands that come under DCL:
- Grant
- Revoke
a. Grant: It is used to give user access privileges to a database.
Example
1. GRANT SELECT, UPDATE ON MY_TABLE TO SOME_USER, ANOTHER_USER; 
b. Revoke: It is used to take back permissions from the user.
Example
   REVOKE SELECT, UPDATE ON MY_TABLE FROM USER1, USER2;


### 4. Transaction Control Language (TCL)
TCL commands can only use with DML commands like INSERT, DELETE and UPDATE only.
These operations are automatically committed in the database that's why they cannot be used while creating tables or 
dropping them.
Here are some commands that come under TCL:
- COMMIT
- ROLLBACK
- SAVEPOINT
a. Commit: Commit command is used to save all the transactions to the database.
Syntax:
COMMIT; 
Example:
   DELETE FROM CUSTOMERS 
   WHERE AGE = 25; 
   COMMIT; 
b. Rollback: Rollback command is used to undo transactions that have not already been saved to the database.
Syntax:
ROLLBACK;
   
Example:
1. DELETE FROM CUSTOMERS 
2. WHERE AGE = 25; 
3. ROLLBACK; 
c. SAVEPOINT: It is used to roll the transaction back to a certain point without rolling back the entire transaction.
Syntax:
1. SAVEPOINT SAVEPOINT_NAME;

   
### 5. Data Query Language (DQL)
DQL is used to fetch the data from the database.
It uses only one command:
- SELECT
a. SELECT: This is the same as the projection operation of relational algebra. It is used to select the attribute based on the 
condition described by WHERE clause.
Syntax:
SELECT expressions 
FROM TABLES 
WHERE conditions;

For example:
SELECT emp_name 
FROM employee 
WHERE age > 20; 
• CREATE TABL
