SELECT DATABASE();
SHOW DATABASES;
USE my_db;

# テーブル一覧
SHOW TABLES;
# テーブル名変更（RENAME TO）
ALTER  TABLE users RENAME TO users_table;
# カラムの削除（DROP COLUMN）
DESCRIBE users_table;

ALTER TABLE users_table DROP COLUMN message;

# カラムの追加（ADD）
ALTER TABLE users_table ADD post_code CHAR(8);

ALTER TABLE users_table ADD gender CHAR(1) AFTER age;

# 一番最初のカラムに追加
ALTER TABLE users_table ADD new_id INT FIRST;

# カラム削除
ALTER TABLE users_table DROP COLUMN new_id ;

# カラムの定義変更
ALTER TABLE users_table MODIFY name VARCHAR(50);

#　カラム名変更
ALTER TABLE users_table CHANGE COLUMN name 名前 VARCHAR(50);

# カラム位置変更
ALTER TABLE users_table CHANGE COLUMN gender gender CHAR(1) AFTER post_code;

#主キーの削除
ALTER TABLE users_table DROP PRIMARY KEY;

DESCRIBE users_table;
