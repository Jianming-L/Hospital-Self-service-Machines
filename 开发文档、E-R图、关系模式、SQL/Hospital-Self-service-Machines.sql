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
			INT
			NOT NULL
			CONSTRAINT pk_Department_DepartmentNo
				PRIMARY KEY(DepartmentNo)
		,DepartmentName
			VARCHAR(40)
			NOT NULL
		)
	INSERT INTO tb_Department(DepartmentNo,DepartmentName) VALUES
	(00,'---请选择---'),
	(01,'内科'),
	(02,'外科'),
	(03,'五官科'),
	(04,'妇产科'),
	(05,'皮肤性病科'),
	(06,'精神心理科'),
	(07,'其它科室')

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
	(000,'---请选择---',00),
	(001,'呼吸内科',01),
	(002,'心血管内科',01),
	(003,'神经内科',01),
	(004,'消化内科',01),
	(005,'内分泌科',01),
	(006,'风湿免疫科',01),
	(007,'肾内科',01),
	(008,'脑外科',02),
	(009,'心胸外科',02),
	(010,'乳腺外科',02),
	(011,'泌尿外科',02),
	(012,'肝胆外科',02),
	(013,'胃肠外科',02),
	(014,'肛肠外科',02),
	(015,'眼科',03),
	(016,'耳鼻咽喉科',03),
	(017,'口腔科',03),
	(018,'头颈外科',03),
	(019,'妇科',04),
	(020,'产科',04),
	(021,'皮肤病科',05),
	(022,'性病科',05),
	(023,'精神病科',06),
	(024,'心理咨询科',06),
	(025,'儿科',07),
	(026,'肿瘤科',07),
	(027,'传染科',07),
	(028,'急诊科',07),
	(029,'老年科',07),
	(030,'整形科',07)









