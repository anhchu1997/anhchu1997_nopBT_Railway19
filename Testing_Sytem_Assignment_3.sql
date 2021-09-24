DROP DATABASE IF EXISTS TestingSystemAssignment1;
CREATE DATABASE      	TestingSystemAssignment1;
USE 					TestingSystemAssignment1;
-- create table Department
DROP TABLE IF EXISTS Department;
CREATE TABLE			 Department (
DepartmentID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName			VARCHAR(50)UNIQUE KEY NOT NULL
);

-- create table Position        

DROP TABLE IF EXISTS `Position`;
CREATE TABLE			`Position`(
PositionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionName			ENUM('Dev','Test','Scrum Master','PM')
);
 -- create table `Account` 
 DROP TABLE IF EXISTS `Account`; 
CREATE TABLE			`Account` (
AccountID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email					VARCHAR(50) UNIQUE KEY,
Username				VARCHAR(50) NOT NULL UNIQUE KEY, -- CHECK(length(UseName)>=4)
FullName				VARCHAR(50) NOT NULL,
DepartmentID			TINYINT UNSIGNED NOT NULL,
PositionID				TINYINT UNSIGNED NOT NULL,
CreateDate				DATETIME DEFAULT NOW(),
CONSTRAINT fk_dp_id FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
CONSTRAINT fk_ps_id FOREIGN KEY(PositionID)	REFERENCES `Position`(PositionID)
);

-- create table `Group`
DROP TABLE IF EXISTS `Group`;
CREATE TABLE			`Group` (
GroupID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
GroupName				VARCHAR(50) UNIQUE KEY NOT NULL ,-- CHECK(length(GroupName)>=6),
CreatorID				TINYINT UNSIGNED,
CreateDate				DATETIME DEFAULT NOW(),
CONSTRAINT fk_creatorID FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountID)
);

-- create table GroupAccount
DROP TABLE IF EXISTS 	GroupAccount;
CREATE TABLE 			GroupAccount (
GroupID					TINYINT UNSIGNED NOT NULL,
AccountID				TINYINT UNSIGNED NOT NULL,
JoinDate				DATETIME DEFAULT NOW(),
CONSTRAINT fk_GroupID FOREIGN KEY(GroupID) 	REFERENCES `Group`(GroupID),
CONSTRAINT fk_AccountID FOREIGN KEY(AccountID)  REFERENCES`Account`(AccountID)
);

-- create table TypeQuestion
DROP TABLE IF EXISTS 	TypeQuestion;
CREATE TABLE 			TypeQuestion(
TypeID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName				ENUM('Essay','Multiple Choice') NOT NULL
);


-- create table 
DROP TABLE IF EXISTS 	CategoryQuestion;
CREATE TABLE 			CategoryQuestion(
CategoryID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName			VARCHAR(50) NOT NULL UNIQUE KEY
);
-- create table 		Question
DROP TABLE IF EXISTS	Quesition;
CREATE TABLE 			Question(
QuestionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content					VARCHAR(100),
CategoryID				TINYINT UNSIGNED NOT NULL,
TypeID					TINYINT UNSIGNED NOT NULL,
CreatorID				TINYINT UNSIGNED NOT NULL,
createDate				DATETIME DEFAULT NOW(),
CONSTRAINT fk_CategoryID FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
CONSTRAINT fk_TypeID 	 FOREIGN KEY(TypeID)	 REFERENCES TypeQuestion(TypeID),
CONSTRAINT fk_Creator    FOREIGN KEY(CreatorID)  REFERENCES `Account`(AccountID)
);

-- create table 		Answer
DROP TABLE IF EXISTS 	Answer;
CREATE TABLE			Answer(
AnswerID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content					VARCHAR(100),
QuestionID				TINYINT UNSIGNED NOT NULL,
isCorrect				ENUM('yes','no') NOT NULL,
CONSTRAINT fk_QuestionID FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

-- create table 		Exam
DROP TABLE IF EXISTS 	Exam;
CREATE TABLE			Exam(
ExamID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
QuestionID				TINYINT UNSIGNED NOT NULL,
createDate				DATETIME DEFAULT NOW(),
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

-- create table 		ExamQuestion 
DROP TABLE IF EXISTS    ExamQuestion;
CREATE TABLE 			ExamQuestion(
ExamID					TINYINT UNSIGNED NOT NULL,
QuestionID				TINYINT UNSIGNED NOT NULL, 
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
CONSTRAINT fk_ExamID   FOREIGN KEY(ExamID) 	REFERENCES Exam(ExamID),
PRIMARY KEY (ExamID,QuestionID)
);
USE TestingSystemAssignment1;

-- insert DEPARTMENT:phong ban

INSERT INTO Department(DepartmentName)
VALUES				('Marketing'),
					('sale'),
					('nhan su'),
                    ('ke toan'),
                    ('ky thuat'),
                    ('phat trien'),
                    ('tai chinh'),
                    ('giam doc'),
					('thu ky'),
					('bao ve'),
                    ('ban hang' );
-- insert POSITION: vi tri
     INSERT INTO `Position`(PositionName)
	VALUES  				('Dev'),
							('Test'),
							('Scrum Master'),
							('PM');   
        
 -- insert ACCOUNT:tai khoan
INSERT INTO `Account`(Email,					UserName,	FullName,	DepartmentID,	PositionID,CreateDate)
			VALUES	('chuthilananh@gmail.com',	'lananh',	'chuthilananh',  1,				2,'2021_09_1'),
					('tranthanhmai@gamil.com',	'thanhmai',	'tranthanhmai',  2,				3,'2021_09_02'),
					('tranthique@gami.com',		'tranque',	'tranthique',	 3,				2,'2021_09_03'),
					('phamvanviet@gmail.com',	'phamviet',	'phamvanviet',	 4,				1,'2021_09_04'),
					('nguyenthitinh@gmail.com',	'nguyentinh','nguyenthitinh',5,				4,'2021_09_07'),
					('hoangthithuy@gmail.com',	'h.thuy',	 'hoangthithuy', 7,				1,'2021_09_09'),
                    ('phamthithuy@gmail.com',	'p.thuy',	 'phamthithuy',  7,				2,'2021_09_10'),
                    ('tranthithuy@gmail.com',	'tranthuy',	 'tranthithuy',  9,				3,'2021_09_11'),
                    ('tranthanhha@gamil.com',	'thanhha',	'tranthanhha',   10,			2,'2021_09_12'),
                    ('tranthimai@gamil.com',	'tranmai',	'tranthimai',    8,				4,'2021_09_13');
 
 -- insert group
INSERT INTO `Group`(GroupName,CreatorID)
VALUES 				('GroupName1','1'),
					('GroupName2','3'),
                    ('GroupName3',2),
                    ('GroupName4','4'),
                    ('GroupName5','5'),
                    ('sale',		7),
                    ('now',    		8),
                    ('past',		10),
                    ('future',      9 ),
                    ('simple',		6);
                    
    -- insert  GroupAccount
    INSERT INTO GroupAccount(GroupID,AccountID)
VALUES 					('1','2'),
						('2','3'),
                        ('3','4'),
                        ('4','5'),
                        ('5','1'),
                        (6,7),
                        (7,6),
                        (8,9),
						(10,9),
                        (9,10);
                        
      --  insret ypeQuestion
      INSERT INTO TypeQuestion(TypeName)
VALUES					('Essay'),
						('Multiple Choice');
                        
	-- insert category:loai
    INSERT INTO CategoryQuestion(CategoryName)
VALUES 						('abc1'),
							('abc2'),
                            ('abc3'),
                            ('abc4'),
                            ('abc5'),
                            ('bcd'),
                            ('cde'),
                            ('def'),
                            ('sml'),
                            ('sql');
       -- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`testingsystemassignment1`.`question`, CONSTRAINT `fk_TypeID` FOREIGN KEY (`TypeID`) REFERENCES `typequestion` (`TypeID`))

      -- insrert Question
      INSERT INTO Question(Content,CategoryID,TypeID,CreatorID)
VALUES				('Content1','1','2','1'),	-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`testingsystemassignment1`.`question`, CONSTRAINT `fk_TypeID` FOREIGN KEY (`TypeID`) REFERENCES `typequestion` (`TypeID`))
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`testingsystemassignment1`.`question`, CONSTRAINT `fk_TypeID` FOREIGN KEY (`TypeID`) REFERENCES `typequestion` (`TypeID`))

					('Content2','1','1','2'),
                    ('Content3','3','1','3'),
                    ('Content4','5','2','2'),
                    ('Content2','2','1','4'),
                    ('Content4', 4, 1,   6),
                    ('Content6', 7, 2 ,  8),
                    ('Content8', 8,  1 , 6),
                    ('Content9', 9,  2,  10),
                    ('Content10',5,  1,  7),
                    ('content1', 4, 2, 9);
                    
      -- insret  Answer             
      INSERT INTO Answer(Content,QuestionID,isCorrect)
VALUES			('Content1','1','yes'),
				('Content2','1','yes'),
                ('Content3','2','no'),
                ('Content4','4','yes'),
                ('Content1','3','no'),
				('Content_abc','3','yes'),
                ('Content_abc1','8','no'),
                ('Content_abc3','8','yes'),
                ('Content_abc4','10','no');
       -- insert Exam
INSERT INTO Exam(QuestionID)
VALUES 			('1'),
				('3'),
                ('2'),
                ('4'),
                ('5'),
                (6),
                (7),
                (6),
                (8),
                (10);
		-- insret ExamQuestion
      INSERT INTO ExamQuestion(ExamID,QuestionID)
VALUES					('1','1'),
						('1','2'),
                        ('2','1'),
                        ('2','3'),
                        ('1','4'),
                        (5,6),
                        (6,7),
                        (8,9),
                        (9,7),
                        (10,8);
	
        -- Question2:
    SELECT Department
    FROM Department;
        -- question3
    SELECT DepartmentID
    FROM 	Department
    WHERE  DepartmentName='sale';
        -- Question 4
     SELECT*
     FROM `Account`
     WHERE length(FullName)=(SELECT MAX(length(FullName)) FROM `Account`);
		-- question 5
        WITH question5 AS
	 ( SELECT*
     FROM `Account`
     WHERE DepartmentID=3) 
     SELECT *
     FROM question5
     WHERE length(FullName)=(SELECT MAX(length(FullName)) FROM question5);
      -- question6
	SELECT groupname
    FROM `Group`
    WHERE CreateDate<'2019_12_20';
    -- question 7
    WITH question_7 AS
    (SELECT QuestionID, COUNT(*)
    FROM answer
    GROUP BY QuestionID)
    SELECT QuestionID
    FROM question_7
    WHERE 'COUNT(*)'>=2;-- da thay doi de bai 4->2
    -- question8
SELECT questionID
FROM  Question -- sai
WHERE  createDate<='2021_09_25'; ------------------ 
  
  -- question9
  SELECT *
  FROM `Group`
  LIMIT 5;
  -- question10
  SELECT COUNT(AccountID)
  FROM `Account`
  WHERE DepartmentID=2;  
  -- question11
  SELECT*
  FROM `Account`
  WHERE Username LIKE 'D%O'
  ORDER BY AccountID ASC;
  -- question12
  DELETE
  FROM Exam
  WHERE createDate;
  
  -- question13
  DELETE
  FROM Question
  WHERE Content LIKE 'cau hoi%';
  -- question14
 
 
  UPDATE `Account`
  SET fullname ='nguyen_ba_loc',
	  email ='loc.nguyenba@vti.com.vn'
  WHERE AccountID=5;
  -- question15

  UPDATE GroupAccount
  SET AccountID=5 
  WHERE GroupID=4;

    
    


    
   




