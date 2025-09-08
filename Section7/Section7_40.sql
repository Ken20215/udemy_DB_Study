USE day_4_9_db;

SELECT DATABASE();

SHOW TABLES;

-- IF（条件式, 真の値, 偽の値）
SELECT IF (10 < 20, "真","偽");

SELECT * FROM users;

# 国籍カラムが日本なら、国籍というカラムを追加して日本人 or その他に分類する
SELECT *,IF(birth_place="日本","日本人","その他") AS "国籍" FROM users;
# 年齢カラムが20歳より若ければ未成人、上なら成人に分類する
SELECT name, age,IF(age < 20,"未成人", "成人") FROM users;

# テーブル変更
SELECT * FROM students;
# クラスNo6の方で、身長が170cm以上の人ならtrue、そうでないならfalseにして"その他"に分類する
SELECT *,IF(class_no=6 AND height > 170,"6組の170cm以上の人","その他") FROM students;
# 名前に"田"が含まれていればtrue、そうでないならfalseにして"その他"に分類する
SELECT *,IF(name LIKE "%田%","名前に田を含む","その他") AS name_check FROM students;


