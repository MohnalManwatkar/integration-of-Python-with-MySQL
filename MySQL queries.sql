-- check the databases
show databases

-- create database
create database P_S_practice

-- to use perticular database
use P_S_practice;

-- query to create table
CREATE TABLE IF NOT EXISTS bank_details (
    age INT,
    job VARCHAR(50),
    marital VARCHAR(10),
    education VARCHAR(50),
    `default` VARCHAR(50),
    balance INT,
    housing VARCHAR(50),
    loan VARCHAR(50),
    contact VARCHAR(50),
    day INT,
    month VARCHAR(50),
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(30),
    y VARCHAR(30)
);

-- query to check the table
select * from bank_details

show tables

describe bank_details

-- insert statement
insert into bank_details values(58,"management","married","tertiary","no",2143,"yes","no","unknown",5,"may",261,1,-1,0,"unknown","no")

select * from bank_details

insert into bank_details values
	(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
	(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
	(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
	(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
	(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
	(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
	(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
	(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
	(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
	(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
	(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
	(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
	(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
	(57,"services","married","secondary","no",162,"yes","no","unknown",5,"may",174,1,-1,0,"unknown","no"),
	(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
	(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
	(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
	(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no"),
	(33,"services","married","secondary","no",0,"yes","no","unknown",5,"may",54,1,-1,0,"unknown","no"),
	(28,"blue-collar","married","secondary","no",723,"yes","yes","unknown",5,"may",262,1,-1,0,"unknown","no"),
	(56,"management","married","tertiary","no",779,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
	(32,"blue-collar","single","primary","no",23,"yes","yes","unknown",5,"may",160,1,-1,0,"unknown","no"),
	(25,"services","married","secondary","no",50,"yes","no","unknown",5,"may",342,1,-1,0,"unknown","no"),
	(40,"retired","married","primary","no",0,"yes","yes","unknown",5,"may",181,1,-1,0,"unknown","no"),
	(44,"admin.","married","secondary","no",-372,"yes","no","unknown",5,"may",172,1,-1,0,"unknown","no"),
	(39,"management","single","tertiary","no",255,"yes","no","unknown",5,"may",296,1,-1,0,"unknown","no"),
	(52,"entrepreneur","married","secondary","no",113,"yes","yes","unknown",5,"may",127,1,-1,0,"unknown","no"),
	(46,"management","single","secondary","no",-246,"yes","no","unknown",5,"may",255,2,-1,0,"unknown","no"),
	(36,"technician","single","secondary","no",265,"yes","yes","unknown",5,"may",348,1,-1,0,"unknown","no")

describe bank_details

-- query to show only 2 columns
select age, job from bank_details;


-- conditional statements
select * from bank_details where age=41;

select * from bank_details where job = 'retired' or balance>100;

select * from bank_details where education = 'primary' or balance<100;

-- to find the unique values
select distinct job from bank_details;

select distinct job, count(job) as count from bank_details group by job;


-- order by function 
select * from bank_details order by age asc;
select * from bank_details order by age desc;

-- Aggrigate functions
-- count the number of rows
select count(*) from bank_details;

select sum(balance) from bank_details;

select avg(balance) from bank_details;

select min(balance) from bank_details;

select * from bank_details where balance=(select min(balance) from bank_details);

-- group by opration
select marital, count(*) as count from bank_details group by marital;

select marital, count(*), sum(balance), avg(balance) from bank_details group by marital;

select marital, count(*), sum(balance), avg(balance) from bank_details group by marital having sum(balance)<300;

-- update statement
set sql_safe_updates = 0;  -- first use this command 
update bank_details set balance = 0 where job= 'unknown';  -- after execution of first command update command will execute
select job, balance from bank_details;

-- updating multiple columns
update bank_details set contact = 'known' , y = 'yes' where education= 'tertiary';
select education, contact, y from bank_details;

update bank_details set `default` = 'known' where `default` = 'no';

-- delete opration
delete from bank_details where job= 'unknown';
select * from bank_details;

--  Procedure =A procedure in SQL is a named block of code that can be executed to perform a specific task or set of tasks.
		-- syntex:  create procedure procedure_name()

DELIMITER &&
create procedure select_procedure()
BEGIN
	select * from bank_details; -- we are using this query again and again, so now we create a procedure and now we just have to call prodedure name so this query will execute automatically.
END &&

call select_procedure


-- Creating new functions in SQL

DELIMITER &&
create procedure function_procedure(in var int)
BEGIN
	select * from bank_details where job = 'retired' or balance > var;
END &&

call function_procedure(2000)

-- passing multiple arguments 
DELIMITER &&
create procedure function_procedure_1(in var1 varchar(30), in var2 int)
BEGIN
	select * from bank_details where job = var1 or balance > var2;
END &&

call function_procedure_1('technician', 2000); -- this will shows the data where job=technician and balance is greater then 2000


-- VIEW - A view in SQL is a virtual table that is based on the result of a predefined query.

select job, age, education, y from bank_details -- creating VIEW for this query

select * from (select job, age, education, y from bank_details) as a where a.age=58;

create view bank_view as select job, age, education, y from bank_details; -- bank_view is a name, we can give any name or alias

select * from bank_view as a where a.age=58;

CREATE TABLE IF NOT EXISTS bank_details_1 (
    age INT,
    job VARCHAR(50),
    marital VARCHAR(10),
    education VARCHAR(50),
    `default` VARCHAR(50),
    balance INT,
    housing VARCHAR(50),
    loan VARCHAR(50),
    contact VARCHAR(50),
    day INT,
    month VARCHAR(50),
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(30),
    y VARCHAR(30)
);

-- -------------------------------------------------------------------------------------------
-- join oprations 
	-- incerting all the data from bank_details (table1) to bank details1 (table2)
insert into bank_details_1 select * from bank_details;

# inner join opration
select bank_details.age, bank_details.job, bank_details.marital 
from bank_details 
INNER JOIN bank_details_1 
on bank_details.age=bank_details_1.age;

# right join opration
select bank_details.age, bank_details.job, bank_details.marital 
from bank_details 
right JOIN bank_details_1 
on bank_details.age=bank_details_1.age;

CREATE TABLE IF NOT EXISTS bank_details_2 (
    age INT,
    job VARCHAR(50),
    marital VARCHAR(10),
    education VARCHAR(50),
    `default` VARCHAR(50),
    balance INT,
    housing VARCHAR(50),
    loan VARCHAR(50),
    contact VARCHAR(50),
    day INT,
    month VARCHAR(50),
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(30),
    y VARCHAR(30)
);

insert into bank_details_2 select * from bank_details where age=58;
select * from bank_details_2;

# inner join opration
select bank_details.age, bank_details.job, bank_details.marital 
from bank_details 
INNER JOIN bank_details_2 
on bank_details.age=bank_details_2.age;

# right join opration
select bank_details.age, bank_details.job, bank_details.marital 
from bank_details 
RIGHT JOIN bank_details_2 
on bank_details.age=bank_details_2.age;

# lefft join opration
select bank_details.age, bank_details.job, bank_details.marital 
from bank_details 
LEFT JOIN bank_details_2 
on bank_details.age=bank_details_2.age;

-- --------------------------------------------------------------------------
show databases 
-- drop statuments
drop database library;