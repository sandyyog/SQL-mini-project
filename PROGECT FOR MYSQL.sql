---data base
create database ddlanguage
---1. Create department table with following columns.
create table DPRT_TABLE (Dept_id Integer Primary key, 
D_Name NVARCHAR (100) Not null, 
Contact_no  Integer Unique);
----2. Create employee table with following columns
create table EMPLOYE_TABLE (Emp_id Integer,Dept_id Integer, Emp_name NVARCHAR (100), Designation NVARCHAR (100) ,Salary Money);----3. ADD A NEW CLOUMN IN DEPARTMENT TABL---alter table DPRT_TABLE add City NVARCHAR(50) not null;alter table DPRT_TABLE add states nvarchar(50) not null ----4. CHANGE THE DATATYPE OF SALARY TO CHAR(10) IN EMPLOYEEalter table EMPLOYE_TABLE alter column Salary numeric;----5. DELete DEPARTMENT TABLE statesalter table DPRT_TABLE drop column states;---6. RENAME A COLUMN(D_NAME) IN DEPARTENT TABLE to (Dept_NAME)exec sp_rename'DPRT_TABLE.D_Name','Dept_Name','column'----insert the valuesalter table EMPLOYE_TABLE add Contact_no varchar(10);alter table EMPLOYE_TABLE add states varchar(20);insert into EMPLOYE_TABLE(Emp_id,Dept_id,Emp_name,Designation,Salary,Contact_no,states)values(1,100,'s ahamad','sales mgr',50000,0110,'newdelhi')insert into EMPLOYE_TABLE(Emp_id,Dept_id,Emp_name,Designation,Salary,Contact_no,states)values(2,101,'anand','senior mgr',40000,0111,'newdelhi')insert into EMPLOYE_TABLE(Emp_id,Dept_id,Emp_name,Designation,Salary,Contact_no,states)values(3,103,'aruna','accounts mgr',45000,0112,'newdelhi')insert into EMPLOYE_TABLE(Emp_id,Dept_id,Emp_name,Designation,Salary,Contact_no,states)values(4,103,'alphah','accountant',35000,0113,'bangalore')insert into EMPLOYE_TABLE(Emp_id,Dept_id,Emp_name,Designation,Salary,Contact_no,states)values(5,104,'monica','incharge',25000,0114,'noida')insert into EMPLOYE_TABLE(Emp_id,Dept_id,Emp_name,Designation,Salary,Contact_no,states)values(6,104,'harish','sales man',15000,0115,'bangalore')select* from EMPLOYE_TABLE---7. Update the Contact_No of employee who stays in ‘Bangalore’ and id = 6update EMPLOYE_TABLE set Contact_no=115 where states='bangalore' and Emp_id=6;---8. Select given selective columns from employee table.
---EMP_ID
--EMP_NAME
--DESIGselect Emp_id,Emp_name,Designation from EMPLOYE_TABLE;---9. Select all details of employee whose salary is greater than 30000select* from EMPLOYE_TABLE where Salary>30000;---10. Select details of employee whose salary is between 15000 and 30000select* from EMPLOYE_TABLE where Salary between 15000 and 30000;---11. Select * from employee who lives in ‘Bangalore’ or ‘New Delhi’select* from EMPLOYE_TABLE where states='bangalore'or states='newdelhi';---12. Select * from employee who do not stay in cities ‘Bangalore’ and ‘New Delhi’select*from EMPLOYE_TABLE where states not in ('bangalore') and states not in ('newdelhi');----13. Select details of employee whose name starts with character ‘A’select* from EMPLOYE_TABLE where Emp_name like'a%'---14. Arrange the details of employee in descending order of their salary.select* from EMPLOYE_TABLE order by Salary desc;---15. Retrieve the average salary of employee per department.alter table EMPLOYE_TABLE alter column Salary int;select Dept_id,avg(Salary) as avg_Sal from EMPLOYE_TABLE group by Dept_id;----16. Get the details of Employee( dept_id, Salary) and its average salary whose average salary is greater than 30000select Dept_id,avg(Salary) as avg_Sal from EMPLOYE_TABLE group by Dept_id having avg(Salary)>30000;------------JOINS, STORED PROCEDURE AND VIEW--1. company details

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