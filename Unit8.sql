/**
 * Output employee's info
 * who has first name length is long.
 */
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	LENGTH(e.FIRST_NAME) = (
	SELECT
		MAX(LENGTH(e.FIRST_NAME))
	FROM
		EMPLOYEES e );

/**
 * Output employee's info with salary 
 * that is more than average salary of  all employees.
 */
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	e.SALARY > (
	SELECT
		AVG(e.SALARY)
	FROM
		EMPLOYEES e );

/**
 * Output cities where employees earn less.
 */
SELECT
	l.CITY
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	(e.DEPARTMENT_ID = d.DEPARTMENT_ID)
JOIN LOCATIONS l ON
	(l.LOCATION_ID = d.LOCATION_ID )
GROUP BY
	l.CITY
HAVING
	SUM(e.SALARY) = (
	SELECT
		MIN(SUM(SALARY))
	FROM
		EMPLOYEES e
	JOIN DEPARTMENTS d ON
		(e.DEPARTMENT_ID = d.DEPARTMENT_ID)
	JOIN LOCATIONS l ON
		(l.LOCATION_ID = d.LOCATION_ID )
	GROUP BY
		l.CITY );

/**
 * Output employee's info
 * who has manager with salary is more than 15000.
 */
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	e.SALARY IN (
	SELECT
		SALARY
	FROM
		EMPLOYEES e
	WHERE
		SALARY > 15000);

/**
 * Output department's info which don't have employees.
 */
SELECT
	*
FROM
	DEPARTMENTS d ;

SELECT
	*
FROM
	DEPARTMENTS d
WHERE
	d.DEPARTMENT_ID NOT IN (
	SELECT
		DISTINCT e.DEPARTMENT_ID
	FROM
		EMPLOYEES e
	WHERE
		e.DEPARTMENT_ID IS NOT NULL);

/**
 * Output employees info who are not manager.
 */
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	e.EMPLOYEE_ID NOT IN (
	SELECT
		DISTINCT e.MANAGER_ID
	FROM
		EMPLOYEES e
	WHERE
		e.MANAGER_ID IS NOT NULL);

/**
 * Output manager's info 
 * who has employee's count more than 6.
 */
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	(
	SELECT
		COUNT(*)
	FROM
		EMPLOYEES e2
	WHERE
		e.EMPLOYEE_ID = MANAGER_ID) > 6;

/**
	 * Output employee's info
	 * who worksin department IT.
	 */
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	e.DEPARTMENT_ID = (
	SELECT
		d.DEPARTMENT_ID
	FROM
		DEPARTMENTS d
	WHERE
		d.DEPARTMENT_NAME = 'IT');

/**
 * Output manager's names where manager is hired in 2005
 * and employees arehired before 2005. 
 */
SELECT
	*
FROM
	EMPLOYEES e2
WHERE
	e2.MANAGER_ID IN (
	SELECT
		EMPLOYEE_ID "Employee id"
	FROM
		EMPLOYEES e
	WHERE
		TO_CHAR(HIRE_DATE, 'YYYY') = '2005')
	AND HIRE_DATE < TO_DATE('01012005', 'DDMMYYYY');

/**
 * Output employee's info 
 * who has manager who is hired in January of any year
 * and their job title has length is more than 15.
 */
SELECT
	*
FROM
	EMPLOYEES e
WHERE
	e.MANAGER_ID IN (
	SELECT
		EMPLOYEE_ID
	FROM
		EMPLOYEES e
	WHERE
		TO_CHAR(HIRE_DATE, 'MM') = '01')
	AND (
	SELECT
		LENGTH(j.JOB_TITLE)
	FROM
		JOBS j
	WHERE
		j.JOB_ID = e.JOB_ID) > 15;
