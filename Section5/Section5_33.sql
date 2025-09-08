-- IN 
# 12歳、24歳、36歳だけを取り出す
SELECT * FROM users WHERE age IN(12,24,36);
# ポーランド、フランス、イタリアだけを取り出す
SELECT * FROM users WHERE birth_place IN("Poland","France","Italy");
# ポーランド、フランス、イタリア以外を取り出す
SELECT * FROM users WHERE birth_place NOT IN("Poland","France","Italy");

-- SELECT + IN
SELECT * FROM customers WHERE id IN(SELECT customer_id FROM receipts);
SELECT * FROM customers WHERE id NOT IN(SELECT customer_id FROM receipts WHERE id<10);

-- ALL, ANY
# employeesテーブルのカラム給与が 5,000,000 を超える従業員の中で、最も年上よりも年上のユーザーを users テーブルから取得する
SELECT age FROM users WHERE age > ALL(SELECT age FROM employees WHERE salary > 5000000);
# employeesテーブルのカラム給与が 5,000,000 を超える従業員の中で、誰か1人よりも年上のユーザーを users テーブルから取得する
SELECT age FROM users WHERE age = ANY(SELECT age FROM employees WHERE salary > 5000000);

-- AND, OR
SELECT * FROM employees;
# 営業部の中の名前に"田"と"ついた人を抽出する
SELECT * FROM employees WHERE department = " 営業部 " AND name LIKE "%田%"
# 営業部の中の名前に"田"と"ついた人と年齢が35歳以下の人を抽出する
SELECT * FROM employees WHERE department = " 営業部 " AND name LIKE "%田%" AND age < 35
# 営業部の中の名前に"田"と"西"がついた人と年齢が35歳以下の人を抽出する
SELECT * FROM employees WHERE department = " 営業部 " AND (name LIKE "%田%" OR name LIKE "%西%")AND age < 35
# 営業部と開発部だけ取り出す
SELECT * FROM employees WHERE department IN(" 営業部 ", " 開発部 ")

-- NOT
# 営業部以外を取り出す
SELECT * FROM employees WHERE NOT department = " 営業部 "




