CREATE OR REPLACE Procedure t8
As

Cursor renter_cur IS 
	SELECT renter_id FROM lease group by renter_id HAVING count(*) > 1;

l_renterid lease.renter_id%type;
l_renter_name renter.rname%type;

BEGIN

	OPEN renter_cur;
	LOOP
	FETCH renter_cur into l_renterid;
	
		EXIT WHEN renter_cur%notfound;
	
		SELECT rname into l_renter_name FROM renter WHERE renter_id=l_renterid;
		
		DBMS_OUTPUT.put_line('Renter: ' || l_renter_name || chr(10));

	END LOOP;
	CLOSE renter_cur;

END;
/
Show Errors;


