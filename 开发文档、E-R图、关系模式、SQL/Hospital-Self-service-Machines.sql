USE master
GO
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

	--����֢״����
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
	(00,'---��ѡ��---'),
	(01,'ͷ�Ρ�ѣ��'),
	(02,'ͷ��'),
	(03,'ʧ��'),
	(04,'�����'),
	(05,'����'),
	(06,'����'),
	(07,'����'),
	(08,'�鷿��'),
	(09,'������'),
	(10,'С���쳣'),
	(11,'��Ѫ'),
	(12,'���ؼ���'),
	(13,'������'),
	(14,'����'),
	(15,'����')

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
	(00,'---��ѡ��---',00),
	(01,'�����ڿ�',01),
	(02,'��Ѫ���ڿ�',01),
	(03,'���ڿ�',01),
	(04,'�����ڿ�',01),
	(05,'�ڷ��ڿ�',01),
	(06,'��ʪ���߿�',01),
	(07,'���ڿ�',01),
	(08,'�����',02),
	(09,'�������',02),
	(10,'�������',02),
	(11,'�������',02),
	(12,'�ε����',02),
	(13,'θ�����',02),
	(14,'�س����',02),
	(15,'�ǿ�',02),
	(16,'�ۿ�',03),
	(17,'�����ʺ��',03),
	(18,'��ǻ��',03),
	(19,'ͷ�����',03),
	(20,'����',04),
	(21,'����',04),
	(22,'Ƥ������',05),
	(23,'�Բ���',05),
	(24,'���񲡿�',06),
	(25,'������ѯ��',06),
	(26,'����',07),
	(27,'������',07),
	(28,'��Ⱦ��',07),
	(29,'�����',07),
	(30,'�����',07),
	(31,'���ο�',07),
	(32,'ѪҺ��',01),
	(33,'ѪҺ���',02)

		--����֢״
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
		,SuggestDepartmentDetailNo--������ϸ����
			INT
			NOT NULL
			CONSTRAINT fk_Symptom_SuggestDepartmentDetailNo
			FOREIGN KEY (SuggestDepartmentDetailNo)
			REFERENCES tb_DepartmentDetail(DepartmentDetailNo)
			ON DELETE CASCADE
			ON UPDATE CASCADE
		)
	INSERT INTO tb_Symptom(SymptomNo,Symptom,SuggestDepartmentDetailNo) VALUES
	(00,'---��ѡ��---',00),
	(01,'վ���ȣ��۾���ת��������ʶ����',03),
	(01,'��ʱ��ǰ����ʹ���Ļš����಻��',01),
	(01,'��ʱ�����ۣ��������顢����֢״',15),
	(01,'ѣ����ͷ��λ�øı��й�,�����»���ͷ��',16),
	(01,'������ɫ�԰�',32),
	(02,'���������ͷ��',08),
	(02,'����ͷ�ۣ�ƣ�͡�����ʱ����',03),
	(02,'����ѣ�Σ����������߶���������',17),
	(03,'ѹ���󡢽���',25),
	(03,'����+����+����',17),
	(03,'�����˶�������',02),
	(04,'˯������࣬ż������ͣ�������룬�����򴭲���',01),
	(04,'˯������࣬ż������ͣ�������룬�����򴭲���',17),
	(05,'����ԡ���̵����ʹ',01),
	(05,'��ͷ�ۡ����ġ���־����',03),
	(05,'�鸹к�����͡���ʹ',28),
	(06,'�������ס���ʹ',18),
	(06,'����+���ۣ�����',17),
	(06,'�����˶�������',02),
	(07,'�ؿڻ���ǰ��ʹ����ѹ�ȸУ������Ļ����̣���Ϣ���Ի���',02),
	(07,'���۰��п��ԡ������ʱ���أ�������Ĥ���β�����',01),
	(07,'���۰��п��ԡ������ʱ���أ�������Ĥ���β�����',09),
	(07,'�˶���ͻȻ���־�����ʹ�������к�������',09),
	(07,'����۵��������£��ڽ�������������ʱ��ʹ�Ӿ�',15),
	(07,'�عǺ����ಿλ�н����У�����3-5����',29),
	(08,'�鷿�ۣ�������С��񣬳�������������',10),
	(08,'�����鷿��ʹ',05),
	(08,'���ټ��ֲ�Ƥ������ˮ�������ʹ',22),
	(09,'���ϸ������¸��ļ��Ը���',13),
	(09,'��ʹ���з��ᡢŻ�¡���к',04),
	(09,'��ʹ���и�к������',13),
	(09,'��ʹ���и�к������',14),
	(09,'��ʹ�����򼱡���Ƶ����ʹ����Ѫ',11),
	(09,'Ů��ͣ���������Ը���',20),
	(10,'Ѫ��',11),
	(10,'Ѫ��',07),
	(10,'��Ƶ���򼱡�����',07),
	(10,'���ٰ�������',11),
	(10,'���ٰ��и���',07),
	(11,'��ɫ�򰵺�ɫ�ı�Ѫ',04),
	(11,'�ʺ�ɫ�ı�Ѫ',14),
	(12,'����ࡢ��ʳ',05),
	(12,'�����ȡ��ູ������',05),
	(12,'����ʳ������쳣',04),
	(13,'��ĳ���ؽ��ס�ʹ',15),
	(13,'����ؽ�ʹͬʱ�������׹ؽڡ���ֺ�ؽڳ��ֺ�����ʹ�������ڳԺ��ʡ�ơ�ƺ���',06),
	(13,'�ȶ����ͣ���ָ��ѹ���ۣ���·����Ϣ�ܻ���',33),
	(14,'����Ϊ������������',07),
	(14,'����Ϊ������ƾ�',04),
	(14,'��֫��Ϊ����������',02),
	(15,'Ƥ���������������������',22)

	--�û�ԤԼ��
	IF OBJECT_ID('tb_Registerd')IS NOT NULL
		DROP TABLE tb_Registerd;
	GO
	CREATE TABLE tb_Registerd
		(UserNo
			CHAR(10)
			NOT NULL
		,DepartmentDetailNo--��ϸ���Һ�
			INT
			NOT NULL
		,RegisterTime--ȷ��ԤԼ����ʱ��
			DATE
			NOT NULL
		,SpecificTimePeriod--����ʱ���
			CHAR(20)
			NOT NULL
		)

	--ԤԼʱ��
	IF OBJECT_ID('tb_RegisterdTime')IS NOT NULL
		DROP TABLE tb_RegisterdTime;
	GO
	CREATE TABLE tb_RegisterdTime
		(No
			INT
			NOT NULL
			PRIMARY KEY(No)
		,RegisterTime--ԤԼʱ��
			CHAR(20)
			NOT NULL
		)
	INSERT INTO tb_RegisterdTime(No,RegisterTime) VALUES
	(0,'---��ѡ��---'),
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

	----����ԤԼ������
	--IF OBJECT_ID('tb_LimitRegisterd')IS NOT NULL
	--	DROP TABLE tb_LimitRegisterd;
	--GO
	--CREATE TABLE tb_LimitRegisterd
	--	(DepartmentDetailNo--��ϸ���Һ�
	--		INT
	--	,RegisterTime--ȷ��ԤԼ����ʱ��
	--		DATE
	--	,SpecificTimePeriod--����ʱ���
	--		CHAR(20)
	--	,NowCount--��ǰ����
	--		INT
	--	)

	IF OBJECT_ID('tb_LimitCount')IS NOT NULL
		DROP TABLE tb_LimitCount
	GO
	CREATE TABLE tb_LimitCount
		(SpecificTimePeriod--����ʱ���
			CHAR(20)
		,LimitCount--��������
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
