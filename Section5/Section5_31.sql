SHOW DATABASES;

USE day_4_9_db;

SHOW TABLES;

# usersの定義
DESCRIBE users;

SELECT * FROM users LIMIT 10;

# = で絞り込む
SELECT * FROM users WHERE name = "奥村 成美"

SELECT * FROM users WHERE birth_place = "日本"

# 日本以外を抽出 実行順番 FROM → WHERE → ORDER BY → LIMIT
SELECT * FROM users WHERE birth_place<> "日本" ORDER BY age;

# 50代より大きい人を取り出せる
SELECT * FROM users WHERE age > 50 LIMIT 10;

# UPDATE 名前を変更
UPDATE users SET name="奥山 成美" WHERE id=1;

SELECT * FROM users WHERE id=1;

SELECT * FROM users ORDER BY id DESC LIMIT 1;

# 削除する
DELETE FROM users WHERE id=200;








