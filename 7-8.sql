----7
create function TEST_TO_GRM (@id numeric)
returns int
as
begin
declare @count int
set @count=(select count(*)from[dbo].[g_test]where germ_id =@id)
return @count
end
--8
create function  GERM_FOR_SUT(@name nvarchar(20))
returns @t table 
(medicine_name varchar(20),germ_name varchar(20))
as
begin
insert into @t
		select germ_name,medicine_name
		from g_archive 
		where @name=medicine_name
		return
end