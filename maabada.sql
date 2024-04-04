--א.בניית המערכת
create database maabada
go
--שימוש במסד הנתונים
use maabada
--1.טבלת החיידקים-g_germs
create table g_germs
(id numeric primary key identity(1,1),
name varchar(20) not null unique ,
short_desc varchar(50),
id_date date not null  check(id_date<=getdate()),
medicine_id numeric,
medicine_date date check(medicine_date<=getdate()));


--2.טבלת תרופות-g_medicine
create table g_medicine
(id numeric primary key identity(500,1) ,
name varchar(20) not null unique);

--3.טבלת ניסויים-g_test

create table g_test
(test_id numeric primary key identity(1000,1),
germ_id numeric foreign key(germ_id) references g_germs(id),
medicin_id numeric foreign key(medicin_id) references g_medicine(id),
test_date date check(test_date<=getdate()),
reaction_type varchar(10) check(reaction_type in('dead','dying','alive')) );


--4.טבלת ארכיון-g_archive
create table g_archive
(germ_name varchar(20),
germ_id numeric foreign key(germ_id) references g_germs(id),
test_date datetime check(test_date<=getdate()),
medicine_name varchar(20),
reaction_type varchar(10) check(reaction_type in('dead','dying','alive')));
 

--5.טבלת הודעת שגיאה-g_exception_table

create table g_exception_table
(message varchar(300),
messagedate datetime default getdate());
--ב.תוכן הטבלאות

--1.טבלת החיידקים-g_germs
  
insert into g_germs(name,id_date) 
values('Pasti','01/jan/1997')
insert into g_germs(name,short_desc,id_date)  
values('Ka','very slim','22/may/1997')
insert into g_germs (name,short_desc,id_date)
values('Yocus','very old','30/jul/1998')
insert into g_germs (name,id_date)
values('Karus','05/feb/1999')
insert into g_germs (name,id_date)
values('Baktus','18/may/1999')


--2.טבלת תרופות-g_medicine
insert g_medicine
values('Unti')
insert g_medicine
values('Acamol')
insert g_medicine
values('Penizilin')
insert g_medicine
values('Asparin')
  

--ג.
--1
--view
create view g_shuts
as
select distinct medicine_name as'שם תרופה',germ_name as 'שם חידק'
,test_date as 'תאריך מציאת תרופה'
from g_archive
where reaction_type='dead'
--1.ב
create proc add_test(@idCH varchar(20), @nameM varchar(20),@dateN date,@statusN varchar(10))
as
begin
insert into g_test values(@idCH, @nameM ,@dateN ,@statusN )
if @statusN='dead'
move_to_archive(@idCH)
end
----------


create proc move_to_archive(@ int) 
as
begin
insert into
end
