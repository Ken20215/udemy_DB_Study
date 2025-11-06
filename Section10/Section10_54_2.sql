USE day_4_9_db;

-- INTERSECT：重複を表示
SELECT * FROM new_students
INTERSECT
SELECT * FROM students;

-- EXCEPT: new_studentsに存在し、studentsには存在しない
SELECT * FROM new_students
EXCEPT 
SELECT * FROM students
ORDER BY id DESC;

-- EXCEPT: studentsに存在し、new_studentsには存在しない
SELECT * FROM students
EXCEPT 
SELECT * FROM new_students;

-- どちらかに存在
(SELECT * FROM new_students
INTERSECT
SELECT * FROM students)
UNION ALL 
(SELECT * FROM students
EXCEPT 
SELECT * FROM new_students)
ORDER BY id DESC;


SELECT * FROM students WHERE id<10
EXCEPT 
SELECT * FROM new_students WHERE id<10;
