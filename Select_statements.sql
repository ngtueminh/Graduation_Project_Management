--2.4: Calculate the number of topics for review and the number of topics for committee members for each Teacher
SELECT MSGV, COUNT(MSDT) AS SLPB
FROM GV_PBDT
GROUP BY MSGV 

SELECT MSGV, COUNT(MSDT) AS SLUV
FROM GV_UVDT
GROUP BY MSGV 

SELECT GIAOVIEN.MSGV,TENGV, COUNT(DISTINCT GV_PBDT.MSDT) AS SLPB ,COUNT(DISTINCT GV_UVDT.MSDT) AS SLUV
FROM GIAOVIEN, GV_PBDT, GV_UVDT
WHERE GIAOVIEN.MSGV = GV_PBDT.MSGV AND GIAOVIEN.MSGV = GV_UVDT.MSGV
GROUP BY GIAOVIEN.MSGV,TENGV
-- 2.5: Print out the list of students with the highest average score
SELECT MSSV, MSDT, DBO.DTB_DT(MSDT)AS KQ
FROM SV_DETAI
GROUP BY MSSV, MSDT

SELECT SINHVIEN.MSSV, SINHVIEN.TENSV
FROM SINHVIEN
WHERE MSSV IN 
	(SELECT MSSV 
	FROM 
		(SELECT MSSV, MSDT, DBO.DTB_DT(MSDT)AS KQ
		FROM SV_DETAI
		GROUP BY MSSV, MSDT
		) AS A
	WHERE A.KQ = (
		SELECT MAX(DBO.DTB_DT(MSDT))
		FROM SV_DETAI
	))