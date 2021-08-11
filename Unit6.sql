SELECT  MIN(salary /*[ DISTINCT | ALL ] expr*/) "Min Salary"
       ,MAX(salary /*[ DISTINCT | ALL ] expr*/) "Max Salary"
       ,MIN(hire_date /*[ DISTINCT | ALL ] expr*/) "Early Hire Date"
       ,MAX(hire_date /*[ DISTINCT | ALL ] expr*/) "Latest Hire Date"
       ,COUNT(* /*{ * | [ DISTINCT | ALL ] expr}*/) "Count Employees"
FROM EMPLOYEES
GROUP BY  DEPARTMENT_ID
ORDER BY COUNT(* /*{ * | [ DISTINCT | ALL ] expr}*/) DESC; /* 1 */

SELECT  SUBSTR(first_name /*char*/,1 /*position*/,1 /*substring_length*/) "First Character"
       ,COUNT(* /*{ * | [ DISTINCT | ALL ] expr}*/) "Count WITH this char"
FROM EMPLOYEES
GROUP BY  SUBSTR(first_name /*char*/,1 /*position*/,1 /*substring_length*/)
HAVING COUNT(* /*{ * | [ DISTINCT | ALL ] expr}*/) > 1
ORDER BY 2 DESC; /* 2 */

SELECT  DEPARTMENT_ID "Department id"
       ,SALARY "salary"
       ,COUNT(* /*{ * | [ DISTINCT | ALL ] expr}*/) "Count of Employees"
FROM EMPLOYEES
GROUP BY  DEPARTMENT_ID
         ,SALARY; /* 3 */

SELECT  TO_CHAR(hire_date /*n*/,'Day' /*fmt*/) "Day of hired"
       ,COUNT(* /*{ * | [ DISTINCT | ALL ] expr}*/) "Count of Employees"
FROM EMPLOYEES
GROUP BY  TO_CHAR(hire_date /*n*/,'Day' /*fmt*/); /* 4 */

SELECT  DEPARTMENT_ID "Department id"
FROM EMPLOYEES
GROUP BY  DEPARTMENT_ID
HAVING COUNT(* /*{ * | [ DISTINCT | ALL ] expr}*/) > 30 AND SUM(salary) > 300000; /* 5 */

SELECT  REGION_ID "Region id"
FROM COUNTRIES
GROUP BY  REGION_ID
HAVING SUM(LENGTH(COUNTRY_NAME /*ch CHAR*/)) > 50;/* 6 */

SELECT  JOB_ID "Job id"
       ,ROUND(AVG(SALARY)) "avg salary"
FROM EMPLOYEES
GROUP BY  JOB_ID;/* 7 */

SELECT  DEPARTMENT_ID "Department id"
FROM EMPLOYEES
GROUP BY  DEPARTMENT_ID
HAVING COUNT(DISTINCT JOB_ID) > 1 ;/* 8 */

SELECT  DEPARTMENT_ID "Department id"
       ,JOB_ID "Job id"
       ,MIN(salary /*[ DISTINCT | ALL ] expr*/) "Min Salary"
       ,MAX(salary /*[ DISTINCT | ALL ] expr*/) "Max Salary"
FROM EMPLOYEES
GROUP BY  DEPARTMENT_ID
         ,JOB_ID
HAVING AVG(salary /*[ DISTINCT | ALL ] expr*/) > 10000;/* 9 */

SELECT  MANAGER_ID "Manager id"
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL
GROUP BY  MANAGER_ID
HAVING AVG(salary /*[ DISTINCT | ALL ] expr*/) BETWEEN 6000 AND 9000; /* 10 */

SELECT  ROUND(MAX(AVG(salary /*[ DISTINCT | ALL ] expr*/) /*[ DISTINCT | ALL ] expr*/) /*date*/,-3 /*fmt*/) "Max and Avg salary"
FROM EMPLOYEES
GROUP BY  DEPARTMENT_ID;/* 11 */