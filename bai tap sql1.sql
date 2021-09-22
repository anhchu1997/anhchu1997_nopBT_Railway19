DROP DATABASE IF EXISTS TestingSystemAssignment1;
CREATE DATABASE      	TestingSystemAssignment1;
USE 					TestingSystemAssignment1;
-- create table Department
DROP TABLE IF EXISTS Department;
CREATE TABLE			 Department (
DepartmentID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName			VARCHAR(50)UNIQUE KEY NOT NULL
);
SELECT*
FROM Department ;
INSERT INTO Department(DepartmentName)
VALUES				('Marketing'),
					('sale'),
					('nhan su'),
                    ('ke toan'),
                    ('ky thuat');

-- create table Position        

DROP TABLE IF EXISTS `Position`;
CREATE TABLE			`Position`(
PositionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionName			ENUM('Dev','Test','Scrum Master','PM')
);
SELECT*
FROM `Position`;
INSERT INTO `Position`(PositionName)
VALUES  ('Dev'),
		('Test'),
		('Scrum Master'),
		('PM');
 -- create table `Account` 
 DROP TABLE IF EXISTS `Account`; 
CREATE TABLE			`Account` (
AccountID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email					VARCHAR(50) UNIQUE KEY,
Username					VARCHAR(50) NOT NULL UNIQUE KEY CHECK(length(UseName)>=4),
FullName				VARCHAR(50) NOT NULL,
DepartmentID			TINYINT UNSIGNED NOT NULL,
PositionID				TINYINT UNSIGNED NOT NULL,
CreateDate				DATETIME DEFAULT NOW(),
FOREIGN KEY(DepartmentID)REFERENCES Department(DepartmentID),
FOREIGN KEY(PositionID)	REFERENCES `Position`(PositionID)
);
SELECT*
FROM `Account`;
INSERT INTO `Account`(Email,UserName,FullName,DepartmentID,PositionID)
VALUES	('abc1@gmail.com','abc1','nguyen_abc1','1','2'),
		('abc2@gmail.com','abc2','nguyen_abc2','2','3'),
        ('abc3@gmail.com','abc3','nguyen_abc3','3','2'),
        ('abc4@gmail.com','abc4','nguyen_abc4','4','1'),
        ('abc5@gmail.com','abc5','nguyen_abc5','5','4');
-- create table `Group`
DROP TABLE IF EXISTS `Group`;
CREATE TABLE			`Group` (
GroupID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
GroupName				VARCHAR(50) UNIQUE KEY NOT NULL CHECK(length(GroupName)>=6),
CreatorID				TINYINT UNSIGNED,
CreateDate				DATETIME DEFAULT NOW(),
FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountID)
);
SELECT*
FROM `Group`;
INSERT INTO `Group`(GroupName,CreatorID)
VALUES 				('GroupName1','1'),
					('GroupName2','3'),
                    ('GroupName3','2'),
                    ('GroupName4','4'),
                    ('GroupName5','5');


-- create table GroupAccount
DROP TABLE IF EXISTS 	GroupAccount;
CREATE TABLE 			GroupAccount (
GroupID					TINYINT UNSIGNED NOT NULL,
AccountID				TINYINT UNSIGNED NOT NULL,
JoinDate				DATETIME DEFAULT NOW(),
FOREIGN KEY(GroupID) 	REFERENCES `Group`(GroupID),
FOREIGN KEY(AccountID)  REFERENCES`Account`(AccountID)
);
SELECT*
FROM GroupAccount;
INSERT INTO GroupAccount(GroupID,AccountID,JoinDate)
VALUES 					('1','2'),
						('2','3'),
                        ('3','4'),
                        ('4','5'),
                        ('5','1');
-- create table TypeQuestion
DROP TABLE IF EXISTS 	TypeQuestion;
CREATE TABLE 			TypeQuestion(
TypeID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName				ENUM('Essay','Multiple Choice') NOT NULL
);
SELECT*
FROM TypeQuestion;
INSERT INTO TypeQuestion(TypeName)
VALUES					('Essay'),
						('Multiple Choice');
-- create table 
DROP TABLE IF EXISTS 	CategoryQuestion;
CREATE TABLE 			CategoryQuestion(
CategoryID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName			VARCHAR(50) NOT NULL UNIQUE KEY
);
SELECT*
FROM CategoryQuestion;
INSERT INTO CategoryQuestion(CategoryID,CategoryName)
VALUES 						('1','abc1'),
							('2','abc2'),
                            ('3','abc3'),
                            ('4','abc4'),
                            ('5','abc5');
-- create table 		Question
DROP TABLE IF EXISTS	Question;
CREATE TABLE 			Question(
QuestionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content					VARCHAR(100),
CategoryID				TINYINT UNSIGNED NOT NULL,
TypeID					TINYINT UNSIGNED NOT NULL,
CreatorID				TINYINT UNSIGNED NOT NULL,
createDate				DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(TypeID)		REFERENCES TypeQuestion(TypeID),
FOREIGN KEY(CreatorID)  REFERENCES `Account`(AccountID)
);
SELECT*
FROM Question;
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID)
VALUES				('Content1','1','2','1'),	
					('Content2','1','3','2'),
                    ('Content3','3','4','3'),
                    ('Content4','5','3','2'),
                    ('Content2','2','5','4');
-- create table 		Answer
DROP TABLE IF EXISTS 	Answer;
CREATE TABLE			Answer(
AnswerID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content					VARCHAR(100),
QuestionID				TINYINT UNSIGNED NOT NULL,
isCorrect				ENUM('yes','no') NOT NULL,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);
SELECT *
FROM Answer;
INSERT INTO Answer(Content,QuestionID,isCorrect)
VALUES			('Content1','1','yes'),
				('Content2','1','yes'),
                ('Content3','2','no'),
                ('Content4','4','yes'),
                ('Content1','3','no');
-- create table 		Exam
DROP TABLE IF EXISTS 	Exam;
CREATE TABLE			Exam(
ExamID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
QuestionID				TINYINT UNSIGNED NOT NULL,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);
SELECT*
FROM Exam;
INSERT INTO Exam(QuestionID)
VALUES 			('1'),
				('3'),
                ('2'),
                ('4'),
                ('5');
				
-- create table 		ExamQuestion 
DROP TABLE IF EXISTS    ExamQuestion;
CREATE TABLE 			ExamQuestion(
ExamID					TINYINT UNSIGNED NOT NULL,
QuestionID				TINYINT UNSIGNED NOT NULL,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
FOREIGN KEY(ExamID) 	REFERENCES Exam(ExamID),
PRIMARY KEY (ExamID,QuestionID)
);
SELECT*
FROM ExamQuestion;
INSERT INTO ExamQuestion(ExamID,QuestionID)
VALUES					('1','1'),
						('1','2'),
                        ('2','1'),
                        ('2','3'),
                        ('1','4');
                        



