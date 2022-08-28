create database Day2

use Day2

create table dept
(  
deptno numeric(10) primary key,  
dname  varchar(30),  
loc    varchar(30),   
)

create table emp
(  
empno numeric(10) primary key,  
ename varchar(30),  
job varchar(30),  
mgrid numeric(10),  
hiredate date,  
sal numeric(10),  
comm numeric(10),  
deptno numeric(10) foreign key references dept (deptno)   
)


insert into dept 
values(10, 'ACCOUNTING', 'NEY YORK'),
(
20, 'RESEARCH', 'DALLAS'
),
(
30, 'SALES', 'CHICAGO'
),
(
40, 'OPERATIONS', 'BOSTON'
)



insert into emp  
values(7839, 'KING', 'PRESIDENT', null,'1981-11-17', 5000, null, 10),  
(  
7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, null, 30  
)
,(  
 7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, null, 10  
),
(  
 7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, null, 20  
),
(  
 7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000, null, 20  
),
(  
 7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, null, 20  
),
(  
 7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, null, 20  
),
(  
 7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30  
),
(  
 7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30  
),
(  
 7654, 'MARTIN', 'SALESMAN', 7698,'1981-09-28', 1250, 1400, 30  
),
(  
 7844, 'TURNER', 'SALESMAN', 7698,  '1981-09-08', 1500, 0, 30  
),
(  
 7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100,null, 20  
),
(  
 7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, null, 30  
),
(  
 7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, null, 10  
)

select * from emp
select * from dept


select ename from emp where job='MANAGER'

select ename,sal from emp where sal>1000

select ename,sal from emp where ename != 'JAMES'

select * from emp where ename like 'S%'

select ename from emp where ename like '%A%'

select ename from emp where ename like '__L%'

Select ename,sal/30 as daily_salary from emp where ename='JONES'

select ename,sal*12 as total_monthlysalary from emp

Select avg(sal*12) as avg_salary from emp

Select ename,job,sal,deptno from emp where job not in('SALESMAN') and deptno=30

select distinct emp.deptno,dept.dname from emp inner join dept on emp.deptno=dept.deptno 

select ename as employees,sal as monthly_salary,deptno from emp where sal>1500 and (deptno=10 or deptno=30)

select ename,job,sal from emp where (job='MANAGER'or job='ANALYST') and (sal not in(1000,3000,5000))

select ename,sal,comm from emp where comm is not null and comm>(sal*0.1)

select ename from emp where ename like '%L%L%' and (deptno=30 or mgrid=7738)

select ename,deptno,datediff(year,hiredate,getdate()) as experience from emp where (datediff(year,hiredate,getdate())>10 ) and (datediff(year,hiredate,getdate())<20)

select dept.dname,emp.ename from emp inner join dept on emp.deptno=dept.deptno order by dept.dname asc,emp.ename desc

select datediff(year,hiredate,getdate()) as experience from emp where ename='MILLER'
