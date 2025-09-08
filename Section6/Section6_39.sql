-- ROUND, FLOOR, CEILING
SELECT ROUND(13.14, -1); #　四捨五入
SELECT FLOOR(3.14); # 切り捨て 
SELECT CEILING(3.14); # 切り上げ
SELECT RAND(); # 0から1の間のランダムな小数を生成
SELECT FLOOR(RAND() * 10); # 0から10の間のランダムな小数を生成

-- POWER
# 3の4乗を計算
SELECT POWER(3,4);
# 任意の数の累乗を計算
SELECT weight / POWER(height/100,2)AS BMI FROM students;
SELECT * FROM students;

-- COALESCE: NULLでない値を最初に返す
SELECT * FROM tests_score;
SELECT COALESCE(NULL,NULL,NULL,"A",NULL,"B");
# NULLでない値を表示させる
SELECT COALESCE(test_score_1,test_score_2,test_score_3) AS score FROM tests_score;
SELECT COALESCE(test_score_1,test_score_2,test_score_3), test_score_1,test_score_2,test_score_3 AS score FROM tests_score;
