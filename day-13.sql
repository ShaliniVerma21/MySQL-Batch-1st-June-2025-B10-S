create database zoom;

use zoom;

-- Multiple types of Keys in Mysql

/* 
1. Super Key: 
A super key is any combination of columns(one or more) that can uniquely identify a row in a table. 
It may contain additional columns that are not necessary for unique identification.

Example: In a Student table, both StudentID and (StudentID, StudentName) are super keys. 
The first uniquely identifies each student, while the second does as well, 
but it includes an unnecessary column.
*/

CREATE TABLE Student (
    StudentID INT,
    StudentName VARCHAR(100),
    PRIMARY KEY (StudentID, StudentName)  -- StudentID is a super key
);

/*  
2. Candidate Key: 
A candidate key is a minimal super key. This means it is a super key that cannot have 
any columns removed without losing its uniqueness property. 
There can be multiple candidate keys in a table.

Example: In the Student table, StudentID is a candidate key. 
If Email is also unique, then both StudentID and Email can be candidate keys.
*/

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE,  -- Email is also a candidate key
    StudentName VARCHAR(100)
);

/* 
3. Primary Key: 
 A primary key is a special case of a candidate key that is chosen to uniquely identify records 
 in a table. A table can have only one primary key, which may consist of one or more columns.
 
 Example: In the Student table, StudentID is designated as the primary key.
*/

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100)
);

/* 
 4. Foreign Key: 
 A foreign key is a field (or collection of fields) in one table that refers to the primary key 
 in another table. It establishes a relationship between the two tables and enforces referential integrity.
 
 Example: If you have a Courses table that references the Student table, 
 the StudentID in the Courses table can be a foreign key.
*/

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    StudentID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
 
/*  
5. Alternate Key: 
An alternate key is any candidate key that is not chosen as the primary key. 
It is an alternative way to uniquely identify a record.

Example: In the Student table, if Email is unique and not the primary key, 
it is considered an alternate key.
*/

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE,  -- Alternate key
    StudentName VARCHAR(100)
);                         

/*
  6. Composite Key: 
A composite key is a primary key that consists of two or more columns. 
It is used when a single column is not sufficient to uniquely identify a record.

Example: In a Enrollments table that records which students are enrolled in which courses, 
a composite key could be made from StudentID and CourseID.
*/

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),  -- Composite key
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);



-- Normalization

/*
Normalization is a systematic approach to organizing data in a database to 
reduce redundancy and improve data integrity. The process involves dividing 
a database into tables and establishing relationships between them while 
ensuring that the data is stored logically. The main goals of normalization 
are to eliminate data redundancy and ensure data dependencies make sense.

Why Normalize?

Reduce Redundancy: Avoid storing the same data multiple times.
Improve Data Integrity: Keep data consistent and accurate.
Prevent Anomalies: Avoid problems when adding, updating, or deleting data.

Normal Forms

Normalization is done in steps called "normal forms."

Normalization typically involves several stages, known as normal forms (NF). 
The most commonly used normal forms are:

1. First Normal Form (1NF) {Eliminate repeating group}:
A table is in 1NF if all the attributes contain only atomic (indivisible) values, 
and each entry in a column is of the same data type. There should be no repeating 
groups or arrays.
Example: A table with student information should not have multiple phone numbers 
in a single field. Instead, each phone number should be in its own row or managed 
through a separate table.

- Each column should contain atomic (indivisible) values.
- Each record must be unique (use a primary key).

| StudentID | Name | Subjects      |
| --------- | ---- | ------------- |
| 1         | Raj  | Math, Science |

❌ Not 1NF (Subjects are multiple values).

✔ Convert to 1NF:

| StudentID | Name | Subject |
| --------- | ---- | ------- |
| 1         | Raj  | Math    |
| 1         | Raj  | Science |

2. Second Normal Form (2NF) {Eliminate Partial Dependency}:
A table is in 2NF if it is in 1NF and all non-key attributes are fully functionally 
dependent on the primary key. This means that there should be no partial dependency 
of any column on the primary key.
Example: If a table contains student ID, course ID, and courseName, and Composite key is 
(studentID, CourseID) then the courseName should not depend on just the student ID. 
it should depend on both.

- Must be in 1NF.
- All non-key columns are fully dependent on the entire primary key, not just part of it.

Example (Before 2NF):
| StudentID | Course | StudentName | CourseName |
| --------: | ------ | ----------- | ---------- |
|         1 | C101   | Raj         | Python     |
|         1 | C102   | Raj         | SQL        |

Here, Primary Key = (StudentID, Course)

StudentName depends only on StudentID → ❌ Partial Dependency.

Converted to 2NF:

Student Table:
| StudentID | StudentName |
| --------: | ----------- |
|         1 | Raj         |

Course Table:
| CourseID | CourseName |
| -------: | ---------- |
|     C101 | Python     |
|     C102 | SQL        |

Enrollment Table:
| StudentID | CourseID |
| --------: | -------- |
|         1 | C101     |
|         1 | C102     |

Note : ✔ Now in 2NF — every non-key attribute depends on the full key.
Use case: When composite keys exist; eliminates redundancy.

3. Third Normal Form (3NF){Eliminate transitive dependency}:
A table is in 3NF if it is in 2NF and there are no transitive dependencies, meaning 
that non-key attributes do not depend on other non-key attributes.
Example: If a table has student ID, department ID, and department name, the department 
name should depend only on the department ID, not on the student ID.
- It is already in 2NF.
- No transitive dependency exists — i.e., non-key columns must not depend on other non-key columns.

Example (Before 3NF):
| StudentID | StudentName | Department | DeptHead   |
| --------: | ----------- | ---------- | ---------- |
|         1 | Raj         | IT         | Mr. Mehta  |
|         2 | Shalini     | HR         | Ms. Trisha |

Here, DeptHead depends on Department, not directly on StudentID → ❌ Transitive dependency.

Converted to 3NF:

Student Table:
| StudentID | StudentName | Department |
| --------: | ----------- | ---------- |
|         1 | Raj         | IT         |
|         2 | Shalini     | HR         |

Department Table:
| Department | DeptHead   |
| ---------- | ---------- |
| IT         | Mr. Mehta  |
| HR         | Ms. Trisha |

Note :  Now in 3NF — all non-key attributes depend only on primary key.
Use case: Removes dependency chains; makes data cleaner and maintainable.

4. Boyce-Codd Normal Form (BCNF){eliminate functional dependency and more restricted than 3NF}:
A table is in BCNF if it is in 3NF and for every functional dependency (X → Y), 
X is a super key. This means that every determinant must be a candidate key.
Example: If a table has a functional dependency where a student's advisor can only be 
from one department, it may violate BCNF if the advisor's department is not a candidate key.

- For every functional dependency (X → Y), X must be a super key.
- Used when a table still has anomalies even after 3NF.

Example (Before BCNF):
| Professor | Subject  | Department |
| --------- | -------- | ---------- |
| A         | DBMS     | CS         |
| B         | OS       | CS         |
| A         | Networks | IT         |

Here:
Each Professor teaches one Department → Professor → Department
But primary key is (Professor, Subject) → ❌ violates BCNF.

Converted to BCNF:
Professor Table:
| Professor | Department |
| --------- | ---------- |
| A         | CS         |
| B         | CS         |

Teaching Table:
| Professor | Subject  |
| --------- | -------- |
| A         | DBMS     |
| A         | Networks |
| B         | OS       |

Note :✔ Now in BCNF — every determinant is a candidate key.
Use case: Applied when multiple overlapping candidate keys exist.


5. Fourth Normal Form (4NF) — Eliminate Multi-Valued Dependencies
A table is in 4NF if , It is in BCNF.and It contains no multi-valued dependencies, i.e., 
one column shouldn’t depend on multiple independent multi-valued facts.

Example (Before 4NF):
| Student | Hobby  | Language |
| ------- | ------ | -------- |
| Raj     | Music  | Hindi    |
| Raj     | Music  | English  |
| Raj     | Sports | Hindi    |
| Raj     | Sports | English  |

❌ Hobby and Language are independent, multi-valued.

Converted to 4NF:

Student_Hobby Table:
| Student | Hobby  |
| ------- | ------ |
| Raj     | Music  |
| Raj     | Sports |

Student_Language Table:
| Student | Language |
| ------- | -------- |
| Raj     | Hindi    |
| Raj     | English  |

Note : ✔ Now in 4NF — removes multi-valued dependencies.
Use case: For advanced modeling — e.g., people with multiple skills, languages, or roles.


6. Fifth Normal Form (5NF) — Eliminate Join Dependencies

A table is in 5NF if, It is in 4NF.and It cannot be further decomposed into smaller tables without losing data.
All join dependencies are implied by candidate keys.

Example (Before 5NF):
| Product | Supplier | Customer |
| ------- | -------- | -------- |
| P1      | S1       | C1       |
| P1      | S1       | C2       |
| P2      | S2       | C1       |

Here, relationships between Product, Supplier, and Customer cause join dependency.

Converted to 5NF:

Product_Supplier Table:
| Product | Supplier |
| ------- | -------- |
| P1      | S1       |
| P2      | S2       |

Supplier_Customer Table:
| Supplier | Customer |
| -------- | -------- |
| S1       | C1       |
| S1       | C2       |
| S2       | C1       |

Product_Customer Table:
| Product | Customer |
| ------- | -------- |
| P1      | C1       |
| P1      | C2       |
| P2      | C1       |

Note : ✔ Now in 5NF — no data redundancy, every relation is meaningful.
Use case: Highly normalized systems, complex business relations (rare in practice).
*/

-- Step 1: Create the Unnormalized Table
/*
   Unnormalized table that contains student information, course details, 
   and instructor information. This table may contain redundancy.
   -- attribute should have atomic and same type of data.
*/
CREATE TABLE UnnormalizedStudents (
    StudentID INT,
    StudentName VARCHAR(100),
    CourseID INT,
    CourseName VARCHAR(100),
    InstructorName VARCHAR(100),
    InstructorEmail VARCHAR(100)
);

-- Inserting sample data into the unnormalized table
INSERT INTO UnnormalizedStudents (StudentID, StudentName, CourseID, CourseName, InstructorName, InstructorEmail) 
VALUES
(1, 'Alice', 101, 'Mathematics', 'Dr. Smith', 'smith@university.edu'),
(1, 'Alice', 102, 'Physics', 'Dr. Johnson', 'johnson@university.edu'),
(2, 'Bob', 101, 'Mathematics', 'Dr. Smith', 'smith@university.edu'),
(2, 'Bob', 103, 'Chemistry', 'Dr. Lee', 'lee@university.edu');

select * from UnnormalizedStudents;

-- Step 2: Convert to First Normal Form (1NF)
/*
   The table is already in 1NF as all values are atomic, 
   but we will create separate tables to eliminate redundancy.
*/

-- Create the Students Table
CREATE TABLE Student1 (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100)
);

-- Create the Courses Table
CREATE TABLE Courses1 (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);
-- Create the Courses Table
CREATE TABLE Instructor1 (
	InstructorID  int primary key,
    InstructorName VARCHAR(100),
    InstructorEmail VARCHAR(100)
);

-- Create the Enrollments Table (linking Students and Courses)
CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student1(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses1(CourseID)
);

-- Step 3: Insert Data into Normalized Tables
/*
   Insert data into the Students and Courses tables, 
   and link them through the Enrollments table.
*/

-- Inserting data into Students table
INSERT INTO Student1 (StudentID, StudentName) VALUES
(1, 'Alice'),
(2, 'Bob');

select * from Student1;

-- Inserting data into Courses table
INSERT INTO Courses1 (CourseID, CourseName, InstructorName, InstructorEmail) VALUES
(101, 'Mathematics', 'Dr. Smith', 'smith@university.edu'),
(102, 'Physics', 'Dr. Johnson', 'johnson@university.edu'),
(103, 'Chemistry', 'Dr. Lee', 'lee@university.edu');

select * from Courses1;

-- Inserting data into Enrollments table
INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 101),
(1, 102),
(2, 101),
(2, 103);

select * from Enrollments;

-- Step 4: Convert to Second Normal Form (2NF)
/*
   The tables are in 2NF since all non-key attributes are fully functionally 
   dependent on the primary key.
   The Students and Courses tables do not have partial dependencies.
*/

-- Step 5: Convert to Third Normal Form (3NF)
/*
   The tables are in 3NF since there are no transitive dependencies. 
   All non-key attributes depend only on their respective primary keys.
*/

-- Step 6: Convert to Boyce-Codd Normal Form (BCNF)
/*
   The tables are in BCNF since all functional dependencies have super keys 
   as their determinants.
   For example, in the Courses table, CourseID is a super key.
*/

-- Final Query: Retrieve data from the normalized tables
/*
   This query retrieves student names along with their enrolled courses 
   and instructor details.
*/
SELECT 
    s.StudentName, 
    c.CourseName, 
    c.InstructorName, 
    c.InstructorEmail
FROM 
    Enrollments e
JOIN 
    Student1 s ON e.StudentID = s.StudentID
JOIN 
    Courses1 c ON e.CourseID = c.
