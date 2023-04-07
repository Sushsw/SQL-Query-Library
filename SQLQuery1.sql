create table student
(
  StudentInt int,
  StudentName varchar(30),
  StudentAge int,
  StudentHeight float
  )

select * from student
insert into student values(1,25,169,'Manish')
insert into student values(2,28,175,'Ronak')
insert into student values(3,24,175,'Rohit')
insert into student values(4,25,175,'Sneha')

truncate table student

select * from student where StudentAge < 26
select * from student where StudentAge =25
select * from student where StudentAge >24
select * from student where StudentAge<>25

select * from student where StudentAge in (24,26)
select * from student where StudentAge between 24 and 26
select * from student where StudentAge <=26 and StudentHeight <= 172
select * from student where StudentAge <=26 or StudentHeight <= 172
select * from student where StudentName = 'Rohit'
select * from student where StudentName <> 'Rohit'
select * from student where StudentName in ('Manish','Sneha')
select * from student where StudentName like 'S%'  /* Like used for Wild Card */
select * from student where StudentName like '%S%'
select * from student where StudentName like '%SH%'
select * from student where StudentName like '%S%H%'
select * from student where StudentName like '%a%' and StudentName like '%s%' 
select * from student where StudentName like '_a%'
select * from student where StudentName like '__j%'
insert into student values (5,'Ronak',22,Null)
insert into student(StudentInt,StudentName,StudentAge) values(6,'Rohan',22)
select * from student where StudentHeight =Null -- gives nothing
select * from student where StudentHeight is Null -- is and isnot is used wit Null
alter table student add Gender char(1)
alter table student drop column StudentName
alter table student add StudentName Varchar(20)
insert into student values (7,'Snehal',27,155,985647214)
alter table student add Dob date	-- Add is used directly
insert into student values (7,'Sneh',27,155,985647214,'1995-12-31')
delete from student where StudentName = 'Sneh'
alter table student drop column PhoneNumber
alter table student drop column CourseId  --Drop is used with column to delete column
update student set StudentHeight = 182
where StudentInt =2
update student set StudentHeight = 168,StudentAge=26
where StudentInt = 6
insert into student  (StudentName) values ('Rohit')
insert into student  (StudentName) values('MAnish')
insert into student  (StudentName) values('Sneha')
insert into student  (StudentName) values('Rajesh')
insert into student  (StudentName) values('Ronak')
insert into student  (StudentName) values('Snehal')
select * from student order by StudentAge -- For Ascending Order(Small to Large Number)
select * from student order by StudentAge desc -- For descending Order (Large to small number)

alter table student add CourseId int

update student set CourseId = 1 where StudentInt =1
update student set CourseId =2 where StudentInt =2
update student set CourseId = 2 where StudentInt =3
update student set CourseId = 3 where StudentInt =4
update student set CourseId = 1 where StudentInt =5


-- various joins

update.student set CourseId = 1 where StudentInt in (1,5)

create table Course  (CourseID int, CourseName Varchar (20))

truncate table Course

insert into Course values (1,'PowerBi'),(2,'Testing')

select * from student
select * from Course
-- Join or Inner Join
select * from student join Course on student.CourseID = Course.CourseID
select  StudentName , CourseName from student join course on student.CourseId = course.CourseID --use to join two tables
--Left Join
select  StudentName , CourseName from student left join course on student.CourseId = course.CourseID --used to show all values in left 
--Right Join
select  StudentName , CourseName from student right join course on student.CourseId = course.CourseID --used to show all values in right
--Full outer Join
select  StudentName , CourseName from student full outer join course on student.CourseId = course.CourseID --used to show all values
--Cross Join
select * from student cross join Course --all possible values or combinations

select * from student left join Course on student.CourseId = course.CourseID where CourseName is Null

select * from student left join Course on student.CourseId = course.CourseID where CourseName is Not Null

--Self Join
create table EmployeSj (EmpId int, EmpName varchar (20),  ManId int)

insert into EmployeSj values (1,'Rohit',0) ,(2,'Neha',1),(3,'Manish',1)
 select * from EmployeSj 
 select emp.EmpName as Employe,  man.Empname as Manager from EmployeSj as emp left join EmployeSj as man on emp.ManId =man.EmpId

 =====---- Constraints---=====
 ---1 Not Null Constraints
 create table SampleNotNull (Id int Not Null, name varchar(20) Not null, age int) 

 select * from SampleNotNull
 insert into  SampleNotNull values (1,'MAhesh',25)
 insert into  SampleNotNull values (1,Null,25)
 ------2 Unique Constraints
 Create table SampleUnique (ID int  not null unique,name varchar (20) not null, age int)
 select * from SampleUnique
 insert into SampleUnique values(1,'Mahesh',25)
 insert into SampleUnique values (1,'Neha',24)
 ------3 Check Constraints
 Create table SampleCheck (Id int not null check(id<3), name varchar(20)not null, age int)
 select * from SampleCheck
 insert into SampleCheck values (2,'Mahesh',25)
 insert into SampleCheck values (4,'Rohit',25)

 Create table CheckEmail (Id int , Name varchar(20), email varchar(20) check(email like '%@gmail.com'))

 select * from CheckEmail
 insert into CheckEmail values (1,'Mahesh','abc@gmail.com')
 insert into CheckEmail values (2,'Neha','abc@yahoo.com')
 
 ------4 Default Constraints

 create table SampleDefault(Id int not null, name varchar(20) not null,age int default 23)
  select * from SampleDefault
  insert into SampleDefault (Id,Name,Age) Values (1,'Mahesh',3)
  insert into SampleDefault (Id,Name) Values (2,'Rohit')
 
 alter table SampleDefault Add Constraint df_name Default 'Sandesh' for Name

 insert into SampleDefault (Id) values (5)
 insert into SampleDefault (ID,name) values (6,'Man')

 ----Primary Key and Foreign Key
 create table Department (Department int primary key, Name varchar(20))
 insert into Department values (1,'IT')
 insert into Department values (2,'HR')
 insert into Department values (0,'Finance') /*Sorted Format*/
 select * from Department
 insert into Department values (2,'Finance')
 insert into Department values(Null,'Finance')

 create Table Employe(EmpId int,EmpName varchar(20),EmpAge int, EmpDeptId int references Department (Department))
 -- Foreign Key  EmpDeptId int references Department (Department)
 select * from Employe

 insert into Employe values (1,'Rohit',26,1)
 insert into Employe values (2,'Shah',28,2)
 insert into Employe values (3,'Man',24,1)
 insert into Employe values (4,'Jyoti',22,3) --Gives Error Foreign Key Constraint

 select * from Employe Left Join Department On EmpId = Department

 select * from Employe Right Join Department On EmpId = Department

-----Index
--1 Clustered Index : Dictionary Type - Attached - Primary Key
--2 Non-Clustered Index : Normal Book - Separated - Unique Key 


---Stored Procedure 
create procedure spGetEmploye
as 
begin
select * from Employe left join Department on Department = EmpId 
end
exec spGetEmploye

create procedure spGetStudent (@StudId int)
as 
Begin
select * from student
where StudentInt = @StudId
end 
exec spGetStudent 2

create procedure spGetStudent1 (@StudId int, @age int)
as Begin
select * from student
where StudentInt = @StudId or StudentAge = @age
end
exec spGetStudent1 4, 23

---Union And Union All

create table test1 (Id int)
create table test2 (Id int)

insert into test1 values(1),(2),(3),(4)
insert into test2 values(2),(4),(3),(4)

select * from test1
select * from test2

select * from test1
union
select * from test2

select * from test1
union all
select * from test2

---

select StudentName ,StudentAge from student where StudentInt = 2

-----Views => To restrict Sensive data
select * from student

create view vwstudent 
as
select StudentAge , StudentName from student

select * from vwstudent where  StudentAge <=25


---Avoid update in Views 
update vwstudent set StudentAge = 28 where StudentName = 'Manish'

create view vwstudentcourse 
as
select studentname , coursename from student left join Course on student.CourseId = Course.CourseID

select * from Student
select * from Course

-----SubQuery----
select * from (select StudentName , studentage from student) ABC

select * from  student
where studentint in  
(
select studentint from student where courseId = 1 
)

-----CTE (Common Table Expression)
; with cteStud as (select StudentName , studentage from student) 
select * from cteStud

; with cteStud1(StudName, StudAge, CurrDate) as 
(
select StudentName, StudentAge , getdate() from student)
select * from cteStud1
-----Recursive CTE (allow upto 100 Numbers)

; with cteTable as  (select 1 as Num union all select Num + 1  from cteTable where Num < 20 )
select * from cteTable

--------Temporary Table---------

---Local

Create table #localtemptable
(id int identity(1,1), name varchar(20))
insert into #localtemptable values ('John'),('Johny'),('Janardan')

select * from #localtemptable

----Global
Create table ##globaltemptable
(id int identity(1,1), name varchar(20))
insert into ##globaltemptable values ('John'),('Johny'),('Janardan')

select * from ##globaltemptable

--Update table based on another table values---
select * from student
select * from course

select * from student
select * from student s left join course c on s.courseID = c. CourseID

update student  set StudentName = CourseName from student left join Course on student.CourseId = Course.CourseID


update  s  set StudentName = CourseName from student s left join Course c on s.CourseId = C.CourseID	


--============= Window functions ============
--Aggregate
--SUM, AVG, MIN, MAX, COUNT
select * from student

select AVG(StudentHeight) from student
select Count(studentage) from student
select Sum(studentage) from student
select StudentName, AVG(studentAge)
from student
group by StudentName

-------Ranking

select *
, RANK () Over (partition by Course order by StudentAge) as AgeRank
from student

select *
, ROW_NUMBER () Over (partition by course order by StudentAge) as AgeRank
from student
select *
,DENSE_RANK () Over (partition by course order by StudentAge) as AgeRank
from student


--DATEPART(datepart,date):  Return single part of date/Time
SELECT *,
DATEPART(yyyy,DateOfBirth) AS BirthYear,
DATEPART(mm,DateOfBirth) AS BirthMonth,
DATEPART(dd,DateOfBirth) AS BirthDay,
DATEPART(weekday,DateOfBirth) AS BirthWD
FROM student

--DATEADD(datepart,number,date): add or subtract specified time from date
SELECT *,
DATEADD(month,13,DateOfBirth) AS BirthDate,
DATEADD(day,15,DateOfBirth) AS BirthDate1,
DATEADD(year,2,DateOfBirth) AS BirthDate2,
DATEADD(year,-1,DateOfBirth) AS BirthDate3
FROM student
--========== Datetime functions ==========
select * from student

alter table student
add DateOfBirth datetime

update student set DateOfBirth = '1997-07-13' where StudentInt=1
update student set DateOfBirth = '1991-10-26' where StudentInt=2
update student set DateOfBirth = '1993-08-15' where StudentInt=3
update student set DateOfBirth = '1999-03-21' where StudentInt=4   


--GETDATE():
SELECT GETDATE()   ----Shows Current Date and Time
--DATEDIFF(datepart,startdate,enddate):
SELECT *,
DATEDIFF(year,DateOfBirth, getdate()) AS AgeYear,
DATEDIFF(month,DateOfBirth, getdate()) AS AgeMonth,
DATEDIFF(day,DateOfBirth, getdate()) AS AgeDay
--,DATEDIFF(month, Dateofbirth, GETDATE()) /3 As AgeQT   
FROM student

SELECT *,
DATEDIFF(year,DateOfBirth, getdate()) AS AgeYear,
DATEDIFF(month,DateOfBirth, getdate())%12 AS AgeMonth,
DATEDIFF(day,DateOfBirth, getdate())%30 AS AgeDay
--,DATEDIFF(month, Dateofbirth, GETDATE()) /3 As AgeQT Returns time between 2 dates
FROM student
--DATEFROMPARTS(year,month,day):
select DATEFROMPARTS(2015,12,25)

--CONVERT(data_type(length),expression,style):
SELECT *,CONVERT(date,DateOfBirth) AS dt
FROM student

select convert(date, getdate(),111)

--FORMAT(date,format string)
SELECT *,FORMAT(DateOfBirth,'MMMM-yy') AS dt
FROM student

------Execution Order

select Top 1
PositionId	, COUNT(*) as cnt from Player where PlayerID<=10
group by PositionID having cnt >= 2 order by cnt


select Top 1
PositionId	, COUNT(*) as cnt from Player where PlayerID<=10
group by PositionID having cnt >= 2 order by cnt desc

select Top 1
PositionId, Count(*) as cnt from Player where PlayerID<=10 
group by PositionID having COUNT(*) >=2
order by cnt

/* 
From 
On
Join 
Where
Group By
Having
Select
Distinct
Order By
Top
*/
-----Case When
select * from student


-----
select*, 
case when StudentAge < 24 and studentName like 'M%'then 'A'
  when StudentAge < 25 then 'B'
  else 'C '
end as ABC from student

  --===================== IF ELSE =================
declare @flag int = 2

IF @flag = 1
  begin
	select 'Condition satisfied'
  end
ELSE
  begin
	select 'Condition not satisfied'
  end

--=================== WHILE LOOP ================
--To perform a task until a given condition is true

declare @count int = 2
while @count <= 200
	begin
	 select @count
	 set @count = @count*2
	end


declare @id int = 1
while @id <= 3
	begin
	 select * from student where studentId = @id
	 set @id = @id + 1
	end

create table ##table1( ID int )
create table ##table2( ID int )

insert into ##table1 values(1),(2),(1),(0),(null),(null)
insert into ##table2 values(2),(1),(0),(null),(2)

select * from ##table1
select * from ##table2
select * from ##table1 join ##table2 on ##table1.ID = ##table2.ID
select * from ##table1 left join ##table2 on ##table1.ID = ##table2.ID
select * from ##table1 right join ##table2 on ##table1.ID = ##table2.ID
select * from ##table1 full outer join ##table2 on ##table1.ID = ##table2.ID
select * from ##table1 cross join ##table2 
select * from ##table2 cross join ##table1

----Delete Duplicate using CTE
create table ##temp
(
Id int,
Name varchar (20)
)

insert into ##temp
values (1,'Vishal'),(2,'Rohit'),(2,'Rohit'),(2,'Rohit'),(3,'Manjari')

select * from ##temp order by 1	
; with cte as ( select	*,  Row_Number () over (partition by id order by id)rn from ##temp)

delete from cte where rn <> 1

create table Teacher (Id int  , Name Varchar (30), Subject varchar(30),  Age Int , Designation varchar (40))

insert into Teacher values (1, 'Alok', 'Visual Tech',42, 'Professor')
insert into Teacher values (2, 'Ajit', 'RDBMS',46, 'Senior Professor')
insert into Teacher values (3, 'Komal', 'Management',38, 'Professor')
insert into Teacher values (4, 'Kirti', 'Java',42, 'Madam')
insert into Teacher values (5, 'Rahul', 'Projects',42, 'Junior Professor')
insert into Teacher values (6, 'Manish', 'Data Structure',52, 'HOD')

Select * from Teacher
Select * from student
Select * from Teacher T left join student s on StudentInt = T.Id 
Select * from Teacher T right join student s on StudentInt = T.Id 
Select * from Teacher T right join student s on s.StudentName = T.Name

Select * from Teacher

Select * from student

alter table Teacher add Height int 
update Teacher set Height = 168
where Name = 'Manish'
update Teacher set Height = 156
where ID = 3
update Teacher set Height = 142
where Name = 'Ajit'
update Teacher set Height = 155
where Name = 'Alok'
update Teacher set Height = 170
where Name = 'Kirti'


Create procedure FD as 
Begin 
Select Name from Teacher 
End
Exec FD

Create procedure A1 as 
Begin 
Select Height from Teacher Where Height > 160 
End
Exec A1 

;with krc as (Select Name From Teacher)
select * from krc

;with Rsv as (Select StudentAge From Student  union all select Age from Teacher)
select * from Rsv

create table a (id int )
insert into a values (98,0)
select * from a
select * from b
select * from a left join b on a.id = b.id
create table b (id int )
insert into b values (98, Null)

select * from a left join b on a.id = b.id
alter table b add id2 char
insert into b values (Null,1)
insert into b values (Null,1)
insert into b values (Null,1)
select * from a full outer join b on a.id = b.id
truncate table a
alter table a add id2 char
insert into a values (Null,1)
insert into a values (Null,1)
select * from Teacher
select avg (age) from Teacher

Select name,age from Teacher where Age < (select Avg(age) from Teacher)


select Name, height from Teacher where Height  is Null
select * from Teacher where Designation Like 'M%'

With MLC as (select Age from Teacher)
select * from MLC


