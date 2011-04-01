drop table if exists teacher_course;
create table teacher_course
(
    t_id char(10) not null,
	course_id char(10) not null
)CHARSET=gbk;

drop table if exists student_course;
create table student_course
(
    s_id char(6) not null,
	course_id char(10) not null
)CHARSET=gbk;


#需要改进
drop table if exists teacher_course_file;
create table teacher_course_file
(
    t_id char(6) not null,
	course_id char(10) not null,
	f_id char(32) not null
)CHARSET=gbk;

#需要改进
drop table if exists student_course_file;
create table student_course_file
(
    s_id char(6) not null,
	course_id char(10) not null,
	f_id char(32) not null
)CHARSET=gbk;

drop table if exists file_comment;
create table file_comment
(
	f_id char(32) not null,
	comment_id	char(32) not null
)CHARSET=gbk;





