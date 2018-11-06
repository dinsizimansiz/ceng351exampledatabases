-- Create a new database called 'Ships'
-- Connect to the 'master' database to run this snippet
-- Drop the database 'Ships'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Uncomment the ALTER DATABASE statement below to set the database to SINGLE_USER mode if the drop database command fails because the database is in use.
-- ALTER DATABASE Ships SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
-- Drop the database if it exists
IF EXISTS (
  SELECT name
   FROM sys.databases
   WHERE name = N'Ships'
)
DROP DATABASE Ships
GO

-- Create a new database called 'Ships'
-- Connect to the 'master' database to run this snippet

-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'Ships'
)
CREATE DATABASE Ships
GO

USE Ships
GO


-- Drop the table 'Sailors' in schema 'SchemaName'
IF EXISTS (
    SELECT *
        FROM sys.tables
        JOIN sys.schemas
            ON sys.tables.schema_id = sys.schemas.schema_id
    WHERE sys.schemas.name = N'SchemaName'
        AND sys.tables.name = N'Sailors'
)
    DROP TABLE SchemaName.Sailors
GO
-- Drop the table 'Boats' in schema 'SchemaName'
IF EXISTS (
    SELECT *
        FROM sys.tables
        JOIN sys.schemas
            ON sys.tables.schema_id = sys.schemas.schema_id
    WHERE sys.schemas.name = N'SchemaName'
        AND sys.tables.name = N'Boats'
)
    DROP TABLE SchemaName.Boats
GO

-- Drop the table 'Reserves' in schema 'SchemaName'
IF EXISTS (
    SELECT *
        FROM sys.tables
        JOIN sys.schemas
            ON sys.tables.schema_id = sys.schemas.schema_id
    WHERE sys.schemas.name = N'SchemaName'
        AND sys.tables.name = N'Reserves'
)
    DROP TABLE SchemaName.Reserves
GO

CREATE TABLE Sailors  (
sid INTEGER,
sname VARCHAR(20),
rating INTEGER,
age REAL,
PRIMARY KEY (sid));

CREATE TABLE Boats (
bid INTEGER,
bname CHAR (20),
color CHAR(10),
PRIMARY KEY (bid));

CREATE TABLE Reserves (
sid INTEGER,
bid INTEGER,
day DATE,
PRIMARY KEY (sid, bid, day),
FOREIGN KEY (sid) REFERENCES Sailors (sid),
FOREIGN KEY (bid) REFERENCES Boats (bid));

GO



INSERT INTO Sailors
VALUES (22,'Dustin',7,45)
INSERT INTO Sailors
VALUES (29,'Brutus',1,33)
INSERT INTO Sailors
VALUES (31,'Lubber',8,55.5)
INSERT INTO Sailors
VALUES (32,'Andy',8,25.5)
INSERT INTO Sailors
VALUES (58,'Rusty',10,35.0)
INSERT INTO Sailors
VALUES (64,'Horatio',7,35.0)
INSERT INTO Sailors
VALUES (71,'Zorba',10,16)
INSERT INTO Sailors
VALUES (74,'Horation',9,35.0)
INSERT INTO Sailors
VALUES (85,'Art',3,25.5)
INSERT INTO Sailors
VALUES (95,'Bob',3,63.5)




INSERT INTO Boats(bid,bname,color)
VALUES (101,'Interlake','blue')

INSERT INTO Boats(bid,bname,color)
VALUES (102,'Interlake','red')

INSERT INTO Boats(bid,bname,color)
VALUES (103,'Clipper','green')

INSERT INTO Boats(bid,bname,color)
VALUES (104,'Marine','red')

INSERT INTO Reserves(sid,bid,day)
VALUES (22,101,'10-10-98')

INSERT INTO Reserves(sid,bid,day)
VALUES (22,102,'10-10-98')

INSERT INTO Reserves(sid,bid,day)
VALUES (22,103,'10-8-98')

INSERT INTO Reserves(sid,bid,day)
VALUES (22,104,'10-7-98')

INSERT INTO Reserves(sid,bid,day)
VALUES (31,102,'11-10-98')

INSERT INTO Reserves(sid,bid,day)
VALUES (31,103,'11-6-98')

INSERT INTO Reserves(sid,bid,day)
VALUES (31,104,'11-12-98')

INSERT INTO Reserves(sid,bid,day)
VALUES (64,101,'9-5-98')

INSERT INTO Reserves(sid,bid,day)
VALUES (64,102,'9-8-98')

INSERT INTO Reserves(sid,bid,day)
VALUES (74,103,'9-8-98')

GO