drop table if exists teacherInfo;
create table teacherInfo
(
    t_id char(10) not null,
	password char(20) not null,
    name char(10) not null,
    sex char(2) not null default '男',
    birthday Date not null,
	nation	char(20),
	pinCode char(18) not null,
	title char(10) not null default '讲师',
	email char(50) not null,
	address char(50),
	phoneNumber char(25),
	primary key(t_id)
)CHARSET=gbk;

drop table if exists studentInfo;
create table studentInfo
(
    s_id char(6) not null,
	password char(20) not null,
    name  char(10) not null,
    sex   char(2) not null default '男',
    birthday   Date not null,
	nation	char(20),
	pinCode char(18) not null,
	email char(50) not null,
	address char(50),
	phoneNumber char(25),
	primary key(s_id)
)CHARSET=gbk;

drop table if exists courses;
create table courses
(
    course_id char(10) not null,
    name char(20) not null,
    credit int,
	schedule_0 int default 0, #(1-70 represent the possible time)
	schedule_1 int default 0, #(1-70 represent the possible time)
	schedule_2 int default 0, #(1-70 represent the possible time)
	schedule_3 int default 0, #(1-70 represent the possible time)
	t_id char(10),
	t_name char(20),
	maxstudent int,
	place varchar(255),
	primary key(course_id)
)CHARSET=gbk;

drop table if exists files;
create table files
(
	f_id int auto_increment,
	name varchar(255) not null,
	filesize int,
	location varchar(255),
	description varchar(255),
	updateDate Date,
	primary key(f_id)
)CHARSET=gbk;


drop table if exists comments;
create table comments
(
	comment_id int auto_increment,
	content	Text,
	updateDate Date,
	primary key(comment_id)
)CHARSET=gbk;

drop table if exists notify;
create table notify
(  
	`NId` INT NOT NULL ,  
	`datetime` DATETIME NOT NULL ,  
	`author` VARCHAR(20) NOT NULL ,  
	`content` LONGTEXT NOT NULL ,  
	`accessory` VARCHAR(255) NULL ,  
	`title` VARCHAR(45) NOT NULL ,  
	PRIMARY KEY (`NId`) 
)CHARSET=gbk;

ALTER TABLE `portal`.`notify` CHANGE COLUMN `NId` `NId` INT(11) NOT NULL AUTO_INCREMENT;