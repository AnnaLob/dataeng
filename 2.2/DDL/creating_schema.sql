CREATE SCHEMA library;
CREATE TABLE IF NOT EXISTS library.readers (
  reader_id serial PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  address_of_reader VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS library.pub_company(
  id_pub_company serial PRIMARY KEY,
  name_of_pub_company VARCHAR(255) NOT NULL,
  city_of_pub_company VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS library.author(
  id_author serial PRIMARY KEY,
  author_name VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS library.book (
  code serial PRIMARY KEY,
  price MONEY,
  number_of_pages SMALLINT NOT NULL,
  year_of_publication SMALLINT,
  amount SMALLINT NOT NULL,
  id_pub_company BIGINT,
  FOREIGN KEY (id_pub_company) REFERENCES library.pub_company (id_pub_company) ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS library.book_extradition (
  reader_id BIGINT,
  code BIGINT,
  FOREIGN KEY (reader_id) REFERENCES library.readers (reader_id) ON DELETE SET NULL, 
  FOREIGN KEY (code) REFERENCES library.book (code) ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS library.author_book (
  code BIGINT,
  id_author BIGINT,
  FOREIGN KEY (code) REFERENCES library.book (code) ON DELETE SET NULL, 
  FOREIGN KEY (id_author) REFERENCES library.author (id_author) ON DELETE SET NULL 
);
