CREATE OR REPLACE PROCEDURE t9(in_city in VARCHAR)
As

l_total_avg property.monthly_rent%type;
l_avail_avg property.monthly_rent%type;
l_leased_avg property.monthly_rent%type;

BEGIN

	SELECT AVG(monthly_rent) INTO l_total_avg FROM property WHERE UPPER(city)=UPPER(in_city);

	SELECT AVG(monthly_rent) INTO l_avail_avg FROM property WHERE UPPER(city)=UPPER(in_city)
	AND status='available';
	
	SELECT AVG(monthly_rent) INTO l_leased_avg FROM property WHERE UPPER(city)=UPPER(in_city)
	AND status='leased';
	


	DBMS_OUTPUT.put_line('Average Rent among all properties in ' || in_city || ': $' 
	|| l_total_avg || chr(10));
	DBMS_OUTPUT.put_line('Average Rent of available properties: $' || l_avail_avg || chr(10));
	DBMS_OUTPUT.put_line('Average Rent of leased properties: $' || l_leased_avg || chr(10));

END;
/
Show Errors

