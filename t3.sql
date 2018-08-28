CREATE OR REPLACE PROCEDURE t3(in_owner_id in VARCHAR, in_branchid in VARCHAR) 
As

Cursor prop_cur IS 
	SELECT prop_id,street,city,zip,monthly_rent,num_rooms FROM property WHERE
		prop_id in (SELECT prop_id FROM owns WHERE owner_id=in_owner_id);

l_propid property.prop_id%type;
l_street property.street%type;
l_city property.city%type;
l_zip property.zip%type;
l_rent property.monthly_rent%type;
l_numrooms property.num_rooms%type;

l_prop_owner owner.name%type;


BEGIN
	SELECT name INTO l_prop_owner FROM owner WHERE owner_id=in_owner_id;

	OPEN prop_cur;
	LOOP
	FETCH prop_cur into l_propid,l_street,l_city,l_zip,l_rent,l_numrooms;
	
		EXIT WHEN prop_cur%notfound;

		DBMS_OUTPUT.put_line('Property ID: ' || l_propid || ' Address: ' || l_street ||
		 ' ' || l_city || ' ' || l_zip || ' Monthly Rent: $' || l_rent || ' Number of Rooms: '
		|| l_numrooms || ' Owner: ' || l_prop_owner || chr(10));

	END LOOP;
	CLOSE prop_cur;

END;
/
Show Errors;
