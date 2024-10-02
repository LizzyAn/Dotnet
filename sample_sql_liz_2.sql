Create schema liz 
CREATE TABLE liz.tbl_lizzy (
roll_no int identity,
First_Name varchar(50) NOT NULL,
Last_Name varchar(50) NOT NULL,
City varchar(50) NOT NULL,
Email varchar(100) NOT NULL,
Phone_Number varchar(20) NOT NULL,
);
INSERT INTO liz.tbl_lizzy(First_Name,Last_Name,City,Email,Phone_Number)
VALUES ('Harini', 'Yuvakumar', 'Salem', 'harini@gmail.com','9087654321'),
('Mohsin', 'Mansur', 'Salem', 'Mohsin@gmail.com','9667754321'),
('Lizzy', 'Gnanam', 'Salem', 'lizzy@gmail.com','9123154321'),
('Jino', 'jino', 'Salem', 'jino@gmail.com','9090876512');

select* from liz.tbl_lizzy;

CREATE TABLE liz.tbl_lizzy_emppfm (
staff_code int primary key identity,
Attitude varchar(50) NOT NULL,
Punctuality varchar(50) NOT NULL,
Coding_skill varchar(50) NOT NULL,
Email varchar(100) NOT NULL,
Phone_Number varchar(20) NOT NULL,
);

INSERT INTO liz.tbl_lizzy_emppfm(Attitude,Punctuality,Coding_Skill,Email,Phone_Number)
VALUES ('GOOD', 'ON_TIME', 'MODERATE', 'harini@gmail.com','9087654321'),
('GOOD', 'ON_TIME', 'MODERATE', 'Mohsin@gmail.com','9667754321'),
('GOOD', 'LITTLE LATE', 'SUPER', 'lizzy@gmail.com','9123154321'),
('VERY GOOD', 'ON TIME', 'SUPER', 'jino@gmail.com','9090876512');

select* from liz.tbl_lizzy_emppfm;


CREATE TABLE liz.tbl_lizzy_grading (
staff_code int primary key identity,
Monthly_pfm varchar(50) NOT NULL,
weekly_pfm varchar(50) NOT NULL,
Daily_pfm varchar(50) NOT NULL,
Email varchar(100) NOT NULL,
Phone_Number varchar(20) NOT NULL,
);

INSERT INTO liz.tbl_lizzy_grading(Monthly_pfm,weekly_pfm,Daily_pfm,Email,Phone_Number)
VALUES ('GOOD', 'GOOD', 'MODERATE', 'harini@gmail.com','9087654321'),
('GOOD', 'GOOD', 'MODERATE', 'Mohsin@gmail.com','9667754321'),
('GOOD', 'GOOD', 'SUPER', 'lizzy@gmail.com','9123154321'),
('VERY GOOD', 'GOOD', 'SUPER', 'jino@gmail.com','9090876512');

select* from liz.tbl_lizzy_emppfm;

SELECT *
FROM liz.tbl_lizzy_grading
RIGHT JOIN  liz.tbl_lizzy_emppfm 
on (liz.tbl_lizzy_grading.staff_code = liz.tbl_lizzy_emppfm.staff_code)




CREATE VIEW liz.[vw_PerformanceTable] AS
SELECT Monthly_pfm,weekly_pfm
FROM liz.tbl_lizzy_grading
WHERE Monthly_pfm = 'VERY GOOD';


select * from liz.vw_PerformanceTable 



Create Table liz.tbl_lizzy_str(
order_id varchar(50),
prd_id varchar(50),
date_of_purchase date,
profit varchar(10)
)
select * from liz.tbl_lizzy_str

INSERT INTO liz.tbl_lizzy_str(order_id,prd_id,date_of_purchase,profit)
VALUES
('10','1020','09-09-2023','1500'),
('20','1030','08-05-2023','1500'),
('30','1040','02-07-2023','1900'),
('40','1050','05-06-2023','1300'),
('50','1060','08-03-2023','2000')

select * from liz.tbl_lizzy_str
where order_id IN (SELECT order_id FROM liz.tbl_lizzy_str WHERE profit >= 1500);

SELECT order_id,prd_id,profit
FROM liz.tbl_lizzy_str
WHERE
    prd_id IN (
        SELECT
            prd_id
        FROM
		    liz.tbl_lizzy_str
        WHERE
		profit>1000       
    )
ORDER BY
    profit desc;



create table liz.tbl_liz_demo(
s_no int primary key identity,
no_of_sub int,
marks int,
per_rat int,
tot int)

insert into liz.tbl_liz_demo (no_of_sub,marks ,per_rat ,tot )
values
('5','80','80','160'),
('2','50','90','140'),
('1','90','70','160'),
('6','75','90','165'),
('9','80','60','140')

select s_no , tot from liz.tbl_liz_demo 
where tot >160


SELECT count(per_rat), tot
FROM liz.tbl_liz_demo
where tot in  (Select top 2 tot from  liz.tbl_liz_demo group by tot order by 1 desc)
GROUP BY tot
ORDER BY COUNT(per_rat) DESC;

select* from liz.tbl_liz_demo


--- alter ,rename operations   ---for renaming operation dont rename with schema name 
create table liz.tbl_alt_rename(
	s_no int primary key identity,
	no_of_sub int,
	marks int,
	tot int)

insert into liz.tbl_alt_rename(no_of_sub,marks,tot)
values
('5','80','160'),
('2','50','140'),
('1','90','160'),
('6','75','165'),
('9','80','140')


--- truncate table liz.tbl_alt_rename


select* from liz.tbl_alt_rename

sp_rename 'liz.tbl_alter_rename','tbl_altered'---not able to rename coz this table (liz.tbl_alter_rename)is not present in db error occurs ,.so not able to drop too

--- add clm
ALTER TABLE liz.tbl_alt_rename
ADD grd_tot int;

---drop clm
ALTER TABLE liz.tbl_alt_rename
Drop COLUMN grd_tot;

select* from liz.tbl_adosample

  
 



 


