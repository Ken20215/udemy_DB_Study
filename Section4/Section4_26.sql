# データベースの中身確認
SELECT DATABASE();

# データベース指定
use my_db;

# テーブルの作成
CREATE TABLE people (
id INT PRIMARY KEY,
name VARCHAR(50),
birth_day DATE DEFAULT "1990-01-01"
);

# INSERT 1
INSERT INTO people VALUES(1, "Taro", "2001-01-01");

# SELECT
SELECT * FROM people;

# INSERT カラム指定
INSERT INTO people(id, name) VALUES (2,"Jiro");

INSERT INTO people(id, name) VALUES (3,"Saburo");

# シングルクウォート
INSERT INTO people VALUES (4, 'John''s son', '2021-01-01');


