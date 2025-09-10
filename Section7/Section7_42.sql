USE day_4_9_db;

SELECT DATABASE();

SHOW TABLES;

SELECT * FROM users;


-- case
# birth_placeカラムが日本なら日本人、そうでないなら外国人にして国籍カラムを追加し、更にidが30以上の人だけ表示する
SELECT 
 *,
 CASE birth_place
 WHEN "日本" THEN "日本人"
 WHEN "iraq" THEN "イラク人"
 WHEN "Andorra" THEN "アンドラ人"
 ELSE  "外国人"
 END AS "国籍"
 FROM users
WHERE id>30;

SELECT * FROM prefectures;

# caseは条件を複数指定することができます
SELECT 
name,
case 
	WHEN name IN("香川県","愛媛県","徳島県","高知県") THEN "四国"
	WHEN name IN("兵庫県","大阪府","滋賀県","京都府","奈良県","三重県","和歌山県") THEN "近畿"
	ELSE "その他"
END AS "地域"
FROM 
 prefectures;

-- 計算
# 
SELECT 
 name,
 birth_day,
 case 
 	WHEN DATE_FORMAT(birth_day, "%Y") % 4 = 0 AND DATE_FORMAT(birth_day, "%Y") % 100 <> 0 THEN "うるう年"
 	ELSE "うるう年でない"
 END AS "うるう年か"
FROM users;


SELECT 
 *,
 case 
 	WHEN student_id % 3 = 0 THEN test_score_1
 	WHEN student_id % 3 = 1 THEN test_score_2
 	WHEN student_id % 3 = 2 THEN test_score_3
 END AS score
FROM tests_score;

