CREATE OR REPLACE Trigger manager_constraint
	BEFORE INSERT on Employs
FOR EACH ROW

DECLARE
	l_new_job employee.job%type;
	l_man_count Integer := 0;

BEGIN
	SELECT COUNT(*) INTO l_man_count FROM employs, employee 
		where employs.employee_id = employee.employee_id AND job='manager' 
		AND employs.branch_number = :new.branch_number;

	SELECT job INTO l_new_job FROM employee WHERE employee_id=:new.employee_id;

	IF (l_man_count > 0 AND l_new_job='manager') THEN
		RAISE_APPLICATION_ERROR(-20000, 'May only have one manager per branch');
	ELSE
		DBMS_OUTPUT.put_line('Manager added to selected branch');
	END IF;
END;
/
SHOW ERRORS

