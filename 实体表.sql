drop table if exists teacherInfo;
create table teacherInfo
(
    id varchar(10) not null,
    name char(10) not null,
    sex char(2) not null default '男',
    birthday Date not null,
	nation	char(20),
	pinCode char(18) not null,
	title char(10) not null default '讲师',
	email char(50) not null,
	address char(50),
	phoneNumber char(25)
)CHARSET=gbk;

drop table if exists studentInfo;
create table studentInfo
(
    id varchar(6) not null,
    name  char(10) not null,
    sex   char(2) not null default '男',
    birthday   Date not null,
	nation	char(20),
	pinCode char(18) not null,
	email char(50) not null,
	address char(50),
	phoneNumber char(25)
)CHARSET=gbk;

drop table if exists course;
create table course
(
    id      char(10) not null,
    name    char(20) not null,
    credit  int
	#上课的时间不知道怎么弄
)CHARSET=gbk;

drop table if exists document;
create table document   #感觉不对，文件夹怎么弄？
(
	id	char(32) not null,
	name varchar(200) not null,
	filesize	int,
	location	varchar(200),
	createDate	Date,
	updateDate	Date
)CHARSET=gbk;

drop table if exists commentary;
create table commentary
(
	id	char(32) not null,
	content	Text,
	createDate	Date,
	updateDate	Date
)CHARSET=gbk;
