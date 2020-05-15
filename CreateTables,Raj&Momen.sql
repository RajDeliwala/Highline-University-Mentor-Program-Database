
create table Dorm(
DormName   VarChar(20) NOT NULL, 
DormNumber int         NOT NULL,
DormPhone  Char(12)    NOT NULL,
CONSTRAINT Dorm_PK     Primary Key(DormName)
);
create table Student(
SUniversityID   int            Not Null Auto_increment,
SLastName       VarChar(20)    Not Null,
SFirstName      VarChar(20)    Not Null,
SEmail          VarChar(30)    Not Null,
DormName        VarChar(20)    Not Null,
DateEnrolled    Date           Not Null,
DateGraduated   Date           Not Null,
DegreeEarned    VarChar(40)    Not Null,
Constraint      Student_PK     primary key(SUniversityID),
Constraint      Student_FK     FOREIGN KEY(DormName)
                               REFERENCES Dorm(DormName)
							   on delete no action
                               on update cascade
);
create table FactultyAdviser(
FUniversityID     int                not null auto_increment,
FLastName         VarChar(20)        not null,
FFirstName        VarChar(20)        not null,
FEmail            VarChar(50)        not null,
FDepartment       VarChar(20)        not null,
OfficeBuilding    VarChar(15)        not null,
OfficeRoomNumber  int                not null,
OfficePhoneNumber char(12)           not null,
CONSTRAINT        FacultyAdviser_PK  primary key(FUniversityID)
);
create table Company(
CompanyName     VarChar(50)  not null,
CompanyAddress  VarChar(50)  not null,
CompanyCity     VarChar(20)  not null,
CompanyState    VarChar(15)  not null,
CompanyZip      Char(5)      not null,
CompanyPhone    Char(12)     not null,
Constraint      Company_PK   primary key(CompanyName)
);
create table Mentor(
MentorID        int           not null auto_increment,
MLastName       VarChar(25)   not null,
MFirstName      VarChar(25)   not null,
MEmail          VarChar(50)   not null,
CompanyName     VarChar(50)   not null,
CONSTRAINT      Mentor_PK    primary key(MentorID),
CONSTRAINT      Mentor_FK    FOREIGN KEY(CompanyName)
                             REFERENCES company(CompanyName)
                             on delete no action
                             on update cascade
);
create table Alumni(
StudentID      int            not null auto_increment,
ALastName      VarChar(20)    not null,
AFirstName      VarChar(20)    not null,
AEmail         VarChar(50)    not null,
AHomeAddress   VarChar(40)    not null,
ACity          VarChar(20)    not null,
AState         VarChar(10)    not null,
AZip           Char(5)        not null,
APhone         Char(12)       not null,
CONSTRAINT     Alumni_PK      primary key(StudentID)
);
CREATE  TABLE Student_Faculty(

    FUniversityID		Int				NOT NULL,
	SUniversityID		Int				NOT NULL,
	Date_assigned		Date	 		NOT NULL,
	Date_ended			Date			NOT NULL,
    
	CONSTRAINT 			F_S_Uni_PK 		PRIMARY KEY (FUniversityID, SUniversityID),
    
    
	CONSTRAINT 			F_Uni_FK 		FOREIGN KEY(FUniversityID)
							REFERENCES FactultyAdviser(FUniversityID)
								ON DELETE NO ACTION
                                ON UPDATE NO ACTION	,
	CONSTRAINT 			S_Uni_FK 	FOREIGN KEY(SUniversityID)
							REFERENCES Student (SUniversityID)								
								ON DELETE NO ACTION
                                ON UPDATE NO ACTION
    );
CREATE  TABLE Faculty_Mentor(

    FUniversityID		Int				NOT NULL,
	MentorID			Int				NOT NULL,
	Date_assigned		Date	 		NOT NULL,
	Date_ended			Date			NOT NULL,
    
	CONSTRAINT 			FUni_Mentor_PK 		PRIMARY KEY (FUniversityID, MentorID),
    
	CONSTRAINT 			SUni_FK 			FOREIGN KEY(FUniversityID)
							REFERENCES FactultyAdviser(FUniversityID)
								ON DELETE NO ACTION
                                ON UPDATE NO ACTION	,
	CONSTRAINT 			MentorID 	FOREIGN KEY(MentorID)
							REFERENCES Mentor(MentorID)								
								ON DELETE NO ACTION
                                ON UPDATE NO ACTION
    );
CREATE  TABLE Student_Mentor(

    SUniversityID		Int				NOT NULL,
	MentorID			Int				NOT NULL,
	Date_assigned		Date	 		NOT NULL,
	Date_ended			Date			NOT NULL,
    
	CONSTRAINT 			SUni_MentorID_DateAssign_DateEnd_PK 		
    PRIMARY KEY (SUniversityID, MentorID,Date_assigned,Date_ended),
    
	CONSTRAINT 			S_Univ_FK 			FOREIGN KEY(SUniversityID)
							REFERENCES Student(SUniversityID)
								ON DELETE NO ACTION
                                ON UPDATE NO ACTION	,
                                
	CONSTRAINT 			Mentor_ID 	FOREIGN KEY(MentorID)
							REFERENCES Mentor(MentorID)								
								ON DELETE NO ACTION
                                ON UPDATE NO ACTION
    );








