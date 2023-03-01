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

	--常见症状类型
	IF OBJECT_ID('tb_SymptomStype')IS NOT NULL
		DROP TABLE tb_SymptomStype;
	GO
	CREATE TABLE tb_SymptomStype
		(SymptomStypeNo
			INT
			NOT NULL
			CONSTRAINT pk_SymptomStype_SymptomStypeNo
				PRIMARY KEY(SymptomStypeNo)
		,Symptom
			VARCHAR(200)
		)
	INSERT INTO tb_SymptomStype(SymptomStypeNo,Symptom) VALUES
	(00,'无'),
	(01,'头晕、眩晕'),
	(02,'头疼'),
	(03,'失眠'),
	(04,'打呼噜'),
	(05,'发热'),
	(06,'牙疼'),
	(07,'胸疼'),
	(08,'乳房疼'),
	(09,'肚子疼'),
	(10,'小便异常'),
	(11,'便血'),
	(12,'脚腿疼'),
	(13,'浮肿'),
	(14,'过敏')

	IF OBJECT_ID('tb_DepartmentDetail')IS NOT NULL
		DROP TABLE tb_DepartmentDetail;
	GO
	CREATE TABLE tb_DepartmentDetail
		(DepartmentDetailNo
			INT
			NOT NULL
			CONSTRAINT pk_DepartmentDetail_DepartmentDetailNo
			PRIMARY KEY (DepartmentDetailNo)
		,DepartmentDetailName
			VARCHAR(40)
			NOT NULL
		,DepartmentNo
			INT
			NOT NULL
			CONSTRAINT fk_DepartmentDetail_DepartmentDetailNo
			FOREIGN KEY (DepartmentNo)
			REFERENCES tb_Department(DepartmentNo)
			ON DELETE CASCADE
			ON UPDATE CASCADE
		)
	INSERT INTO tb_DepartmentDetail(DepartmentDetailNo,DepartmentDetailName,DepartmentNo) VALUES
	(00,'---请选择---',00),
	(01,'呼吸内科',01),
	(02,'心血管内科',01),
	(03,'神经内科',01),
	(04,'消化内科',01),
	(05,'内分泌科',01),
	(06,'风湿免疫科',01),
	(07,'肾内科',01),
	(08,'脑外科',02),
	(09,'心胸外科',02),
	(10,'乳腺外科',02),
	(11,'泌尿外科',02),
	(12,'肝胆外科',02),
	(13,'胃肠外科',02),
	(14,'肛肠外科',02),
	(15,'骨科',02),
	(16,'眼科',03),
	(17,'耳鼻咽喉科',03),
	(18,'口腔科',03),
	(19,'头颈外科',03),
	(20,'妇科',04),
	(21,'产科',04),
	(22,'皮肤病科',05),
	(23,'性病科',05),
	(24,'精神病科',06),
	(25,'心理咨询科',06),
	(26,'儿科',07),
	(27,'肿瘤科',07),
	(28,'传染科',07),
	(29,'急诊科',07),
	(30,'老年科',07),
	(31,'整形科',07),
	(32,'血液科',01)

		--常见症状
	IF OBJECT_ID('tb_Symptom')IS NOT NULL
		DROP TABLE tb_Symptom;
	GO
	CREATE TABLE tb_Symptom
		(SymptomNo
			INT
			NOT NULL
			CONSTRAINT fk_Symptom_SymptomNo
			FOREIGN KEY (SymptomNo)
			REFERENCES tb_SymptomStype(SymptomStypeNo)
			ON DELETE CASCADE
			ON UPDATE CASCADE
		,Symptom
			VARCHAR(200)
		,SuggestDepartmentDetailNo--建议详细科室
			INT
			NOT NULL
			CONSTRAINT fk_Symptom_SuggestDepartmentDetailNo
			FOREIGN KEY (SuggestDepartmentDetailNo)
			REFERENCES tb_DepartmentDetail(DepartmentDetailNo)
			ON DELETE CASCADE
			ON UPDATE CASCADE
		)
	INSERT INTO tb_Symptom(SymptomNo,Symptom,SuggestDepartmentDetailNo) VALUES
	(00,'---请选择---',00),
	(01,'站不稳，眼睛轮转，甚至意识不清',03),
	(01,'晕时心前区疼痛，心慌、心脏不适',01),
	(01,'晕时脖子疼，伴有手麻、脚麻症状',15),
	(01,'眩晕与头的位置改变有关,如躺下或翻身头晕',16),
	(01,'伴有脸色苍白',32),
	(01,'站不稳，眼睛轮转，甚至意识不清',03),
	(02,'外伤引起的头疼',08),
	(02,'—侧头疼，疲劳、紧张时加重',03),
	(02,'伴有眩晕，耳鸣，或者耳塞、流涕',17),
	(03,'压力大、焦虑',25),
	(03,'牙疼+脸疼+鼻塞',17),
	(03,'经常运动后牙疼',02),
	(04,'睡觉打呼噜，偶尔“暂停”三五秒，甚至因喘不过',01),
	(04,'睡觉打呼噜，偶尔“暂停”三五秒，甚至因喘不过',17)




