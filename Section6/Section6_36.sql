SELECT age,age+3 AS age_3 FROM users LIMIT 10;
SELECT 10 - 5;
SELECT age-1 AS age_1 FROM users;
SELECT birth_day, birth_day+2 FROM users;

SELECT * FROM employees;

# 給料に1.1をかけて算出し、カラム名を変更し表示
SELECT department, name, salary, salary *1.1 AS salary_next_year FROM employees;

SELECT salary / 10 FROM employees;

SELECT age % 12 FROM users;


-- CONCAT（文字の連結）
SELECT CONCAT(department, ":", name) AS "部署:名前" FROM employees;
# 名前(年齢)としてカラム表示を行う
SELECT CONCAT(name, "(",age,")") AS "名前(年齢)" FROM users;

-- NOW, CURDATE, DATE_FORMAT
# 現在時刻
SELECT NOW();
SELECT NOW(), name, age FROM users;
# 日付（今日の日付）
SELECT CURDATE();
# 日付の表示形式を指定
SELECT DATE_FORMAT(NOW(), "%Y/%m/%d/%H");





