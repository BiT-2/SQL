use Misal_Vighnesh_Test;
--Create Tables Student, UniveresityDepartment and Major--
create Table dbo.Student
(
StudentID int NOT NULL PRIMARY KEY,
FirstName varchar(20),
LastName varchar(20),
MajorID int NOT NULL
)

create table dbo.UniversityDepartment
(
DepartmentID int NOT NULL PRIMARY KEY,
DepartmentName varchar(20),
MajorID varchar(20) NOT NULL
)

create table dbo.Major
(
MajorID int NOT NULL PRIMARY KEY,
MajorName varchar(20)
)

--Add foreign Key Constraints--
ALTER TABLE dbo.Student 
ADD CONSTRAINT FK_STUDENT_MAJOR
FOREIGN KEY (MajorID) REFERENCES dbo.Major(MajorID);

ALTER TABLE dbo.UniversityDepartment
ALTER COLUMN MajorID int

ALTER TABLE dbo.UniversityDepartment 
ADD CONSTRAINT FK_DEPARTMENT_MAJOR
FOREIGN KEY (MajorID) REFERENCES dbo.Major(MajorID);

--ADD NEW COLUMNS--
ALTER TABLE dbo.Student ADD emailaddress varchar(50);
ALTER TABLE dbo.UniversityDepartment ADD telephone int;


--INSERT VALUES--
INSERT INTO dbo.Major(MajorID,MajorName) VALUES(1, 'Physics');
INSERT INTO dbo.Major(MajorID,MajorName) VALUES(2, 'Chemistry');
INSERT INTO dbo.Major(MajorID,MajorName) VALUES(3, 'Biology');
INSERT INTO dbo.Major(MajorID,MajorName) VALUES(4, 'Computer Science');

INSERT INTO dbo.Student(StudentID, FirstName, LastName, emailaddress, MajorID) VALUES(1, 'John', 'Doe','johndoe@uw.edu',2);
INSERT INTO dbo.Student(StudentID, FirstName, LastName, emailaddress, MajorID) VALUES(2, 'Jane', 'Porter','janep@uw.edu',3);
INSERT INTO dbo.Student(StudentID, FirstName, LastName, emailaddress, MajorID) VALUES(3, 'Alicia', 'Keys','aliciak@uw.edu',2);
INSERT INTO dbo.Student(StudentID, FirstName, LastName, emailaddress, MajorID) VALUES(4, 'Jim', 'Halpert','jimhalpert@uw.edu',1);
INSERT INTO dbo.Student(StudentID, FirstName, LastName, emailaddress, MajorID) VALUES(5, 'Michael', 'Scarne','scarne@uw.edu',4);
INSERT INTO dbo.Student(StudentID, FirstName, LastName, emailaddress, MajorID) VALUES(6, 'Greg', 'House','aliciak@uw.edu',3);

INSERT INTO dbo.UniversityDepartment(DepartmentID,DepartmentName,MajorID,telephone) VALUES(1, 'Applied Science','3',2064123765)
INSERT INTO dbo.UniversityDepartment(DepartmentID,DepartmentName,MajorID,telephone) VALUES(2, 'Theoretical Science','1',206539087)
INSERT INTO dbo.UniversityDepartment(DepartmentID,DepartmentName,MajorID,telephone) VALUES(3, 'Information','4',206781209)

--CHANGE VALUES/UPDATE VALUES--
UPDATE dbo.Student
SET FirstName = 'Gregory'
WHERE StudentID = 6;

UPDATE dbo.UniversityDepartment
SET DepartmentName = 'Informatics'
WHERE DepartmentID = 3;

--Select--

select * from dbo.Student;
select * from dbo.UniversityDepartment;
select * from dbo.Major;

select * 
from dbo.Student S INNER JOIN dbo.Major M ON S.MajorID = M.MajorID


select *
from dbo.UniversityDepartment D INNER JOIN dbo.Major M ON D.MajorID = M.MajorID


--Create, display and delete a VIEW
CREATE VIEW [Complete_View] AS
SELECT S.StudentID, S.FirstName, S.LastName, S.MajorID, S.emailaddress, D.DepartmentID, D.DepartmentName, D.telephone, M.MajorName
FROM  dbo.Major M 
INNER JOIN dbo.UniversityDepartment D ON M.MajorID = D.MajorID
INNER JOIN dbo.Student S on S.MajorID = M.MajorID

select * from [Complete_View]

Drop View [Complete_View]

--DROP CONSTRAINT--
ALTER TABLE dbo.Student DROP CONSTRAINT FK_STUDENT_MAJOR;
ALTER TABLE dbo.UniversityDepartment DROP CONSTRAINT FK_DEPARTMENT_MAJOR

--DROP TABLES--
drop table dbo.Major;
drop table dbo.Student;
drop table dbo.UniversityDepartment;



--STEP 3--
ALTER TABLE dbo.TargetMailingLists DROP CONSTRAINT CompositeKey;

drop table dbo.TargetCustomers;
drop table dbo.MailingLists;
drop table dbo.TargetMailingLists


CREATE TABLE dbo.TargetCustomers
(
TargetID int NOT NULL PRIMARY KEY,
FirstName varchar(40) NOT NULL,
LastName varchar(40) NOT NULL,
Address varchar(200) NOT NULL,
City varchar(30) NOT NULL,
State varchar(20) NOT NULL,
Zipcode int
);

Create table dbo.MailingLists
(
MailingListID int NOT NULL PRIMARY KEY,
MailingList varchar(50)
)

Create table dbo.TargetMailingLists
(
TargetID int NOT NULL REFERENCES dbo.TargetCustomers(TargetID),
MailingListID int NOT NULL REFERENCES dbo.MailingLists(MailingListID)
CONSTRAINT CompositeKey PRIMARY KEY CLUSTERED (TargetID, MailingListID)
)