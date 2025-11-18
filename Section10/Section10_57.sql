USE day_4_9_db;
SHOW TABLES;


SELECT * FROM users;

-- HAVING
SELECT department, AVG(salary) FROM employees
GROUP BY department 
HAVING AVG(salary) > 3980000;

SELECT birth_place, age, COUNT(*) FROM users
GROUP BY birth_place ,age
HAVING  COUNT(*)>1
ORDER BY COUNT(*);

