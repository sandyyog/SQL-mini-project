---data base
create database ddlanguage
---1. Create department table with following columns.
create table DPRT_TABLE (Dept_id Integer Primary key, 
D_Name NVARCHAR (100) Not null, 
Contact_no  Integer Unique);
----2. Create employee table with following columns
create table EMPLOYE_TABLE (Emp_id Integer,Dept_id Integer, Emp_name NVARCHAR (100), Designation NVARCHAR (100) ,Salary Money);
---EMP_ID
--EMP_NAME
--DESIG

create table DETAIL_COMPANY(Emp_id Integer,
Name NVARCHAR (10), 
Age Integer, 
Address NVARCHAR (30),
Salary Numeric(8,2), 
Join_date Datetime);
insert into DETAIL_COMPANY values(1,'paul',32,'california',20000.00,2001-07-13),(3,'allen',23,'norway',20000.00,''),(4,'david',25,'richmond',65000.00,2010-10-25),(5,'mark',27,'texas',35000.00,2015-11-02),(2,'teddy',25,'los vegas','',2013-09-01);

--- create table department
create table DEPT_DATA (id int, dept nvarchar(20),emp_id int);
insert into DEPT_DATA values (1,'ID BILLING',1),(2,'ENGINEERING',2),(3,'FINANCE',41);

---17. Query1. Fetch following details for employee with id = 2
select*from DETAIL_COMPANY join DEPT_DATA on DEPT_DATA.Emp_id=DETAIL_COMPANY.Emp_id=2 and DEPT_DATA.Emp_id=2;
---18.Create a stored procedure to fetch following columns from Company and Dept2 table based on a given emp id.
create procedure MRK 
as begin 
select*from DETAIL_COMPANY JOIN DEPT_DATA ON DEPT_DATA.Emp_id=DETAIL_COMPANY.Emp_id
end;
exec MRK;

---19.Create a view to fetch the details of employee with following columns
create view km
as
select DETAIL_COMPANY.Emp_id,DETAIL_COMPANY.Name,DETAIL_COMPANY,Age,DETAIL_COMPANY.Salary,DEPT_DATA.Dept.DETAIL_COMPANY.ID
from DETAIL_COMPANY
FULL OUTER JOIN DEPT_DATA ON DEPT_DATA=DETAIL_COMPANY.Emp_id
GO;