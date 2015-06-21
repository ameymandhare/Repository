Begin Transaction

Create Table tColumnCodes(
cc_id int Identity(1,1),
cc_code nvarchar(5) unique
)
GO
Insert into tColumnCodes(cc_code) values('Ews')
Insert into tColumnCodes(cc_code) values('Ems')
Insert into tColumnCodes(cc_code) values('Rol')
Insert into tColumnCodes(cc_code) values('Cls')
Insert into tColumnCodes(cc_code) values('Sec')
Insert into tColumnCodes(cc_code) values('Csc')
Insert into tColumnCodes(cc_code) values('Hus')
Insert into tColumnCodes(cc_code) values('Add')
Insert into tColumnCodes(cc_code) values('Gen')
Insert into tColumnCodes(cc_code) values('stud')
Insert into tColumnCodes(cc_code) values('Stf')
GO
CREATE TABLE tEWSMessage(
Ews_Id int IDENTITY(1,1), 
Ews_ReportId nvarchar(30), 
Ews_SeverityId int,
Ews_Description text,
Ews_LoggedDate datetime
)
GO
CREATE TABLE tEWSMessageSeverity(
Ems_SeverityId int IDENTITY(1,1),  
Ems_Severity nvarchar(15)
)
Insert into tEWSMessageSeverity(Ems_Severity) values('Error')
Insert into tEWSMessageSeverity(Ems_Severity) values('Warning')
Insert into tEWSMessageSeverity(Ems_Severity) values('Information')
Insert into tEWSMessageSeverity(Ems_Severity) values('Other')
GO
Create Table tRoles(
Rol_RoleId int identity(1,1),
Rol_CanAdd bit,
Rol_CanEdit bit,
Rol_CanDelete bit,
Rol_CanView bit Default 1,
Rol_IsDeleted bit Default 0, 
Rol_DeletedDate Datetime,
Rol_DeletedBy int,
Rol_LastUpdatedDate Datetime,
Rol_LastUpdatedBy int
constraint pk_rol_RoleId Primary Key(Rol_RoleId)
);

Insert into tRoles(rol_CanAdd,rol_CanEdit,rol_CanDelete) values(1,1,1);
Insert into tRoles(rol_CanAdd,rol_CanEdit,rol_CanDelete) values(0,0,0);

GO

CREATE TABLE tAcademicYear(
Acy_Id int IDENTITY(1,1) Primary Key, 
Acy_AcademicYear nvarchar(30), 
Acy_StartDate datetime NOT NULL,
Acy_EndDate datetime NOT NULL,
Acy_IsActive bit NOT NULL,
Acy_IsDeleted bit Default 0,
Acy_DeletedDate Datetime,
Acy_DeletedBy int,
Acy_LastUpdatedDate Datetime,
Acy_LastUpdatedBy int
)
insert into tAcademicYear(Acy_AcademicYear,Acy_StartDate,Acy_EndDate,Acy_IsActive) Values('A.Y. 2015-2015', '2015-06-01 00:00:00.000','2016-04-01 00:00:00.000', 1)

GO

create table tGender(
Gen_Id int identity(1,1) Primary Key,
Gen_Code nvarchar(1),
Gen_Text nvarchar(25)
)

GO

insert into tGender(Gen_Code,Gen_Text) Values('M', 'Male')
insert into tGender(Gen_Code,Gen_Text) Values('F', 'Female')
insert into tGender(Gen_Code,Gen_Text) Values('B', 'Both')

GO

CREATE TABLE tClass(
Cls_Id int IDENTITY(1,1) Primary Key,
Cls_Name nvarchar(25),
Cls_DisplayName nvarchar(25),
Cls_IsDeleted bit Default 0, 
Cls_DeletedDate Datetime,
Cls_DeletedBy int,
Cls_LastUpdatedDate Datetime,
Cls_LastUpdatedBy int
)

GO

insert into tClass(Cls_Name,Cls_DisplayName) Values('1', 'First Standard')
insert into tClass(Cls_Name,Cls_DisplayName) Values('2', 'Second Standard')
insert into tClass(Cls_Name,Cls_DisplayName) Values('3', 'Third Standard')
insert into tClass(Cls_Name,Cls_DisplayName) Values('4', 'IV')
insert into tClass(Cls_Name,Cls_DisplayName) Values('5', 'V')
insert into tClass(Cls_Name,Cls_DisplayName) Values('6', 'VI')
insert into tClass(Cls_Name,Cls_DisplayName) Values('7', 'VII')
insert into tClass(Cls_Name,Cls_DisplayName) Values('8', 'VIII')
insert into tClass(Cls_Name,Cls_DisplayName) Values('9', 'IX')
insert into tClass(Cls_Name,Cls_DisplayName) Values('10', 'X')

GO

CREATE TABLE tSection(
Sec_Id int IDENTITY(1,1) Primary Key,
Sec_Name nvarchar(25),
Sec_DisplayName nvarchar(25),
Sec_IsDeleted bit Default 0, 
Sec_DeletedDate Datetime,
Sec_DeletedBy int,
Sec_LastUpdatedDate Datetime,
Sec_LastUpdatedBy int
)

GO

insert into tSection(Sec_Name,Sec_DisplayName) Values('A', 'Division A')
insert into tSection(Sec_Name,Sec_DisplayName) Values('B', 'Division B')

GO

CREATE TABLE tClassSection(
Csc_Id int IDENTITY(1,1) Primary Key, 
Csc_ClassId int Foreign Key References tClass(Cls_Id), 
Csc_SectionId int Foreign Key References tSection(Sec_Id),
Csc_DisplayName nvarchar(30),
Csc_IsDeleted bit Default 0, 
Csc_DeletedDate Datetime,
Csc_DeletedBy int,
Csc_LastUpdatedDate Datetime,
Csc_LastUpdatedBy int
)

GO
insert into tClassSection(Csc_ClassId,Csc_SectionId,Csc_DisplayName) Values(1, 1,'First-A')
insert into tClassSection(Csc_ClassId,Csc_SectionId,Csc_DisplayName) Values(1, 1,'First-B')
insert into tClassSection(Csc_ClassId,Csc_SectionId,Csc_DisplayName) Values(4, 1,'IV-A')
insert into tClassSection(Csc_ClassId,Csc_SectionId,Csc_DisplayName) Values(5, 1,'V-A')
insert into tClassSection(Csc_ClassId,Csc_SectionId,Csc_DisplayName) Values(6, 1,'VI-A')
insert into tClassSection(Csc_ClassId,Csc_SectionId,Csc_DisplayName) Values(7, 1,'VII-A')
insert into tClassSection(Csc_ClassId,Csc_SectionId,Csc_DisplayName) Values(8, 1,'VIII-A')
insert into tClassSection(Csc_ClassId,Csc_SectionId,Csc_DisplayName) Values(9, 1,'IX-A')
insert into tClassSection(Csc_ClassId,Csc_SectionId,Csc_DisplayName) Values(10, 1,'X-A')


GO

CREATE TABLE tHouses(
Hus_Id int IDENTITY(1,1) Primary Key, 
Hus_Name nvarchar(30), 
Hus_Description nvarchar(200),
Hus_IsDeleted bit Default 0,
Hus_DeletedDate Datetime,
Hus_DeletedBy int,
Hus_LastUpdatedDate Datetime,
Hus_LastUpdatedBy int
)

GO

insert into tHouses(Hus_Name,Hus_Description) Values('Agni', 'Red House')
insert into tHouses(Hus_Name,Hus_Description) Values('Varun', 'Blue House')

GO

CREATE TABLE tHouseDesignation(
Hsd_Id int IDENTITY(1,1) Primary Key, 
Hsd_HouseId int Foreign Key References tHouses(Hus_Id), 
Hsd_Name nvarchar(30), 
Hsd_Description nvarchar(200),
Hsd_DesCode nvarchar(3),
Hsd_Gender int Foreign Key References tGender(Gen_Id),
Hsd_IsDeleted bit Default 0,
Hsd_DeletedDate Datetime,
Hsd_DeletedBy int,
Hsd_LastUpdatedDate Datetime,
Hsd_LastUpdatedBy int
)

GO

insert into tHouseDesignation(Hsd_HouseId, Hsd_Name,Hsd_Description, Hsd_Gender,Hsd_DesCode) Values(1, 'Prefect', 'Prefect', 3, 'PR')
insert into tHouseDesignation(Hsd_HouseId, Hsd_Name,Hsd_Description, Hsd_Gender,Hsd_DesCode) Values(1, 'vice Prefect', 'Vice Prefect', 3, 'VP')
insert into tHouseDesignation(Hsd_HouseId, Hsd_Name,Hsd_Description, Hsd_Gender,Hsd_DesCode) Values(1, 'Junior Prefect', 'Junior Prefect', 3, 'JP')
insert into tHouseDesignation(Hsd_HouseId, Hsd_Name,Hsd_Description, Hsd_Gender,Hsd_DesCode) Values(2, 'Prefect', 'Prefect', 3, 'PR')
insert into tHouseDesignation(Hsd_HouseId, Hsd_Name,Hsd_Description, Hsd_Gender,Hsd_DesCode) Values(2, 'vice Prefect', 'Vice Prefect', 3, 'VP')
insert into tHouseDesignation(Hsd_HouseId, Hsd_Name,Hsd_Description, Hsd_Gender,Hsd_DesCode) Values(2, 'Junior Prefect', 'Junior Prefect', 3, 'JP')



GO

CREATE TABLE tSenateDesignation(
Sen_Id int IDENTITY(1,1) Primary Key, 
Sen_Name nvarchar(30), 
Sen_Description nvarchar(200),
Sen_DesCode nvarchar(3),
Sen_Gender int Foreign Key References tGender(Gen_Id),
Sen_IsDeleted bit Default 0,
Sen_DeletedDate Datetime,
Sen_DeletedBy int,
Sen_LastUpdatedDate Datetime,
Sen_LastUpdatedBy int
)

GO

insert into tSenateDesignation(Sen_Name, Sen_Description, Sen_Gender, Sen_DesCode) Values('Head Boy', 'Head Boy', 1, 'HB')
insert into tSenateDesignation(Sen_Name, Sen_Description, Sen_Gender, Sen_DesCode) Values('Head Girl', 'Head Girl', 2, 'HG')
insert into tSenateDesignation(Sen_Name, Sen_Description, Sen_Gender, Sen_DesCode) Values('Games Captain', 'Games Captain', 3, 'GC')
insert into tSenateDesignation(Sen_Name, Sen_Description, Sen_Gender, Sen_DesCode) Values('Vice Games Captain', 'Vice Games Captain', 3, 'VGC')





Create table tAddress(
Add_AddressId int identity(1,1),
Add_AddressLine1 nvarchar(250),
Add_AddressLine2 nvarchar(250),
Add_CityId int,
Add_StateId int,
Add_CountryId int,
Add_Pincode nvarchar(6),
Add_IsDeleted bit Default 0, 
Add_DeletedDate Datetime,
Add_DeletedBy int,
Add_LastUpdatedDate Datetime,
Add_LastUpdatedBy int
Constraint PK_add_AddressId Primary Key(Add_AddressId)
);



GO

CREATE TABLE tStudent(
stud_Id int IDENTITY(1001,1) NOT NULL, 
stud_Key as 'KL'+Cast(stud_Id as nVarchar(10)) PERSISTED PRIMARY KEY, 
stud_FirstName nvarchar(50),
stud_MiddleName nvarchar(50),
stud_LastName nvarchar(50),
stud_DoB Datetime,
stud_GenderId int Foreign Key References tGender(Gen_Id),
stud_ClassSectionId int Foreign Key References tClassSection(Csc_Id),
stud_HouseId int Foreign Key References tHouses(Hus_Id),
stud_IsActive bit Default 1,
stud_Password nvarchar(10),
stud_CreatedDate Datetime Default getdate(),
stud_CreatedBy int,
stud_IsDeleted bit Default 0, 
stud_DeletedDate Datetime,
stud_DeletedBy int,
stud_LastUpdatedDate Datetime,
stud_LastUpdatedBy int
)

GO

Insert into tStudent(stud_FirstName,stud_MiddleName,stud_LastName,stud_DoB,stud_GenderId,stud_ClassSectionId,stud_HouseId)
Values('Gaurav','','Mothekadam','2010-06-01 00:00:00.000',1,1,1),
('Suraj','S','Shenmare','2010-01-01 00:00:00.000',1,1,2),
('Amey','S','Mandhare','2010-02-02 00:00:00.000',1,2,2)

GO

Create table tStaff(
Stf_UserId int identity(1,1),
Stf_FirstName nvarchar(50),
Stf_MiddleName nvarchar(50),
Stf_LastName nvarchar(50),
Stf_DoB Datetime,
Stf_EmailId nvarchar(250),
Stf_ContactNo nvarchar(25),
Stf_GenderId int,
Stf_AddressId int,
Stf_IsCandidate bit,
Stf_RoleId int,
Stf_Password nvarchar(10),
Stf_CreatedDate Datetime,
Stf_CreatedBy int,
Stf_IsDeleted bit Default 0, 
Stf_DeletedDate Datetime,
Stf_Usr_DeletedBy int,
Stf_LastUpdatedDate Datetime,
Stf_LastUpdatedBy int
Constraint PK_Users_UserId Primary Key(Stf_UserId)
Constraint FK_RoleId foreign key(Stf_RoleId)
references tRoles(rol_RoleId),
--Constraint FK_AddressId foreign key(AddressId)
--references tAddress(add_AddressId)
);


GO

CREATE TABLE tSenateNomination(
Snn_Id int IDENTITY(1,1) Primary Key, 
Snn_SenateDesignationId int Foreign Key References tSenateDesignation(Sen_Id), 
Snn_ClassSectionId int Foreign Key References tClassSection(Csc_Id),
Snn_studKey nvarchar(12) Foreign Key References tStudent(stud_Key),
Snn_VoteCount int default 0,
Snn_Photo text,
Snn_AboutNominee text,
Snn_IsDeleted bit Default 0,
Snn_DeletedDate Datetime,
Snn_DeletedBy int,
Snn_LastUpdatedDate Datetime,
Snn_LastUpdatedBy int
)

GO

insert into tSenateNomination(Snn_SenateDesignationId, Snn_ClassSectionId, Snn_studKey) Values(1, 2, 'KL1003')

GO

CREATE TABLE tVotedStudent(
Vst_Id int IDENTITY(1,1) Primary Key, 
Vst_StudentKey nvarchar(12) Foreign Key References tStudent(stud_Key),
Vst_IVFHouse bit NOT NULL, 
Vst_IVFHeadSenate bit NOT NULL,
Vst_IVFGamesCap bit NOT NULL,
Vst_IVFGamesViceCap bit NOT NULL,
Vst_VoatedOn datetime default getdate(),
Vst_IsDeleted bit Default 0,
Vst_DeletedDate Datetime,
Vst_DeletedBy int,
Vst_LastUpdatedDate Datetime,
Vst_LastUpdatedBy int
)

GO

CREATE TABLE tHouseNomination(
Hsn_Id int IDENTITY(1,1) Primary Key, 
Hsn_HouseId int Foreign Key References tGender(Gen_Id), 
Hsn_HouseDesignationId int Foreign Key References tHouseDesignation(Hsd_Id), 
Hsn_ClassSectionId int Foreign Key References tClassSection(Csc_Id),
Hsn_studKey nvarchar(12) Foreign Key References tStudent(stud_Key),
Hsn_VoteCount int default 0,
Hsn_Photo text,
Hsn_AboutNominee text,
Hsn_IsDeleted bit Default 0,
Hsn_DeletedDate Datetime,
Hsn_DeletedBy int,
Hsn_LastUpdatedDate Datetime,
Hsn_LastUpdatedBy int
)

GO

insert into tHouseNomination(Hsn_HouseId, Hsn_HouseDesignationId, Hsn_ClassSectionId, Hsn_studKey) Values(1, 1, 1, 'KL1001')
GO

Create View vLogin
As
select 
		Stf_EmailId AS Username,
		Stf_Password AS Password,
		'S' AS UserType
from 
		tStaff
where 
		isnull(Stf_IsDeleted, 0) = 0

UNION

select 
		stud_Key AS Username,
		stud_Password AS Password,
		'C' AS UserType
from 
		tStudent
where 
		isnull(stud_IsDeleted, 0) = 0

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amey Mandhare
-- Create date: 13-6-2015
-- Description:	Get User details according to logged in user for storing session object
-- EXEC SP_GetUserSession 'KL1', 'c'
-- =============================================
CREATE PROCEDURE SP_GetUserSession @UserName nvarchar(25), @UserType nvarchar 
AS
BEGIN
	
	if LOWER(@UserType) = 'c'
		BEGIN
			SELECT 
					stud_Id,
					stud_Key,
					stud_FirstName,
					stud_MiddleName,
					stud_LastName,
					stud_DoB,
					stud_GenderId,
					Gen_Text,
					Gen_Code,
					stud_ClassSectionId, 
					Cls_Id,
					Cls_DisplayName,
					Sec_Id,
					Sec_Name,
					Csc_DisplayName,
					Hus_Id,
					Hus_Name,
					'C' AS UserType 
			FROM	
					tStudent 
					JOIN tGender ON stud_GenderId = Gen_Id
					JOIN tClassSection ON stud_ClassSectionId = Csc_Id
					JOIN tHouses ON stud_HouseId = Hus_Id
					JOIN tClass ON Csc_ClassId = Cls_Id
					JOIN tSection ON Csc_SectionId = Sec_Id
			WHERE 
					LOWER(stud_Key) = LOWER(@UserName) AND 
					ISNULL(stud_IsDeleted,0) != 1

		END
	
	else if LOWER(@UserType) = 's'
	
		BEGIN
			SELECT *, 'S' AS UserType FROM tStaff WHERE LOWER(Stf_EmailId) = LOWER(@UserName) AND ISNULL(Stf_IsDeleted,0) != 1
		END
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amey Mandhare
-- Create date: 13-6-2015
-- Description:	Get User details according to logged in user for storing session object
-- EXEC SP_UpdateUserPassword 'KL1', '2010-06-01 00:00:00.000', '123'
-- =============================================
CREATE PROCEDURE SP_UpdateUserPassword @UserName nvarchar(25), @UserDoB Datetime, @NewPassword nvarchar(20)
AS
BEGIN
	Update tStudent
	Set stud_Password = lower(@NewPassword)
	where lower(stud_Key) = lower(@UserName)
	and stud_DoB = @UserDoB
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amey Mandhare
-- Create date: 13-6-2015
-- Description:	Check Login credentials in Login view
-- EXEC SP_VerifyUser 'KL1', '123'
-- =============================================
CREATE PROCEDURE SP_VerifyUser @UserName nvarchar(25), @NewPassword nvarchar(20)
AS
BEGIN
	Select 
			* 
	from 
			vLogin 
	Where 
			lower(Username) = lower(@UserName) and
			lower(Password) = lower(@NewPassword)
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amey Mandhare
-- Create date: 13-6-2015
-- Description:	Log Error, Info, Warning using EWS
-- EXEC SP_LoggError 1, 'Test Test Test'
-- =============================================
CREATE PROCEDURE SP_LoggError @SeverityId int, @Description text
AS
BEGIN
	Insert into tEWSMessage(Ews_SeverityId, Ews_Description, Ews_LoggedDate)
	Values(@SeverityId, @Description, GETDATE())
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amey Mandhare
-- Create date: 13-6-2015
-- Description:	Get All student data to cached for Register purpose
-- EXEC SP_GetAllStudents
-- =============================================
CREATE PROCEDURE SP_GetAllStudents 
AS
BEGIN
	
	
			SELECT 
					stud_Id,
					stud_Key,
					stud_FirstName,
					stud_MiddleName,
					stud_LastName,
					stud_DoB,
					stud_GenderId,
					Gen_Text,
					Gen_Code,
					stud_ClassSectionId, 
					Cls_Id,
					Cls_DisplayName,
					Sec_Id,
					Sec_Name,
					Csc_DisplayName,
					Hus_Id,
					Hus_Name,
					'C' AS UserType 
			FROM	
					tStudent 
					JOIN tGender ON stud_GenderId = Gen_Id
					JOIN tClassSection ON stud_ClassSectionId = Csc_Id
					JOIN tHouses ON stud_HouseId = Hus_Id
					JOIN tClass ON Csc_ClassId = Cls_Id
					JOIN tSection ON Csc_SectionId = Sec_Id
			WHERE 
					ISNULL(stud_IsDeleted,0) != 1

END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amey Mandhare
-- Create date: 13-6-2015
-- Description:	Get All student data to cached for Register purpose
-- EXEC SP_GetAllSenateNominee
-- =============================================
CREATE PROCEDURE SP_GetAllSenateNominee 
AS
BEGIN
	Select 
			Snn_Id as NomineeId,
			Sen_DesCode as DesignationCode,
			stud_key as StudentID,
			stud_FirstName + ' '+stud_MiddleName+' '+stud_LastName as StudentName,
			Csc_DisplayName as ClassSection,
			Snn_Photo as PhotoURL,
			Snn_SenateDesignationId as DesignationID,
			Sen_Name as DesignationText,
			Snn_AboutNominee as AboutMe

	from 
			tSenateNomination
			JOIN tSenateDesignation on Snn_SenateDesignationId = Sen_Id
			JOIN tStudent on Snn_studKey = stud_Key
			JOIN tClassSection ON stud_ClassSectionId = Csc_Id
	where 
			stud_IsDeleted = 0
END
GO

  
  
-- =============================================  
-- Author:  Suraj Shenmare  
-- Create date: 21-6-2015  
-- Description: Get house nomination names by house id  
-- EXEC SP_GetHouseNominationsNameByHouseId 0  
-- =============================================  
CREATE PROCEDURE [dbo].[SP_GetHouseNominationsNameByHouseId] @HouseId int  
AS  
BEGIN  
 If(@HouseId=0)  
	Select 
			HN.Hsn_Id as NomineeId,
			HD.Hsd_DesCode as DesignationCode,
			S.stud_key as StudentID,
			S.stud_FirstName + ' '+ ISNULL(S.stud_MiddleName,'') +' '+ ISNULL(S.stud_LastName,'') as StudentName,
			CS.Csc_DisplayName as ClassSection,
			HN.Hsn_Photo as PhotoURL,
			HN.Hsn_HouseDesignationId as DesignationID,
			HD.Hsd_Name as DesignationText,
			HN.Hsn_AboutNominee as AboutMe

	from 
			tHouseNomination HN 
			JOIN tHouseDesignation HD on HD.Hsd_Id = HN.Hsn_Id  AND ISNULL(HD.Hsd_IsDeleted,0)!=1
			JOIN tStudent S ON S.stud_HouseId = HN.Hsn_HouseId AND ISNULL(S.stud_IsDeleted,0)!=1  
			JOIN tHouses H ON H.Hus_Id=S.stud_HouseId AND ISNULL(H.Hus_IsDeleted,0)!=1  
			JOIN tClassSection CS ON S.stud_ClassSectionId = Cs.Csc_Id AND ISNULL(CS.Csc_IsDeleted,0)!=1
	where 
			ISNULL(HN.Hsn_IsDeleted,0) != 1  
 ELSE IF(@HouseId>0)  
  Select 
			HN.Hsn_Id as NomineeId,
			HD.Hsd_DesCode as DesignationCode,
			S.stud_key as StudentID,
			S.stud_FirstName + ' '+ ISNULL(S.stud_MiddleName,'') +' '+ ISNULL(S.stud_LastName,'') as StudentName,
			CS.Csc_DisplayName as ClassSection,
			HN.Hsn_Photo as PhotoURL,
			HN.Hsn_HouseDesignationId as DesignationID,
			HD.Hsd_Name as DesignationText,
			HN.Hsn_AboutNominee as AboutMe

	from 
			tHouseNomination HN 
			JOIN tHouseDesignation HD on HD.Hsd_Id = HN.Hsn_Id  AND ISNULL(HD.Hsd_IsDeleted,0)!=1
			JOIN tStudent S ON S.stud_HouseId = HN.Hsn_HouseId AND ISNULL(S.stud_IsDeleted,0)!=1  
			JOIN tHouses H ON H.Hus_Id=S.stud_HouseId AND ISNULL(H.Hus_IsDeleted,0)!=1  
			JOIN tClassSection CS ON S.stud_ClassSectionId = Cs.Csc_Id AND ISNULL(CS.Csc_IsDeleted,0)!=1
	where 
			ISNULL(HN.Hsn_IsDeleted,0) != 1  AND H.Hus_Id=@HouseId  
END  