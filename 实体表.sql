create table teacherInfo
(
    id	  char(10) constraint Teacher_Prim primary key not null,
    name  char(10) not null,
    sex   char(2) not null default '男',
    birthday   Date not null,
	nation	char(20),
	pinCode char(18) not null,
	title char(10) not null default '讲师',
	email char(50) not null,
	address char(50),
	phoneNumber char(25),
)

create table studentInfo
(
    id	  char(6) constraint Student_Prim primary key not null,
    name  char(10) not null,
    sex   char(2) not null default '男',
    birthday   Date not null,
	nation	char(20),
	pinCode char(18) not null,
	email char(50) not null,
	address char(50),
	phoneNumber char(25)
)

create table course
(
    id      char(10) constraint Course_Prim primary key not null,
    name    char(20) not null,
    credit  int
	--上课的时间不知道怎么弄
)

create table document --感觉不对，文件夹怎么弄？
(
	id	char(32) constraint Document_Prim primary key not null,
	name	varchar not null,
	大小	size,
	location	varchar,
	createDate	Date,
	updateDate	Date
)

create table commentary
(
	id	char(32) constraint Commentary_Prim primary key not null,
	content	Text,
	createDate	Date,
	updateDate	Date
)
