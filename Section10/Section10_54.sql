USE day_4_9_db;
SHOW TABLES;

-- UNIONは重複を削除してくれる
SELECT * FROM new_students
UNION 
SELECT * FROM students;


-- UNION ALLは重複削除してくれない。ただつけるだけ。
SELECT * FROM new_students
UNION ALL
SELECT * FROM students
ORDER BY id;


SELECT id,name FROM students WHERE id < 10
UNION ALL 
SELECT id,name FROM students WHERE id > 250;


SELECT id,name FROM students WHERE id < 10
UNION
SELECT id,name FROM students WHERE id < 10;

