create database QLBH
use QLBH
set dateformat DMY
CREATE TABLE KHACHHANG
(
	MAKH char(4) primary key,
	HOTEN varchar(24),
	DIACHI varchar(50),
	SDT varchar(10),
	NGSINH datetime,
	NGAYDK datetime,
	DOANHSO MONEY
)
CREATE TABLE NHANVIEN
(
	MANV CHAR(4) PRIMARY KEY,
	HOTEN char (20) ,
	NGVL datetime,
	SODT varchar(10)
)
CREATE TABLE HOADON
(
	SOHD int primary key,
	NGHD datetime,
	MAKH char(4) references KHACHHANG(MAKH),
	MANV char(4) references NHANVIEN(MANV),
	TRIGIA money
)
CREATE TABLE SANPHAM
(
	MASP varchar(4) primary key,
	TENSP varchar(20),
	DVT varchar(20),
	NUOCSX varchar(20),
	GIA MONEY
)
CREATE TABLE CTHD
(
	SOHD int references HOADON(SOHD),
	MASP varchar(4) references SANPHAM(MASP),
	SL int
)
ALTER TABLE SANPHAM
ADD GHICHU varchar(20);
ALTER TABLE KHACHHANG 
ADD LOAIKH tinyint;
ALTER TABLE SANPHAM
ALTER COLUMN GHICHU varchar(100);
AlTER TABLE SANPHAM
DROP COLUMN GHICHU;
ALTER TABLE KHACHHANG
ALTER COLUMN LOAIKH varchar(40);
ALTER TABLE KHACHHANG
alter column LOAIKH SET DEFAULT 'WWS';
ALTER TABLE SANPHAM
ADD CHECK (DVT='cay' OR DVT='cai' OR DVT='quyen' OR DVT='chuc' OR DVT='hop');
ALTER TABLE SANPHAM
ADD CHECK (GIA >=500);
ALTER TABLE CTHD
ADD CHECK (SL>=1);
ALTER TABLE KHACHHANG
ADD CHECK(NGAYDK >NGSINH);
/*ALTER TABLE HOADON
ADD CHECK(HOADON.NGHD>(SELECT NGAYDK FROM (SELECT MAKH FROM KHACHHANG)) ;
ALTER TABLE HOADON
*/
ALTER TABLE KHACHHANG
ALTER COLUMN HOTEN VARCHAR(40);
ALTER TABLE KHACHHANG
ALTER COLUMN DIACHI VARCHAR(100)
ALTER TABLE KHACHHANG
ALTER COLUMN SDT VARCHAR(20);

insert into KHACHHANG values ('KH01','Nguyen Van A','731, Tran Hung Dao, Q 5, Tp HCM','08823451','22/10/1960','22/10/2006',13000000,'VIP')
insert into KHACHHANG values ('KH02','Tran Ngoc Han','23/5, Nguyen Trai, Q 5, Tp HCM','0908256478','03/04/1974','30/07/2006',280000,'NORMAL')
insert into KHACHHANG values ('KH03','Tran Ngoc Linh','45, Nguyen Canh Chan, Q 1, Tp HCM','0938776266','12/06/1980','05/08/2006',3860000,'KING')
insert into KHACHHANG values ('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q 10, Tp HCM','0917325476','09/03/1965','02/10/2006',250000,'')
insert into KHACHHANG values ('KH05','Le Nhat Minh','34, Truong Dinh, Q 3, Tp HCM','08246108','10/03/1950','28/10/2006',21000,'')
insert into KHACHHANG values ('KH06','Le Hoai Thuong','227, Nguyen Van Cu, Q 5, Tp HCM','08631738','31/12/1981','24/11/2006',915000,'')
insert into KHACHHANG values ('KH07','Nguyen Van Tam','32/3, Tran Binh Trong, Q 5, Tp HCM','0916783565','06/04/1971','01/12/2006',12500,'')
insert into KHACHHANG values ('KH08','Phan Thi Thanh','45/2, An Duong Vuong, Q 5, Tp HCM','0938435756','10/01/1971','13/12/2006',365000,'')
insert into KHACHHANG values ('KH09','Le Ha Vinh','873, Le Hong Phong, Q 5, Tp HCM','08654763','03/09/1979','14/01/2007',70000,'')
insert into KHACHHANG values ('KH10','Ha Duy Lap','34/34B, Nguyen Trai, Q 1, Tp HCM','08768904','02/05/1983','16/01/2007',67500,'')	
SELECT * FROM KHACHHANG
insert into NHANVIEN values ('NV01','Nguyen Nhu Nhut','0927345678','13/04/2006')
insert into NHANVIEN values ('NV02','Le Thi Phi Yen','0987567390','21/04/2006')
insert into NHANVIEN values ('NV03','Nguyen Van B','0997047382','27/04/2006')
insert into NHANVIEN values ('NV04','Ngo Thanh Tuan','0913758498','24/06/2006')
insert into NHANVIEN values ('NV05','Nguyen Thi Truc Thanh','0918590387','20/07/2006')
SELECT* FROM NHANVIEN
ALTER TABLE NHANVIEN 
DROP COLUMN NGVL;
ALTER TABLE NHANVIEN 
ADD NGVL DATETIME;
SELECT * FROM NHANVIEN WHERE MONTH(NGVL)>4
ALTER TABLE NHANVIEN 
ALTER COLUMN HOTEN VARCHAR(30);
UPDATE  NHANVIEN 
SET SODT='1234567891'
WHERE MANV='NV04';
insert into SANPHAM values ('BC01','But chi','cay','Singapore',3000)
insert into SANPHAM values ('BC02','But chi','cay','Singapore',5000)
insert into SANPHAM values ('BC03','But chi','cay','Viet Nam',3500)
insert into SANPHAM values ('BC04','But chi','hop','Viet Nam',30000)
insert into SANPHAM values ('BB01','But bi','cay','Viet Nam',5000)
insert into SANPHAM values ('BB02','But bi','cay','Trung Quoc',7000)
insert into SANPHAM values ('BB03','But bi','hop','Thai Lan',100000)
insert into SANPHAM values ('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into SANPHAM values ('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into SANPHAM values ('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into SANPHAM values ('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into SANPHAM values ('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into SANPHAM values ('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into SANPHAM values ('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into SANPHAM values ('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into SANPHAM values ('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into SANPHAM values ('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into SANPHAM values ('ST04','So tay ','quyen','Thai Lan',55000)
insert into SANPHAM values ('ST05','So tay mong','quyen','Thai Lan',20000)
insert into SANPHAM values ('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into SANPHAM values ('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into SANPHAM values ('ST08','Bong bang','cai','Viet Nam',1000)
insert into SANPHAM values ('ST09','But long','cay','Viet Nam',5000)
insert into SANPHAM values ('ST10','But long','cay','Trung Quoc',7000)
SELECT* FROM SANPHAM
DELETE FROM SANPHAM
ALTER TABLE SANPHAM
ADD CHECK (DVT='cay' OR DVT='cai' OR DVT='quyen' OR DVT='chuc' OR DVT='hop');
insert into HOADON values (1001,'7/23/2006','KH01','NV01',320000)
insert into HOADON values (1002,'8/12/2006','KH01','NV02',840000)
insert into HOADON values (1003,'8/23/2006','KH02','NV01',100000)
insert into HOADON values (1004,'9/1/2006','KH02','NV01',180000)
insert into HOADON values (1005,'10/20/2006','KH01','NV02',3800000)
insert into HOADON values (1006,'10/16/2006','KH01','NV03',2430000)
insert into HOADON values (1007,'10/28/2006','KH03','NV03',510000)
insert into HOADON values (1008,'10/28/2006','KH01','NV03',440000)
insert into HOADON values (1009,'10/28/2006','KH03','NV04',200000)
insert into HOADON values (1010,'11/1/2006','KH01','NV01',5200000)
insert into HOADON values (1011,'11/4/2006','KH04','NV03',250000)
insert into HOADON values (1012,'11/30/2006','KH05','NV03',21000)
insert into HOADON values (1013,'12/12/2006','KH06','NV01',5000)
insert into HOADON values (1014,'12/31/2006','KH03','NV02',3150000)
insert into HOADON values (1015,'1/1/2007','KH06','NV01',910000)
insert into HOADON values (1016,'1/1/2007','KH07','NV02',12500)
insert into HOADON values (1017,'1/2/2007','KH08','NV03',35000)
insert into HOADON values (1018,'1/13/2007','KH08','NV03',330000)
insert into HOADON values (1019,'1/13/2007','KH01','NV03',30000)
insert into HOADON values (1020,'1/14/2007','KH09','NV04',70000)
insert into HOADON values (1021,'1/16/2007','KH10','NV03',67500)
insert into HOADON values (1022,'1/16/2007',null,'NV03',7000)
insert into HOADON values (1023,'1/17/2007',null,'NV01',330000)
DELETE FROM HOADON
SELECT *FROM HOADON
insert into CTHD values (1001,'TV02',10)
insert into CTHD values (1001,'ST01',5)
insert into CTHD values (1001,'BC01',5)
insert into CTHD values (1001,'BC02',10)
insert into CTHD values (1001,'ST08',10)
insert into CTHD values (1002,'BC04',20)
insert into CTHD values (1002,'BB01',20)
insert into CTHD values (1002,'BB02',20)
insert into CTHD values (1003,'BB03',10)
insert into CTHD values (1004,'TV01',20)
insert into CTHD values (1004,'TV02',20)
insert into CTHD values (1004,'TV03',20)
insert into CTHD values (1004,'TV04',20)
insert into CTHD values (1005,'TV05',50)
insert into CTHD values (1005,'TV06',50)
insert into CTHD values (1006,'TV07',20)
insert into CTHD values (1006,'ST01',30)
insert into CTHD values (1006,'ST02',10)
insert into CTHD values (1007,'ST03',10)
insert into CTHD values (1008,'ST04',8)
insert into CTHD values (1009,'ST05',10)

insert into CTHD values (1010,'TV07',50)
insert into CTHD values (1010,'ST07',50)
insert into CTHD values (1010,'ST08',100)
insert into CTHD values (1010,'ST04',50)
insert into CTHD values (1010,'TV03',100)
insert into CTHD values (1011,'ST06',50)
insert into CTHD values (1012,'ST07',3)
insert into CTHD values (1013,'ST08',5)
insert into CTHD values (1014,'BC02',80)
insert into CTHD values (1014,'BB02',100)
insert into CTHD values (1014,'BC04',60)
insert into CTHD values (1014,'BB01',50)
insert into CTHD values (1015,'BB02',30)
insert into CTHD values (1015,'BB03',7)
insert into CTHD values (1016,'TV01',5)
insert into CTHD values (1017,'TV02',1)
insert into CTHD values (1017,'TV03',1)
insert into CTHD values (1017,'TV04',5)
insert into CTHD values (1018,'ST04',6)
insert into CTHD values (1019,'ST05',1)
insert into CTHD values (1019,'ST06',2)
insert into CTHD values (1020,'ST07',10)
insert into CTHD values (1021,'ST08',5)
insert into CTHD values (1021,'TV01',7)
insert into CTHD values (1021,'TV02',10)
insert into CTHD values (1022,'ST07',1)
insert into CTHD values (1023,'ST04',6)
insert into NHANVIEN values ('NV01','Nguyen Nhu Nhut','0927345678','13/04/2006')
insert into NHANVIEN values ('NV02','Le Thi Phi Yen','0987567390','21/04/2006')
insert into NHANVIEN values ('NV03','Nguyen Van B','0997047382','27/04/2006')
insert into NHANVIEN values ('NV04','Ngo Thanh Tuan','0913758498','24/06/2006')
insert into NHANVIEN values ('NV05','Nguyen Thi Truc Thanh','0918590387','20/07/2006')
SELECT MASP,TENSP FROM SANPHAM WHERE NUOCSX='Trung Quoc';
SELECT MASP, TENSP FROM SANPHAM WHERE MASP LIKE ('B%01');
/*CAU 4*/
SELECT MASP, TENSP FROM SANPHAM WHERE (GIA>30000 AND GIA <40000);
SELECT SOHD, TRIGIA FROM HOADON WHERE (NGHD>'1/1/2007' AND NGHD <'2/1/2007')
--cau 5
SELECT MASP, TENSP FROM SANPHAM WHERE NUOCSX ='Trung Quoc' or NUOCSX='Thai Lan';
--cau 6
SELECT SOHD,TRIGIA FROM HOADON WHERE NGHD='1/1/2007' or NGHD='1/2/2007'
--cau 7
SELECT SOHD,TRIGIA FROM HOADON WHERE month(NGHD)='1' and year(NGHD)='2007' 
ORDER BY NGHD asc, TRIGIA desc;
--cau 8
SELECT KHACHHANG.MAKH, HOTEN FROM KHACHHANG INNER JOIN HOADON on KHACHHANG.MAKH=HOADON.MAKH where NGHD='1/1/2007'
--cau 9
SELECT HOADON.SOHD, TRIGIA FROM KHACHHANG INNER JOIN HOADON on KHACHHANG.MAKH=HOADON.MAKH where NGHD='10/28/2006'and HOTEN='Nguyen Van B'
--Cau 10 
SELECT SANPHAM.MASP,TENSP from ((KHACHHANG INNER JOIN HOADON on HOADON.MAKH=KHACHHANG.MAKH)INNER JOIN CTHD on CTHD.SOHD=HOADON.SOHD)INNER JOIN SANPHAM on SANPHAM.MASP=CTHD.MASP
where HOTEN='Nguyen Van A' and month(NGHD)=10 and year(NGHD)=2006
--cau 11
SELECT SOHD from CTHD where MASP='BB01'or MASP='BB02';
--Cau 12
SELECT SOHD from CTHD where MASP='BB01'or MASP='BB02'and SL>10 and SL<20;
--Cau 13
SELECT distinct SOHD from CTHD where MASP='BB01' and SL>10 and SL<=20 and  EXISTS (
SELECT distinct SOHD from CTHD where MASP='BB02' and SL>10 and SL<=20)
--CAU14
SELECT DISTINCT SP.MASP,SP.TENSP 
FROM SANPHAM SP
WHERE NUOCSX='Trung Quoc' OR EXISTS(
SELECT * FROM SANPHAM SP1,HOADON HD,CTHD
WHERE SP1.MASP=CTHD.MASP AND HD.SOHD=CTHD.SOHD AND HD.NGHD='1/1/2007')
--CAU 15
SELECT DISTINCT SP.MASP,SP.TENSP 
FROM SANPHAM SP
WHERE  NOT EXISTS(
SELECT * FROM SANPHAM SP1,HOADON HD,CTHD
WHERE (SP1.MASP=CTHD.MASP) AND (HD.SOHD=CTHD.SOHD)AND SP.MASP=SP1.MASP)
insert into SANPHAM values ('SD15','But long','cay','Trung Quoc',7000)
--CAU16
SELECT DISTINCT SP.MASP,SP.TENSP 
FROM SANPHAM SP
WHERE  NOT EXISTS(
SELECT * FROM SANPHAM SP1,HOADON HD,CTHD
WHERE (SP1.MASP=CTHD.MASP) AND (HD.SOHD=CTHD.SOHD)AND SP.MASP=SP1.MASP AND YEAR(HD.NGHD)=2016 )

--CAU17
SELECT DISTINCT SP.MASP,SP.TENSP 
FROM SANPHAM SP
WHERE SP.NUOCSX='Trung Quoc'AND NOT EXISTS(
SELECT * FROM SANPHAM SP1,HOADON HD,CTHD
WHERE (SP1.MASP=CTHD.MASP) AND (HD.SOHD=CTHD.SOHD)AND SP.MASP=SP1.MASP AND YEAR(HD.NGHD)=2016 )
--CAU18
SELECT HD.SOHD 
FROM HOADON HD
WHERE NOT EXISTS(
SELECT* FROM SANPHAM SP
WHERE SP.NUOCSX='Singapore'
AND NOT EXISTS(
SELECT * 
FROM CTHD
WHERE 
CTHD.MASP=SP.MASP AND CTHD.SOHD=HD.SOHD AND HD.NGHD=2006 ))
--Cau20
SELECT COUNT(*) 
FROM HOADON 
WHERE MAKH NOT IN (
SELECT MAKH 
FROM KHACHHANG KH
WHERE KH.MAKH=HOADON.MAKH)
--Cau21
select COUNT(DISTINCT MASP)AS SOSANPHAM
FROM CTHD,HOADON
WHERE CTHD.SOHD=HOADON.SOHD AND YEAR(HOADON.NGHD)=2016
--CAU22
SELECT MAX(TRIGIA) AS MAX ,MIN(TRIGIA) AS MIN
FROM HOADON 
--CAU23
SELECT AVG(TRIGIA)AS TB
FROM HOADON
WHERE YEAR(NGHD)=2006
--CAU24
SELECT SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD)=2006
--CAU25
SELECT SOHD
FROM HOADON
WHERE YEAR(NGHD)=2006 AND TRIGIA=(SELECT MAX(TRIGIA) FROM HOADON)
--CAU26
SELECT HOTEN 
FROM KHACHHANG KH,HOADON HD
WHERE KH.MAKH=HD.MAKH AND HD.TRIGIA IN 
(
	SELECT TRIGIA 
	FROM HOADON
	WHERE TRIGIA=(SELECT MAX(TRIGIA) FROM HOADON)
)
--CAU27
SELECT TOP 3 MAKH,HOTEN
FROM KHACHHANG
ORDER BY DOANHSO ASC
--CAU28
SELECT MASP,TENSP
FROM SANPHAM
WHERE GIA IN (
SELECT TOP 3 GIA 
FROM SANPHAM
ORDER BY GIA DESC)
--CAU29
SELECT MASP,TENSP
FROM SANPHAM
WHERE SANPHAM.NUOCSX='Thai Lan' AND GIA IN (
SELECT TOP 3 GIA 
FROM SANPHAM
ORDER BY GIA DESC)
--CAU30
SELECT MASP,TENSP
FROM SANPHAM
WHERE SANPHAM.NUOCSX='Trung Quoc' AND GIA IN (
SELECT TOP 3 GIA 
FROM SANPHAM
ORDER BY GIA DESC)
--CAU31
SELECT TOP 3 MAKH,HOTEN
FROM KHACHHANG 
ORDER BY DOANHSO DESC
--CAU32
SELECT COUNT(DISTINCT MASP)
FROM SANPHAM 
WHERE NUOCSX='Trung Quoc'

-- CAU 33
SELECT COUNT(DISTINCT MASP) AS TONGSP,NUOCSX 
FROM SANPHAM
GROUP BY NUOCSX

--CAU34
SELECT MAX(GIA) AS MAX,MIN(GIA) AS MIN,AVG(GIA) AS TB,NUOCSX 
FROM SANPHAM
GROUP BY NUOCSX

--CAU35
SELECT SUM(TRIGIA) AS DOANHTHU, NGHD
FROM HOADON
GROUP BY NGHD

--CAU36
SELECT SUM(SL) AS SOLUONG,MASP
FROM CTHD,HOADON
WHERE CTHD.SOHD=HOADON.SOHD AND MONTH(HOADON.NGHD)=10 AND YEAR(HOADON.NGHD)=2006
GROUP BY MASP
USE QLBH
--CAU37
SELECT SUM(TRIGIA) AS DOANHTHU ,MONTH(NGHD) AS THANG
FROM HOADON
WHERE YEAR(NGHD)=2006
GROUP BY MONTH(NGHD)

--CAU38
SELECT DISTINCT*
FROM HOADON HD,CTHD
WHERE HD.SOHD=CTHD.SOHD AND SL>=4 

SELECT * 
FROM HOADON
WHERE SOHD IN 
(SELECT SOHD 
FROM CTHD 
WHERE SL>=4
)

--CAU39
SELECT * 
FROM HOADON
WHERE SOHD IN 
(SELECT SOHD 
FROM CTHD,SANPHAM SP
WHERE SP.NUOCSX='Viet Nam' AND SL>=3
)

--CAU40
SELECT * 
FROM KHACHHANG 
WHERE MAKH IN (
SELECT TOP 1 MAKH
FROM HOADON 
GROUP BY HOADON.MAKH
ORDER BY COUNT(DISTINCT SOHD) DESC
)

--CAU41
SELECT TOP 1 MONTH(NGHD) AS THANG
FROM HOADON 
WHERE YEAR(NGHD)=2006 
GROUP BY MONTH(NGHD)
ORDER BY SUM(TRIGIA) DESC

--CAU42
SELECT TOP 1 SP.MASP, SP.TENSP
FROM SANPHAM SP,HOADON HD,CTHD 
WHERE SP.MASP=CTHD.MASP AND HD.SOHD=CTHD.SOHD AND YEAR(NGHD)=2006
GROUP BY SP.MASP,SP.TENSP
ORDER BY SUM(SL) DESC

SELECT MASP,TENSP
FROM SANPHAM 
WHERE MASP IN
(SELECT TOP 1 MASP 
FROM CTHD
GROUP BY MASP
ORDER BY SUM(SL) DESC
)

--CAU43

	SELECT NUOCSX , MAX(GIA) AS MAXGIA
	into B
	FROM SANPHAM
	GROUP BY NUOCSX
SELECT SP.MASP,SP.TENSP ,SP.GIA,SP.NUOCSX
FROM SANPHAM SP
WHERE EXISTS 
(
SELECT * 
FROM B
WHERE B.NUOCSX=SP.NUOCSX AND SP.GIA=B.MAXGIA
)
--CAU44
SELECT NUOCSX
FROM SANPHAM
GROUP BY NUOCSX 
HAVING COUNT(DISTINCT MASP)>=3

--CAU45

SELECT TOP 10 MAKH
INTO C
FROM KHACHHANG 
ORDER BY DOANHSO DESC


SELECT TOP 1 MAKH,(COUNT(HOADON.SOHD)) as MAX
FROM HOADON 
WHERE HOADON.MAKH IN 
(
	SELECT TOP 10 MAKH
	FROM KHACHHANG 
	ORDER BY DOANHSO DESC
)
GROUP BY HOADON.MAKH
ORDER BY COUNT(HOADON.SOHD) DESC

