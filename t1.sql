CREATE OR REPLACE Procedure t1(branch_num in VARCHAR)
As

manager_name employee.name%type;
Cursor prop_cur IS 
	SELECT prop_id,street,city,zip,monthly_rent,num_rooms FROM property WHERE status='available' AND prop_id IN
		(SELECT prop_id FROM manages WHERE supervisor_id IN
			(SELECT employee_id FROM employs WHERE branch_number=branch_num) );

l_propid property.prop_id%type;
l_prop_owner owner.name%type; 
l_numrooms property.num_rooms%type;
l_street property.street%type;
l_city property.city%type;
l_zip property.zip%type;
l_rent property.monthly_rent%type;


BEGIN
	OPEN prop_cur;
	loop
	FETCH prop_cur into l_propid,l_street,l_city,l_zip,l_rent,l_numrooms;
		
		EXIT WHEN prop_cur%notfound;
		SELECT name INTO l_prop_owner FROM owner WHERE owner_id = 
			(SELECT owner_id FROM owns WHERE prop_id = l_propid) ;
		DBMS_OUTPUT.put_line('Property ID: ' || l_propid || ' Address: ' ||
		l_street || ' ' || l_city || ' ' || l_zip || ' Monthly Rent: $' || l_rent || ' Number of Rooms: ' 
		|| l_numrooms || ' Owner Name: ' || l_prop_owner || chr(10) );
		
	END LOOP;
	CLOSE prop_cur;
	
	SELECT name INTO manager_name from employee WHERE job = 'manager' AND employee_id IN
		(SELECT employee_id FROM employs WHERE branch_number = branch_num);
	
	DBMS_OUTPUT.put_line('Manager: ' || manager_name);
	
END;
/
