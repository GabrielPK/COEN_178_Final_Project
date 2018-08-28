insert into branch values ('10000001','2390000000','El Camino Real','Santa Clara','95053');
insert into branch values ('10000002','2390000001','Baker Street','Los Angeles','90003');

insert into employee values ('00000001','John Smith','2390000002','manager');
insert into employee values ('00000002','Jane Doe','2390000003','supervisor');
insert into employee values ('00000003','John Deer','2390000004','supervisor');
insert into employee values ('00000004','Jane Baker','2390000005','manager');
insert into employee values ('00000005','Jack Mansfield','2390000006','supervisor');
insert into employee values ('00000006','Jeff Donohue','2390000007','supervisor');

insert into employs values ('10000001','00000001');
insert into employs values ('10000001','00000002');
insert into employs values ('10000001','00000003');
insert into employs values ('10000002','00000004');
insert into employs values ('10000002','00000005');
insert into employs values ('10000002','00000006');

insert into supervises values ('00000001','00000002');
insert into supervises values ('00000001','00000003');
insert into supervises values ('00000004','00000005');
insert into supervises values ('00000004','00000006');

insert into owner values ('20000001','George Washington','Virgina Avenue','Norfolk','12340','2390000008');
insert into owner values ('20000002','John Adams','Massachusetts Road','Boston','12341','2390000009');
insert into owner values ('20000003','Thomas Jefferson','Delaware Street','Dover','12342','2390000010');
insert into owner values ('20000004','James Madison','New Hampshire Road','Concord','12343','2390000011');
insert into owner values ('20000005','James Monroe','New York Way','Buffalo','12344','2390000012');
insert into owner values ('20000006','John Q Adams','Vermont','Montpelier','12345','2390000013');

insert into property values (0,'Towne Valley Drive','Santa Clara','95053',2,1412.34,'available',
	TO_DATE('01-JUN-18','DD-MON-YY'));
insert into property values (1,'Liberty Road','Los Angeles','90005',4,1006.71,'leased',
	TO_DATE('23-JUL-18','DD-MON-YY'));
insert into property values (2,'Desert Hill Road','Santa Clara','95050',2,1234.50,'available',
	TO_DATE('01-JUN-18','DD-MON-YY'));
insert into property values (3,'Blue Ridge Parkway','Los Angeles','90003',7,9000.00,'available',
	TO_DATE('01-JUN-18','DD-MON-YY'));
insert into property values (4,'Oak Pine Way','Santa Clara','95053',3,2100.00,'available',
	TO_DATE('01-JUN-18','DD-MON-YY'));
insert into property values (5,'Dead End Path','Los Angeles','90009',1,1300.00,'available',
	TO_DATE('01-JUN-18','DD-MON-YY'));
insert into property values (6,'Parrot Street','Santa Clara','95049',3,3300.00,'available',
	TO_DATE('01-JUN-18','DD-MON-YY'));
insert into property values (7,'Danny Boy Lane','Los Angeles','90010',3,2900.00,'available',
	TO_DATE('01-JUN-18','DD-MON-YY'));

insert into manages values ('00000002',0);
insert into manages values ('00000002',2);
insert into manages values ('00000002',4);
insert into manages values ('00000003',6);
insert into manages values ('00000005',1);
insert into manages values ('00000005',3);
insert into manages values ('00000006',5);
insert into manages values ('00000006',7);

insert into owns values (0,'20000001');
insert into owns values (1,'20000002');
insert into owns values (2,'20000003');
insert into owns values (3,'20000004');
insert into owns values (4,'20000005');
insert into owns values (5,'20000006');
insert into owns values (6,'20000001');
insert into owns values (7,'20000002');

insert into renter values ('Dom Pedro I','2390000014','2390000015','30000001');
insert into renter values ('Getulio Vargas','2390000016','2390000017','30000002');
insert into renter values ('Michel Temer','2390000018','2390000019','30000003');
insert into renter values ('Dilma Rousseff','2390000020','2390000021','30000004');
insert into renter values ('Luiz Inacio Lula da Silva','2390000022','2390000023','30000005');

insert into lease values ('30000001',TO_DATE('25-DEC-2017','DD-MON-YYYY'),TO_DATE('23-JUL-2018','DD-MON-YYYY'),
	1006.71,'00000003',0,1);
