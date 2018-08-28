CREATE OR REPLACE Procedure t6(in_renter_id IN VARCHAR, in_prop_id IN Integer, in_start IN DATE, 
	in_end IN DATE)
As

l_rname renter.rname%type;
l_rhome renter.rhome%type;
l_rwork renter.rwork%type;

l_status property.status%type;
l_rent property.monthly_rent%type;

l_supid manages.supervisor_id%type;
l_supname employee.name%type;

l_leaseid lease.lease_id%type;

BEGIN

	SELECT status INTO l_status FROM property WHERE prop_id = in_prop_id;

	IF (l_status = 'available') THEN
	
		SELECT rname,rhome,rwork into l_rname,l_rhome,l_rwork FROM renter where renter_id=in_renter_id;
	
		SELECT monthly_rent into l_rent FROM property where prop_id=in_prop_id;
		
		SELECT supervisor_id into l_supid FROM manages WHERE prop_id=in_prop_id;
		SELECT name into l_supname FROM employee where employee_id=l_supid;
		
		SELECT count(*) INTO l_leaseid FROM lease;
		l_leaseid :=l_leaseid + 1;
		
		INSERT INTO lease values (in_renter_id,in_start,in_end,l_rent,l_supid,l_leaseid,in_prop_id);
		
		UPDATE property
		set status='leased', monthly_rent=1.1*l_rent, avail_start_date=in_end
		WHERE prop_id=in_prop_id;

		
	ELSE
		RAISE_APPLICATION_ERROR(-20000, 'Property not available!');		
	END IF;

END;
/
SHOW ERRORS

