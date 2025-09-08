SELECT DATABASE();

DESCRIBE customers;

# テーブルの中のnameというカラムの中に名前がない（不明）nullだけ取り出す
# IS NULLでないと取り出せない
SELECT * FROM customers WHERE name IS NULL;

SELECT NULL = NULL;
SELECT NULL IS NULL;

# テーブルの中のnameというカラムの中に名前がない（不明）nullじゃないものだけ取り出す
# IS NOT NULL
SELECT * FROM customers WHERE name IS NOT NULL;

SELECT * FROM prefectures;

# 空白の取り出し方(nullでない)
SELECT * FROM prefectures WHERE name = "";

# BETWEEN, NOT BETWEEN
# 年齢 (age) が 5歳から10歳の間ではないレコードを取得する
SELECT * FROM users WHERE age BETWEEN 5 AND 10;
SELECT * FROM users WHERE age NOT BETWEEN 5 AND 10;

# LIKE, NOT LIKE
SELECT * FROM users WHERE name LIKE "村%"; -- 前方一致
SELECT * FROM users WHERE name LIKE "%郎"; -- 後方一致
SELECT * FROM users WHERE name LIKE "%ed%"; -- 中間一致
SELECT * FROM prefectures WHERE name LIKE "%福_%" ORDER BY name; -- _は任意の1文字


