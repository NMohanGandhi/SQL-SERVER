use om;
select * from emp;

select*from dept;

select empno,ename,job from emp;

--by using alias name
select empno as employee_Number,ename [employee Number],job empjob from emp;

select * from emp where deptno=10;

select * from emp where sal>2000;
select * from emp where sal<1500;

select * from emp where sal>=3000;
select * from emp where sal<=1600;

select * from emp where sal>2000 and sal<4000;
select * from emp where sal between 2000 and 4000;

select * from emp where sal between 1500 and 3000;
select * from emp where sal>=1500 and sal<=3000;

select * from emp where job = 'salesman';
select * from emp where job like 'salesman';

select * from emp where job in ('salesman','clerk');
select * from emp where job='salesman' or job = 'clerk';

select * from emp where comm is null or comm<=0;
select * from emp where comm is not null and comm>0;

select * from emp where deptno = 10 and job = 'clerk';

select * from emp where deptno in (10,20,30) and job = 'clerk';
select * from emp where deptno =20 and job in ('clerk','analyst');

select * from emp where deptno != 30;
select * from emp where deptno not in (30);
select * from emp where deptno <> 30;

select * from emp where deptno in (10,20) and job <> 'Manager';

select * from emp where ename like 's%';
select * from emp where ename like '%s';
select * from emp where ename like '_a%';
select * from emp where ename like '%r_';
select * from emp where ename like 's%' and len(ename) = 5;
select * from emp where ename like '%s%';

select * from emp where ename like '[a,e,i,o,u]%';
select * from emp where ename like '[aeiou]%';

select * from emp where ename not like '[a,e,i,o,u]%';
select * from emp where ename like '%[a,e,i,o,u]';
select * from emp where ename like '%[^aeiou]';



