select * from student;
select * from user;
select * from enrollment;
select * from profesor;
select * from curs;

select email from user;
select firstName from user;
select department from curs;
select age from user;

select firstName, lastName from user;
select email, age from student;

select firstName as prenume, lastName as "Nume de familie" from user;
select age as varsta, password as "Parola" from student;

select * from student where age < 20;
select firstName, lastName from user where password = 'parola1';
select email from user where firstName = 'Ana';
select firstName as cursant from profesor where nrOreSaptamana>10;

select * from curs where department <> 'Matematica';
select profesorId as codProfesor from curs where department != 'Informatica';

select * from student where age <= 20;
select * from student where age > 20;

select name as curs from curs where department = 'Fizica' or department = 'Chimie';

select email from user where id in (1,3);

select email from student where id not in (1,3,5);

select * from student where age between 19 and 21;

select * from student where password like '%pass%';




insert into profesor values (6, 'Danila', 'Iulian', 'danila@gmail.com', 35, 'parolaParola', 24);

update user set age = 20;

update user set age = 19 where id = 1;
select * from user;
update user set age = 24 where id =3;

delete from profesor where id = 6;

begin;
rollback;




select * from student order by age asc;

select * from student order by id desc;

select * from student where password like '%pass%' order by id asc;

select * from student order by firstName asc,
                               age asc;

select * from profesor;

select * from profesor limit 4;

select * from profesor limit 1 offset 3;
select * from profesor limit 3,1;
select * from student limit 4,1;

select upper (firstName) from student;
select upper('Andrei');

select concat(1,2,3,4);
select concat(firstName,age,email) from profesor;

select length(password) from student;
select length(password) from student limit 2 offset 3;
select length(password) from student limit 3, 2;

select lower(firstName) from profesor;
select lower('ANA');

select substr('test@gmail' ,5, 6);

select replace('Elena', firstName, 'X') from student;
select * from student;

select count(*) from profesor;
select count(*) from user;

select count(distinct profesorId) from curs;

select sum(age) from student;

select sum(age) as sumaAni from profesor;
select avg(age) from profesor;
select max(age) from profesor;



create table book (
    id integer unique not null primary key,
    studentId integer not null,
    bookName varchar(255) null,

    foreign key (studentId) references student(id)
);
insert into book (id, bookName, studentId)
values  (1, 'clean code',  1),
        (2, 'spring boot',  1),
        (3, 'think like a programmer',  2);
insert into book (id, bookName, studentId) values
(4, 'effective java', 3),
(5, 'java concurrency', 3),
(6, 'introduction to algorithms', 5),
(7, 'postgresql up and running', 6);


create table student_id_card(
    id integer unique not null primary key,
    studentId integer not null,
    cardNumber integer unique not null,

    foreign key (studentId) references student(id)
);
insert into student_id_card (id, cardNumber, studentId)
values      (1, '1234567890', 1),
            (2, '0987654321', 2);
insert into student_id_card (id, cardNumber, studentId) values
(3, '1000000003', 3),
(4, '1000000004', 4),
(5, '1000000005', 5),
(6, '1000000006', 6);


select s.firstName, s.lastName, c.cardNumber
from student as s
inner join student_id_card as c on s.id = c.studentId;

select s.firstName, s.lastName, c.name as materie
from student as s
inner join enrollment as e on e.studentId = s.id
inner join curs as c on c.id = e.cursId;

select s.firstName, s.lastName, b.bookName
from student as s
left outer join book as b on b.studentId = s.id;

select s.firstName, s.lastName, c.name
from student as s
join enrollment as e on e.studentId = s.id
right outer join curs as c on c.id = e.cursId;

select email from student
union
select email from profesor
union
select email from user;

select lastName from student
union all
select lastName from profesor;

select email from user
intersect
select email from student;






