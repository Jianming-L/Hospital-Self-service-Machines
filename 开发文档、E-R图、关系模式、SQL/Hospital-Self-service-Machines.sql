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
			SMALLDATETIME
			NOT NULL
		)

	--ԤԼʱ��
	IF OBJECT_ID('tb_RegisterdTime')IS NOT NULL
		DROP TABLE tb_RegisterdTime;
	GO
	CREATE TABLE tb_RegisterdTime
		(No
			CHAR(10)
			NOT NULL
		,RegisterTime--ԤԼʱ��
			SMALLDATETIME
			NOT NULL
		)

