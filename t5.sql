CREATE OR REPLACE Procedure t5
As

l_count Integer := 0;

BEGIN


	SELECT count(*) into l_count FROM property WHERE status='available';
	
	DBMS_OUTPUT.put_line('Number of available houses: ' || l_count);


END;
/
Show Errors;
