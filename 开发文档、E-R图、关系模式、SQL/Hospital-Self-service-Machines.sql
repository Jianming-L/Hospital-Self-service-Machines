USE master
IF DB_ID('ҽԺ���������')IS NOT NULL
	DROP DATABASE ҽԺ���������;
GO
CREATE DATABASE ҽԺ���������
	ON 
		(NAME='DataFile_1',FILENAME='E:\ҽԺ���������\DataFile_1.mdf')
	LOG ON
		(NAME='LogFile_1',FILENAME='E:\ҽԺ���������\LogFile_1.ldf')
GO

USE ҽԺ���������

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
	('3210707010','���',HASHBYTES('MD2','qwe123456'))

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
	('00','---��ѡ��---'),
	('01','�ڿ�'),
	('02','���'),
	('03','��ٿ�'),
	('04','������'),
	('05','Ƥ���Բ���'),
	('06','���������'),
	('07','��������')
