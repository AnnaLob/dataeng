INSERT INTO library.readers( full_name, address_of_reader, phone_number) 
VALUES ('Petrov Peter Petrovich', 'Moscow', '+79651234567'),
('Ivanov Ivan Ivanovich', 'Sochi', '+79651234568'),
('Волошин Петр Михайлович', 'Москва', '+79876543212'),
('Авдеева Мария Михайловна', 'Москва', '+79346543212'),
('Лапаев Лев Андреевич', 'Москва', '+79809545412');


insert into library.author (author_name)
values ('Максим Горький'),
('Александр Пушкин'),
('Лев Толстой'),
 ('Марина Цветаева'),
 ('Анна Ахматова'),
 ('Михаил Булгаков'),
 ('Александр Островский');

insert into library.pub_company (name_of_pub_company, city_of_pub_company)
values ('Просвещение', 'Москва'),
('Династия', 'Санкт-Петербург'),
('Жаворонок', 'Калининград'),
('Искусство', 'Москва'),
('Серебряный век', 'Тюмень');

insert into library.book (price, number_of_pages, year_of_publication, amount, id_pub_company, name_of_book )
values (300, 215, 2004, 5, 4, 'На дне'),
 (213, 100, 2009, 2, 2, 'Евгений Онегин' ),
 (100, 239, 1986, 6, 1, 'Детство' ),
 (50, 100, 2014, 1, 2, 'Золотая коллекция стихов' ),
 (210, 302, 2022, 2, 3, 'О жизни' ),
 (134, 400, 1999, 4, 1, 'Мастер и Маргарита' ),
 (156, 90, 2001, 7, 5, 'Гроза' );

insert into library.author_book (code, id_author)
values(1, 1),
(2, 1),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

insert into library.book_extradition (reader_id, code, date_of_ex, date_of_refund)
values (1, 1, '2023-03-01', '2023-03-05'),
(3, 3, '2023-03-08', NULL),
(2, 4, '2023-03-01', '2023-03-09'),
(4, 5, '2023-03-07', '2023-03-23'),
(1, 6, '2023-03-03', NULL),
(5, 2, '2023-03-01', '2023-03-028');

