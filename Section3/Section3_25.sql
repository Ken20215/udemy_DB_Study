-- データベース作成（まだなら）
CREATE DATABASE my_db;

-- 使用するDBを選択
USE my_db;

-- テーブル作成
CREATE TABLE students (
    id INT PRIMARY KEY,
    name CHAR(10)
);

-- 確認
SHOW TABLES;

-- データ挿入
INSERT INTO students VALUES (1, "ABCDEF   ");

-- 中身を確認
SELECT * FROM students;

ALTER TABLE students MODIFY name VARCHAR(10);

INSERT INTO students VALUES (2,"ABCDEF  ");

SELECT * FROM students;

# name,nameの文字の数を表示
SELECT name, CHARACTER_LENGTH(name)FROM students;