

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


