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
			INT
			NOT NULL
			CONSTRAINT pk_Department_DepartmentNo
				PRIMARY KEY(DepartmentNo)
		,DepartmentName
			VARCHAR(40)
			NOT NULL
		)
	INSERT INTO tb_Department(DepartmentNo,DepartmentName) VALUES
	(00,'---��ѡ��---'),
	(01,'�ڿ�'),
	(02,'���'),
	(03,'��ٿ�'),
	(04,'������'),
	(05,'Ƥ���Բ���'),
	(06,'���������'),
	(07,'��������')

	IF OBJECT_ID('tb_DepartmentDetail')IS NOT NULL
		DROP TABLE tb_DepartmentDetail;
	GO
	CREATE TABLE tb_DepartmentDetail
		(DepartmentDetailNo
			INT
			NOT NULL
			CONSTRAINT pk_DepartmentDetail_DepartmentDetailNo
				PRIMARY KEY(DepartmentDetailNo)
		,DepartmentDetailName
			VARCHAR(40)
			NOT NULL
		,DepartmentNo
			INT
			NOT NULL
			CONSTRAINT fk_DepartmentDetail_DepartmentNo
			FOREIGN KEY (DepartmentNo)
			REFERENCES tb_Department(DepartmentNo)
			ON DELETE CASCADE
			ON UPDATE CASCADE
		)
	INSERT INTO tb_DepartmentDetail(DepartmentDetailNo,DepartmentDetailName,DepartmentNo) VALUES
	(000,'---��ѡ��---',00),
	(001,'�����ڿ�',01),
	(002,'��Ѫ���ڿ�',01),
	(003,'���ڿ�',01),
	(004,'�����ڿ�',01),
	(005,'�ڷ��ڿ�',01),
	(006,'��ʪ���߿�',01),
	(007,'���ڿ�',01),
	(008,'�����',02),
	(009,'�������',02),
	(010,'�������',02),
	(011,'�������',02),
	(012,'�ε����',02),
	(013,'θ�����',02),
	(014,'�س����',02),
	(015,'�ۿ�',03),
	(016,'�����ʺ��',03),
	(017,'��ǻ��',03),
	(018,'ͷ�����',03),
	(019,'����',04),
	(020,'����',04),
	(021,'Ƥ������',05),
	(022,'�Բ���',05),
	(023,'���񲡿�',06),
	(024,'������ѯ��',06),
	(025,'����',07),
	(026,'������',07),
	(027,'��Ⱦ��',07),
	(028,'�����',07),
	(029,'�����',07),
	(030,'���ο�',07)









