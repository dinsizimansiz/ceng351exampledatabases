IF EXISTS (
  SELECT name
   FROM sys.databases
   WHERE name = N'Metu'
)
DROP DATABASE Metu
GO


IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'Metu'
)
CREATE DATABASE Metu
GO

USE Metu
GO

IF EXISTS (
    SELECT *
        FROM sys.tables
        JOIN sys.schemas
            ON sys.tables.schema_id = sys.schemas.schema_id
    WHERE sys.schemas.name = N'SchemaName'
        AND sys.tables.name = N'Student'
) DROP TABLE SchemaName.Student
GO

IF EXISTS (
    SELECT *
        FROM sys.tables
        JOIN sys.schemas
            ON sys.tables.schema_id = sys.schemas.schema_id
    WHERE sys.schemas.name = N'SchemaName'
        AND sys.tables.name = N'Professor'
)
    DROP TABLE SchemaName.Professor
GO
IF EXISTS (
    SELECT *
        FROM sys.tables
        JOIN sys.schemas
            ON sys.tables.schema_id = sys.schemas.schema_id
    WHERE sys.schemas.name = N'SchemaName'
        AND sys.tables.name = N'Course'
)
    DROP TABLE SchemaName.Course
GO
IF EXISTS (
    SELECT *
        FROM sys.tables
        JOIN sys.schemas
            ON sys.tables.schema_id = sys.schemas.schema_id
    WHERE sys.schemas.name = N'SchemaName'
        AND sys.tables.name = N'Transcript'
)
    DROP TABLE SchemaName.Transcript
GO
IF EXISTS (
    SELECT *
        FROM sys.tables
        JOIN sys.schemas
            ON sys.tables.schema_id = sys.schemas.schema_id
    WHERE sys.schemas.name = N'SchemaName'
        AND sys.tables.name = N'Teaching'
)
    DROP TABLE SchemaName.Teaching
GO



CREATE TABLE Student  (
StudentId INTEGER,
Name VARCHAR(30),
Address VARCHAR(100),
Status VARCHAR(20),
GPA REAL,
PRIMARY KEY (StudentId));

CREATE TABLE Professor  (
ProfessorId INTEGER,
Name VARCHAR(30),
DeptID VARCHAR(5),
Age INTEGER,
PRIMARY KEY (ProfessorId));

CREATE TABLE Course  (
CourseId VARCHAR(20),
DeptID VARCHAR(20),
CourseName VARCHAR(50),
PRIMARY KEY (CourseId));

CREATE TABLE Transcript (
StudentId INTEGER,
CourseId VARCHAR(20),
Semester VARCHAR(20),
Score INTEGER,
PRIMARY KEY (StudentId, CourseId, Semester),
FOREIGN KEY (StudentId) REFERENCES Student (StudentId),
FOREIGN KEY (CourseId) REFERENCES Course (CourseId));


CREATE TABLE Teaching (
CourseId VARCHAR(20),
Semester VARCHAR(20),
ProfessorId INTEGER,
PRIMARY KEY (CourseId, Semester),
FOREIGN KEY (CourseId) REFERENCES Course (CourseId),
FOREIGN KEY (ProfessorId) REFERENCES Professor (ProfessorId));
GO


INSERT INTO Student
VALUES (1,"Martin Prince","Eskisehir yolu, Ankara","Senior",2.5)


INSERT INTO Student
VALUES (2,"Lisa Simpson","Istanbul yolu, Ankara","Junior",3.5)

INSERT INTO Student
VALUES (3,"Milhouse Van Houten","Umitkoy, Ankara","Senior",2.7)

INSERT INTO Student
VALUES (4,"Nelson Muntz","Kecioren, Ankara","Senior",2)

INSERT INTO Student
VALUES (5,"Ralph Wiggum","Yenimahalle, Ankara","Freshman",2.5)

INSERT INTO Student
VALUES (6,"Todd Flanders","Yenimahalle, Ankara","Sophomore",2.8)

INSERT INTO Professor
VALUES (1,"Wayloy Smithers","CENG",35)
 
INSERT INTO Professor
VALUES (2,"Edna Krabappel","EE",42)

INSERT INTO Professor
VALUES (3,"Hans Moleman","CENG",63)
INSERT INTO Professor
VALUES (4,"Joe Quimby","ME",45)
INSERT INTO Professor
VALUES (5,"Julius Hibbert","METE",50)
INSERT INTO Professor
VALUES (6,"Troy McClure","EE",35)

INSERT INTO Course 
VALUES ("CENG100","CENG","Computer Engineering Orientation")

INSERT INTO Course 
VALUES ("CENG230","CENG","Introduction to C Programming")
INSERT INTO Course 
VALUES ("CENG223","CENG","Discrete Computational Structures")
INSERT INTO Course 
VALUES ("EE201","EE","Circuit Theory I")
INSERT INTO Course 
VALUES ("EE213","EE","Electrical Circuits Laboratory")
INSERT INTO Course 
VALUES ("METE201","METE","Materials Science I")
INSERT INTO Course 
VALUES ("METE202","METE","Materials Science II")
INSERT INTO Course 
VALUES ("ME202","ME","Manufacturing Technologies")


INSERT INTO Transcript 
VALUES (1,"EE213","F2013",20)
INSERT INTO Transcript 
VALUES (1,"EE213","F2014",60)
INSERT INTO Transcript 
VALUES (1,"CENG230","S2014",65)
INSERT INTO Transcript 
VALUES (2,"CENG230","F2013",85)
INSERT INTO Transcript 
VALUES (2,"ME202","F2013",40)
INSERT INTO Transcript 
VALUES (3,"EE213","S2014",90)
INSERT INTO Transcript 
VALUES (3,"EE201","S2014",10)
INSERT INTO Transcript 
VALUES (4,"EE213","F2013",52)
INSERT INTO Transcript 
VALUES (4,"CENG230","F2015",55)
INSERT INTO Transcript 
VALUES (5,"ME202","F2013",49)
INSERT INTO Transcript 
VALUES (5,"CENG230","S2014",53)
INSERT INTO Transcript 
VALUES (6,"EE213","F2014",78)
INSERT INTO Transcript 
VALUES (4,"EE201","F2013",50)


INSERT INTO Teaching
VALUES ("CENG100","F2013",1)
INSERT INTO Teaching
VALUES ("EE201","S2014",2)

INSERT INTO Teaching
VALUES ("CENG230","F2015",2)

INSERT INTO Teaching
VALUES ("CENG230","S2014",2)

INSERT INTO Teaching
VALUES ("ME202","F2013",4)

INSERT INTO Teaching
VALUES ("METE201","F2014",5)

INSERT INTO Teaching
VALUES ("CENG230","F2013",5)

INSERT INTO Teaching
VALUES ("EE213","F2013",2)

INSERT INTO Teaching
VALUES ("EE213","F2014",2)

INSERT INTO Teaching
VALUES ("EE213","S2014",6)

GO



