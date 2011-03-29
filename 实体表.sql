drop table if exists teacherInfo;
create table teacherInfo
(
    t_id char(10) not null,
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
	#上课的时间不知道怎么弄
	primary key(course_id)
)CHARSET=gbk;

drop table if exists files;
create table files  #感觉不对，文件夹怎么弄？
(
	f_id char(32) not null,
	name varchar(255) not null,
	filesize int,
	location varchar(255),
	createDate Date,
	updateDate Date,
	primary key(f_id)
)CHARSET=gbk;

drop table if exists comments;
create table comments
(
	comment_id char(32) not null,
	content	Text,
	createDate Date,
	updateDate Date,
	primary key(comment_id)
)CHARSET=gbk;
