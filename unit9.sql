SELECT
	*
FROM
	EMPLOYEES e;

/**
 * Output information about salary group
 * that union manager id, job id and department id.
 */
SELECT
	MANAGER_ID "Manager id",
	TO_CHAR(NULL) "Job id",
	SUM(SALARY) "Salary",
	TO_NUMBER(NULL) "Department id"
FROM
	EMPLOYEES e
GROUP BY
	MANAGER_ID
UNION
SELECT
	TO_NUMBER(NULL),
	JOB_ID,
	SUM(SALARY) ,
	TO_NUMBER(NULL)
FROM
	EMPLOYEES e
GROUP BY
	JOB_ID
UNION 
SELECT
	TO_NUMBER(NULL),
	TO_CHAR(NULL),
	SUM(SALARY),
	DEPARTMENT_ID
FROM
	EMPLOYEES e2
GROUP BY
	DEPARTMENT_ID ;

/**
 * Output department id in which managers with id = 100 work
 * and managers with id = 145 or 201 don't work.
 */
SELECT
	DEPARTMENT_ID "Department id"
FROM
	EMPLOYEES e
WHERE
	MANAGER_ID = 100
MINUS 
SELECT
	DEPARTMENT_ID
FROM
	EMPLOYEES e2
WHERE
	MANAGER_ID = 145
	OR MANAGER_ID = 201;

/**
 * Output info employees in which first name has second letter is "a"
 * and last name has "s".
 */
SELECT
	FIRST_NAME "First name",
	LAST_NAME "Last name",
	SALARY "Salary"
FROM
	EMPLOYEES e
WHERE
	FIRST_NAME LIKE '%_a%'
INTERSECT 
SELECT
	FIRST_NAME,
	LAST_NAME,
	SALARY
FROM
	EMPLOYEES e
WHERE
	LOWER(LAST_NAME) LIKE '%s%'
ORDER BY
	SALARY DESC ;

/**
 * Output location's info which are located in Italy or Germany
 * and postal code has number 9.
 */
SELECT
	LOCATION_ID "Location id",
	POSTAL_CODE "Postal code",
	CITY "City"
FROM
	LOCATIONS l
WHERE
	COUNTRY_ID IN
(
	SELECT
		COUNTRY_ID
	FROM
		COUNTRIES c
	WHERE
		COUNTRY_NAME IN ('Italy', 'Germany'))
UNION ALL 
SELECT
	LOCATION_ID ,
	POSTAL_CODE ,
	CITY
FROM
	LOCATIONS l
WHERE
	POSTAL_CODE LIKE '%9%';

/**
 * Output uniq country's info
 * where length of country name is more than 8
 * and which are not inclided in Europe region.
 */
SELECT
	COUNTRY_ID "Country id",
	COUNTRY_NAME "Country name",
	REGION_ID "Region id"
FROM
	COUNTRIES c
WHERE
	LENGTH (COUNTRY_NAME) > 8
UNION 
SELECT
	*
FROM
	COUNTRIES c
WHERE
	REGION_ID != (
	SELECT
		REGION_ID
	FROM
		REGIONS r
	WHERE
		REGION_NAME = 'Europe')
ORDER BY
	COUNTRY_NAME DESC ;
