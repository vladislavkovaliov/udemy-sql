/**
 * Helpers 
 **/
SELECT
	*
FROM
	EMPLOYEES e;

SELECT
	*
FROM
	REGIONS r;

SELECT
	*
FROM
	DEPARTMENTS d ;

SELECT
	*
FROM
	LOCATIONS l ;

SELECT
	*
FROM
	COUNTRIES c ;

SELECT
	*
FROM
	JOBS j ;

/**
 * Output informations about regions 
 * and count of employees by each region name.
 */
SELECT
	region_name "Region name",
	COUNT(*) "Count of employee"
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	(d.DEPARTMENT_ID = e.DEPARTMENT_ID)
JOIN LOCATIONS l ON
	(l.LOCATION_ID = d.LOCATION_ID)
JOIN COUNTRIES c ON
	(c.COUNTRY_ID = l.COUNTRY_ID)
JOIN REGIONS r ON
	(r.REGION_ID = c.REGION_ID)
GROUP BY
	region_name;

SELECT
	region_name "Region name",
	COUNT(*) "Count of employee"
FROM
	EMPLOYEES e,
	DEPARTMENTS d,
	LOCATIONS l ,
	COUNTRIES c ,
	REGIONS r
WHERE
	(d.DEPARTMENT_ID = e.DEPARTMENT_ID
		AND l.LOCATION_ID = d.LOCATION_ID
		AND c.COUNTRY_ID = l.COUNTRY_ID
		AND r.REGION_ID = c.REGION_ID)
GROUP BY
	region_name;

/**
 * Output detailed information about each employee.
 */
SELECT
	e.FIRST_NAME "First name",
	e.LAST_NAME "Last name",
	e.JOB_ID "Job ID",
	d.DEPARTMENT_NAME "Department name",
	l.STREET_ADDRESS "Street name",
	c.COUNTRY_NAME "Country name",
	r.REGION_NAME "Region name"
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	(e.DEPARTMENT_ID = d.DEPARTMENT_ID)
JOIN LOCATIONS l ON
	(d.LOCATION_ID = l.LOCATION_ID)
JOIN COUNTRIES c ON
	(c.COUNTRY_ID = l.COUNTRY_ID)
JOIN REGIONS r ON
	(r.REGION_ID = c.REGION_ID);

/**
 * Output manager's name who has more than 6 employees
 * and output count of employees by manager.
 */
SELECT
	m.FIRST_NAME "First name",
	COUNT(*) "Count of employee"
FROM
	EMPLOYEES e
JOIN EMPLOYEES m ON
	(e.MANAGER_ID = m.MANAGER_ID)
GROUP BY
	m.FIRST_NAME
HAVING
	COUNT(*) > 6
ORDER BY
	2 DESC;

/**
 * Output department's names 
 * and count of employees if count is more than 30.
 */
SELECT
	d.DEPARTMENT_NAME "Department name" ,
	count(*) "Count of employees"
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d
		USING (department_id)
GROUP BY
	d.DEPARTMENT_NAME
HAVING
	count(*) > 30;

/**
 * Output department's names where is no employees.
 */
SELECT
	d.DEPARTMENT_NAME "Department name"
FROM
	EMPLOYEES e
RIGHT JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE
	e.FIRST_NAME IS NULL
GROUP BY
	d.DEPARTMENT_NAME
ORDER BY
	d.DEPARTMENT_NAME ASC;

SELECT
	d.DEPARTMENT_NAME "Department name"
FROM
	EMPLOYEES e,
	DEPARTMENTS d
WHERE
	(e.DEPARTMENT_ID (+) = d.DEPARTMENT_ID
		AND e.FIRST_NAME IS NULL);

/**
 * Output manager's names where manager is hired in 2005
 * and employees arehired before 2005. 
 */
SELECT
	*
FROM
	EMPLOYEES e
JOIN EMPLOYEES m ON
	(e.MANAGER_ID = m.MANAGER_ID)
WHERE
	TO_CHAR(m.HIRE_DATE, 'YYYY') = '2005'
	AND E.HIRE_DATE < TO_DATE('01-01-2005', 'DD-MM-YYYY');

/**
 * Output names of both coountries and regions.
 */
SELECT
	*
FROM
	COUNTRIES c NATURAL
JOIN REGIONS r;

/**
 * Output names of employee who have salary less than min salary + 1000.
 */
SELECT
	*
FROM
	EMPLOYEES e
JOIN JOBS j
		USING (JOB_ID)
WHERE
	e.SALARY < j.MIN_SALARY + 1000;

/**
 * Output names of employee, country name 
 * and info about employee and county which about no info.
 */
SELECT
	DISTINCT e.FIRST_NAME "First name",
	e.LAST_NAME "Last name",
	d.DEPARTMENT_NAME "Department name",
	c.COUNTRY_NAME "Country name"
FROM
	EMPLOYEES e
FULL OUTER JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
FULL OUTER JOIN LOCATIONS l ON
	(l.LOCATION_ID = d.LOCATION_ID)
FULL OUTER JOIN COUNTRIES c ON
	(c.COUNTRY_ID = l.COUNTRY_ID);

/**
 * Output names of employee and country name
 * using cross join
 */
SELECT
	e.FIRST_NAME "First name",
	e.LAST_NAME "Last name",
	c.COUNTRY_NAME "Country name"
FROM
	EMPLOYEES e
CROSS JOIN COUNTRIES c;
