use om;

select * from emp;

select sum(comm) as Totalcomm from emp;
select sum(sal) as TotalSalary from emp;

select * from emp where comm is null or comm =0;

select min(sal) from emp;
select min(comm) from emp;

select max(sal) from emp;
select max(comm) from emp;

select avg(sal) from emp;
select avg(comm) from emp;

select count(*) from emp where comm is null;
