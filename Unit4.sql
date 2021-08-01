SELECT  *
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) > 10; /* 1 */ 

SELECT  *
FROM EMPLOYEES
WHERE MOD(SALARY, 1000) = 0; /* 2 */ 

SELECT  phone_number 
       ,SUBSTR(phone_number /*char*/,1 /*position*/,3 /*substring_length*/)
FROM EMPLOYEES
WHERE phone_number like '___.___.____'; /* 3 */ 

SELECT  *
FROM EMPLOYEES
WHERE SUBSTR(first_name, - 1) = 'm' 
AND LENGTH(first_name /*ch CHAR*/) > 5; /* 4 */ 

SELECT  Next_day(sysdate,'Friday')
FROM DUAL; /* 5 */

SELECT  *
FROM EMPLOYEES
WHERE MONTHS_BETWEEN(SYSDATE /*date1 DATE*/, HIRE_DATE/*date1 DATE*/) > 150; /* 6 */ 

SELECT  PHONE_NUMBER "Old Format" 
       ,REPLACE(PHONE_NUMBER,'.','-') "New Format"
FROM EMPLOYEES; /* 7 */

SELECT  UPPER(FIRST_NAME) 
       ,LOWER(EMAIL) 
       ,INITCAP(JOB_ID)
FROM EMPLOYEES; /* 8 */

SELECT  FIRST_NAME 
       ,SALARY 
       ,CONCAT(FIRST_NAME,SALARY)
FROM EMPLOYEES; /* 9 */

SELECT  EMPLOYEE_ID 
       ,FIRST_NAME 
       ,HIRE_DATE 
       ,ROUND(HIRE_DATE,'MM') 
       ,TRUNC(HIRE_DATE,'YYYY')
FROM EMPLOYEES; /* 10 */

SELECT  RPAD(FIRST_NAME/*expr1*/,10 /*n*/,'$' /*expr2*/) 
       ,LPAD(LAST_NAME /*expr1*/,15 /*n*/,'!' /*expr2*/)
FROM EMPLOYEES; /* 11 */

SELECT  FIRST_NAME 
       ,INSTR(first_name /*string*/,'a' /*substring*/,1 /*position*/,2 /*occurrence*/)
FROM EMPLOYEES; /* 12 */

SELECT  '!!!HELLO!! MY FRIEND!!!!!!!!' 
       ,TRIM(BOTH '!'
FROM '!!!HELLO!! MY FRIEND!!!!!!!!')
FROM DUAL; /* 13 */

SELECT  SALARY 
       ,(SALARY * 3.1415) 
       ,ROUND(SALARY * 3.1415) 
       ,TRUNC(SALARY * 3.1415,-3) / 1000
FROM EMPLOYEES;/* 14 */

SELECT  HIRE_DATE 
       ,ADD_MONTHS(hire_date /*date*/,6 /*integer*/) 
       ,LAST_DAY 
(hire_date /*date DATE*/
)
FROM EMPLOYEES; /* 15 */