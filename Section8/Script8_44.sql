USE day_4_9_db;

SELECT DATABASE();

SHOW TABLES;

-- 問題1
# customersテーブルから、ageが28以上40以下でなおかつ、nameの末尾が「子」の人だけに絞り込んでください。
# そして、年齢で降順に並び替え、検索して先頭の5件の人のnameとageだけを表示してください。
SELECT * FROM customers;

SELECT name, age
FROM customers
WHERE age >= 28 AND age <= 40 AND name LIKE '%子'
ORDER BY age DESC
LIMIT 5;

-- 問題2
# receiptsテーブルに、「customer_idが100」「 store_nameがStore X」「priceが10000」のレコードを挿入してください。
DESCRIBE receipts;
SELECT * FROM receipts ORDER BY id DESC LIMIT 10;
INSERT INTO receipts VALUES(301, 100, "Store X", 10000);

-- 問題3
# 2で挿入したレコードを削除してください
SELECT * FROM receipts ORDER BY id DESC LIMIT 10;
DELETE FROM receipts WHERE id = 301;

-- 問題4
#  prefecturesテーブルから、nameが「空白もしくはNULL」のレコードを削除してください
SELECT * FROM prefectures;
DELETE FROM prefectures WHERE name IS NULL OR name = "";

-- 問題5
# customersテーブルのidが20以上50以下の人に対して、年齢を+1してレコードを更新してください(ただし、BETWEENを使うこと)
SELECT * FROM customers;
SELECT *,age + 1 FROM customers WHERE id BETWEEN 20 AND 50;
UPDATE customers SET age=age+1 WHERE id BETWEEN 20 AND 50;

-- 問題6
# studentsテーブルのclass_noが6の人すべてに対して、1～5のランダムな値でclass_noを更新してください
SELECT * FROM students;
UPDATE students 
SET class_no = FLOOR(RAND(id) * 5) + 1 
WHERE class_no = 6;

-- 問題7
# class_noが3または4の人をstudentsテーブルから取り出します。
# 取り出した人のheightに10を加算して、その加算した全値よりも、heightの値が小さくてclass_noが1の人をstudentsテーブルから取り出してください。
# (ただし、IN, ALLを使うこと)
SELECT * FROM students 
WHERE height < ALL (SELECT height+10 FROM students WHERE class_no IN(3,4))
AND class_no = 1;

-- 問題8
# employeesテーブルのdepartmentカラムには、「 営業部 」のような形で部署名の前後に空白が入っています。この空白を除いた形にテーブルを更新してください
SELECT * FROM employees;
UPDATE employees SET department = TRIM(department);


-- 問題9
# 9. employeesテーブルからsalaryが5000000以上の人のsalaryは0.9倍して、5000000未満の人のsalaryは1.1倍して下さい。
# (ただし、小数点以下は四捨五入します)
SELECT *,ROUND(salary*1.1) FROM employees WHERE salary < 5000000;
SELECT *,
CASE 
	WHEN salary >= 5000000 THEN ROUND (salary * 0.9)
	WHEN salary < 5000000 THEN ROUND (salary * 1.1)
END AS new_salary
FROM employees;

UPDATE employees
SET salary=CASE 
	WHEN salary >= 5000000 THEN ROUND (salary * 0.9)
	WHEN salary < 5000000 THEN ROUND (salary * 1.1)
END;
SELECT * FROM employees;

-- 問題10
# 10. customersテーブルにnameが「名無権兵衛」、ageが0、birth_dayが本日日付の人を挿入してください。 （ただし、日付関数を使うこと）
SELECT * FROM customers;

SHOW CREATE TABLE customers;
ALTER TABLE customers
MODIFY id INT NOT NULL AUTO_INCREMENT;

INSERT INTO customers (name, age, birth_day)
VALUES ('名無権兵衛', 0, CURDATE());

-- 問題11
# 11. customersテーブルに新たなカラムとして、「name_length INT」を作成します。name_lengthカラムをcustomersテーブルの各行の名前の文字数でアップデートしてください
SELECT * FROM customers;
ALTER TABLE customers ADD name_length INT;
SELECT *,CHAR_LENGTH(name) FROM customers;
UPDATE customers SET name_length = CHAR_LENGTH(name);

-- 問題12
# 12. tests_scoreテーブルに新たなカラムとして、「score INT」を作成します。
# scoreカラムに、testsテーブルの各行のtest_score_1, test_score_2, test_score_3から、取り出したNULLでない最初の値で更新します。
# ただし取り出したtest_score_〇が、900以上の人は1.2倍して小数点以下を切り捨てて、600以下の人は0.8倍して小数点以下を切り上げてください。

ALTER TABLE tests_score
ADD COLUMN score INT;

UPDATE tests_score
SET score = CASE
    WHEN COALESCE(test_score_1, test_score_2, test_score_3) >= 900
         THEN FLOOR(COALESCE(test_score_1, test_score_2, test_score_3) * 1.2)
    WHEN COALESCE(test_score_1, test_score_2, test_score_3) <= 600
         THEN CEILING(COALESCE(test_score_1, test_score_2, test_score_3) * 0.8)
    ELSE COALESCE(test_score_1, test_score_2, test_score_3)
END;

SELECT id, test_score_1, test_score_2, test_score_3, score
FROM tests_score;


-- 問題13 
# 13. employeesテーブルを、 departmentが、マーケティング部 、研究部、開発部、総務部、営業部、経理部の順になるように並び替えて表示してください。

SELECT * 
FROM employees
ORDER BY
  CASE department
    WHEN 'マーケティング部' THEN 1
    WHEN '研究部' THEN 2
    WHEN '開発部' THEN 3
    WHEN '総務部' THEN 4
    WHEN '営業部' THEN 5
    WHEN '経理部' THEN 6
    ELSE 7
  END;