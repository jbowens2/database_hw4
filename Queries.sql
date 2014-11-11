/*select *
from employee
where exists (select * from works_on B 
where (B.Pno in (select Pnumber 
                 from project where Dnum = 5)));*/

/*a*/
/*select * from employee A
where A.Ssn in (select Essn from works_on B 
				   where B.Hours > 10.0 AND B.Pno in (select Pnumber from project C 
								   where C.Pname = "ProductX")
                                   AND A.Dno = 5);*/
                                   
/*b*/

/*select Lname, Fname, Dependent_name
from employee
left join dependent on employee.Ssn = dependent.Essn
where dependent.Dependent_name is not null;*/

/*c*/
/*select Lname, Fname from employee A
where A.Ssn in(select Ssn from Employee B
                where B.Super_ssn = 333445555);*/
				 
                 
                 
/*d*/
/*select Lname, Fname, Pname, Hours
from employee, works_on, project
where employee.Ssn in (select Essn from works_on A
                        where A.Pno in (select Pnumber from project))*/
                        
                        
                        
/*e*/
/*select Lname, Fname
from employee
where not exists (select * from works_on);*/


/*f*/

/*select Dname, avg(salary)
from employee
left join department
on employee.Ssn = department.Mgr_ssn
where department.Dname = "Research";

select Dname, avg(salary)
from employee
left join department
on employee.Ssn = department.Mgr_ssn
where department.Dname = "Administration";

select Dname, avg(salary)
from employee
left join department
on employee.Ssn = department.Mgr_ssn
where department.Dname = "Headquarters";*/

/*g*/
/*select avg(salary)
from employee
where employee.Sex = "M"*/

/*h*/

select Lname, Fname from employee A 
where A.Ssn in (select Essn from works_on B
                 where B.Pno in (select Pnumber from project C
								  where C.Plocation = "Houston"
                                  and exists (select Dnum from dept_location D 
												 where not Dlocation = "Houston")));
							
                 