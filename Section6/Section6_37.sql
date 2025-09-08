-- LENGTH
SELECT LENGTH("ABC");
SELECT LENGTH("あいう"); -- 9バイト

SELECT name, LENGTH(name) FROM users;

-- CHAR_LENGTH
SELECT CHAR_LENGTH("ABC");
SELECT CHAR_LENGTH("あいう"); -- 3文字数

SELECT name, CHAR_LENGTH(name) FROM users;

-- TRIM, LTRIM, RTLIM　空白削除
SELECT LTRIM("  ABC  ")AS a;
SELECT RTRIM("  ABC  ")AS a;
SELECT TRIM("  ABC  ") AS a;

SELECT name, CHAR_LENGTH(name) AS name_lenght 
FROM employees 
WHERE CHAR_LENGTH(name) <> CHAR_LENGTH(TRIM(name));

-- UPDATEして空白を削除したものにする
UPDATE employees
SET name = TRIM(name)
WHERE CHAR_LENGTH(name) <> CHAR_LENGTH(TRIM(name));


-- REPLACE：置換
# 「i like an apple」のappleの箇所をlemonに置換
SELECT REPLACE("i like an apple","apple","lemon");
# テーブルの中にあるnameカラムで"Mrs"とついた名前の人を"Ms"に変更
-- SELECT REPLACE(name, "Mrs", "Ms") FROM users WHERE name LIKE "Mrs%"
# UPDATE ver
UPDATE users SET name = REPLACE(name, "Mrs", "Ms") WHERE name LIKE "Mrs%"

SELECT * FROM users;


-- UPPER, LOWER（大文字、小文字に変換する）
SELECT UPPER("apple");
SELECT LOWER("APPLE");
# テーブルの中のnameカラムを大文字、小文字に変換
SELECT name, UPPER(name), LOWER(name) FROM users;

-- SUBSTING 一部取り出し
# name カラムの 2文字目から3文字分 を切り出す
SELECT SUBSTRING(name, 2,3),name FROM employees;
# name の 2文字目を1文字だけ抽出。その結果が "田" と一致する行だけを抽出。つまり「名前の2文字目が田の人」を検索
SELECT * FROM employees WHERE SUBSTRING(name, 2,1) = "田";

-- REVERSE：逆順
# nameカラムを逆に
SELECT REVERSE(name), name FROM employees;

