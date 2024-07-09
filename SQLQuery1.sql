create database om;

Create table emp (empid int,empname varchar(10), 
                   designation varchar(10),
				   salary money, doj date);

sp_help emp; 

Alter table emp add Gender char(1);

Alter table emp alter column empid bigint;

Alter table emp alter column empname varchar(50);