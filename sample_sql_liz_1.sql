Create schema liz 


 Create Table liz.tblliz_bank(
 cust_id int  primary key  not null,
 acc_no int unique not null,
 ifsc int unique not null,
 cust_name varchar (10),
 acc_type varchar(10),
 acc_bal int,
 branch varchar(10)
 )


 insert into liz.tblliz_bank (cust_id ,acc_no, ifsc ,cust_name ,acc_type,acc_bal, branch ) 
 values 
 (01,1001,11,'Lilly','savings',50000,'Salem'),
 (02,1002,12,'Lizzy','savings',25000,'Chennai'),
 (03,1003,13,'Jeff','Current',75000,'Cbe'),
 (04,1004,14,'prakash','Current',80000,'Venice'),
 (05,1005,15,'Jino','savings',90000,'Swiz'),
 (06,1006,16,'Mohsin','savings',68000,'Hosur'),
 (07,1007,17,'Mohana','Current',50000,'America'),
 (08,1008,18,'Moana','Current',50000,'Cbe'),
 (09,1009,19,'Emma','savings',12000,'Salem'),
 (10,1010,20,'Chopra','savings',78000,'Chennai')

select * FROM   liz.tblliz_bank
select * from sys.schemas
select * from information_schema.tables where table_type = 'VIEW'


SELECT cust_name  FROM liz.tblliz_bank
where acc_type='savings' and acc_bal >25000

select count(cust_name),acc_type,acc_bal
from liz.tblliz_bank
group by cust_name,acc_type,acc_bal having acc_bal > 25000 

select count(cust_id),acc_type
from liz.tblliz_bank
where  branch = 'Salem'
group by acc_type
having count(cust_id)>2


---drop table liz. tbl_sca

create table  liz.tbl_sca(ID int Identity primary key ,StudentID INT foreign key references tbl_StudentInfo_Vijay ,
Term int, math_score int,history_score int, physics_score int, chemistry_score int, biology_score int,
english_score int, geography_score int, updatedOn date)


insert into liz.tbl_sca 
select StudentID  ,Term , math_score,history_score , physics_score , chemistry_score , biology_score ,
english_score , geography_score , updatedOn from tbl_Student_Marks_Vijay



----  copied data  from tbl_Student_Marks_Vijay to liz.tbl_sca 
select * from liz.tbl_sca 
select * from tbl_Student_Marks_Vijay

----- the  stud id in liz.tbl_sca  is refering to  tbl_StudentInfo_Vijay  ----- as the old table tbl_Student_Marks_Vijay was refering to tbl_StudentInfo_Vijay  (REFERENCES ITTesting.dbo.tbl_StudentInfo_Vijay (id))

select* from tbl_StudentInfo_Vijay                         --- not in liz schema
select* from tbl_Student_Career_Aspiration_Vijay           --- not in liz schema



--inner join 
select A.id,A.StudentID,B.id from liz.tbl_sca  A 
inner join  tbl_StudentInfo_Vijay B
ON A.ID =B.id

---case when then 
select id , math_score,physics_score,
CASE WHEN  math_score >90 and physics_score >90 then 'Good Score'
when math_score <90  and physics_score <90 then 'Score  Good '
else 'Study  Well'
END AS Study_Score 
FROM liz.tbl_sca 

--row number 
select  id, Term, math_score,
row_number() over ( order by math_score desc   )as row_number
from liz.tbl_sca


----- sample  problem 1 
create table   sellers
( id int primary key,
name varchar(30) not null,
rating int not null)

insert into sellers values (1,'lilly',4)
INSERT INTO sellers(id, name, rating) VALUES(2, 'Roger', 3);
INSERT INTO sellers(id, name, rating) VALUES(3, 'Penny', 5);
INSERT INTO sellers(id, name, rating) VALUES(4, 'eanny', 2);
INSERT INTO sellers(id, name, rating) VALUES(5, 'winny', 8);
INSERT INTO sellers(id, name, rating) VALUES(6, 'kenny', 9);
INSERT INTO sellers(id, name, rating) VALUES(7, 'lucy', 2);

create table  items
( id int primary key,
name varchar(30) not null,
 sellerId int 
 foreign key  (sellerId) References sellers(id)
 )

INSERT INTO items(id, name, sellerId) VALUES(1, 'Notebook', 1);
INSERT INTO items(id, name, sellerId) VALUES(2, 'Stapler', 2);
INSERT INTO items(id, name, sellerId) VALUES(3, 'rubber', 3);
INSERT INTO items(id, name, sellerId) VALUES(4, 'pen', 4);
INSERT INTO items(id, name, sellerId) VALUES(5, 'pin', 5);
INSERT INTO items(id, name, sellerId) VALUES(6, 'label', 6);
INSERT INTO items(id, name, sellerId) VALUES(7, 'ink', 7);

--
select * from sellers
select * from items
 
 select items. name , sellers. name 
 from sellers inner join items 
 on   sellers.id =items.sellerId
 where rating >4

  ----- sample problem 2 

 create  table liz. salesman ( 
 salesman_id int,
 name varchar (50),
 city varchar(50),
 commision float
 )

insert into liz.salesman values (5001,'James Hoog','New York',0.15)
insert into liz.salesman values (5002,'Naile Knite','Paris',0.13)
insert into liz.salesman values (5005,'Pit Alex','London',0.11)
insert into liz.salesman values (5006,'Mc Lyon','Paris',0.14)
insert into liz.salesman values (5003,'Lauson Hen','Null',0.12)
insert into liz.salesman values (5007,'Paul Adam','Rome',0.13)

 create  table liz.customer ( 
 customer_id int,
 customer_name varchar (50),
 city varchar(50),
 grade int,
 salesman_id int,
 )
insert into liz.customer values (3002,'Nick Rimando','New York',100,5001)
insert into liz.customer values (3005,' Graham','California',200,5002)
insert into liz.customer values (3001,'Brad Guzan','London',0,0)
insert into liz.customer values (3004,'Fabian Jons','Paris',300,5006)
insert into liz.customer values (3007,'Brad Davis','New York',200,5001)
insert into liz.customer values (3009,' Geoff ','Berlin',100,0)
insert into liz.customer values (3008,'Julian Green ','London',300,5002)
insert into liz.customer values (3003,'Jozy Altidor','Moncow',200,5007)

 create  table liz.orders ( 
 order_no int,
 purch_amt float,
order_date date,
 customer_id int,
 salesman_id int,
 )
insert into liz.orders values (70001,150.5,'10-05-2016',3005,5002)
insert into liz.orders values (70009,270.65,'09-10-2016',3001,0)
insert into liz.orders values (70002,65.26,'10-05-2016',3002,5001)
insert into liz.orders values (70004,110.5,'08-17-2016',3009,0)
insert into liz.orders values (70007,948.5,'09-10-2016',3005,5002)
insert into liz.orders values (70005,2400.6,'07-27-2016',3007,5001)
insert into liz.orders values (70008,5760,'09-10-2016',3002,5001)
insert into liz.orders values (70000,1983.43,'10-10-2016',3004,5006)
insert into liz.orders values (70003,2840.4,'10-10-2016',3009,0)
insert into liz.orders values (70002,250.45,'06-27-2016',3008,5002)
insert into liz.orders values (70011,75.29,'08-17-2016',3003,5007)

select * from liz. salesman
 select * from liz. customer
select * from liz. orders
 
 SELECT * FROM liz. salesman
JOIN liz. customer
  ON liz.salesman.salesman_id = liz. customer.salesman_id
JOIN liz. orders
  ON liz. customer.salesman_id = liz. orders.salesman_id 
 

  SELECT name, commision  FROM liz. salesman
JOIN liz. customer
  ON liz.salesman.salesman_id = liz. customer.salesman_id
JOIN liz. orders
  ON liz. customer.salesman_id = liz. orders.salesman_id 
 
  SELECT distinct salesman_id   FROM liz. orders

  SELECT  name , city   FROM liz.salesman
  where city ='Paris'


  select * from liz.customer 
  where grade =200
 
select order_no ,purch_amt ,order_date from liz.orders
where salesman_id =5001

  select * from  liz.customer 
  where city ='New York' OR GRADE<= 100

 SELECT salesman_id, name, city, commision 
FROM LIZ.salesman 
WHERE commision between 0.10 AND 0.12


SELECT * FROM liz.customer 
where grade =0

select sum(purch_amt)  as sum_of_purchase_amt from liz.orders

 select city ,max( grade) 
 from liz.customer
 group by(city)

 select salesman_id,max(purch_amt)
 from liz.orders 
 where order_date ='08-17-2016'
 group by  salesman_id

select customer_id ,order_date,max(purch_amt)
from liz.orders 
group by order_date,customer_id
having max(purch_amt)>2000.0

select count(order_no)    ---or count(*)
from liz.orders
where order_date ='08-17-2016'

select * from liz. salesman
select * from liz. customer
select * from liz. orders

select liz.salesman.name,  liz.customer. customer_name, liz.customer. city
from liz.customer join liz.salesman
on liz.customer.salesman_id = liz.salesman.salesman_id
where liz.customer. city = liz.salesman.city

select liz.customer.customer_name,liz.Salesman.name 
from liz.customer join liz.salesman
on liz.customer.salesman_id = liz.salesman.salesman_id
where liz.customer. salesman_id = liz.salesman.salesman_id


select liz.orders.order_no ,liz.customer.salesman_id,liz.customer.customer_name, liz.customer.customer_id
  FROM liz. salesman
  JOIN liz.customer
  ON liz.salesman.salesman_id = liz. customer.salesman_id
JOIN liz.orders
  ON liz. customer.salesman_id = liz. orders.salesman_id 
where liz.customer. city<> liz.salesman.city

------ SAMPLE VIEW CREATED BY SIR --NOT EXECUTED
CREATE VIEW vw_customer_lizzy
as 
select * from vw_customer_lizzy where name= 'Paul Adam'
-------

select order_no,purch_amt,order_date,customer_id,salesman.salesman_id,salesman.name
from liz.orders join liz.salesman
on liz.orders.salesman_id = liz.salesman.salesman_id
where liz.salesman.name= 'Paul Adam'

select * from liz.orders where purch_amt >
(select avg(purch_amt ) from liz.orders  where order_date ='10-10-2016')

select * from liz.orders
join liz.salesman
on liz.salesman.salesman_id = liz.orders.salesman_id
where liz.salesman.city  = 'Paris'


select * from sys.schemas
select * from sys.views  where schema_id=7   ----find views in schema 
select * from sys.tables  where schema_id=7 ----find tables   in schema
select * from sys.procedures  where schema_id=7 ----- find procedures  in schema 
select * from sys.procedures where name like 'sp_liz%' --- find procedurs in schema 


select * from sys.procedures where name like 'liz.sp_liz%'   --- delete  this and liz.tbl_alter_rename

exec sp_rename 'old_name ','new_name'   ---rename the sp name 
sp_helptext liz.sp_login_validation  -- to view the code

	
-------Stored procedures    


create table liz.tbl_employee(empid int not null, empname varchar(50), adid int)

create table liz.tbl_address(adid int primary key, city varchar(50))


--create a stored procedure for inserting data into employee 

create procedure liz.sp_employee_insert(@id int, @name varchar(50), @adid int)
as
begin
	insert into liz.tbl_employee values(@id,@name,@adid)
end

--executing a stored procedure

exec liz.sp_employee_insert 1,'anand',101

select * from liz.tbl_employee

-- execute using key value pairs

exec liz.sp_employee_insert @id=2,@name='kumar',@adid=102

select * from liz.tbl_employee


--create a stored procedure for inserting data into employee and to check primary key constraint to provide custom error messages

create  procedure liz.sp_employee_pk(@id int, @name varchar(50), @adid int)
as
begin

	if exists(select empid from liz.tbl_employee where empid=@id)
		begin
			raiserror('employee id already exists...',17,1)
		end
	else
		begin
			insert into liz.tbl_employee values(@id,@name,@adid)
		end
end

--executing stp

select * from liz.tbl_employee

exec liz.sp_employee_pk 3,'anand',101 -- throws error coz emp id is pk 
exec liz.sp_employee_pk 1,'anand',101 -- throws error coz emp id is pk 




GO
SET XACT_ABORT ON;
SET NOCOUNT ON;

begin try;
   begin transaction;
    print 'Tran Start';
    Raiserror('my raiserror message',11,1);   --shows error and starts running
    --Throw 50030,'my throw message',1;    ---shows error and stops running
    print 'tran end,State:' +cast(XACT_STATE() AS varchar(50));
   commit transaction ;
   print 'Tran Committed ,State:' + cast(xact_state() as varchar(50));
end try

begin catch;
   print 'catch begin,state:'+cast(xact_state() as varchar(50));

  if xact_state() =-1 begin;
    print 'The transaction is in an uncommitable state .Rolling back is transaction.'
    rollback transaction ;
    print 'error_number='+ cast(error_number() as varchar(100));
    print 'error_severity='+ cast(error_severity() as varchar(100));
    print 'error_state='+ cast(error_state() as varchar(100));
    print 'error_procedure='+ cast(error_procedure() as varchar(100));
    print 'error_line='+ cast(error_line() as varchar(100));
	print 'error_message ='+ cast(error_message() as varchar(100));
  end ;

---Test whether the transaction is active and valid 
  if xact_state() =1 begin;
     print 'the transaction is committable'+'Committing transaction';
     commit transaction;
  end;
     print 'catch-end';
end catch;

print 'code end'

CREATE TABLE liz.UserInformation(
	UserId int IDENTITY(1,1) NOT NULL,
	Name varchar(20) NOT NULL,
	Status bit NOT NULL)


INSERT INTO liz.UserInformation VALUES ('Jhon',0),('Kabir',1)
         
          
	select * from  liz.UserInformation

























 



-

				











