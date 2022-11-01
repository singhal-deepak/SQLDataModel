CREATE Table department
(
  dept_name varchar(100),
  building varchar(100),
  budget int,
  primary key(dept_name)
  );
 Insert into department(dept_name,building, budget)
values 
  ('IDS', 'Douglas Hall', 600000),
  ('CS', 'Science and Technology Building', 800000),
  ('FIN', 'Lecture Centre C', 800000);


CREATE TABLE [course](
[course_id] [varchar](100) NOT NULL,
[Title] [varchar](100) NOT NULL,
[credits] int NOT NULL,
[prereq_id] [varchar](100) NULL,
[dept_name] varchar(100),
primary key (course_id),
FOREIGN KEY (dept_name) REFERENCES department(dept_name) 
);

INSERT INTO [dbo].[course] ([course_id], [Title], [credits], [prereq_id]) VALUES ('IDS 575','Machine Learning', 4,'IDS 410')
INSERT INTO [dbo].[course] ([course_id], [Title], [credits], [prereq_id]) VALUES ('IDS 576','Deep Learning', 4,'IDS 572')
INSERT INTO [dbo].[course] ([course_id], [Title], [credits]) VALUES ('IDS 572','Data Mining', 4)
INSERT INTO [dbo].[course] ([course_id], [Title], [credits], [prereq_id]) VALUES ('IDS 566','Advance Text Analytics', 2,'IDS 572')
INSERT INTO [dbo].[course] ([course_id], [Title], [credits]) VALUES ('MKTG 500','Intro to Marketing', 4)
INSERT INTO [dbo].[course] ([course_id], [Title], [credits]) VALUES ('IDS 521','Advance Database Management', 4)
INSERT INTO [dbo].[course] ([course_id], [Title], [credits]) VALUES ('FIN 500','Intro to Finance', 4)
INSERT INTO [dbo].[course] ([course_id], [Title], [credits], [prereq_id]) VALUES ('IDS 561','Big Data Analytics', 4,'IDS 572')


CREATE TABLE [section](
[sec_id] int NOT NULL,
[semester] [varchar](100) NOT NULL,
[year] int NOT NULL,
[course_id] [varchar](100) NOT NULL references [dbo].[course]([course_id]),
section_name varchar(100),
max_occupancy int,
seats_available int,
waitlist_count int,
primary key (course_id,sec_id,semester,year)
);

INSERT INTO [dbo].[section] ([sec_id],[semester],[year],[course_id], section_name, max_occupancy, seats_available, 
waitlist_count) VALUES (1,'Fall',2020,'IDS 572', 'Green', 100, 30, 0)
INSERT INTO [dbo].[section] ([sec_id],[semester],[year],[course_id], section_name, max_occupancy, seats_available, 
waitlist_count) VALUES (2,'Spring',2020,'IDS 572', 'Red', 100, 100, 20)
INSERT INTO [dbo].[section] ([sec_id],[semester],[year],[course_id], section_name, max_occupancy, seats_available, 
waitlist_count) VALUES (3,'Fall',2021,'IDS 575', 'Yellow', 100, 80, 0)
INSERT INTO [dbo].[section] ([sec_id],[semester],[year],[course_id], section_name, max_occupancy, seats_available, 
waitlist_count) VALUES (1,'Fall',2020,'IDS 521', 'Red', 100, 30, 0)
INSERT INTO [dbo].[section] ([sec_id],[semester],[year],[course_id], section_name, max_occupancy, seats_available, 
waitlist_count) VALUES (2,'Spring',2021,'IDS 561', 'Green', 100, 30, 0)
INSERT INTO [dbo].[section] ([sec_id],[semester],[year],[course_id], section_name, max_occupancy, seats_available, 
waitlist_count) VALUES (3,'Fall',2020,'IDS 572', 'Yellow', 100, 100, 10)
 


 

CREATE Table instructor
(
  InstructorId varchar(1000),
  Name varchar(1000),
  Salary int,
  dept_name varchar(100),
  sec_id int not null,
[semester] [varchar](100) NOT NULL,
[year] int NOT NULL,
[course_id] [varchar](100) NOT NULL ,
  primary key (InstructorId),
  FOREIGN KEY (dept_name) REFERENCES department(dept_name),
 -- FOREIGN KEY (course_id) REFERENCES course(course_id),
  FOREIGN KEY (course_id,sec_id,semester,year) REFERENCES section(course_id,sec_id,semester,year)
  );


Insert into instructor (InstructorId,Name,Salary, dept_name, sec_id,semester,year,course_id)
values 
 ('567','Jacob',56000,'IDS',1,'Fall',2020,'IDS 572'),
 ('425','John',100000,'IDS',2,'Spring',2021,'IDS 561'),
 ('777','Singh',35000,'IDS',3,'Fall',2021,'IDS 575'),
 ('892','Chen',39000,'IDS',1,'Fall',2020,'IDS 521'),
 ('584','Judy',45000,'IDS',2,'Spring',2020,'IDS 572'),
 ('582', 'Jacky',56000,'IDS',3,'Fall',2020,'IDS 572');

 

CREATE TABLE student(student_id char(9) NOT NULL,
 first_name varchar(20), last_name varchar(20), 
 tot_cred char(3),
 dept_name varchar(100),
 --sec_id int not null,
--[semester] [varchar](100) NOT NULL,
--[year] int NOT NULL,
--[course_id] [varchar](100) NOT NULL ,
--InstructorId varchar(1000) NOT NULL,
 PRIMARY KEY (student_id),
 FOREIGN KEY (dept_name) REFERENCES department(dept_name)),
  --FOREIGN KEY (InstructorId) REFERENCES instructor(InstructorId),
  --FOREIGN KEY (course_id,sec_id,semester,year) REFERENCES section(course_id,sec_id,semester,year) ); 


INSERT INTO student VALUES ('568925890', 'Sam', 'Smith', '10', 'IDS');
INSERT INTO student VALUES ('789654231', 'Winston', 'Jackson', '8', 'IDS');
INSERT INTO student VALUES ('147852963', 'Jessica', 'Day', '16', 'CS');
INSERT INTO student VALUES ('456963159', 'Nick', 'Miller', '4', 'IDS');
INSERT INTO student VALUES ('753123852', 'Rachel', 'Green', '6', 'CS');
INSERT INTO student VALUES ('156354759', 'Monica', 'Geller', '18', 'FIN');
INSERT INTO student VALUES ('751953852', 'Chandler', 'Bing', '10', 'FIN');
INSERT INTO student VALUES ('658458789', 'Ross', 'Geller', '18', 'CS');
INSERT INTO student VALUES ('640001236', 'Phoebe', 'Buffay', '4', 'FIN');
INSERT INTO student VALUES ('665626369', 'Joey', 'Tribbiani', '4', 'IDS');

INSERT INTO student VALUES ('454565651', 'Cece', 'Parikh', '10', 'IDS');
INSERT INTO student VALUES ('545496969', 'Allison', 'Day', '14', 'FIN');
INSERT INTO student VALUES ('667298123', 'Ken', 'Adams', '16', 'CS');
INSERT INTO student VALUES ('443454183', 'Robin', 'Hood', '4', 'FIN');
INSERT INTO student VALUES ('782964572', 'Lisa', 'Jacobs', '12', 'IDS');
INSERT INTO student VALUES ('663656214', 'Wyatt', 'Smith', '14', 'FIN');
INSERT INTO student VALUES ('667258695', 'Joe', 'Goldberg', '16', 'FIN');
INSERT INTO student VALUES ('662584569', 'Emily', 'Fields', '12', 'IDS');
INSERT INTO student VALUES ('652158963', 'Hanna', 'Marin', '10', 'CS');
INSERT INTO student VALUES ('651258945', 'Aria', 'Montgomery', '16', 'IDS');

INSERT INTO student VALUES ('642589631', 'Ezra', 'Fitz', '10', 'IDS');
INSERT INTO student VALUES ('648595632', 'Sheldon', 'Cooper', '18', 'CS');
INSERT INTO student VALUES ('647845185', 'Raj', 'Koothrapali', '16', 'FIN');
INSERT INTO student VALUES ('652548741', 'Howard', 'Wolowitz', '18', 'IDS');
INSERT INTO student VALUES ('658021500', 'Leonard', 'Hofstadter', '6', 'CS');
INSERT INTO student VALUES ('661200785', 'Bernadette', 'Wolowitz', '18', 'IDS');
INSERT INTO student VALUES ('645210078', 'Priya', 'Koothrapali', '10', 'FIN');
INSERT INTO student VALUES ('652158965', 'Emily', 'Sweets', '18', 'FIN');
INSERT INTO student VALUES ('661002789', 'Zack', 'Rivers', '4', 'FIN');
INSERT INTO student VALUES ('642568900', 'Penny', 'Smith', '4', 'CS');



ALTER TABLE student
add InstructorId varchar(1000),
FOREIGN KEY (InstructorId) REFERENCES instructor(InstructorId);

UPDATE student SET InstructorId = 777 WHERE student_id = 568925890;
UPDATE student SET InstructorId = 777 WHERE student_id = 789654231;
UPDATE student SET InstructorId = 777 WHERE student_id = 147852963;
UPDATE student SET InstructorId = 777 WHERE student_id = 456963159;
UPDATE student SET InstructorId = 777 WHERE student_id = 753123852;
UPDATE student SET InstructorId = 777 WHERE student_id = 156354759;
UPDATE student SET InstructorId = 892 WHERE student_id = 751953852;
UPDATE student SET InstructorId = 892 WHERE student_id = 658458789;
UPDATE student SET InstructorId = 892 WHERE student_id = 640001236;
UPDATE student SET InstructorId = 892 WHERE student_id = 665626369;
UPDATE student SET InstructorId = 892 WHERE student_id = 454565651;
UPDATE student SET InstructorId = 584 WHERE student_id = 545496969;
UPDATE student SET InstructorId = 584 WHERE student_id = 667298123;
UPDATE student SET InstructorId = 584 WHERE student_id = 443454183;
UPDATE student SET InstructorId = 584 WHERE student_id = 782964572;
UPDATE student SET InstructorId = 584 WHERE student_id = 663656214;
UPDATE student SET InstructorId = 582 WHERE student_id = 667258695;
UPDATE student SET InstructorId = 582 WHERE student_id = 662584569;
UPDATE student SET InstructorId = 582 WHERE student_id = 652158963;
UPDATE student SET InstructorId = 582 WHERE student_id = 651258945;

UPDATE student SET InstructorId = 582 WHERE student_id = 642589631;
UPDATE student SET InstructorId = 425 WHERE student_id = 648595632;
UPDATE student SET InstructorId = 425 WHERE student_id = 647845185;
UPDATE student SET InstructorId = 425 WHERE student_id = 652548741;
UPDATE student SET InstructorId = 425 WHERE student_id = 658021500;
UPDATE student SET InstructorId = 567 WHERE student_id = 661200785;
UPDATE student SET InstructorId = 567 WHERE student_id = 645210078;
UPDATE student SET InstructorId = 567 WHERE student_id = 652158965;
UPDATE student SET InstructorId = 567 WHERE student_id = 661002789;
UPDATE student SET InstructorId = 567 WHERE student_id = 642568900;



ALTER TABLE student
add course_id varchar(100),
 sec_id int,
  semester varchar(100),
   year int,
FOREIGN KEY
(course_id, sec_id, semester, year) REFERENCES section(course_id,
sec_id, semester, year);
select * from student
select * from section
UPDATE student SET course_id = 'IDS 572', sec_id = 1, semester = 'Fall', year=2020 WHERE student_id = '568925890';
UPDATE student SET course_id = 'IDS 572', sec_id = 3, semester = 'Fall',
year=2020 WHERE student_id = 789654231;
UPDATE student SET course_id = 'IDS 575', sec_id = 3, semester = 'Fall',
year=2021 WHERE student_id = 147852963;
UPDATE student SET course_id = 'IDS 561', sec_id = 2, semester = 'Spring',
year=2021 WHERE student_id = 456963159;

UPDATE student SET course_id = 'IDS 561', sec_id = 2, semester = 'Spring',
year=2021 WHERE student_id = 753123852;

UPDATE student SET course_id ='IDS 572', sec_id = 1, semester = 'Fall',
year=2020 WHERE student_id = 156354759;

UPDATE student SET course_id ='IDS 521', sec_id = 1, semester = 'Fall',
year=2020 WHERE student_id = 751953852;


UPDATE student SET course_id = 'IDS 521', sec_id = 1, semester = 'Fall',
year=2020 WHERE student_id = 658458789;
UPDATE student SET course_id = 'IDS 561', sec_id = 2, semester = 'Spring',
year=2021 WHERE student_id = 640001236;


UPDATE student SET course_id = 'IDS 561', sec_id = 2, semester = 'Spring',
year=2021 WHERE student_id = 665626369;
UPDATE student SET course_id = 'IDS 561', sec_id = 2, semester = 'Spring',
year=2021 WHERE student_id = 454565651;
UPDATE student SET course_id = 'IDS 572', sec_id = 3, semester = 'Fall',
year=2020 WHERE student_id = 545496969;
UPDATE student SET course_id = 'IDS 575', sec_id = 3, semester = 'Fall',
year=2021 WHERE student_id = 667298123;
UPDATE student SET course_id = 'IDS 521', sec_id = 1, semester = 'Fall',
year=2020 WHERE student_id = 443454183;
UPDATE student SET course_id = 'IDS 561', sec_id = 2, semester = 'Spring',
year=2021 WHERE student_id = 782964572;
UPDATE student SET course_id = 'IDS 572', sec_id = 3, semester = 'Fall',
year=2020 WHERE student_id = 663656214;
UPDATE student SET course_id = 'IDS 521', sec_id = 1, semester = 'Fall',
year=2020 WHERE student_id = 667258695;
UPDATE student SET course_id = 'IDS 561', sec_id = 2, semester = 'Spring',
year=2021 WHERE student_id = 662584569;
UPDATE student SET course_id ='IDS 561', sec_id = 2, semester = 'Spring',
year=2021 WHERE student_id = 652158963;

UPDATE student SET course_id = 'IDS 572', sec_id = 2, semester = 'Spring',
year=2020 WHERE student_id = 651258945;
UPDATE student SET course_id = 'IDS 575', sec_id = 3, semester = 'Fall',
year=2021 WHERE student_id = 642589631;
UPDATE student SET course_id = 'IDS 521', sec_id = 1, semester = 'Fall',
year=2020 WHERE student_id = 648595632;
UPDATE student SET course_id = 'IDS 561', sec_id = 2, semester = 'Spring',
year=2021 WHERE student_id = 647845185;
UPDATE student SET course_id = 'IDS 561', sec_id = 2, semester = 'Spring',
year=2021 WHERE student_id = 652548741;
UPDATE student SET course_id = 'IDS 572', sec_id = 1, semester = 'Fall',
year=2020 WHERE student_id = 658021500;
UPDATE student SET course_id = 'IDS 572', sec_id = 3, semester = 'Fall',
year=2020 WHERE student_id = 661200785;
UPDATE student SET course_id = 'IDS 521', sec_id = 1, semester = 'Fall',
year=2020 WHERE student_id = 645210078;
UPDATE student SET course_id = 'IDS 521', sec_id = 1, semester = 'Fall',
year=2020 WHERE student_id = 652158965;
UPDATE student SET course_id = 'IDS 561', sec_id = 2, semester = 'Spring',
year=2021 WHERE student_id = 661002789;
UPDATE student SET course_id ='IDS 572', sec_id = 1, semester = 'Fall',
year=2020 WHERE student_id = 642568900;

CREATE TABLE [time_slot](
[time_slot_id] int NOT NULL,
[day] [varchar](10) NULL,
[start_time] [time](7) NULL,
[end_time] [time](7) NULL,
sec_id int not null,
[semester] [varchar](100) NOT NULL,
[year] int NOT NULL,
[course_id] [varchar](100) NOT NULL ,
Primary Key (time_slot_id),
FOREIGN KEY (course_id,sec_id,semester,year) REFERENCES section(course_id,sec_id,semester,year)
);

INSERT INTO [dbo].[time_slot]  VALUES (1, 'Monday', '9:00', '12:00',1,'Fall',2020,'IDS 572')
INSERT INTO [dbo].[time_slot]  VALUES (2, 'Tuesday', '09:00', '12:00',2,'Spring',2020,'IDS 572')
INSERT INTO [dbo].[time_slot]  VALUES (3, 'Wednesday', '09:00', '12:00',2,'Spring',2021,'IDS 561')
INSERT INTO [dbo].[time_slot]  VALUES (4, 'Thursday', '9:00', '12:00',3,'Fall',2020,'IDS 572')
INSERT INTO [dbo].[time_slot]  VALUES (5, 'Friday', '09:00', '12:00',2,'Spring',2021,'IDS 561')
INSERT INTO [dbo].[time_slot]  VALUES (6, 'Monday', '15:00', '18:00',2,'Spring',2020,'IDS 572')
INSERT INTO [dbo].[time_slot]  VALUES (7, 'Tuesday', '15:00', '18:00',3,'Fall',2020,'IDS 572')
INSERT INTO [dbo].[time_slot]  VALUES (8, 'Wednesday', '15:00', '18:00',2,'Spring',2021,'IDS 561')
INSERT INTO [dbo].[time_slot]  VALUES (9, 'Thursday', '15:00', '18:00',2,'Spring',2020,'IDS 572')
INSERT INTO [dbo].[time_slot]  VALUES (10, 'Friday', '15:00', '18:00',1,'Fall',2020,'IDS 521')


CREATE TABLE [classroom](
[building] [varchar](100) NOT NULL,
[room_number] int NOT NULL,
[capacity] int NULL,
sec_id int not null,
[semester] [varchar](100) NOT NULL,
[year] int NOT NULL,
[course_id] [varchar](100) NOT NULL ,
primary key (building, room_number),
FOREIGN KEY (course_id,sec_id,semester,year) REFERENCES section(course_id,sec_id,semester,year)

);

INSERT INTO [dbo].[classroom]  VALUES ('BuildingA',101, 100,1,'Fall',2020,'IDS 572')
INSERT INTO [dbo].[classroom]  VALUES ('BuildingA',102, 50,2,'Spring',2020,'IDS 572')
INSERT INTO [dbo].[classroom]  VALUES ('BuildingA',103, 200,3,'Fall',2021,'IDS 575')
INSERT INTO [dbo].[classroom]  VALUES ('BuildingB',101, 100,1,'Fall',2020,'IDS 521')
INSERT INTO [dbo].[classroom]  VALUES ('BuildingB',102, 50,2,'Spring',2021,'IDS 561')
INSERT INTO [dbo].[classroom]  VALUES ('BuildingB',103, 200,3,'Fall',2020,'IDS 572')
INSERT INTO [dbo].[classroom]  VALUES ('BuildingC',101, 100,1,'Fall',2020,'IDS 572')
INSERT INTO [dbo].[classroom]  VALUES ('BuildingC',102, 50,3,'Fall',2020,'IDS 572')
INSERT INTO [dbo].[classroom]  VALUES ('BuildingC',103, 200,2,'Spring',2021,'IDS 561')
INSERT INTO [dbo].[classroom] VALUES ('BuildingD',101, 100,3,'Fall',2020,'IDS 572')
INSERT INTO [dbo].[classroom]  VALUES ('BuildingD',102, 50,2,'Spring',2020,'IDS 572')
INSERT INTO [dbo].[classroom] VALUES ('BuildingD',103, 200,2,'Spring',2020,'IDS 572')

select *  from [classroom]

select student_id, course_id into Grade from student

update Grade set grade = 'C' where student_id>456963159 and student_id<642568900

INSERT INTO [dbo].[Grade] VALUES('568925890','C1','A')
INSERT INTO [dbo].[Grade] VALUES('789654231','C1','A')
INSERT INTO [dbo].[Grade] VALUES('147852963','C1','A')
INSERT INTO [dbo].[Grade] VALUES('456963159','C1','A')
INSERT INTO [dbo].[Grade] VALUES('753123852','C1','A')
INSERT INTO [dbo].[Grade] VALUES('156354759','C1','A')
INSERT INTO [dbo].[Grade] VALUES('751953852','C1','A')
INSERT INTO [dbo].[Grade] VALUES('658458789','C1','A')
INSERT INTO [dbo].[Grade] VALUES('640001236','C1','A')
INSERT INTO [dbo].[Grade] VALUES('665626369','C1','A')
INSERT INTO [dbo].[Grade] VALUES('454565651','C1','A')
INSERT INTO [dbo].[Grade] VALUES('545496969','C1','A')
INSERT INTO [dbo].[Grade] VALUES('667298123','C1','A')
INSERT INTO [dbo].[Grade] VALUES('782964572','C1','A')
INSERT INTO [dbo].[Grade] VALUES('443454183','C1','A')
INSERT INTO [dbo].[Grade] VALUES('663656214','C1','A')
INSERT INTO [dbo].[Grade] VALUES('667258695','C1','A')
INSERT INTO [dbo].[Grade] VALUES('651258945','C1','A')

select * from instructor
