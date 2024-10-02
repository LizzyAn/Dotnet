create table liz.tbl_pt(
pt_no int primary key,
pt_name varchar(100),
pt_age int,
pt_loc varchar(80),
pt_dis varchar(100) not null,
pt_dislvl int,
dis_no int foreign key references liz.tbl_dis(dis_no)
)

create table liz.tbl_dis(
dis_no int primary key ,
dis_name varchar(50),
dis_satlvl varchar (50)
)

create table liz.tbl_fd(
fd_no int primary key,
fd_name varchar(100),
fd_quan varchar(30),
dis_no int foreign key references liz.tbl_dis(dis_no)
)

--drop table  liz.tbl_fd

--drop table  liz.tbl_pt

--drop table  liz.tbl_dis

-- drop table liz.#T_tbl1

select * from liz.tbl_fd
select * from liz.tbl_dis
select * from liz.tbl_pt
select * from  liz.#T_tbl1

insert into liz.tbl_pt values
(101,'Anitha',27,'Bangalore','Fibroid',30,1),
(102,'Kangana',35,'Bombay','Asthma',40,2),
(103,'Pavithra',30,'Trichy','Sore throat',20,3),
(104,'Raviraj',42,'Chennai','Constipation',45,4),
(105,'Arunkumar',30,'Pondicherry','Anaemia',60,5),
(106,'Gowtham',38,'Salem','Indigestion',40,6),
(107,'lovisha',50,'Hyderabad','Insomnia',55,7),
(108,'Karthika',43,'Theni','Tooth ache',35,8),
(109,'Jeyaram',65,'Karur','Ortho',50,9),
(110,'Kokila',25,'Madurai','PCOD',40,10),
(111,'Ida',34,'Singapore','Fibroid',30,1),
(112,'Oviya',34,'Lalgudi','Asthma',40,2),
(113,'Jenushan',29,'Tiruppur','Sore throat',20,3),
(114,'Victoria',50,'Hosur','Constipation',45,4),
(115,'Kevin',30,'karaikudi','Anaemia',60,5),
(116,'Vinusha',23,'Bombay','Indigestion',40,6),
(117,'Vani',30,'Attur','Insomnia',55,7),
(118,'Roja',60,'Hyderabad','Tooth ache',35,8),
(119,'Rahul',44,'Kanyakumari','Ortho',50,9),
(120,'Kamal',65,'Theni','PCOD',40,10)

insert into liz.tbl_dis values
(1,'Fibroid',60),
(2,'Asthma',80),
(3,'Sorethroat',40),
(4,'Constipation',90),
(5,'Anaemia',120),
(6,'Indigestion',80),
(7,'Insomnia',110),
(8,'Tooth ache',70),
(9,'Ortho',100),
(10,'PCOD',80)

insert into liz.tbl_fd values
(1,'Ragi dosa','2',1),
(2,'Idly','3',2),
(3,'Milk and Bread','4',3),
(4,'Banana','3',4),
(5,'Dates','10',5),
(6,'Fibre food','200g',6),
(7,'Pongal','500g',7),
(8,'Juice','500ml',8),
(9,'Mutton Bones','500g',9),
(10,'pomegranate','700gm',10)

---simple condition 
select pt_no ,pt_name ,pt_age ,pt_loc 
from liz.tbl_pt
where pt_dislvl >50

----3 joins
select *
FROM liz.tbl_pt
left JOIN liz.tbl_dis
ON liz.tbl_pt.dis_no=liz.tbl_dis.dis_no
right JOIN liz.tbl_fd
ON liz.tbl_dis.dis_no=liz.tbl_fd.dis_no
where tbl_dis.dis_no=5


-- creating temp table
SELECT liz.tbl_pt. pt_no ,
liz.tbl_pt .pt_name ,
liz.tbl_fd.dis_no  ,
liz.tbl_dis.dis_name ,
liz.tbl_fd.fd_no ,
liz.tbl_fd.fd_name ,
liz.tbl_fd.fd_quan
INTO liz.#T_tbl1
FROM liz.tbl_pt
left JOIN liz.tbl_dis
ON liz.tbl_pt.dis_no=liz.tbl_dis.dis_no
right JOIN liz.tbl_fd
ON liz.tbl_dis.dis_no=liz.tbl_fd.dis_no
where liz.tbl_dis.dis_satlvl>30

---- main tbl join with temp table 
select *
FROM liz.tbl_pt
left JOIN liz.#T_tbl1
ON liz.tbl_pt.dis_no = liz.#T_tbl1.dis_no


---  joining four tables 
SELECT liz.#T_tbl1.pt_no ,
liz.#T_tbl1.pt_name ,
liz.#T_tbl1.dis_no  ,
liz.tbl_dis.dis_name ,
liz.#T_tbl1.fd_no ,
liz.#T_tbl1.fd_name ,
liz.#T_tbl1.fd_quan
FROM liz.tbl_pt---tbl1
left JOIN liz.tbl_dis---tbl2
ON liz.tbl_pt.dis_no=liz.tbl_dis.dis_no

right JOIN liz.tbl_fd---tbl3
ON liz.tbl_dis.dis_no=liz.tbl_fd.dis_no

right JOIN liz.#T_tbl1--tbl4
ON liz.#T_tbl1.dis_no=liz.tbl_fd.dis_no

 --drop table liz.tbl_win


create table liz.tbl_win
(st_id int,
st_name varchar(10),
eng int ,
tam int,
math int,
sci int,
soc int)
insert into liz.tbl_win values (1,'jef',8,9,7,8,9)
insert into liz.tbl_win values (2,'jino',9,9,7,8,7)
insert into liz.tbl_win values (3,'lilly',9,9,9,8,9)
insert into liz.tbl_win values (4,'elsa',8,9,9,8,9)
insert into liz.tbl_win values (5,'kim ',8,9,7,8,8)
select * from liz.tbl_win

select (eng+tam+math+sci+soc) as tot from liz.tbl_win  --- row wise sum
--where st_id =1
group by st_id 
order by st_id 



---offset sample 

create table liz.tbl_offset(id int,
mem_name varchar(20),
mem_role varchar(20),
mem_salary int,
mem_branch int)
insert into liz.tbl_offset values
(1,'Harini','IT Intern',12000,101),
(2,'Lizzy','Software Developer',25000,102),
(3,'Mohsin','Admin',22000,103),
(4,'Indira','Admin',23000,104),
(5,'Oviya','Software Developer',26000,102),
(6,'Shervin','IT Intern',12000,103)

select * from liz.tbl_offset

SELECT mem_name, mem_role
FROM liz.tbl_offset
ORDER BY mem_salary
--OFFSET 1 ROWS;

SELECT mem_name, mem_role
FROM liz.tbl_offset
ORDER BY mem_salary desc
OFFSET 1 ROWS; --- removes one row 

SELECT mem_name, mem_role
FROM liz.tbl_offset
ORDER BY mem_salary 
OFFSET 2 ROWS ---removes two rows 
FETCH NEXT 2 ROWS ONLY -- gives the next number of rows



---- windows functions like row_number ,lead,lag,rank,dense rank
create table liz.tbl_mem(staff_id int,staff_name varchar(20),staff_role varchar(20),staff_salary int,staff_branch int)
insert into liz.tbl_mem values
(1,'Harini','IT Intern',12000,101),
(2,'Lizzy','Software Developer',25000,102),
(3,'Mohsin','Admin',22000,103),
(4,'Indira','Admin',23000,104),
(5,'Oviya','Software Developer',26000,102),
(6,'Shervin','IT Intern',12000,103),
(7,'Jeni','S.SoftDeve',40000, 101),
(8,'Ken','Senior Admin',35000,104),
(9,'Lilly','SSoftDeve',50000,102),
(10,'Jeff','Senior Admin',35000,104)
select * from liz.tbl_mem
 --drop table liz.tbl_mem
 

SELECT *,
ROW_NUMBER()   OVER (ORDER BY staff_id) AS row_num
FROM liz.tbl_mem



SELECT *, ROW_NUMBER()   
OVER (ORDER BY staff_salary) AS row_num
FROM liz.tbl_mem  
WHERE staff_salary >15000 AND staff_salary <= 50000



SELECT staff_id, staff_salary,
RANK() OVER (PARTITION BY staff_role ORDER BY staff_id desc ) AS rank
FROM liz.tbl_mem
WHERE staff_salary>30000


SELECT staff_id, staff_salary,
DENSE_RANK() OVER (PARTITION BY staff_role ORDER BY staff_id desc ) AS Denserank
FROM liz.tbl_mem
WHERE staff_salary>30000


SELECT
[staff_id],
  LAG([staff_id]) OVER(ORDER BY[staff_id]) AS[Lag "staff_id"
    Column]
FROM liz.tbl_mem
ORDER BY[staff_id] 

SELECT
[staff_id],
  LEAD([staff_id]) OVER(ORDER BY[staff_id]) AS[Lead "staff_id"
    Column]
FROM liz.tbl_mem
ORDER BY[staff_id] 

---loginform adoasp
drop Table liz.loginform
drop procedure liz.sp_login_validation

--Create Table liz.loginform(Username varchar(50),Password varchar(50)) --- this table is to validate used for login page 
--insert into liz.loginform values ('Harini','9087654321')
--insert into liz.loginform values ('Lizzy','9087654321')
--insert into liz.loginform values ('Jino','9087654321')
--select * from liz.loginform


create procedure liz.sp_login_validation(@first_name varchar(50),@ph_no varchar(50))
as
begin
if exists (select top 1 * from liz.tbl_regform where first_name = @first_name)   
	if exists(select top 1 * from liz.tbl_regform where first_name = @first_name and ph_no = @ph_no)
	select 1
	else
	select -1
else
select 0
end

drop table liz.tbl_regform

create table liz.tbl_regform
(
first_name varchar(15) primary key ,
last_name varchar(15),
email_id varchar(20),
ph_no bigint not null,
gender varchar(6) check(gender='Male' OR gender='Female' ),
date  varchar(20),
College varchar(15),
Department varchar(15),
dob date,
Domain varchar(20)
);
 ----ALTER TABLE liz.tbl_regform ADD CONSTRAINT pk_first_name PRIMARY KEY (first_name)
create proc liz.sp_regform
(
@first_name varchar(15),
@last_name varchar(15),
@email_id varchar(20),
@ph_no bigint,
@gender varchar(6),
@date varchar(20) ,
@College varchar(15),
@Department varchar(15),
@dob date,
@Domain varchar(20)
)
as
begin
Insert into liz.tbl_regform values (@first_name, @last_name,@email_id,@ph_no,@gender,@date,@College,@Department,@dob ,@Domain)
end

drop proc liz.sp_regform
select* from  liz.tbl_regform
truncate table  liz.tbl_regform


drop table liz.journal

CREATE TABLE liz.journal(
	journal_id int IDENTITY(1,1) NOT NULL, 
	journal_genre varchar (50),
	journal_topic varchar(50) ,
	journal_author varchar(50),
	Contact varchar(50) ,
	Email varchar(50),
	)

	select * from  liz.journal


	-------------------sample master project --------------------------------------------

	drop table liz.tblStatemgmtloginworker ------tblworker
	create table liz.tblStatemgmtloginworker(id int primary key identity,Name varchar (20),
	ph_no bigint,aadhaar varchar(20),Work  varchar(20) ,Experience  varchar(9) ,City  varchar(10),State  varchar(10) ,photo   varchar(50),active_status int ,admin int default '0')
	select * from liz.tblStatemgmtloginworker

	
	
	-- delete from liz.tblStatemgmtloginworker where id=24
	



	--UPDATE liz.tblStatemgmtloginworker
    --SET City = 'Vizag'
    --WHERE id = 1;  

	--ALTER TABLE liz.tblStatemgmtloginworker
    --ALTER COLUMN active_status bit;


	----sample master  -----------tblcustomer
	drop table liz.tblStatemgmtlogincustomer
	create table liz.tblStatemgmtlogincustomer(id int primary key identity,Name varchar (20),
	ph_no bigint,Work   varchar(20) ,City  varchar(10),State  varchar(10),salary varchar(20),workMode varchar(20))
	select * from liz.tblStatemgmtlogincustomer

	--delete from liz.tblStatemgmtlogincustomer where id=3 

	


	--drop table liz.tblsubcriptionworker  -----dummy  for subscription 
	-- create table liz.tblsubcriptionworker (id int identity, subscription bit default '0' )
	-- select * from liz.tblsubcriptionworker




---admin sp
create procedure liz.sp_Statemgmtloginworkeradminapprove
AS
BEGIN
SELECT * from  liz.tblStatemgmtloginworker  
END



-----sp to select the workers in admin page for populate method
create procedure liz.sp_Statemgmtloginworkeradminpopulate
AS
BEGIN
SELECT * FROM liz.tblStatemgmtloginworker  
END




---sp to show in workers available 
	drop procedure liz.sp_Statemgmtloginworker 

create procedure liz.sp_Statemgmtloginworker 
AS
BEGIN
SELECT * from  liz.tblStatemgmtloginworker  where admin=1 and active_status =1
END


---sp to show in jobs available 
create procedure liz.sp_Statemgmtlogincustomer 
AS
BEGIN
SELECT * from  liz.tblStatemgmtlogincustomer  
END


---sp for login as worker
drop procedure liz.sp_Statemgmtloginworkerlogincheck 

create procedure liz.sp_Statemgmtloginworkerlogincheck 
(@Name varchar (20),
@ph_no bigint)
AS
BEGIN
select id,Name,ph_no from liz.tblStatemgmtloginworker where Name=@Name and ph_no=@ph_no
END



---sp for login as customer
create procedure liz.sp_Statemgmtlogincustomerlogincheck 
(@Name varchar (20),
@ph_no bigint)
AS
BEGIN
select id,Name,ph_no from liz.tblStatemgmtlogincustomer where Name=@Name and ph_no=@ph_no
END



drop procedure liz.sp_Statemgmtloginworkerinsert 

sp_helptext [liz.sp_Statemgmtloginworkerinsert]


---sp for  worker registration (inserting values into worker table) 
create procedure liz.sp_Statemgmtloginworkerinsert 
(
@Name varchar (20),@ph_no bigint,@aadhaar varchar(20),@Work  varchar(20) ,@Experience  varchar(9) ,@City  varchar(10),@State  varchar(10) ,@photo   varchar(50)
)
AS
BEGIN
  insert into liz.tblStatemgmtloginworker(Name,ph_no,aadhaar,Work,Experience,City,State,photo) values(@Name,@ph_no,@aadhaar,@Work ,@Experience ,@City ,@State ,@photo)
END


---sp for  customer  registration (inserting values into customer table)
create procedure liz.sp_Statemgmtlogincustomerinsert 
(
@Name varchar (20),@ph_no bigint,@Work   varchar(20) ,@City  varchar(10),@State  varchar(10),@salary varchar(20),@workMode varchar(20))
AS
BEGIN
  insert into liz.tblStatemgmtlogincustomer(Name,ph_no,Work,City ,State ,salary,workMode ) values( @Name,@ph_no,@Work ,@City ,@State,@salary,@workMode)
END



---FOR Review and Feedback worker
drop table liz.reviewforworker
create table liz.reviewforworker (id varchar(15),workDone varchar(20), workreview varchar(20))
select * from liz.reviewforworker



---delete from liz.reviewforworker where id=6

--sp inserting into  Review and Feedback worker
drop procedure liz.sp_reviewforworker
create procedure liz.sp_reviewforworker(
@id varchar (15),
@workDone varchar(20),
@workreview   varchar(20))
AS     
BEGIN
  insert into liz.reviewforworker(id,workDone ,workreview) values(@id,@workDone,@workreview)
END


--view for review 
CREATE VIEW liz.vw_workers
as
select liz.reviewforworker.id ,workDone,workreview   FROM liz.reviewforworker
JOIN liz.tblStatemgmtloginworker
ON liz.tblStatemgmtloginworker.id= liz.reviewforworker.id
SELECT * FROM liz.vw_workers




----FOR Review and Feedback company
create table liz.reviewforcompany ( review varchar(50))
select * from liz.reviewforcompany

--sp inserting into  Review and Feedback company
drop procedure liz.sp_reviewforcompany
create procedure liz.sp_reviewforcompany(
@review varchar(50)) 
AS
BEGIN
  insert into liz.reviewforcompany(review) values(@review)
END





--- sp to set admin as 1  in workers table in admin page 
--drop procedure liz.sp_adminpermit   ----dummy sp dropped
--create procedure liz.sp_adminpermit(@value bit,@id int)
--AS
--BEGIN
--UPDATE liz.tblStatemgmtloginworker SET admin = @value WHERE id = @id
--END



--- sp to set admin as 0  in workers table in admin page 
--drop procedure liz.sp_admindontpermit      ----dummy sp dropped
--create procedure liz.sp_admindontpermit(@value bit,@id int)
--AS
--BEGIN
--UPDATE liz.tblStatemgmtloginworker SET admin = @value WHERE id = @id
--END


	--drop table liz.Workers  --dummy for popup sample practise ,this table is dropped
	--select * from  liz.Workers
	--create table liz.Workers(w_id int primary key identity,w_name varchar(20) ,w_phno bigint ,w_occupation varchar(20),w_pic nvarchar(50))
    
	
	
	--Insert into liz.Workers values('Paul',9087654321,'Lawyer', 'person_pic\person1.jpg'),
	--('Reno',9087654321,'Coach', 'person_pic\person2.jpg'),
	--('Shervin',9087654321,'Teacher', 'person_pic\person3.jpg'),
	--('Roman',9087654321,'Lawyer', 'person_pic\person1.jpg'),
	--('Antony',9087654321,'Software Developer', 'person_pic\person2.jpg'),
	--('Mark',9087654321,'Event Organizer', 'person_pic\person3.jpg'),
	--('Tae',9087654321,'Teacher', 'person_pic\person2.jpg'),
	--('Kim',9087654321,'UI/UX Designer', 'person_pic\person1.jpg'),
	--('Mathew',9087654321,'UI/UX Designer', 'person_pic\person1.jpg'),
	--('Mark',9087654321,'UI/UX Designer', 'person_pic\person1.jpg'),
	--('Sundar',9087654321,'UI/UX Designer', 'person_pic\person1.jpg'),
	--('Shankar',9087654321,'UI/UX Designer', 'person_pic\person1.jpg'),
	--('Prakash',9087654321,'UI/UX Designer', 'person_pic\person1.jpg')



	--- Cursors 1
	create table liz.SalesData(id int,Value int , RunningTotal int )
	Insert into liz.SalesData values(1,10,10),(2,20,10),(3,30,80),(4,40,20)

	declare  @id int
	declare  @value int
	declare  @RunningTotal int = 0

	declare runningtotalcursor cursor for 
	select  id , value  from liz.SalesData
	order by id
	open  runningtotalcursor 
	fetch next from  runningtotalcursor into @id,@value
	while @@fetch_status=0    
	begin 
		 set @RunningTotal =@RunningTotal + @value
		 update liz.SalesData SET RunningTotal  = @RunningTotal  where id = @id
		 fetch next from  runningtotalcursor into @id,@value
	end
	close runningtotalcursor
	deallocate runningtotalcursor

	select* from  liz.SalesData


	---Triggeres
	CREATE TABLE liz.employee_triggers(emp_id int ,fname varchar(20),lname varchar(2),salary int,manager_id varchar(20),dept_id int) 
	 insert into liz.employee_triggers values
		(101,'LILLY','R',50000,12,92),
		(102,'PRAKASH','G',45000,13,90),
		(103,'JEFFRIN','G',50000,15,94),
		(104,'HARI','P',45000,12,90),
		(105,'JAYA','T',35000,13,94),
		(106,'JINO','O',85000,15,90), 
		(107,'MOHSIN','P',50000,12,92), 
		(108,'MOHANA','E',75000,13,90),
		(109,'RENO','U',80000,15,91),
		(110,'ROMAN','J',80000,12,91)
		SELECT * FROM liz.employee_triggers       
		

		CREATE TABLE liz.employee_triggers_audit(employee_id int,operation varchar(10),
		UpdatedDate DateTime)


		SELECT * FROM liz.employee_triggers_audit

		ALTER trigger  liz.trggemployee_triggers_audit
		on liz.employee_triggers
		after insert ,Delete 
		as
		begin
		insert into  liz.employee_triggers_audit
		select emp_id,'INS',GETDATE()
		FROM inserted 

		UNION ALL 

		SELECT emp_id,'DEL',GETDATE()
		FROM DELETED
		END

        insert into liz.employee_triggers values
		(111,'Mary','G',100000,13,92)
		DELETE from liz.employee_triggers where emp_id=102


		select * into liz.employee_triggers_copy FROM liz.employee_triggers
		ALTER TABLE liz.employee_triggers_copy ADD active  bit
		ALTER TABLE liz.employee_triggers_copy ADD Enddate  datetime

		select * from liz.employee_triggers_copy

		delete from liz.employee_triggers_copy where emp_id = 104    

		create trigger liz.trg_emp_delete
		on  liz.employee_triggers_copy 
		instead of delete
		as
		begin
		update liz.employee_triggers_copy 
		set active= 0, Enddate=GETDATE()
		WHERE emp_id IN
		(SELECT emp_id FROM DELETED)
		END

		---indexing 
		CREATE TABLE liz.student_indexing
     (
    id INT ,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    DOB datetime NOT NULL,
    total_score INT NOT NULL,
    city VARCHAR(50) NOT NULL
 )

 INSERT INTO liz.student_indexing VALUES  
(6, 'Kate', 'Female', '03-JAN-1985', 500, 'Liverpool'), 
(2, 'Jon', 'Male', '02-FEB-1974', 545, 'Manchester'),
(9, 'Wise', 'Male', '11-NOV-1987', 499, 'Manchester'), 
(3, 'Sara', 'Female', '07-MAR-1988', 600, 'Leeds'), 
(1, 'Jolly', 'Female', '12-JUN-1989', 500, 'London'),
(4, 'Laura', 'Female', '22-DEC-1981', 400, 'Liverpool'),
(7, 'Joseph', 'Male', '09-APR-1982', 643, 'London'),  
(5, 'Alan', 'Male', '29-JUL-1993', 500, 'London'), 
(8, 'Mice', 'Male', '16-AUG-1974', 543, 'Liverpool'),
(10, 'Elis', 'Female', '28-OCT-1990', 400, 'Leeds')

SELECT * FROM  liz.student_indexing

drop table liz.student_indexing

CREATE CLUSTERED INDEX IX_tblStudent_Gender_Score
ON  liz.student_indexing(gender ASC, total_score DESC)


CREATE NONCLUSTERED INDEX IX_tblStudent_Name
ON liz.student_indexing(name ASC)


--views changes 
drop table liz.tblvwcheck
create table liz.tblvwcheck(name varchar(10),age int, work varchar(10) )
insert into liz.tblvwcheck values 
('lizzy',21,'dev'),
('lilly',23,'dev'),
('lucy',24,'dev'),
('pinky',25,'dev')

CREATE VIEW liz.[vw_check] AS
SELECT * FROM   liz.tblvwcheck


SELECT * FROM  liz.[vw_check] -- can see view 

---cursor vs while loop


 
--webapi 
drop table liz.productsapi 
create table liz.productsapi (id int identity,name varchar(20),
brand varchar(20),category varchar(20),price int,description varchar(20))

SELECT * FROM liz.productsapi


create procedure liz.sp_productsapi 
@name varchar(20),@brand varchar(20),@category varchar(20),@price int,@description  varchar(20)
AS
BEGIN
  insert into liz.productsapi(name,brand,category,price,description)values(@name,@brand,@category,@price,@description)
END
  

create procedure liz.sp_productsapipostupdate
@id int,@name varchar(20),@brand varchar(20),@category varchar(20),@price int,@description  varchar(20)
AS
BEGIN
update liz.productsapi set name=@name,brand=@brand,category=@category,price=@price,description=@description where id=@id
END
  
