create database organization;
use organization;

create table emp1 (id int, first_name varchar(100), departman varchar(100), salary int, mobile text);
select * from emp1;
insert into emp1 values (101,'Rakesh', 'tester', 20000, 8017329358),
(102,'Rohit', 'Developer', 30000, 9017329358),
(103,'Pushpender', 'HR', 40000, 7617329358),
(104,'Nishant', 'Assistent', 50000, 7717329358),
(105,'Parth', 'Developer', 25000, 7917329358),
(106,'Vikash', 'tester', 22000, 7617329358);
-- update/drop
select max(salary) from emp1;
select max(salary) from emp1 where saary<(select max(salary) from emp1);
select max(salary) from emp1 where salary<(select max(salary) from emp1 where salary < (select max(salary) from emp1));
select  max( salary) from emp1 where salary< (select  max( salary) from emp1);
select min(salary) from emp1;
select count(distinct(salary)) from emp1;
select avg(salary) from emp1;
select sum(salary) as SUM from emp1;
select min(salary) as MIN from emp1;
select distinct first_name, salary from emp1;
select max(salary) from emp1 where salary < (select max(salary) from emp1) ;
alter table emp1 drop mobile;
select * from emp1;
update emp1 set salary=salary+550 where id = 101; 
alter table emp1 add gender varchar(4);
alter table emp1 drop gender;
update emp1 set gender = 'male' where id = 101;
update emp1 set salary = salary+550 where id = 103;
-- Logical operator AND,OR,^
-- AND operator update values column wise.
-- OR operator update values Row wise.
select*from emp1 where id = 101 and salary = 20000; -- AND operator search column wise.
select*from emp1 where id = 101 or salary = 30000;-- OR operator search row wise.
update emp1 set salary = salary+550 where first_name= 'Rohit';
update emp1 set salary = salary+550 where first_name= 'Rakesh' or salary<20000;
update emp1 set salary = salary+550 where first_name= 'Parth' and salary^22000;
update emp1 set salary = salary+550 where first_name ='Parth' and first_name = 'Rakesh';
-- Assignment operator > , < , = , <> , !=
select* from emp1 where salary > 20000 and salary >= 15000;
select* from emp1 where salary > 20000 or salary >= 15000;
select* from emp1 where salary < 30000 and salary <= 40000;
select* from emp1 where salary < 20000 or salary <= 22000;
select* from emp1 where salary <>20000 and salary != 30000;

select salary from emp1; 
select*from emp1 where salary between 20000 and 30000;
select * from emp1 where name like 'R%';
select distinct first_name from emp1; -- distinct used to unique values. 
select distinct salary from emp1;
insert into emp1 values(106,'Rakesh','tester', 40000);
select*from emp1;
select*from emp1 where id not in (101); 
select*from emp1 where id in (102); 
select*from emp1 where first_name not in ('R'); 
select*from emp1 where first_name in ('r'); 
select count(salary) as SALARY from emp1;
select count(first_name) as NAME from emp1;
-----------------------------------------------------
-- Aggregate function-- sum(),count(),min(),max(),avg() -- it is used only column wise.and it is not acceptable where clause.
select sum(salary) from emp1;
select avg(salary) from emp1;
select max(salary) from emp1;
select min(salary) from emp1;
select count(salary) from emp1;
select  count(*) from emp1;
set autocommit = 1;
update emp1 set salary = salary+330 where id = 102;
select*from emp1;
select avg(salary) as avg_sal,sum(salary) as sum_sal,min(salary) as min_sal,count(salary) as count_sal from emp1;

create table student (id int, name varchar(100),branch varchar(100), class int);
select*from student;
insert into student values(201,'Aniket','science',10),
(202,'Anil','maths',11),
(203,'Rakesh','art',12),
(204,'Rohit','science',9),
(205,'Parth','home science',8),
(206,'Nishant','social science',6);

create table worker (id int, name varchar(100),depart varchar(100),salary int);
select*from worker;
insert into worker values(301,'Rakesh','HR',20000),
(302,'Rohit','dev',30000),
(303,'Ravi','teser',23000),
(304,'Parth','SHR',25000),
(305,'Pushpender','ARO',27000);


-- create table marksheet (id int, name varchar(100), subject varchar(100),pass varchar(50);
create table marksheet (id int, name varchar(100), subject varchar(100),pass varchar(50);