SELECT  *
FROM EMPLOYEES
WHERE INSTR(LOWER(first_name) /*string*/, 'b' /*substring*/) > 0;/* 1 */

SELECT  *
FROM EMPLOYEES
WHERE INSTR(LOWER(first_name) /*string*/, 'a' /*substring*/, 1 /*position*/, 2 /*occurrence*/) > 0;/* 2 */

SELECT  *
FROM EMPLOYEES;/* 3 */

SELECT  SUBSTR(first_name /*char*/,2 /*position*/,LENGTH(first_name /*ch CHAR*/) - 1 /*substring_length*/)
FROM EMPLOYEES;/* 4 */

SELECT  *
FROM EMPLOYEES
WHERE LENGTH(SUBSTR(job_id, INSTR(job_id /*string*/, '_' /*substring*/) + 1)) > 3
AND LOWER(SUBSTR(job_id, INSTR(job_id /*string*/, '_' /*substring*/) + 1)) != 'clerk'; /* 5 */

SELECT  *
FROM EMPLOYEES
WHERE TO_CHAR(hire_date /*n*/, 'dd' /*fmt*/) = '01';/* 6 */

SELECT  *
FROM EMPLOYEES
WHERE TO_CHAR(hire_date /*n*/, 'YYYY' /*fmt*/) = '2008';/* 7 */

SELECT  TO_CHAR((SYSDATE + 1) /*n*/,'fm"Tomorrow is "Ddspth" day of "Month"' /*fmt*/)
FROM DUAL;/* 8 */

SELECT  first_name
       ,TO_CHAR(hire_date /*n*/,'fm""ddth" of "Month","YYYY""' /*fmt*/) "First hire day"
FROM EMPLOYEES;/* 9 */

SELECT  first_name
       ,TO_CHAR(salary * 1.20 /*n*/,'$999,99.999' /*fmt*/) "New Salary"
FROM EMPLOYEES;/* 10 */

SELECT  SYSDATE "Now"
       ,SYSDATE + (1 / (24 * 60 * 60)) "One Second"
       ,SYSDATE + (1 / 24 / 60) "One Minute"
       ,SYSDATE + (1 / 24) "One Hour"
       ,SYSDATE + 1 "One Day"
       ,ADD_MONTHS(SYSDATE /*date*/,1 /*integer*/) "One Month"
       ,ADD_MONTHS(SYSDATE /*date*/,12 /*integer*/) "One Year"
FROM DUAL;/* 11 */

SELECT  FIRST_NAME
       ,SALARY "Old Salary"
       ,SALARY + TO_NUMBER('$12,345.55' /*expr */,'$99,999.99' /*fmt*/) "New Salary"
FROM EMPLOY EES;/* 12 */

SELECT  FIRST_NAME
       ,HIRE_DATE
       ,TO_DATE('SEP,18:45:00 18 2009','MON,HH24:MI:SS DD YYYY') "Incomming date"
       ,MONTHS_BETWEEN(TO_DATE('SEP,18:45:00 18 2009','MON,HH24:MI:SS DD YYYY') /*date1 DATE*/,HIRE_DATE /*date1 DATE*/)
FROM EMPLOYEES;/* 13 */

SELECT  FIRST_NAME
       ,LAST_NAME
       ,SALARY
       ,TO_CHAR(SALARY + SALARY * NVL(COMMISSION_PCT /*expr1*/,0 /*expr1*/) /*n*/,'$99,999.99' /*fmt*/)
FROM EMPLOYEES;/* 14 */

SELECT  FIRST_NAME "First name"
       ,LAST_NAME "Last name"
       ,NVL2(NULLIF(LENGTH(FIRST_NAME),LENGTH(LAST_NAME)) /*expr1*/,'the same length' /*expr2*/,'the different length' /*expr3*/) "Equal"
FROM EMPLOYEES;/* 15 */

SELECT  FIRST_NAME "First name"
       ,NVL(COMMISSION_PCT /*expr1*/,0 /*expr1*/) "Commission"
       ,NVL2(COMMISSION_PCT /*expr1*/,'Yes' /*expr2*/,'No' /*expr3*/)
FROM EMPLOYEES;/* 16 */

SELECT  FIRST_NAME "First name"
       ,COALESCE(COMMISSION_PCT /*expr*/,MANAGER_ID /*expr*/,SALARY /*expr*/) "Info"
FROM EMPLOYEES;/* 17 */

SELECT  FIRST_NAME "First name"
       ,SALARY "Salary"
       ,CASE WHEN SALARY < 5000 THEN 'Low'
             WHEN (SALARY > 5000 OR SALARY = 5000) AND SALARY < 10000 THEN 'Normal'
             WHEN SALARY > 10000 OR SALARY = 10000 THEN 'High' END "Salary Level"
FROM EMPLOYEES;/* 18 */

SELECT  REGION_ID "Region Id"
       ,DECODE(REGION_ID /*expr*/,1 /*search*/,'Europe' /*result*/,2 /*search,result*/,'America' /*search,result*/,3 /*search,result*/,'Asia' /*search,result*/,4 /*search,result*/,'Africa' /*search,result*/) "Region Name"
FROM COUNTRIES;/* 19 */

SELECT  REGION_ID "Region Id"
       ,CASE WHEN REGION_ID = 1 THEN 'Europe'
             WHEN REGION_ID = 2 THEN 'America'
             WHEN REGION_ID = 3 THEN 'Asia'
             WHEN REGION_ID = 4 THEN 'Africa' END "Region Name"
FROM COUNTRIES;

SELECT  FIRST_NAME "First Name"
       ,SALARY "Salary"
       ,CASE WHEN SALARY < 10000 AND COMMISSION_PCT is NULL THEN 'BAD'
             WHEN SALARY BETWEEN 10000 AND 15000 THEN 'NORMAL'
             WHEN SALARY > 15000 Or SALARY = 15000 THEN 'GOOD' END "Condition"
FROM EMPLOYEES;/* 20 */
