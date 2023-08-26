create database organization;
use organization;
create table emp(id int, name varchar(100), department varchar(100), user_id int, manager_id int, salary int);
select*from emp;
insert into emp values(101,'Rakesh','Tester',201,301,30000),
(102,'Rohit','Dev',202,302,33000),
(103,'Parth','S.Tester',203,303,20000),
(104,'Nishant','HR',204,304,40000),
(105,'Pushpender','AssistantHR',205,305,50000);
---------------------------------------------------------------------------------
create table student (id int, name varchar(100),branch varchar(100), class int);
select*from student;
insert into student values(201,'Aniket','science',10),
(202,'Anil','maths',11),
(203,'Rakesh','art',12),
(204,'Rohit','science',9),
(205,'Parth','home science',8),
(206,'Nishant','social science',6);
-- drop table student;
---------------------------------------------------------------------------------------
create table work_emp(id int, name varchar(100),depart varchar(100),salary int);
select*from work_emp;
insert into work_emp values(301,'Rakesh','HR',20000),
(302,'Rohit','dev',30000),
(303,'Ravi','teser',23000),
(304,'Parth','SHR',25000),
(305,'Pushpender','ARO',27000);
-----------------------------------------------------------------------------------------
select*from emp;
select*from student;
select*from worker;
-------------------------------------------------------------------------------------------
-- delete, drop,truncate
-- delete
-- delete the data from the table row wise and table structure remains.
-- it can be rollback to data.alter
set autocommit = 0;
delete from emp where id = 101;
delete from emp;
delete from emp where name = 'Rakesh';
-- drop
-- delete all the data from table and  table structure also .
-- it can not be rollback.
drop table emp;
drop database organization;
-- turncate 
-- delete all data from the table and structure remains.
-- it cant not be rollback.
truncate emp;
truncate organization;
-----------------------------------------------------------------------------------------
show databases;
desc emp;
set autocommit = 0;
alter table emp add column Age int;
update emp set age = 20 where id = 101;
update emp set id =101 where Age = 20;
alter table emp drop age;
select*from emp;
------------------------------------------------------------------------------------
-- distinct 
-- it is used to find the unique values in table.
select distinct salary from emp;
select count(distinct (name)) from emp;
--------------------------------------------------------------------------------------
-- LOGICAL OPERATOR      AND , OR , ^(NOT)
-- ASSIGNMENT OPERATOR    > , < , >=, <= , <>, !=  these are the assignment operator which is used to assign the data into table.
-- AND OPERATOR -- it is used to column wise when find the data in table.
-- OR OPERATOR --  it is used to row wise when find the data in table.
-- ^ (NOT) OPERATOR -- it is used to find the data in table when condition not equal to.
select* from emp where name = 'Pushpender' and salary =50000; 
select* from emp where name = 'Rakesh' or salary =30000; 
select* from emp where name = 'Pushpender' and salary^30000;
select* from emp where salary between 20000 and 30000; 
select* from emp where  salary  in (50000,40000);
select* from emp where  salary not in (50000,40000); 
select* from emp where id%2=0; -- for even data 
select* from emp where id%2=1; -- for odd data 
select* from emp where salary = 50000 and name like 'p%';
select* from emp where salary = 30000 or name like 'R%';
select* from emp where salary < 40000 and salary >=20000;
select* from emp where salary=20000 or salary !=30000;  
select* from emp where salary<= 40000 and salary >=30000; 
select* from emp where name = 'Rakesh' and salary <>30000;
update emp set salary = salary +330 where id = 101; -- for update salary 
update emp set salary = salary +330   where id  between 101 and 102; 
-------------------------------------------------------------------------------------------
-- ORDER BY -- it is used to data set in asc/desc  in order.
select * from emp order by user_id,name asc;
select * from emp order by user_id desc;
select * from emp order by salary desc,id asc;
select * from emp order by salary asc;
select * from emp order by salary asc, name desc, user_id asc, id desc;
-- TOP 
select *from emp order by user_id asc limit 2 ;
select *from emp order by user_id desc limit 5 ;
select top*2 from emp where salary = 30000 order by user_id asc;
----------------------------------------------------------------------------------------------
-- Aggregate function.
-- the WHERE keyword cannot be used with aggregate functions.
-- Functions: Count(), AVG(), SUM(), MIN(), MAX()
-- AVG() : 1 values
-- SUM() : 1 values
-- MIN() : 1 values
-- MAX() : 1 values
-- Count():  1 values
-- Always use fucntions after SELECT
-- Functions are always used on COLUMN
select max(salary) from emp;
select min(salary) from emp;
select avg(salary) from emp;
select count(salary) from emp;
select sum(salary) from emp;

-- 2nd highest salary find out with out any keyword.
-- these condition when we use that  does not know about the salaries.
select max(salary) from emp where salary < (select max(salary) from emp);
-- 3rd highest salary
select max(salary) from emp where salary < (select max(salary)from emp where salary < (select max(salary) from emp));
select * from emp;
-- 2nd highest salary find out with the help of limit decending order. 
select* from emp order by salary desc limit 1,1;
-- 3rd highest salary find out with the help of limit in ascending order.
select* from emp order by salary desc limit 2,1;
-- 4th highest salary find out with the help of limit in ascending order.
select* from emp order by salary desc limit 4,1;
-- 2nd highest salary find out with the help of distinct and limit decending order.
select distinct(salary) from emp  where salary < 50000 limit 3,1;
select distinct(salary) from emp  where salary > 20000 limit 2,1;
--------------------------------------------------------------------------------------------------------------
-- PRACTICE FOR SQL QUESTION IT WILL BE HELP IN INTERVIEW
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
select*from worker;
-----------------------------------------------------------------------------------------------

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
	REFERENCES Worker(WORKER_ID)
       
);
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
select*from Bonus;
------------------------------------------------------------------------------------------------------------
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
	REFERENCES Worker(WORKER_ID)
       
);
INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
select*from Title;
-----------------------------------------------------------------------------------------------
select*from worker;
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select FIRST_NAME  as WORKER_NAME from worker; 
-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(FIRST_NAME) from worker;
-- lower case 
select lower(FIRST_NAME) from worker;
 -- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
 select distinct(DEPARTMENT) from worker;
 -- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table
 select  substring(FIRST_NAME ,1,3) as three_char from Worker;
--  Write an SQL query to print the last  three characters of  FIRST_NAME from Worker table.
select substring(FIRST_NAME,3,5) as last_three from worker;
#. select substring_index2(FIRST_NAME) from worker;
-- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
select position('a'in 'Amitabh') as position_char from worker;

-- TRIM , LTRIM, RTRIM.
--- By default, the TRIM() function removes leading and trailing spaces from a string.
-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select trim('FIRST_NAME') from worker;
select rtrim('FIRST_NAME ') from worker;
-- remove white space from left side.
select ltrim('  FIRST_NAME') from worker;
#.select ltrim('Monika') from worker;
-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select ltrim('   DEPARTMENT') from worker;
--  Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select lenght('DEPARTMENT')from worker;
select distinct(lenght('DEPARTMENT'))from worker;
-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace( FIRST_NAME,'a' ,'A') from worker;
--  Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select concat( first_name,' ' , last_name)  as complete_name from worker;
 -- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
 select * from worker order by FIRST_NAME asc;
-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from  worker order by  FIRST_NAME  asc , DEPARTMENT desc;
-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from worker  where first_name between 'vipul'and 'satish';
select first_name as 'vipul''satish' from worker;
--  Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select last_name  as 'vipul''satish' from worker;
-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”
select*from worker where department= 'Admin';
--  Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’. start with a.
select * from worker where FIRST_NAME like 'a%';
-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where FIRST_NAME like '%a';
 -- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
 select * from worker where  FIRST_NAME like '%h%';
 -- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000;
-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from worker where joining_date >= 2014-02-01;
--  Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(first_name) from worker where department = 'Admin';
-- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000
select first_name,salary from worker where salary >= 50000 and salary <= 100000;
-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select count(first_name) from worker order by department desc;
-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
select*from Title;
select *from Title where worker_title = 'manager';
--  Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select first_name from worker where salary>50000 group by last_name having sum(salary)<100000;
-- syntax 
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);
-------------------------------------------------------------------------------------------------------
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5; 
--------------------------------------------------------------------------------------------------------
-- group by
-- syntax 
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);

SELECT COUNT(worker_id ) ,salary
FROM worker
GROUP BY first_name
order by last_name asc;
----------------------------------------------------------------
SELECT COUNT(worker_id ),salary
FROM worker
GROUP BY first_name;
 -- Q-26. Write an SQL query to show only odd rows from a table.---limit row%2=1;
 select * from worker where worker_id%2=1;
 select*from worker where worker_id limit 3;
 -- Q-27. Write an SQL query to show only even rows from a table.--- limit row%2=0;
 select * from worker where worker_id%2=0;
 -- 
 -- Q-28. Write an SQL query to clone a new table from another table.
 create table worker_clone (select*from worker);
 select * from worker_clone;
 --  Q-29. Write an SQL query to fetch intersecting records of two tables.
 -- Ans.
 --  Q-30. Write an SQL query to show records from one table that another table does not have.
select* from worker;
--  Q-31. Write an SQL query to show the current date and time.
select*from worker where joining_date; 
-- Q-32. Write an SQL query to show the top n (say 10) records of a table.
select*from worker order by worker_id limit 10;
select top from worker;
SELECT LAST(salary) FROM worker;
select * from worker salary limit 3;
 --  Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select*from worker salary limit 4,1;
select*from worker order by salary desc limit 1,1;
--  Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
SELECT * FROM (  
SELECT ROW_NUMBER() OVER (ORDER BY SALARY desc) AS rownumber,Salary  
FROM worker )  
AS rakesh  
WHERE rownumber = 5; 

 -- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select first_name,salary from worker;
--  Q-36. Write an SQL query to show the second highest salary from a table.
select* from (select row_number() over (order by salary desc) as rownumber,salary from worker) as rakesh where rownumber=2;
select*from worker order by salary  desc limit 2,1;
select * from worker where salary  limit 3,1;
select max(salary) from worker where salary < (select max(salary) from worker);
--  Q-37. Write an SQL query to show one row twice in results from a table.
select worker_id, first_name from worker 
union all 
select worker_id, first_name from worker;
--  Q-38. Write an SQL query to fetch intersecting records of two tables.
select worker_id, first_name from worker;
SELECT  ID, NAME, AMOUNT, DATE
   FROM CUSTOMERS
   LEFT JOIN ORDERS
   ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID
INTERSECT
   SELECT  ID, NAME, AMOUNT, DATE
   FROM CUSTOMERS
   RIGHT JOIN ORDERS
   ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID;
--  Q-39. Write an SQL query to fetch the first 50% records from a table.
select*from worker where worker_id <= (select count(worker_id)/2 from worker); 
select count(worker_id)/2 from worker;
--  Q-40. Write an SQL query to fetch the departments that have less than five people in it.
select*from worker where department<5;
--  Q-41. Write an SQL query to show all departments along with the number of people in there.
select department from worker;
--  Q-42. Write an SQL query to show the last record from a table.
select * from worker order by worker_id desc limit 1;
--  Q-43. Write an SQL query to fetch the first row of a table.
select*from worker order by worker_id asc limit 1; 
--  Q-44. Write an SQL query to fetch the last five records from a table.
-- select TOP 5 from worker order by worker_id DESC;
select*from worker order by worker_id desc limit 5;
--  Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
select first_name,department, salary from worker where salary having max(salary);
--  Q-46. Write an SQL query to fetch three max salaries from a table.
SELECT distinct Salary from worker a WHERE 3>=
(SELECT count(distinct Salary) from worker b WHERE a.Salary <=b.Salary)
ORDER by a.Salary desc;
-- Write An SQL Query To Find The (Position) Of The Alphabet ('A') In The First Name Column 'Amitabh' From Worker Table.
-- select instr('Amitabh', 'A') first_name from worker;
--  Q-47. Write an SQL query to fetch three min salaries from a table.
SELECT DISTINCT salary 
FROM worker a
WHERE  3 >= (SELECT COUNT(DISTINCT salary) 
FROM worker b 
WHERE a.salary <= b.salary) 
ORDER BY a.salary desc;

-----------------------------------------------------------------------------------------------------------
-- CONTRAINTS.
-- contraints always applicable for column. 
-- PRIMARY KEY.
-- 1. it wiil always accept unique values.
-- 2. it will not accept duplicates and null values.
-- 3. it accepts only one in a table.
-- 4. it will accept auto - increment.

-- UNIQUE KEY.
-- 1. it wiil always accept unique values.
-- 2. it will not accept duplicates values.
-- 3. it will accept null values.
-- 3. it can create multiple colummn of unique key in a table.
-- 4. it will not  accept auto - increment.

-- FOREIGN KEY.
-- 1. it wiil accept unique values.
-- 2. it will accept duplicates and null values.
-- 3. it can create multiple colummn of in a table.
-- 4. Always need reference table for make a foreign key.
create table sample1 (id int,fname varchar(100), primary key(id));
create table sample2 (user_id int, lname varchar(100),  foreign key (user_id) references  sample1 (id));

insert into sample1 values (101,'Rakesh'),
(102,'Ramesh'),
(103,'Rajesh'),
(104,'Rohit');

insert into sample2 values (101,'Kumar'),
(102,'singh'),
(103,'sagar'),
(104,'singh');
------------------------------------------------------------------------------------------------------------
desc sample1;
desc sample2;

-----------------------------------------------------------------------------------------------------------
select*from sample1;
select*from sample2;
------------------------------------------------------------------------------------------------------------
-- JOIN
-- 1. INNER JOIN/ OUTER JOIN. 
-- 2. LEFT OUTER JOIN/ LEFT JOIN. 
-- 3. RIGHT OUTER JOIN/ RIGHT JOIN.
-- 4. FULL OUTER JOIN/ FULL JOIN.
-- 5. SELF JOIN.
---------------------------------------------------------------------------------------------
-- 1. INNER JOIN.
-- it returns all the common data/values or records from the left and right table.

select*from sample1;
select*from sample2;
select*from sample1 inner join sample2 on sample1.id = sample2.user_id;
select sample1.id,fname,lname from sample1 inner join sample2 on sample1.id = sample2.user_id;
insert into sample1 values(105,'Rahul');
-----------------------------------------------------------------------------------------------------
-- 2. LEFT JOIN.
-- it returns all the common values/data or records from the right table.
-- it returns all records from the left table.

select*from sample1;
select*from sample2;
select*from sample1 left join sample2 on sample1.id = sample2.user_id;
select sample1.id,fname,lname from sample1 left join sample2 on sample1.id = sample2.user_id;
select sample1.id,fname,lname from sample2 left join sample1 on sample1.id = sample2.user_id;
insert into sample1 values(105,'Rahul');
insert into sample2 values(106,'suman');
---------------------------------------------------------------------------------------------------
-- 3. RIGHT JOIN.
-- it returns all the common values/data or records from the left table.
-- it returns all records from the right table.

select*from sample1;
select*from sample2;
select sample1.id,fname,lname from sample1 right join sample2 on sample1.id = sample2.user_id;
select sample1.id,fname,lname from sample2 right join sample1 on sample1.id = sample2.user_id;
-----------------------------------------------------------------------------------------------------
-- 4. FULL JOIN.
-- it returns all the common data from both table right and left.

select*from sample1;
select*from sample2;
select*from sample1 inner join sample2 on sample1.id = sample2.user_id;
select*from sample1 where sample1.id = sample2.user_id;
------------------------------------------------------------------------------------------------------
-- PRACTICE
select id,fname,char_length(fname) from sample1;
select rand(fname) from sample1;

create table students23 (id int, roll_no int, stu_name varchar(100));
insert into students23 values
(1, 10, 'ajay'),
(2, 11, 'manish'),
(3, 12, 'kajal'),
(4, 13, 'anil'),
(5, 14, 'amit');
create table prize (roll_no int, prize_status boolean);
insert into prize values
(10, 1),
(12,1),
(13,1);
select*from prize;
select*from students23;
desc students23;
desc prize;


alter table students23 add primary key (roll_no);
alter table prize add foreign key (roll_no) references students23(roll_no);

-- select students23.roll_no,students23 from students23 left join prize on students23.roll_no = prize.prize_status where prize.prize_status is not null;
---------------------------------------------------------------------------------------------------------------------------------------

create database pvt_comp;
use pvt_comp;
create table employe (id int,first_name varchar(50),department varchar(50),salary int);
insert into employe values(101,'Rakesh','Tester',45000),
(102,'Rohit','Sr.Tester',55000),
(103,'Parth','Dev',40000),
(104,'Nishant','Manager',30000),
(105,'Pushpender','S.Mester',33000),
(106,'Nirdesh','Sr.Tester',25000);

select*from employe;
select first_name,salary from employe;
select*from employe  order by salary asc limit 3; 
select first_name, salary from employe  order by salary asc limit 5; 
select first_name, salary from employe  order by salary desc limit 4; 
select first_name,salary from employe where salary > 33000;
select first_name,salary from employe where id%2=1;
select first_name,salary from employe where id%2=0;
select *from employe where first_name like'%R';
select *from employe where first_name like'R%';
select *from employe where first_name like'%R%';
update employe set salary = salary + 550 where salary > 33000;
-- delete from employe where id= 105;
alter table employe add column Male varchar(4);
select*from employe;
update employe set Male = 'Male' where id =  101;
update employe set Male = 'Male' where id =  102;
select max(salary) from employe;
select max(salary) from employe where salary < (select max(salary) from employe);
select max(salary) from employe where salary < (select max(salary) from employe where salary < ((select max(salary)from employe)));
select max(salary),first_name from employe;
select min(salary) from employe;
select avg(salary) from employe;
select count(salary) from employe;
select sum(salary) from employe;
select*from employe where first_name = 'R' or salary > 40000;
select*from employe where first_name = 'R' and salary > 40000;
select*from employe where salary <= 50000 and salary > 40000;
select*from employe where salary <= 50000 or salary > 40000;
update employe set first_name = 'Mukesh' where id = 101; 
alter table employe add column Age int;
select * from employe;
select concat(first_name,' ', department) from employe;
select replace(department,'',first_name) from employe;
select upper(first_name) from employe;
select lower(first_name) from employe;
select ltrim('  first_name') from employe;
select ltrim('first_name  ') from employe;
select position('M' in 'Mukesh') from employe;
select substring('Mukesh',1,3) from employe;
select distinct(department) from employe;
select count(distinct(first_name)) from employe;
select first_name, salary from employe order by salary desc limit 0,1;
select first_name, salary from employe order by salary asc limit 1,1;
select first_name, salary from employe order by salary desc limit 2,1;
select first_name, salary from employe order by salary asc limit 3,1;
select first_name, salary from employe order by salary asc limit 4,1;
select*from employe;
 select replace(first_name,'M','m') from employe;

