--일반적인 아우터 조인 쿼리
select emp_id, emp_name, gender, age, hire_date,  d.dept_id, dept_name 
from emp_master e, dept_master d
where e.dept_id = d.dept_id(+)

--스칼라 서브쿼리
select emp_id, emp_name, gender, age, hire_date, dept_id, 
    (select  dept_name from dept_master d where e.dept_id = d.dept_id) as dept_name
from emp_master e

--inline view
select *
from dept_master d, 
            (select e.emp_id, e.emp_name, (a.city || a.gu || a.address_name) as address, e.dept_id
                from emp_master e, address_master a
                where e.address_id = a.address_id)  b
where d.dept_id = b.dept_id and d.use_yn = 'Y'

--중첩 서브쿼리
-- 단일로우, 단일컬럼
select *
from dept_master d
where dept_id = (select dept_id from emp_master where emp_name = '채송화')
-- 단일컬럼, 다중로우
select *
from dept_master
where dept_id in (select dept_id from emp_master where age between 40 and 49)

-- 다중컬럼, 다중row를 리턴받는 서브쿼리 예제
select * 
from emp_master
where (gender, age) in (
            select gender, age from emp_master e, address_master a where e.address_id = a.address_id and gu in ('중구', '서대문구')
            )


---------------------------------
SELECT * FROM DICT;

SELECT * FROM DICT WHERE table_name = 'USER_OBJECTS';

SELECT * FROM TAB;

CREATE TABLE table_name (
  column_name1 column_name1_type [[NOT] NULL], 
  column_name2 column_name2_type [[NOT] NULL],
  … )
TABLESPACE tb_name
PCTUSED 0
PCTFREE 10
INITRANS 1 
MAXTRANS 255 ….. ;

CREATE [OR REPLACE] VIEW [schema.] view_name
AS SELECT clause …
[WITH CHECK OPTION] [WITH READ ONLY]
DROP VIEW [schema.] view_name;

DROP SEQUENCE “schema.seq_name”;
 
ALTER SEQUENCE sequence_name
  [INCREMENT BY n]
  [MAXVALUE n | NOMAXVALUE] 
  [MINVALUE n | NOMINVALUE] 
  [CYCLE | NOCYCLE]
  [CACHE | NOCACHE]
  
CREATE [UNIQUE] INDEX [schema.] index_name
	ON [schema.] table_name (column_name1, [column_name2, column_name3 …]); 
DROP INDEX [schema.] index_name;

CREATE [OR REPLACE] [PUBLIC] SYNONYM ‘[schema.] syn_name’
	FOR ‘[schema.] object_name’;
 
DROP [PUBLIC] SYNONYM ‘schema.syn_name’;

CREATE USER user01 IDENTIFIED BY user01;

CREATE USER user IDENTIFIED {BY password | EXTERNALLY}
  [DEFAULT TABLESPACE tablespace] 
  [TEMPORARY TABLESPACE tablespace] [PASSWORD EXPIRE]
  [ACCOUNT {unlock/lock}] 
  [PROFILE profile]
  [QUOTA {integer [K|M] | UNLIMITED} ON tablespace ]
  
  DROP USER user01 [CASCADE];
  
  GRANT create session, create table TO user01 ; 
REVOKE create session, create table FROM user01 ;

GRANT select, insert On emp TO user01 ; 
REVOKE select, insert On emp FROM user01 ;


  
  
