INSERT INTO library.readers( full_name, address_of_reader, phone_number) 
VALUES ('Petrov Peter Petrovich', 'Moscow', '+79651234567'),
('Ivanov Ivan Ivanovich', 'Sochi', '+79651234568');
SELECT * FROM library.readers;

insert into library.author (author_name)
values ('Максим Горький'),
('Александр Пушкин'),
('Лев Толстой'),
 ('Марина Цветаева'),
 ('Анна Ахматова'),
 ('Михаил Булгаков');



insert into library.readers (full_name, address_of_reader, phone_number)
values ('Волошин Петр Михайлович', 'Москва', '+79876543212'),
('Авдеева Мария Михайловна', 'Москва', '+79346543212'),
('Лапаев Лев Андреевич', 'Москва', '+79809545412');

insert into library.pub_company (name_of_pub_company, city_of_pub_company)
values ('Просвещение', 'Москва'),
('Династия', 'Санкт-Петербург'),
('Жаворонок', 'Калининград'),
('Искусство', 'Москва'),
('Серебряный век', 'Тюмень');

alter table library.book
add name_of_book varchar(50) not null default ('Неизвестно');


delete from library.book;

insert into library.book (price, number_of_pages, year_of_publication, amount, name_of_book )
values (300, 215, 2004, 5, 'На дне'),
 (213, 100, 2009, 2, 'Евгений Онегин' ),
 (300, 215, 1986, 6, 'Детство' ),
 (300, 215, 2014, 1, 'Золотая коллекция стихов' ),
 (300, 215, 2022, 2, 'О жизни' ),
 (300, 215, 1999, 4, 'Мастер и Маргарита' ),
 (300, 215, 2001, 7, ' ' );
insert into library.author_book (code, id_author)
values(17, 1),
(21, 5),
(20, 4);

alter table library.book_extradition
add date_of_ex date not null,
add date_of_refund date;

insert into library.book_extradition (reader_id, code, date_of_ex, date_of_refund)
values (1, 17, '2023-03-01', '2023-03-05'),
(3, 19, '2023-03-08', NULL),
(2, 18, '2023-03-01', '2023-03-09'),
(4, 17, '2023-03-07', '2023-03-23'),
(1, 20, '2023-03-03', NULL),
(5, 23, '2023-03-01', '2023-03-028');

select max(count) from( select reader_id, count(*) as count from library.book_extradition group by reader_id) as max; 

select * from library.book_extradition;

--1 задание
select reader_id, count(*) as count from library.book_extradition where date_of_refund is not null
group by reader_id 
order by count desc;

--2 задание
select reader_id, count (*) as count from library.book_extradition where date_of_refund is null
group by reader_id;

--3 задание
select reader_id from library.book_extradition 
join library.book on book_extradition.code=book.code where date_of_refund is null and name_of_book = 'Детство';


--4 задание 
select name_of_book from library.book_extradition
join library.book on book_extradition.code=book.code where date_of_refund is null;

--5 задание 
select count(reader_id) as diff
from library.book_extradition
where date_of_ex is null and book_extradition.date_of_refund < (now()-interval '14 days');

--6 задание
select name_of_pub_company, count(*) as count
from library.pub_company join library.book 
on pub_company.id_pub_company=book.id_pub_company
join library.book_extradition on book.code=book_extradition.code group by name_of_pub_company order by count desc;

--7 задание 
select max(author_name), max(count)  from (select count(*) as count, author_name from library.author join library.author_book on author.id_author=author_book.id_author join library.book 
on author_book.code=book.code
join library.book_extradition on book.code=book_extradition.code group by author_name) as max; 

--8 задание 
select full_name, (sum(library.book.number_of_pages)/sum(library.book_extradition.days_for_read) )as average
from 


