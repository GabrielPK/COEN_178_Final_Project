CREATE OR REPLACE Procedure t10
As

cursor prop_cur IS
	SELECT prop_id,street,city,zip,monthly_rent,num_rooms,avail_start_date FROM property WHERE
		ABS(SYSDATE - avail_start_date) <= 60 AND status='leased';

l_propid property.prop_id%type;
l_street property.street%type;
l_city property.city%type;
l_zip property.zip%type;
l_rent property.monthly_rent%type;
l_numrooms property.num_rooms%type;
l_owner owner.name%type;
l_date property.avail_start_date%type;

BEGIN

	OPEN prop_cur;
	LOOP
	FETCH prop_cur into l_propid,l_street,l_city,l_zip,l_rent,l_numrooms,l_date;

	EXIT WHEN prop_cur%notfound;
	
	SELECT name INTO l_owner FROM owner WHERE owner_id = 
		(SELECT owner_id FROM owns WHERE prop_id = l_propid);

	DBMS_OUTPUT.put_line('Property ID: ' || l_propid || ' Address: ' || l_street ||
	 ' ' || l_city || ' ' || l_zip || ' Monthly Rent: $' || l_rent || ' Number of Rooms: '
	|| l_numrooms || ' Owner: ' || l_owner || ' Start Date: ' || l_date || chr(10));

	END LOOP;
	CLOSE prop_cur;

END;
/
Show Errors


