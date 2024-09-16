﻿use QLGiaoVien
go

----------27---------
SELECT COUNT(*) AS SoLuongGiaoVien, SUM(GV.LUONG)
FROM GIAOVIEN GV


--------28--------
SELECT COUNT(*) AS SoLuongGiaoVien, AVG(GV.LUONG) AS LuongTB
FROM GIAOVIEN GV
GROUP BY GV.MABM


-------29---------
SELECT CD.TENCD, COUNT(DT.MADT) AS SoLuongDeTai
FROM CHUDE CD
INNER JOIN DETAI DT ON CD.MACD = DT.MACD
GROUP BY CD.TENCD



-------30----------
SELECT GV.HOTEN, COUNT(DISTINCT PC.MADT) AS SoLuongDeTai
FROM GIAOVIEN GV, THAMGIADT PC
WHERE GV.MAGV = PC.MAGV
GROUP BY GV.HOTEN


-------31-----------
SELECT GV.HOTEN, COUNT(*) AS SoLuongDeTaiCN
FROM GIAOVIEN GV, DETAI DT
WHERE GV.MAGV = DT.GVCNDT
GROUP BY GV.HOTEN


-------32----------
SELECT GV.HOTEN, COUNT(*) SoLuongNguoiThan
FROM GIAOVIEN GV, NGUOITHAN NT
WHERE GV.MAGV = NT.MAGV
GROUP BY GV.HOTEN


-------33---------
SELECT GV.HOTEN
FROM GIAOVIEN GV, THAMGIADT PC
WHERE GV.MAGV = PC.MAGV
GROUP BY GV.HOTEN
HAVING COUNT(DISTINCT PC.MADT) >= 3


----------34---------
SELECT COUNT(DISTINCT PC.MAGV) AS SoLuongGiaoVien
FROM GIAOVIEN GV
INNER JOIN THAMGIADT PC ON GV.MAGV = PC.MAGV
INNER JOIN DETAI DT ON PC.MADT = DT.MADT
WHERE DT.TENDT = N'HTTT quản lý giáo vụ cho một Khoa'
