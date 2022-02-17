create database Facebook
create table Userr(
Id int identity primary key,
Name nvarchar(100),
Surname nvarchar(100),
ProfilePhoto nvarchar(100),
Biography nvarchar(100),
PostCount int
)
create table Posts(
Id int identity primary key,
Image nvarchar(100),
Text nvarchar(100),
)
create table Comment(
Id int identity primary key,
Text nvarchar(100),
)
alter table Posts add UserId int references Userr(Id)
alter table Comment add PostId int references Posts(Id)

create view UsersPosts as
select u.Name,u.Surname,p.Image,p.Text from Userr as u
join Posts as p
on u.Id=p.UserId

alter table Comment add UserId int references Userr(Id)

update Userr
set PostCount=0

insert into Posts values (null,'hello',2)

create trigger PostAdded
on Posts
after insert
as
begin
update Userr set PostCount=PostCount+1 where id=(select UserId from  inserted Posts)
end
