CREATE OR REPLACE Procedure t7(in_renterid IN VARCHAR)
As

Cursor lease_cur IS 
	SELECT start_date,end_date,deposit_amt,supervisor_id,lease_id,prop_id FROM 
	lease WHERE renter_id=in_renterid;

l_start lease.start_date%type;
l_end lease.end_date%type;
l_deposit lease.deposit_amt%type;
l_supid lease.supervisor_id%type;
l_leaseid lease.lease_id%type;
l_propid lease.prop_id%type;

l_renter_name renter.rname%type;
l_supname employee.name%type;
l_rhome renter.rhome%type;
l_rwork renter.rwork%type;


BEGIN
	SELECT rname INTO l_renter_name FROM renter WHERE renter_id = in_renterid;

	OPEN lease_cur;
	LOOP
	FETCH lease_cur into l_start,l_end,l_deposit,l_supid,l_leaseid,l_propid;
	
		EXIT WHEN lease_cur%notfound;

		SELECT rhome into l_rhome FROM renter where renter_id=in_renterid;
		SELECT rwork into l_rwork FROM renter where renter_id=in_renterid;

		SELECT name into l_supname FROM employee where employee_id=l_supid;

		DBMS_OUTPUT.put_line('Renter Name: ' || l_renter_name || chr(10) 
		|| 'Renter home phone: ' || l_rhome || chr(10)
		|| 'Renter work phone: ' || l_rwork || chr(10)
		|| 'Starting Date of Lease: ' || l_start || chr(10)
		|| 'Ending Date of Lease: ' || l_end || chr(10) 
		|| 'Deposit Amount: $' || l_deposit || chr(10)
		|| 'Rent Amount: $' || l_deposit || ' per month' || chr(10)
		|| 'Supervisor: ' || l_supname || chr(10) );
	
	END LOOP;
	CLOSE lease_cur;
END;
/
Show Errors;
