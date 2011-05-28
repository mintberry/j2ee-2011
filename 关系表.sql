drop table if exists student_course;
create table student_course
(
	id int auto_increment,
    s_id char(6) not null,
	course_id char(10) not null,
	primary key(id)
)CHARSET=gbk;


drop table if exists teacher_course_file;
create table teacher_course_file
(
	id int auto_increment,
    t_id char(10) not null,
	course_id char(10) not null,
	f_id char(32) not null,
	primary key(id)
)CHARSET=gbk;

drop table if exists student_course_file;
create table student_course_file
(
	id int auto_increment,
    s_id char(6) not null,
	course_id char(10) not null,
	f_id char(32) not null,
	primary key(id)
)CHARSET=gbk;

drop table if exists file_comment;
create table file_comment
(
	id int auto_increment,
	f_id char(32) not null,
	comment_id	char(32) not null,
	primary key(id)
)CHARSET=gbk;