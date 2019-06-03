create database testdb;use testdb;create table customer(
  ID int not null,
  NAME varchar(20) not null,
  AGE int not null,
  ADDRESS char(25),
  SALARY decimal(18, 2),
  primary key(ID)
);
insert into
  customer (ID, NAME, AGE, ADDRESS, SALARY)
values
  (1, 'Hello', 19, 'Bangalore', 200.00);
insert into
  customer
values
  (2, 'World', 20, 'Chennai', 300.00);
insert into
  customer
values
  (3, 'This', 18, 'Hyderabad', 400.00);
insert into
  customer
values
  (4, 'is', 24, 'Mumbai', 500.00);
delete from
  testdb.customer
where
  AGE = 19;
select
  ID,
  NAME,
  AGE,
  SALARY
from
  testdb.customer
where
  AGE >= 18
  and SALARY < 400.00;
select
  *
from
  testdb.customer
where
  NAME like '_or%';
select
  *
from
  customer
limit
  2;
select
  *
from
  customer
order by
  SALARY desc;
update
  customer
set
  NAME = 'This'
where
  NAME = 'is';
select
  NAME,
  sum(SALARY)
from
  customer
group by
  NAME;
select
  distinct NAME
from
  customer
order by
  AGE;create table employee(
    id int not null,
    name char(3) not null,
    boss_id int not null
  );
insert into
  employee
values
  (1, 'ABC', 3);
insert into
  employee
values
  (2, 'DEF', 1);
insert into
  employee
values
  (3, 'GHI', 2);
select
  emp1.id,
  emp1.name,
  emp2.id as BOSSID,
  emp2.name as BOSS
from
  employee emp1,
  employee emp2
where
  emp1.boss_id = emp2.id
order by
  emp1.id;
alter table
  employee
add
  age int;
select
  *
from
  employee;
update
  employee
set
  age = 6
where
  id < 4;
alter table
  employee
add
  constraint MyPK primary key(id);
alter table
  employee drop primary key;
alter table
  employee drop column age;create view emp_view as
select
  id,
  name
from
  employee
where
  boss_id < 3;drop view emp_view;
insert into
  employee
values
  (4, 'GHI', 2);
insert into
  employee
values
  (5, 'ABC', 3);
select
  *
from
  employee
group by
  name
having
  count(id) >= 2;start transaction;savepoint sp1;
delete from
  employee
where
  id = 4;savepoint sp2;
delete from
  employee
where
  id = 5;
select
  *
from
  employee;rollback to sp1;release savepoint sp1;
select
  curdate();
select
  curtime();
select
  date('2018-10-31 12:59:59');
select
  date_add('2018-10-31 12:59:59', interval '1-3' year_month);
select
  date_format(curtime(), '%D %M %Y %W %r %j');show create table employee;
select
  *
from
  employee
where
  id in (
    select
      id
    from
      employee
    where
      boss_id < 3
  );
insert into
  employee
select
  *
from
  employee
where
  id in (
    select
      id
    from
      employee
  );
select
  *
from
  employee;
alter table
  employee drop id;
alter table
  employee
add
  id int not null auto_increment first,
add
  primary key(id);
select
  distinct name,
  boss_id
from
  employee;
select
  id,
  name,
  sqrt(boss_id)
from
  employee
order by
  rand();
select
  interval(9, 1, 2, 3, 4, 5, 6, 7, 8);
