USE master
IF DB_ID('医院自助服务机')IS NOT NULL
	DROP DATABASE 医院自助服务机;
GO
CREATE DATABASE 医院自助服务机
	ON 
		(NAME='DataFile_1',FILENAME='E:\医院自助服务机\DataFile_1.mdf')
	LOG ON
		(NAME='LogFile_1',FILENAME='E:\医院自助服务机\LogFile_1.ldf')
GO

USE 医院自助服务机

	IF OBJECT_ID('tb_User')IS NOT NULL
		DROP TABLE tb_User;
	GO
	CREATE TABLE tb_User
		(UserNo
			CHAR(10)
			NOT NULL
			CONSTRAINT UserNo
				PRIMARY KEY(UserNo)
		,UserName
			VARCHAR(10)
			NOT NULL
		,Password
			VARBINARY(20)
			NOT NULL
		)
	INSERT INTO tb_User(UserNo,UserName,Password) VALUES
	('3210707010','李健铭',HASHBYTES('MD2','qwe123456'))

	IF OBJECT_ID('tb_Department')IS NOT NULL
		DROP TABLE tb_Department;
	GO
	CREATE TABLE tb_Department
		(DepartmentNo
			CHAR(10)
			NOT NULL
			CONSTRAINT DepartmentNo
				PRIMARY KEY(DepartmentNo)
		,DepartmentName
			VARCHAR(40)
			NOT NULL
		)
	INSERT INTO tb_Department(DepartmentNo,DepartmentName) VALUES
	('00','---请选择---'),
	('01','内科'),
	('02','外科'),
	('03','五官科'),
	('04','妇产科'),
	('05','皮肤性病科'),
	('06','精神心理科'),
	('07','其它科室')
