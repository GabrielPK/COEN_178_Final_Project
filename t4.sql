CREATE OR REPLACE Procedure t4(in_city in VARCHAR, in_numrooms in Integer, in_lo_rent in number, 
	in_hi_rent in number)
As
	Cursor prop_cur IS 
		SELECT prop_id,street,city,zip,monthly_rent,num_rooms FROM property 
			WHERE upper(city)=upper(in_city) AND num_rooms >= in_numrooms AND status='available';

	Cursor prop_cur_range IS 
		SELECT prop_id,street,city,zip,monthly_rent,num_rooms FROM property
			WHERE upper(city)=upper(in_city) AND num_rooms >= in_numrooms AND status='available'
			AND monthly_rent <= in_hi_rent AND monthly_rent >= in_lo_rent;

l_prop_owner owner.name%type;
l_propid property.prop_id%type;
l_street property.street%type;
l_city property.city%type;
l_zip property.zip%type;
l_rent property.monthly_rent%type;
l_numrooms property.num_rooms%type;


BEGIN
	IF (in_hi_rent = 0) THEN 
		OPEN prop_cur;
		LOOP
		FETCH prop_cur into l_propid,l_street,l_city,l_zip,l_rent,l_numrooms;
			
			EXIT WHEN prop_cur%notfound;
			
			SELECT name INTO l_prop_owner FROM owner WHERE owner_id =
				(SELECT owner_id FROM owns WHERE prop_id = l_propid);
		
			DBMS_OUTPUT.put_line('Property ID: ' || l_propid || ' Address: ' || 
			l_street || ' ' || l_city || ' ' || l_zip || ' Monthly Rent: $' || l_rent || 
			' Number of Rooms: ' || l_numrooms || ' Owner Name: ' || l_prop_owner || chr(10) );
		
		END LOOP;
		CLOSE prop_cur;
	ELSE 	
		OPEN prop_cur_range;
		LOOP
		FETCH prop_cur_range into l_propid,l_street,l_city,l_zip,l_rent,l_numrooms;
			
			EXIT WHEN prop_cur_range%notfound;
			
			SELECT name INTO l_prop_owner FROM owner WHERE owner_id =
				(SELECT owner_id FROM owns WHERE prop_id = l_propid);
		
			DBMS_OUTPUT.put_line('Property ID: ' || l_propid || ' Address: ' || 
			l_street || ' ' || l_city || ' ' || l_zip || ' Monthly Rent: $' || l_rent || 
			' Number of Rooms: ' || l_numrooms || ' Owner Name: ' || l_prop_owner || chr(10));
		
		END LOOP;
		CLOSE prop_cur_range;
	END IF;

END;
/
Show Errors;

