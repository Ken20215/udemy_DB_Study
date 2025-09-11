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


-- ORDER BYとCASEを組み合わせ
# CASEで分類し昇順・降順に並び替える
SELECT 
 *,
 CASE 
	WHEN name IN("香川県","愛媛県","徳島県","高知県") THEN "四国"
	WHEN name IN("兵庫県","大阪府","滋賀県","京都府","奈良県","三重県","和歌山県") THEN "近畿"
	ELSE "その他" END AS "地域名"
	FROM prefectures
ORDER BY
 CASE 
	WHEN name IN("香川県","愛媛県","徳島県","高知県") THEN "四国"
	WHEN name IN("兵庫県","大阪府","滋賀県","京都府","奈良県","三重県","和歌山県") THEN "近畿"
	ELSE "その他"
END DESC;

# 四国を一番最初に持ってくる
SELECT 
 *,
 CASE 
	WHEN name IN("香川県","愛媛県","徳島県","高知県") THEN "四国"
	WHEN name IN("兵庫県","大阪府","滋賀県","京都府","奈良県","三重県","和歌山県") THEN "近畿"
	ELSE "その他" END AS "地域名"
	FROM prefectures
ORDER BY
 CASE 
	WHEN name IN("香川県","愛媛県","徳島県","高知県") THEN 0
	WHEN name IN("兵庫県","大阪府","滋賀県","京都府","奈良県","三重県","和歌山県") THEN 1
	ELSE 2
END;


-- UPDATE + CASE
SELECT * FROM users;

ALTER TABLE users ADD birth_era VARCHAR(2) AFTER birth_day;

SELECT *,
CASE
	WHEN birth_day < "1989-01-07" THEN "昭和"
	WHEN birth_day < "2019-05-01" THEN "平成"
	WHEN birth_day >= "2019-05-01" THEN "令和"
	ELSE "不明"
	END AS "元号"
FROM users;


UPDATE users
SET birth_era = CASE
	WHEN birth_day < "1989-01-07" THEN "昭和"
	WHEN birth_day < "2019-05-01" THEN "平成"
	WHEN birth_day >= "2019-05-01" THEN "令和"
	ELSE "不明"
	END;

SELECT * FROM users;


-- NULLを使う場合
SELECT *,
CASE
	WHEN name IS NULL THEN "不明"
	ELSE ""
END AS "NULL CHECK"
FROM customers WHERE name IS NULL;



