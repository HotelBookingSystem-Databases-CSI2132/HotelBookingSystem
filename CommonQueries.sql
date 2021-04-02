-- #Point 8 --

---- Query 1 -----

---- Query 2 -----

---- Query 3 -----
---- Query 4 -----
---- Query 5 -----
Select * from renting c where c.check_in_day=10 and c.check_in_month=4

---- Query 6 -----
Update customer set phone_number='456-123-7790' where id=2;

---- Query 7 -----
---- Query 8 -----
SELECT Max(Salary) AS second_max_salary FROM (SELECT Salary From Employee
EXCEPT (SELECT MAX(Salary) FROM Employee)) as SalaryTable;
