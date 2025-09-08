SELECT DATABASE();

use my_db;

SHOW TABLES;

# 全レコード、全カラムを表示
SELECT * FROM people;

# カラム一部抜粋
SELECT name,id,birth_day FROM people;

SELECT id AS "番号", name AS "名前" FROM people;

# WHERE句
SELECT * FROM people WHERE id = 4;

# UPDATE文 データ更新
UPDATE people SET birth_day="1900-01-01", name = "";

SELECT * FROM people;

# UPDATE WHERE 特定の条件合致でデータ更新
UPDATE people SET name = "Taro", birth_day="2000-01-01" WHERE id = 3;

UPDATE people SET name = "Jiro", birth_day="2000-01-01" WHERE id>4;  

# DELETE: レコード削除
DELETE FROM people WHERE id > 4;

#全削除
DELETE FROM people;


