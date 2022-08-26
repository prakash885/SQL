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

select * from emp where ename like 'A%'


select * from emp where mgrid is null

select ename,empno,sal from emp where sal between 1200 and 1400

select empno,ename,dname,sal as Pre_Value,sal+(sal*10/100) as Increment from dept,emp where dept.dname='RESEARCH' and dept.deptno=emp.deptno

select count(job) as Total_Clerks from emp where job='CLERK'

select job,avg(sal) as Avg_Sal from emp group by job 

select * from emp where sal=
							(select max(sal) from emp) 
or
						sal=
							 (select min(sal) from emp)

select distinct dname from dept,emp where dept.deptno not in
															(select emp.deptno from emp) 

select emp.deptno,ename,sal from emp,dept where dept.deptno=emp.deptno and dept.deptno=20 and job='analyst' order by ename

select dname,sum(sal) as Tot_Salary from dept,emp where dept.deptno=emp.deptno group by dname

select ename,sal from emp where ename in ('MILLER','SMITH')

select ename from emp where ename like '[AM]%'

select ename,sal*12 as Annual_Salary from emp where ename='SMITH'

select ename,sal from emp where sal between 1500 and 2850

select mgrid,count(empno) as Emp_Count from emp group by mgrid having count(*)>2

