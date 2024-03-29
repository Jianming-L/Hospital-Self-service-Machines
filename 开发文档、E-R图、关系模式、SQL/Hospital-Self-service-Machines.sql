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
		,IsActivated
			BIT
			NOT NULL
		,LoginFailCount
			INT
			NOT NULL
			DEFAULT 0
		)
	INSERT INTO tb_User(UserNo,UserName,Password,IsActivated) VALUES
	('3210707010','李健铭',HASHBYTES('MD2','qwe123456'),0)

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

	--用户预约次数
	IF OBJECT_ID('tb_RegisterdCancelCount')IS NOT NULL
		DROP TABLE tb_RegisterdCancelCount;
	GO
	CREATE TABLE tb_RegisterdCancelCount
		(UserNo
			CHAR(10)
		,Count
			INT
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

	IF OBJECT_ID('tb_DoctorInfo')IS NOT NULL
		DROP TABLE tb_DoctorInfo
	GO
	CREATE TABLE tb_DoctorInfo
		(DoctorNo
			CHAR(20)
			NOT NULL
		,DoctorName
			CHAR(20)
			NOT NULL
		,DepartmentDetailNo
			INT
		,WorkWeekday
			INT
		,WorkTime
			CHAR(20)
			NOT NULL
		)
	INSERT INTO tb_DoctorInfo(DoctorNo,DoctorName,DepartmentDetailNo,WorkWeekday,WorkTime) VALUES
	(0,'---请选择---',null,null,'---请选择---'),
	(1,'刘润生',1,1,'07:00-12:00'),
	(2,'韩刚龙',1,2,'12:00-18:00'),
	(3,'孙丽萍',1,3,'18:00-24:00'),
	(1,'刘润生',1,4,'12:00-18:00'),
	(2,'韩刚龙',1,5,'18:00-24:00'),
	(3,'孙丽萍',1,6,'07:00-12:00'),
	(1,'刘润生',1,0,'12:00-18:00'),
	(2,'韩刚龙',1,0,'07:00-12:00'),
	(3,'孙丽萍',1,0,'18:00-24:00'),
	(4,'陈桂平',2,1,'07:00-12:00'),
	(5,'李熙平',2,2,'12:00-18:00'),
	(6,'董三女',2,3,'18:00-24:00'),
	(4,'陈桂平',2,4,'12:00-18:00'),
	(5,'李熙平',2,5,'18:00-24:00'),
	(6,'董三女',2,6,'07:00-12:00'),
	(4,'陈桂平',2,0,'12:00-18:00'),
	(5,'李熙平',2,0,'07:00-12:00'),
	(6,'董三女',2,0,'18:00-24:00'),
	(7,'李开英',3,1,'07:00-12:00'),
	(8,'刘再海',3,2,'12:00-18:00'),
	(9,'康永清',3,3,'18:00-24:00'),
	(7,'李开英',3,4,'12:00-18:00'),
	(8,'刘再海',3,5,'18:00-24:00'),
	(9,'康永清',3,6,'07:00-12:00'),
	(7,'李开英',3,0,'12:00-18:00'),
	(8,'刘再海',3,0,'07:00-12:00'),
	(9,'康永清',3,0,'18:00-24:00'),
	(10,'康根',4,1,'07:00-12:00'),
	(11,'刘来有',4,2,'12:00-18:00'),
	(12,'石双厚',4,3,'18:00-24:00'),
	(10,'康根',4,4,'12:00-18:00'),
	(11,'刘来有',4,5,'18:00-24:00'),
	(12,'石双厚',4,6,'7:00-12:00'),
	(10,'康根',4,0,'12:00-18:00'),
	(11,'刘来有',4,0,'07:00-12:00'),
	(12,'石双厚',4,0,'18:00-24:00'),
	(13,'石天才',5,1,'07:00-12:00'),
	(14,'石利军',5,2,'12:00-18:00'),
	(15,'刘龙',5,3,'18:00-24:00'),
	(13,'石天才',5,4,'12:00-18:00'),
	(14,'石利军',5,5,'18:00-24:00'),
	(15,'刘龙',5,6,'07:00-12:00'),
	(13,'石天才',5,0,'12:00-18:00'),
	(14,'石利军',5,0,'07:00-12:00'),
	(15,'刘龙',5,0,'18:00-24:00'),
	(16,'石栓成',6,1,'07:00-12:00'),
	(17,'李二美',6,2,'12:00-18:00'),
	(18,'辛文斌',6,3,'18:00-24:00'),
	(16,'石栓成',6,4,'12:00-18:00'),
	(17,'李二美',6,5,'18:00-24:00'),
	(18,'辛文斌',6,6,'07:00-12:00'),
	(16,'石栓成',6,0,'12:00-18:00'),
	(17,'李二美',6,0,'07:00-12:00'),
	(18,'辛文斌',6,0,'18:00-24:00'),
	(19,'石根厚',7,1,'07:00-12:00'),
	(20,'石建军',7,2,'12:00-18:00'),
	(21,'石正厚',7,3,'18:00-24:00'),
	(19,'石根厚',7,4,'12:00-18:00'),
	(20,'石建军',7,5,'18:00-24:00'),
	(21,'石正厚',7,6,'07:00-12:00'),
	(19,'石根厚',7,0,'12:00-18:00'),
	(20,'石建军',7,0,'07:00-12:00'),
	(21,'石正厚',7,0,'18:00-24:00'),
	(22,'刘占宽',8,1,'07:00-12:00'),
	(23,'刘耀清',8,2,'12:00-18:00'),
	(24,'贾六',8,3,'18:00-24:00'),
	(22,'刘占宽',8,4,'12:00-18:00'),
	(23,'刘耀清',8,5,'18:00-24:00'),
	(24,'贾六',8,6,'07:00-12:00'),
	(22,'刘占宽',8,0,'12:00-18:00'),
	(23,'刘耀清',8,0,'07:00-12:00'),
	(24,'贾六',8,0,'18:00-24:00'),
	(25,'石俊梅',9,1,'07:00-12:00'),
	(26,'刘飞',9,2,'12:00-18:00'),
	(27,'刘文明',9,3,'18:00-24:00'),
	(25,'石俊梅',9,4,'12:00-18:00'),
	(26,'刘飞',9,5,'18:00-24:00'),
	(27,'刘文明',9,6,'07:00-12:00'),
	(25,'石俊梅',9,0,'12:00-18:00'),
	(26,'刘飞',9,0,'07:00-12:00'),
	(27,'刘文明',9,0,'18:00-24:00'),
	(28,'高文利',10,1,'07:00-12:00'),
	(29,'高四明',10,2,'12:00-18:00'),
	(30,'高文军',10,3,'18:00-24:00'),
	(28,'高文利',10,4,'12:00-18:00'),
	(29,'高四明',10,5,'18:00-24:00'),
	(30,'高文军',10,6,'07:00-12:00'),
	(28,'高文利',10,0,'12:00-18:00'),
	(29,'高四明',10,0,'07:00-12:00'),
	(30,'高文军',10,0,'18:00-24:00'),
	(31,'高文军',11,1,'07:00-12:00'),
	(32,'袁富存',11,2,'12:00-18:00'),
	(33,'尚文忠',11,3,'18:00-24:00'),
	(31,'高文军',11,4,'12:00-18:00'),
	(32,'袁富存',11,5,'18:00-24:00'),
	(33,'尚文忠',11,6,'07:00-12:00'),
	(31,'高文军',11,0,'12:00-18:00'),
	(32,'袁富存',11,0,'07:00-12:00'),
	(33,'尚文忠',11,0,'18:00-24:00'),
	(34,'贾乐',12,1,'07:00-12:00'),
	(35,'石栓柱',12,2,'12:00-18:00'),
	(36,'李龙',12,3,'18:00-24:00'),
	(34,'贾乐',12,4,'12:00-18:00'),
	(35,'石栓柱',12,5,'18:00-24:00'),
	(36,'李龙',12,6,'07:00-12:00'),
	(34,'贾乐',12,0,'12:00-18:00'),
	(35,'石栓柱',12,0,'07:00-12:00'),
	(36,'李龙',12,0,'18:00-24:00'),
	(37,'李海龙',13,1,'07:00-12:00'),
	(38,'王露',13,2,'12:00-18:00'),
	(39,'王桂香',13,3,'18:00-24:00'),
	(37,'李海龙',13,4,'12:00-18:00'),
	(38,'王露',13,5,'18:00-24:00'),
	(39,'王桂香',13,6,'07:00-12:00'),
	(37,'李海龙',13,0,'12:00-18:00'),
	(38,'王露',13,0,'07:00-12:00'),
	(39,'王桂香',13,0,'18:00-24:00'),
	(40,'王焕树',14,1,'07:00-12:00'),
	(41,'王二兵',14,2,'12:00-18:00'),
	(42,'韩凤英',14,3,'18:00-24:00'),
	(40,'王焕树',14,4,'12:00-18:00'),
	(41,'王二兵',14,5,'18:00-24:00'),
	(42,'韩凤英',14,6,'07:00-12:00'),
	(40,'王焕树',14,0,'12:00-18:00'),
	(41,'王二兵',14,0,'07:00-12:00'),
	(42,'韩凤英',14,0,'18:00-24:00'),
	(43,'王有罕',15,1,'07:00-12:00'),
	(44,'王山崎',15,2,'12:00-18:00'),
	(45,'杜茂仁',15,3,'18:00-24:00'),
	(43,'王有罕',15,4,'12:00-18:00'),
	(44,'王山崎',15,5,'18:00-24:00'),
	(45,'杜茂仁',15,6,'07:00-12:00'),
	(43,'王有罕',15,0,'12:00-18:00'),
	(44,'王山崎',15,0,'07:00-12:00'),
	(45,'杜茂仁',15,0,'18:00-24:00'),
	(46,'刘海欢',16,1,'07:00-12:00'),
	(47,'康桃花',16,2,'12:00-18:00'),
	(48,'杜元晓',16,3,'18:00-24:00'),
	(46,'刘海欢',16,4,'12:00-18:00'),
	(47,'康桃花',16,5,'18:00-24:00'),
	(48,'杜元晓',16,6,'07:00-12:00'),
	(46,'刘海欢',16,0,'12:00-18:00'),
	(47,'康桃花',16,0,'07:00-12:00'),
	(48,'杜元晓',16,0,'18:00-24:00'),
	(55,'张海宝',17,1,'07:00-12:00'),
	(56,'张飞雄',17,2,'12:00-18:00'),
	(57,'刘御',17,3,'18:00-24:00'),
	(55,'张海宝',17,4,'12:00-18:00'),
	(56,'张飞雄',17,5,'18:00-24:00'),
	(57,'刘御',17,6,'07:00-12:00'),
	(55,'张海宝',17,0,'12:00-18:00'),
	(56,'张飞雄',17,0,'07:00-12:00'),
	(57,'刘御',17,0,'18:00-24:00'),
	(58,'张润佘',18,1,'07:00-12:00'),
	(59,'张永强',18,2,'12:00-18:00'),
	(60,'郭三梅',18,3,'18:00-24:00'),
	(58,'张润佘',18,4,'12:00-18:00'),
	(59,'张永强',18,5,'18:00-24:00'),
	(60,'郭三梅',18,6,'07:00-12:00'),
	(58,'张润佘',18,0,'12:00-18:00'),
	(59,'张永强',18,0,'07:00-12:00'),
	(60,'郭三梅',18,0,'18:00-24:00'),
	(61,'杜云',19,1,'07:00-12:00'),
	(62,'魏红',19,2,'12:00-18:00'),
	(63,'刘继牛',19,3,'18:00-24:00'),
	(61,'杜云',19,4,'12:00-18:00'),
	(62,'魏红',19,5,'18:00-24:00'),
	(63,'刘继牛',19,6,'07:00-12:00'),
	(61,'杜云',19,0,'12:00-18:00'),
	(62,'魏红',19,0,'07:00-12:00'),
	(63,'刘继牛',19,0,'18:00-24:00'),
	(64,'郭武莱',20,1,'07:00-12:00'),
	(65,'高桂清',20,2,'12:00-18:00'),
	(66,'杜永强',20,3,'18:00-24:00'),
	(64,'郭武莱',20,4,'12:00-18:00'),
	(65,'高桂清',20,5,'18:00-24:00'),
	(66,'杜永强',20,6,'07:00-12:00'),
	(64,'郭武莱',20,0,'12:00-18:00'),
	(65,'高桂清',20,0,'07:00-12:00'),
	(66,'杜永强',20,0,'18:00-24:00'),
	(67,'杜文渊',21,1,'07:00-12:00'),
	(68,'高二媛',21,2,'12:00-18:00'),
	(69,'王二锁',21,3,'18:00-24:00'),
	(67,'杜文渊',21,4,'12:00-18:00'),
	(68,'高二媛',21,5,'18:00-24:00'),
	(69,'王二锁',21,6,'07:00-12:00'),
	(67,'杜文渊',21,0,'12:00-18:00'),
	(68,'高二媛',21,0,'07:00-12:00'),
	(69,'王二锁',21,0,'18:00-24:00'),
	(70,'王志宏',22,1,'07:00-12:00'),
	(71,'李金云',22,2,'12:00-18:00'),
	(72,'李欣媛',22,3,'18:00-24:00'),
	(70,'王志宏',22,4,'12:00-18:00'),
	(71,'李金云',22,5,'18:00-24:00'),
	(72,'李欣媛',22,6,'07:00-12:00'),
	(70,'王志宏',22,0,'12:00-18:00'),
	(71,'李金云',22,0,'07:00-12:00'),
	(72,'李欣媛',22,0,'18:00-24:00'),
	(73,'戴双宝',23,1,'07:00-12:00'),
	(74,'王焕锁',23,2,'12:00-18:00'),
	(75,'孙瑞军',23,3,'18:00-24:00'),
	(73,'戴双宝',23,4,'12:00-18:00'),
	(74,'王焕锁',23,5,'18:00-24:00'),
	(75,'孙瑞军',23,6,'07:00-12:00'),
	(73,'戴双宝',23,0,'12:00-18:00'),
	(74,'王焕锁',23,0,'07:00-12:00'),
	(75,'孙瑞军',23,0,'18:00-24:00'),
	(76,'石飞鹏',24,1,'07:00-12:00'),
	(77,'石胜厚',24,2,'12:00-18:00'),
	(78,'康振清',24,3,'18:00-24:00'),
	(76,'石飞鹏',24,4,'12:00-18:00'),
	(77,'石胜厚',24,5,'18:00-24:00'),
	(78,'康振清',24,6,'07:00-12:00'),
	(76,'石飞鹏',24,0,'12:00-18:00'),
	(77,'石胜厚',24,0,'07:00-12:00'),
	(78,'康振清',24,0,'18:00-24:00'),
	(79,'王禅',25,1,'07:00-12:00'),
	(80,'高志新',25,2,'12:00-18:00'),
	(81,'刘飞云',25,3,'18:00-24:00'),
	(79,'王禅',25,4,'12:00-18:00'),
	(80,'高志新',25,5,'18:00-24:00'),
	(81,'刘飞云',25,6,'07:00-12:00'),
	(79,'王禅',25,0,'12:00-18:00'),
	(80,'高志新',25,0,'07:00-12:00'),
	(81,'刘飞云',25,0,'18:00-24:00'),
	(82,'刘二云',26,1,'07:00-12:00'),
	(83,'刘三正',26,2,'12:00-18:00'),
	(84,'刘东',26,3,'18:00-24:00'),
	(82,'刘二云',26,4,'12:00-18:00'),
	(83,'刘三正',26,5,'18:00-24:00'),
	(84,'刘东',26,6,'07:00-12:00'),
	(82,'刘二云',26,0,'12:00-18:00'),
	(83,'刘三正',26,0,'07:00-12:00'),
	(84,'刘东',26,0,'18:00-24:00'),
	(85,'刘双正',27,1,'07:00-12:00'),
	(86,'乔银栓',27,2,'12:00-18:00'),
	(87,'乔占宽',27,3,'18:00-24:00'),
	(85,'刘双正',27,4,'12:00-18:00'),
	(86,'乔银栓',27,5,'18:00-24:00'),
	(87,'乔占宽',27,6,'07:00-12:00'),
	(85,'刘双正',27,0,'12:00-18:00'),
	(86,'乔银栓',27,0,'07:00-12:00'),
	(87,'乔占宽',27,0,'18:00-24:00'),
	(88,'乔军',28,1,'07:00-12:00'),
	(89,'贾九',28,2,'12:00-18:00'),
	(90,'李二明',28,3,'18:00-24:00'),
	(88,'乔军',28,4,'12:00-18:00'),
	(89,'贾九',28,5,'18:00-24:00'),
	(90,'李二明',28,6,'07:00-12:00'),
	(88,'乔军',28,0,'12:00-18:00'),
	(89,'贾九',28,0,'07:00-12:00'),
	(90,'李二明',28,0,'18:00-24:00'),
	(91,'李顺正',29,1,'07:00-12:00'),
	(92,'李振云',29,2,'12:00-18:00'),
	(93,'康志强',29,3,'18:00-24:00'),
	(91,'李顺正',29,4,'12:00-18:00'),
	(92,'李振云',29,5,'18:00-24:00'),
	(93,'康志强',29,6,'07:00-12:00'),
	(91,'李顺正',29,0,'12:00-18:00'),
	(92,'李振云',29,0,'07:00-12:00'),
	(93,'康志强',29,0,'18:00-24:00'),
	(94,'刘六',30,1,'07:00-12:00'),
	(95,'蒋进如',30,2,'12:00-18:00'),
	(96,'林豪谱',30,3,'18:00-24:00'),
	(94,'刘六',30,4,'12:00-18:00'),
	(95,'蒋进如',30,5,'18:00-24:00'),
	(96,'林豪谱',30,6,'07:00-12:00'),
	(94,'刘六',30,0,'12:00-18:00'),
	(95,'蒋进如',30,0,'07:00-12:00'),
	(96,'林豪谱',30,0,'18:00-24:00'),
	(97,'孙剑佛',31,1,'07:00-12:00'),
	(98,'李四',31,2,'12:00-18:00'),
	(99,'魏成贯',31,3,'18:00-24:00'),
	(97,'孙剑佛',31,4,'12:00-18:00'),
	(98,'李四',31,5,'18:00-24:00'),
	(99,'魏成贯',31,6,'07:00-12:00'),
	(97,'孙剑佛',31,0,'12:00-18:00'),
	(98,'李四',31,0,'07:00-12:00'),
	(99,'魏成贯',31,0,'18:00-24:00'),
	(100,'卫耿羿',32,1,'07:00-12:00'),
	(101,'谢协湃',32,2,'12:00-18:00'),
	(102,'岑刚飘',32,3,'18:00-24:00'),
	(100,'卫耿羿',32,4,'12:00-18:00'),
	(101,'谢协湃',32,5,'18:00-24:00'),
	(102,'岑刚飘',32,6,'07:00-12:00'),
	(100,'卫耿羿',32,0,'12:00-18:00'),
	(101,'谢协湃',32,0,'07:00-12:00'),
	(102,'岑刚飘',32,0,'18:00-24:00'),
	(103,'吴资龙',33,1,'07:00-12:00'),
	(104,'陈仓翼',33,2,'12:00-18:00'),
	(105,'刘枝迟',33,3,'18:00-24:00'),
	(103,'吴资龙',33,4,'12:00-18:00'),
	(104,'陈仓翼',33,5,'18:00-24:00'),
	(105,'刘枝迟',33,6,'07:00-12:00'),
	(103,'吴资龙',33,0,'12:00-18:00'),
	(104,'陈仓翼',33,0,'07:00-12:00'),
	(105,'刘枝迟',33,0,'18:00-24:00')

	--专家信息
	IF OBJECT_ID('tb_ExpertInfo')IS NOT NULL
		DROP TABLE tb_ExpertInfo;
	GO
	CREATE TABLE tb_ExpertInfo
		(ExpertInfoNo
			INT
			NOT NULL
			PRIMARY KEY(ExpertInfoNo)
		,Info
			VARCHAR(1000)
		)
	--INSERT INTO tb_ExpertInfo(ExpertInfoNo,Info) VALUES
	--()


	--国家
	IF OBJECT_ID('tb_Nation')IS NOT NULL
		DROP TABLE tb_Nation;
	GO
	CREATE TABLE tb_Nation
		(No
			INT
			NOT NULL
			PRIMARY KEY(No)
		,NationName
			CHAR(50)
			NOT NULL
		)
	INSERT INTO tb_Nation(No,NationName)VALUES 
	(0,'---请选择---'),
	(1,'中国'),
	(2,'俄罗斯'),
	(3,'美国')

	--省
	IF OBJECT_ID('tb_Province')IS NOT NULL
		DROP TABLE tb_Province;
	GO
	CREATE TABLE tb_Province
		(No
			INT
			NOT NULL
			PRIMARY KEY(No)
		,ProvinceName
			CHAR(50)
			NOT NULL
		,NationNo
			INT
			CONSTRAINT fk_Province_NationNo
			FOREIGN KEY (NationNo)
			REFERENCES tb_Nation(No)
			ON DELETE CASCADE
			ON UPDATE CASCADE
		)
	INSERT INTO tb_Province(No,ProvinceName,NationNo)VALUES 
	(0,'---请选择---',0),
	(1,'福建',1),
	(2,'浙江',1),
	(3,'台湾',1)

	--市区
	IF OBJECT_ID('tb_City')IS NOT NULL
		DROP TABLE tb_City;
	GO
	CREATE TABLE tb_City
		(No
			INT
			NOT NULL
			PRIMARY KEY(No)
		,CityName
			CHAR(50)
			NOT NULL
		,ProvinceNo
			INT 
			NOT NULL
			CONSTRAINT fk_City_ProvinceNo
			FOREIGN KEY (ProvinceNo)
			REFERENCES tb_Province(No)
			ON DELETE CASCADE
			ON UPDATE CASCADE
		)
	INSERT INTO tb_City(No,CityName,ProvinceNo)VALUES 
	(0,'---请选择---',0),
	(1,'福州',1),
	(2,'厦门',1),
	(3,'泉州',1),
	(4,'杭州',2),
	(5,'无锡',2),
	(6,'宁波',2),
	(7,'台北',3),
	(8,'高雄',3),
	(9,'桃园',3)

	--县区
	IF OBJECT_ID('tb_Country')IS NOT NULL
		DROP TABLE tb_Country;
	GO
	CREATE TABLE tb_Country
		(No
			INT
			NOT NULL
			PRIMARY KEY(No)
		,CountryName
			CHAR(50)
			NOT NULL
		,CityNo
			INT 
			NOT NULL
			CONSTRAINT fk_Country_CityNo
			FOREIGN KEY (CityNo)
			REFERENCES tb_City(No)
			ON DELETE CASCADE
			ON UPDATE CASCADE
		)
	INSERT INTO tb_Country(No,CountryName,CityNo)VALUES 
	(0,'---请选择---',0),
	(1,'闽侯',1),
	(2,'仓山',1),
	(3,'思明',2),
	(4,'湖里',2),
	(5,'晋江',3),
	(6,'惠安',3),
	(7,'余杭',4),
	(8,'西湖',4),
	(9,'梁溪',5),
	(10,'惠山',5),
	(11,'江北',6),
	(12,'北仑',6),
	(13,'台北',7),
	(14,'新北',7),
	(15,'左营',8),
	(16,'鼓山',8),
	(17,'桃园',9),
	(18,'中坜',9)

	IF OBJECT_ID('tb_EthnicGroup')IS NOT NULL
		DROP TABLE tb_EthnicGroup;
	GO
	CREATE TABLE tb_EthnicGroup
		(EthnicGroupNo
			INT
			NOT NULL
			PRIMARY KEY(EthnicGroupNo)
		,EthnicGroupName
			CHAR(30)
			NOT NULL
		)
	INSERT INTO tb_EthnicGroup(EthnicGroupNo,EthnicGroupName)VALUES 
	(0,'---请选择---'),
	(1,'汉族'),
	(2,'壮族'),
	(3,'畲族'),
	(4,'高山族')

	--建档信息
	IF OBJECT_ID('tb_DocumentationInformation')IS NOT NULL
		DROP TABLE tb_DocumentationInformation;
	GO
	CREATE TABLE tb_DocumentationInformation
		(UserNo
			CHAR(10)
			NOT NULL
			CONSTRAINT pk_DocumentationInformation_UserNo
			PRIMARY KEY (UserNo)
		,UserName
			VARCHAR(20)
		,Gender
			BIT
		,Birthday
			DATE
		,Nation
			CHAR(50)
		,Province
			CHAR(30)
		,City
			CHAR(30)
		,Country
			CHAR(50)
		,EthnicGroup
			CHAR(20)
		)

	--检测信息
	IF OBJECT_ID('tb_PatientCheckInformation')IS NOT NULL
		DROP TABLE tb_PatientCheckInformation;
	GO
	CREATE TABLE tb_PatientCheckInformation
	(UserNo
		CHAR(10)
		NOT NULL
	,ItemNo
		INT
		NOT NULL
	,ResultScore
		CHAR(10)
		NOT NULL
	)
	INSERT INTO tb_PatientCheckInformation(UserNo,ItemNo,ResultScore)VALUES
	('3210707010',1,'5.9'),
	('3210707010',2,'40.4'),
	('3210707010',3,'5.8'),
	('3210707010',4,'44.5'),
	('3210707010',5,'8.3'),
	('3210707010',6,'1'),
	('3210707010',7,'2.6'),
	('3210707010',8,'2.4')

	--检验日期基本信息
	IF OBJECT_ID('tb_CheckDateInformation')IS NOT NULL
		DROP TABLE tb_CheckDateInformation;
	GO
	CREATE TABLE tb_CheckDateInformation
	(UserNo
		CHAR(10)
		NOT NULL
	,CheckTime
		DATE
		NOT NULL
	,DoctorCheckName
		CHAR(20)
		NOT NULL
	)
	INSERT INTO tb_CheckDateInformation(UserNo,CheckTime,DoctorCheckName)VALUES
	('3210707010','2023-4-3','张三')

	--项目信息
	IF OBJECT_ID('tb_ItemInformation')IS NOT NULL
		DROP TABLE tb_ItemInformation;
	GO
	CREATE TABLE tb_ItemInformation
	(ItemNo
		INT
		NOT NULL
	,ItemName
		CHAR(100)
		NOT NULL
	,ReferenceValue
		CHAR(30)
		NOT NULL
	,Unit
		CHAR(20)
		NOT NULL
	)
	INSERT INTO tb_ItemInformation(ItemNo,ItemName,ReferenceValue,Unit)VALUES
	(1,'白细胞计数（WBC）','3.5-9.5','10^9/L'),
	(2,'淋巴细胞百分率（LY%）','20-50','%'),
	(3,'单核细胞百分率（MO%）','3.0-10.0','%'),
	(4,'中性粒细胞百分率（NE%）','40.0-75.0','%'),
	(5,'嗜酸性粒细胞百分率（EO%）','0.4-8.0','%'),
	(6,'嗜碱性粒细胞百分率（BA%）','0.0-1.0','%'),
	(7,'中性粒细胞绝对值（NE#）','1.8-6.3','10^9/L'),
	(8,'单核细胞计数（LY#）','1.1-3.2','10^9/L')

	--缴费单
	IF OBJECT_ID('tb_Payment')IS NOT NULL
		DROP TABLE tb_Payment;
	GO
	CREATE TABLE tb_Payment
	(UserNo
		CHAR(10)
		NOT NULL
	,PayItemNo
		CHAR(20)
		NOT NULL
	,PayTime
		DATE
	,Flat--标记
		INT
	)
	INSERT INTO tb_Payment(UserNo,PayItemNo,Flat)VALUES
	('3210707010',1,0),
	('3210707010',2,0),
	('3210707010',3,0)

	--价格单
	IF OBJECT_ID('tb_Price')IS NOT NULL
		DROP TABLE tb_Price;
	GO
	CREATE TABLE tb_Price
	(PayItemNo
		CHAR(20)
		NOT NULL
	,PayItemName
		CHAR(100)
		NOT NULL
	,Price	
		DECIMAL(5,2)
		NOT NULL
	)
	INSERT INTO tb_Price(PayItemNo,PayItemName,Price)VALUES
	(1,'999感冒清热颗粒',22.86),
	(2,'布洛芬缓释胶囊',14.4),
	(3,'复方氨酚烷胺胶囊',3)

--	INSERT INTO tb_Registerd(UserNo,DepartmentDetailNo,RegisterTime,SpecificTimePeriod) VALUES
--(3210707010,1,'2023-3-11','07:00-07:30'),
--(3210707011,1,'2023-3-11','07:00-07:30'),
--(3210707012,1,'2023-3-11','07:00-07:30'),
--(3210707013,1,'2023-3-11','07:00-07:30'),
--(3210707014,1,'2023-3-11','07:00-07:30')


--SELECT IIF(LC.LimitCount >=(SELECT COUNT(*) AS NowCount
--		FROM tb_LimitCount AS LC
--		RIGHT JOIN tb_Registerd AS R ON R.SpecificTimePeriod=LC.SpecificTimePeriod),'SHI','FOU')
--FROM tb_LimitCount AS LC
--RIGHT JOIN tb_Registerd AS R ON R.SpecificTimePeriod=LC.SpecificTimePeriod
--WHERE R.RegisterTime='2023-3-9' AND R.SpecificTimePeriod='07:00-07:30' 

--SELECT D.DepartmentName,DD.DepartmentDetailName,IIF(U.UserNo='3210707010','是','否') AS IsRegisterd,R.UserNo
--                    FROM tb_Department AS D
--                    LEFT JOIN tb_DepartmentDetail AS DD ON DD.DepartmentNo=D.DepartmentNo
--                    LEFT JOIN tb_Registerd AS R ON R.DepartmentDetailNo=DD.DepartmentDetailNo
--					LEFT JOIN tb_User AS U ON U.UserNo=R.UserNo
--                    WHERE D.DepartmentNo=1 AND DD.DepartmentDetailNo=1 AND R.RegisterTime='2023-3-10' AND R.SpecificTimePeriod='17:00-17:30'

--SELECT *,IIF(R.UserNo='3210707010','SHI','FOU')
--FROM tb_User AS U
--LEFT JOIN tb_Registerd AS R ON U.UserNo=R.UserNo
--WHERE R.DepartmentDetailNo=1 AND R.RegisterTime='2023-3-10' AND R.SpecificTimePeriod='17:30-18:00'
