create database Laboratory
go
use Laboratory

create table Patient
(
ptID varchar(9) primary key,
ptFirstName varchar(20),
ptlastName varchar(20)
)

create table CheckType
(
chkCode int identity (100,1) primary key,
chkDescription varchar(100),
chkMin int,
chkMax int
)

create table Visit
(
vsCode int identity (1,1) primary key,
vsDate date,
vsPID varchar (9) foreign key (vsPID) references Patient (ptID),
)

create table Result
(
rsCode int identity (1,1) primary key,
rsVCode int foreign key (rsVCode) references Visit(vsCode),
rsChkTCode int foreign key (rsChkTCode) references CheckType(chkCode),
rsResult int
)

insert into Patient values
('325953836','chagit','epstin'),
('657382904','chani','glazer'),
('022415646','shira','aviv'),
('324537669','michal','david'),
('325673882','tamar','levin'),
('021371668','elishva','choen')

insert into CheckType values
('homoglobin',113,160),
('mishkal',220,400),
('lachatzDam',120,190),
('high',50,220)

insert into Visit values
('12/01/2023','021371668'),('08/04/2022','325673882'),('10/09/2021','324537669')


