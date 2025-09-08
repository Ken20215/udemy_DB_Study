SELECT * FROM customers WHERE name IS NULL;
SELECT * FROM customers WHERE name IN("河野 文典", "稲田 季雄") OR name IS NULL;

-- NOT IN
# OR の中で一つでも UNKNOWN がある場合、NOT をつけても結果は TRUE にならず、WHERE では行は選ばれません。
# 結論：リストに NULL があると、全ての行が除外される。
SELECT * FROM customers WHERE name NOT IN ("河野 文典", "稲田 季雄", NULL);
# IS NOT NULL をつけることで、NULL の行を除外し、比較可能な行だけを対象にできます。
# その上で、'河野 文典' と '稲田 季雄' 以外の名前を抽出。
SELECT * FROM customers WHERE name NOT IN ("河野 文典", "稲田 季雄") AND name IS NOT NULL;

# NULLはINの中で使用せず、外に出して記述しましょう。

-- ALL
# customersテーブルからid < 10の人の誕生日よりも古い誕生日の人をusersから取り出すSQL
# IS NOT NULLがないとNULLで引っ掛かり抽出されない
SELECT * FROM users WHERE birth_day <= ALL(SELECT birth_day FROM customers WHERE id < 10 AND birth_day IS NOT NULL);

SHOW TABLES;



