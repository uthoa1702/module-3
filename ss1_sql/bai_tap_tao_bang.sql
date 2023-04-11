CREATE database student_management;
use student_management;
create table class (id int primary key, `name` varchar(50));
CREATE table teacher (id int primary key,
`name` varchar(50),
age int, 
country varchar(50)
);
select * from class;
select `name` from class;
drop table class;
insert into class values (1,"c01"), 
(2,"c02"), 
(3,"c03");
insert into teacher value (1,"Hoa", 22, "Vie");
select * from teacher;
