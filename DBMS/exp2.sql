create table student(s_id SMALLINT PRIMARY KEY AUTO_INCREMENT, s_name 
VARCHAR(50), ph_no VARCHAR(10), dob DATE, email_id VARCHAR(50), dept_id 
varchar(20)); 

show tables;

create table department(dept_id varchar(20) PRIMARY KEY, dept_name varchar(50));

desc department;

desc student; 

INSERT INTO department VALUES('101','CE'); 
INSERT INTO department VALUES('102','ENTC'); 
INSERT INTO department VALUES('103','IT'); 
select * from department; 

INSERT INTO student VALUES(1, 'Shalin Chore', '986543217','2003-03-30','shalinchore@gmail.com','103'); 
INSERT INTO student VALUES(2,'Vaibhav Shinde', '9824331017','2003-12-22','shindevaibhav@gmail.com','101'); 
INSERT INTO student VALUES(3,'Suma Gadepalli', '8247348988','2003-11-30','sumamebh@gmail.com','102'); 
INSERT INTO student VALUES(4,'Tanvi Zuluk', '712459618','2003-03-31','tanvizuluk@gmail.com','103'); 
INSERT INTO student VALUES(5,'Rajat Totla', '7042188631','2003-05-08','rajattotla@gmail.com','103'); 
INSERT INTO student VALUES(6,'Aarti Lad', '8007125493','2003-03-25','aartilad@gmail.com','101'); 
INSERT INTO student VALUES(7,'Gunjan Pardikar', '8023584773','2003-11-26','gunjanpard@gmail.com','102'); 
INSERT INTO student VALUES(8,'Anushree Patil', '8346010072','2003-07-02','patilanushree@gmail.com','101'); 
INSERT INTO student VALUES(9,'Siddhi Hajare', '8179960032','2003-11-24','sidphajare@gmail.com','102'); 
INSERT INTO student VALUES(10,'Parth Dawande', '9844132470','2003-02-19','dawandeparth@gmail.com','101'); 
 
mysql> select * from student;

show index from student; 

explain select * from student;

explain select * from student where s_id=5; 

explain select * from student where s_name='Shalin Chore'; 