create table students ( id int,
                        sname varchar(100),
						smarks int
						);
------------------------------------------------------------------------------

insert into students values(1,'a',99),(2,'b',48),(4,'c',64),
                           (8,'d',33),(5,'e',48),(6,'f',20),
						   (7,'e',74),(11,'g',33),(9,'h',89),
						   (10,'i',79);
------------------------------------------------------------------------------
select * from students;
------------------------------------------------------------------------------

select id,sname,smarks,
          row_number()
		  over(order by smarks desc)
		  as rownumber
from students;
-------------------------------------------------------------------------------
with cte as 
(
 select *,
        rank()
		over(order by smarks desc)
		as ranks
 from students
 )
 select * from cte -- where ranks=5;
----------------------------------------------------------------------

 with denseranks as
 (
 select *,
        dense_rank()
		over (order by smarks desc)
		as denserank
 from students
 )
 select * from denseranks;
----------------------------------------------------------------------------
 select *,
       ntile(3)
	   over(order by smarks desc)
	   as ntil
from students;
-----------------------------------------------------------------------------
select getdate() as datetime;

select sysdatetime() as dates;
------------------------------------------------------------------------------
---->DATEPART()

select datepart(day,getdate());
select datepart(month,getdate());
select datepart(year,getdate());
select datepart(weekday,getdate());
select datepart(dayofyear,getdate());
-------------------------------------------------------------------------------
-- WHO ARE BORN IN 1982

select * from emp;

SELECT * FROM EMP
      WHERE  DATEPART(YEAR,HIREDATE)=1982;

SELECT * FROM EMP
        WHERE DATEPART(MONTH,HIREDATE)=2 AND DATEPART(YEAR,HIREDATE)=1981;
----------------------------------------------------------------------------------


SELECT * FROM EMP
      WHERE DATEPART(mONTH,HIREDATE)=2 OR DATEPART(YEAR,HIREDATE)=1981;
---------------------------------------------------------------------------------
---> WHO ARE CELEBRATING TODAY
DOB
5/21/2000 RAVI
5/26/1999 KIRAN
---------------------------------------------------------------------------
DATEPART(MONTH,DOB) AND DATEPART(MONTH,GETDATE())
DATEPART(DAY,DOB) AND DATEPART(DAY,GETDATE())
------------------------------------------------------------------------------

----- DATENAME()

SELECT DATENAME(DAY,GETDATE())
SELECT DATENAME(MONTH,GETDATE())
SELECT DATENAME(YEAR,GETDATE())
SELECT DATENAME(DAYOFYEAR,GETDATE())

----------------------------------------------------------------------------

---> DATEADD()

SELECT DATEADD(YEAR,-5,GETDATE());
SELECT DATEADD(YEAR,-23,GETDATE());
SELECT DATEADD(DAY,1,GETDATE());
SELECT DATEADD(MONTH,1,GETDATE());

-----------------------------------------------------------------------

--> DATEDIFF()

SELECT DATEDIFF(YEAR,'2001-08-2',GETDATE())
SELECT DATEDIFF(MONTH,'2001-08-2',GETDATE())
SELECT DATEDIFF(DAY,'2001-08-2',GETDATE())



