USE master
GO
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
	(00,'---请选择---'),
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
	(12,'体重减轻'),
	(13,'脚腿疼'),
	(14,'浮肿'),
	(15,'过敏')

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
	(32,'血液科',01),
	(33,'血液外科',02)

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
	(02,'外伤引起的头疼',08),
	(02,'—侧头疼，疲劳、紧张时加重',03),
	(02,'伴有眩晕，耳鸣，或者耳塞、流涕',17),
	(03,'压力大、焦虑',25),
	(03,'牙疼+脸疼+鼻塞',17),
	(03,'经常运动后牙疼',02),
	(04,'睡觉打呼噜，偶尔“暂停”三五秒，甚至因喘不过',01),
	(04,'睡觉打呼噜，偶尔“暂停”三五秒，甚至因喘不过',17),
	(05,'伴咳嗽、咳痰、胸痛',01),
	(05,'伴头疼、恶心、神志不清',03),
	(05,'伴腹泻、腹胀、腹痛',28),
	(06,'牙龈发炎、肿痛',18),
	(06,'牙疼+脸疼＋鼻塞',17),
	(06,'经常运动后牙疼',02),
	(07,'胸口或胸前疼痛，有压迫感，伴有心慌气短，休息可以缓解',02),
	(07,'胸疼伴有咳嗽、深呼吸时加重，多有胸膜、肺部疾病',01),
	(07,'胸疼伴有咳嗽、深呼吸时加重，多有胸膜、肺部疾病',09),
	(07,'运动后突然发现剧烈胸痛，并伴有呼吸困难',09),
	(07,'因骨折等外伤所致，在进行弯腰、侧腰时疼痛加剧',15),
	(07,'胸骨后、心脏部位有紧缩感，持续3-5分钟',29),
	(08,'乳房疼，摸着有小疙瘩，常见是乳腺增生',10),
	(08,'男性乳房疼痛',05),
	(08,'乳腺及局部皮肤出现水疱产生疼痛',22),
	(09,'右上腹和右下腹的急性腹疼',13),
	(09,'腹痛伴有反酸、呕吐、腹泻',04),
	(09,'腹痛伴有腹泻、发热',13),
	(09,'腹痛伴有腹泻、发热',14),
	(09,'腹痛伴有尿急、尿频、尿痛、便血',11),
	(09,'女性停经后发生急性腹疼',20),
	(10,'血尿',11),
	(10,'血尿',07),
	(10,'尿频、尿急、尿疼',07),
	(10,'尿少伴有腰疼',11),
	(10,'尿少伴有浮肿',07),
	(11,'黑色或暗红色的便血',04),
	(11,'鲜红色的便血',14),
	(12,'伴尿多、多食',05),
	(12,'伴怕热、多汗、急躁',05),
	(12,'伴厌食、大便异常',04),
	(13,'仅某—关节肿、痛',15),
	(13,'两侧关节痛同时发作，踝关节、足趾关节出现红肿疼痛，尤其在吃海鲜、啤酒后发作',06),
	(13,'腿肚肿胀，手指按压更疼，走路疼休息能缓解',33),
	(14,'脸肿为主，伴有尿少',07),
	(14,'腹胀为主，伴黄疽',04),
	(14,'下肢肿为主，伴气促',02),
	(15,'皮肤瘙痒、出红疹、鼻塞流涕',22)

	--用户预约表
	IF OBJECT_ID('tb_Registerd')IS NOT NULL
		DROP TABLE tb_Registerd;
	GO
	CREATE TABLE tb_Registerd
		(UserNo
			CHAR(10)
			NOT NULL
		,DepartmentDetailNo--详细科室号
			INT
			NOT NULL
		,RegisterTime--确认预约所在时间
			DATE
			NOT NULL
		,SpecificTimePeriod--具体时间段
			CHAR(20)
			NOT NULL
		)

	--预约时间
	IF OBJECT_ID('tb_RegisterdTime')IS NOT NULL
		DROP TABLE tb_RegisterdTime;
	GO
	CREATE TABLE tb_RegisterdTime
		(No
			INT
			NOT NULL
			PRIMARY KEY(No)
		,RegisterTime--预约时间
			CHAR(20)
			NOT NULL
		)
	INSERT INTO tb_RegisterdTime(No,RegisterTime) VALUES
	(0,'---请选择---'),
	(1,'07:00-07:30'),
	(2,'07:30-08:00'),
	(3,'08:00-08:30'),
	(4,'08:30-09:00'),
	(5,'09:00-09:30'),
	(6,'09:30-10:00'),
	(7,'10:00-10:30'),
	(8,'10:30-11:00'),
	(9,'11:00-11:30'),
	(10,'11:30-12:00'),
	(11,'12:00-12:30'),
	(12,'12:30-13:00'),
	(13,'13:00-13:30'),
	(14,'13:30-14:00'),
	(15,'14:00-14:30'),
	(16,'14:30-15:00'),
	(17,'15:00-15:30'),
	(18,'15:30-16:00'),
	(19,'16:00-16:30'),
	(20,'16:30-17:00'),
	(21,'17:00-17:30'),
	(22,'17:30-18:00'),
	(23,'18:00-18:30'),
	(24,'18:30-19:00'),
	(25,'19:00-19:30'),
	(26,'19:30-20:00'),
	(27,'20:00-20:30'),
	(28,'20:30-21:00')

	----限制预约人数表
	--IF OBJECT_ID('tb_LimitRegisterd')IS NOT NULL
	--	DROP TABLE tb_LimitRegisterd;
	--GO
	--CREATE TABLE tb_LimitRegisterd
	--	(DepartmentDetailNo--详细科室号
	--		INT
	--	,RegisterTime--确认预约所在时间
	--		DATE
	--	,SpecificTimePeriod--具体时间段
	--		CHAR(20)
	--	,NowCount--当前人数
	--		INT
	--	)

	IF OBJECT_ID('tb_LimitCount')IS NOT NULL
		DROP TABLE tb_LimitCount
	GO
	CREATE TABLE tb_LimitCount
		(SpecificTimePeriod--具体时间段
			CHAR(20)
		,LimitCount--限制人数
			INT
		)
	INSERT INTO tb_LimitCount(SpecificTimePeriod,LimitCount) VALUES
	('07:00-07:30',5),
	('07:30-08:00',5),
	('08:00-08:30',5),
	('08:30-09:00',5),
	('09:00-09:30',5),
	('09:30-10:00',5),
	('10:00-10:30',5),
	('10:30-11:00',5),
	('11:00-11:30',5),
	('11:30-12:00',5),
	('12:00-12:30',5),
	('12:30-13:00',5),
	('13:00-13:30',5),
	('13:30-14:00',5),
	('14:00-14:30',5),
	('14:30-15:00',5),
	('15:00-15:30',5),
	('15:30-16:00',5),
	('16:00-16:30',5),
	('16:30-17:00',5),
	('17:00-17:30',5),
	('17:30-18:00',5),
	('18:00-18:30',5),
	('18:30-19:00',5),
	('19:00-19:30',5),
	('19:30-20:00',5),
	('20:00-20:30',5),
	('20:30-21:00',5)

--	INSERT INTO tb_Registerd(UserNo,DepartmentDetailNo,RegisterTime,SpecificTimePeriod) VALUES
--(3210707010,1,'2023-3-9','07:00-07:30'),
--(3210707011,1,'2023-3-9','07:00-07:30'),
--(3210707012,1,'2023-3-9','07:00-07:30'),
--(3210707013,1,'2023-3-9','07:00-07:30'),
--(3210707014,1,'2023-3-9','07:00-07:30')


--SELECT IIF(LC.LimitCount >=(SELECT COUNT(*) AS NowCount
--		FROM tb_LimitCount AS LC
--		RIGHT JOIN tb_Registerd AS R ON R.SpecificTimePeriod=LC.SpecificTimePeriod),'SHI','FOU')
--FROM tb_LimitCount AS LC
--RIGHT JOIN tb_Registerd AS R ON R.SpecificTimePeriod=LC.SpecificTimePeriod
--WHERE R.RegisterTime='2023-3-9' AND R.SpecificTimePeriod='07:00-07:30' 
