select nullif('Hi','Hi')
select nullif('Hello','Hi')
select nullif(null,'hi')

select coalesce('hi','hello',null);
select coalesce(null,'hi');
select coalesce(null,null);

select isnull(null,6);
select isnull(null,null)
select isnull('mohan','hu');
select isnull('mohan',null);


declare @name varchar(20)
set @name = 'Banglore'
select left(@name,3);

declare @name1 varchar(25)
set @name1 = 'banglore'
select right(@name1,3);

declare @fruits varchar(10)
set @fruits = 'apple'
select upper(@fruits)

declare @fruits1 varchar(20)
set @fruits1 = 'APPLE'
SELECT LOWER(@FRUITS1)

declare @str varchar(100)
set @str = '  chennai    '
select ltrim(@str) as TrimmedString;

declare @str1 varchar(100)
set @str1 = '  chennai    '
select rtrim(@str1) as TrimmedString;


declare @str2 varchar(100)
set @str2 = '   chennai   '
select rtrim(ltrim(@str2));

declare @rev varchar(100)
set @rev = 'Hukum'
select reverse(@rev) as reverseword;

declare @length int
set @length = 1234
select len(@length);

declare @replicat varchar(50)
set @replicat = 'Hukum'
select replicate(@replicat,5)


declare @place varchar(10)
set @place = 'punnnnne'
select replace(@place,'nnnnn','n');

declare @stuf varchar(100)
set @stuf = 'bannnnglore'
select stuff(@stuf,3,4,'n')

declare @char varchar(100)
set @char = 'banglorea'
select charindex('a',@char)

declare @char1 varchar(100)
set @char1 = 'banglorea'
select charindex('a',@char1,charindex('a',@char1)+1)

declare @email varchar(100)
set @email = 'ravi@tcs.com'
select substring(@email,5,9)




