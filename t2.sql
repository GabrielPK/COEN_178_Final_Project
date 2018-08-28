CREATE OR REPLACE Procedure t2
AS

l_supervisor_name employee.name%type;

Cursor prop_cur IS 
	SELECT prop_id,street,city,zip,monthly_rent,num_rooms FROM property;

l_propid property.prop_id%type;
l_street property.street%type;
l_city property.city%type;
l_zip property.zip%type;
l_rent property.monthly_rent%type;
l_numrooms property.num_rooms%type;
l_prop_owner owner.name%type;

BEGIN

	OPEN prop_cur;
	LOOP
	FETCH prop_cur into l_propid,l_street,l_city,l_zip,l_rent,l_numrooms;
	
		EXIT WHEN prop_cur%notfound;

		SELECT name INTO l_supervisor_name FROM employee WHERE employee_id = 
			(SELECT supervisor_id FROM manages WHERE prop_id = l_propid);

		SELECT name INTO l_prop_owner FROM owner WHERE owner_id = 
			(SELECT owner_id FROM owns WHERE prop_id = l_propid);

		DBMS_OUTPUT.put_line('Supervisor: ' || l_supervisor_name || chr(10) || 'Property ID: '
		|| l_propid || ' Address: ' || l_street || ' ' || l_city || ' ' || l_zip || 
		' Monthly Rent: $' || l_rent || ' Number of Rooms: ' || l_numrooms || ' Owner: '
		|| l_prop_owner || chr(10));
	END LOOP;
	CLOSE prop_cur;

END;
/
Show Errors



