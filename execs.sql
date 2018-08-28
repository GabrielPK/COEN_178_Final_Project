exec t1('10000001')
exec t1('10000002')

exec t2

exec t3('20000001','10000001')

exec t4('Santa Clara',2,0,1500)
exec t4('Los Angeles',3,0,0)

exec t5


SELECT COUNT(*) FROM property WHERE status='available';
SELECT monthly_rent FROM property WHERE prop_id=0;
exec t6('30000001',0,TO_DATE('08-JUN-18','DD-MON-YY'),TO_DATE('08-FEB-19','DD-MON-YY'))
SELECT COUNT(*) FROM PROPERTY WHERE status='available';
SELECT monthly_rent FROM property WHERE prop_id=0;

exec t7('30000001')

exec t8

exec t9('santa clara')

exec t10


