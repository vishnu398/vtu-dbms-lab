--Create Table PUBLISHER with Primary Key as NAME

CREATE TABLE PUBLISHER
(NAME VARCHAR(20) PRIMARY KEY,
PHONE INTEGER,
ADDRESS VARCHAR(20));

DESC PUBLISHER;

--Create Table BOOK with Primary Key as BOOK_ID and Foreign Key PUB_NAME referring the PUBLISHER table

CREATE TABLE BOOK
(BOOK_ID INTEGER PRIMARY KEY,
TITLE VARCHAR(20),
PUB_YEAR VARCHAR(20),
PUB_NAME VARCHAR(20),
FOREIGN KEY (PUB_NAME) REFERENCES PUBLISHER(NAME) ON DELETE CASCADE);


DESC BOOK;

--Create Table BOOK_AUTHORS with Primary Key as BOOK_ID and AUTHOR_NAME and Foreign Key BOOK_ID referring the BOOK table

CREATE TABLE BOOK_AUTHORS
(AUTHOR_NAME VARCHAR(20),
BOOK_ID INTEGER,
FOREIGN KEY (BOOK_ID) REFERENCES BOOK(BOOK_ID) ON DELETE CASCADE,
PRIMARY KEY(BOOK_ID, AUTHOR_NAME));

DESC BOOK_AUTHORS;

--Create Table LIBRARY_PROGRAMME with Primary Key as PROGRAMME_ID

CREATE TABLE LIBRARY_PROGRAMME
(PROGRAMME_ID INTEGER PRIMARY KEY,
PROGRAMME_NAME VARCHAR(50),
ADDRESS VARCHAR(50));

DESC LIBRARY_PROGRAMME;

--Create Table as BOOK_COPIES with Primary Key as BOOK_ID and PROGRAMME_ID and Foreign Key BOOK_ID and PROGRAMME_ID referring the BOOK and LIBRARY_PROGRAMME tables respectively

CREATE TABLE BOOK_COPIES
(NO_OF_COPIES INTEGER,
BOOK_ID INTEGER,
PROGRAMME_ID INTEGER,
FOREIGN KEY (BOOK_ID) REFERENCES BOOK(BOOK_ID) ON DELETE CASCADE,
FOREIGN KEY(PROGRAMME_ID) REFERENCES LIBRARY_PROGRAMME(PROGRAMME_ID) ON DELETE CASCADE,
PRIMARY KEY (BOOK_ID,PROGRAMME_ID));

DESC BOOK_COPIES;

-- Create Table CARD with Primary Key as CARD_NO

CREATE TABLE CARD
(CARD_NO INTEGER PRIMARY KEY);

DESC CARD;

-- Create Table BOOK_LENDING With Primary Key as BOOK_ID, PROGRAMME_ID and CARD_NO and Foreign key as BOOK_ID, PROGRAMME_ID and CARD_NO referring the BOOK, LIBRARY_PROGRAMME and CARD tables respectively

CREATE TABLE BOOK_LENDING
(BOOK_ID INTEGER,
PROGRAMME_ID INTEGER,
CARD_NO INTEGER,
DATE_OUT DATE,
DUE_DATE DATE,
FOREIGN KEY (BOOK_ID) REFERENCES BOOK(BOOK_ID) ON DELETE CASCADE,
FOREIGN KEY (PROGRAMME_ID) REFERENCES LIBRARY_PROGRAMME(PROGRAMME_ID) ON DELETE CASCADE,
FOREIGN KEY (CARD_NO) REFERENCES CARD(CARD_NO) ON DELETE CASCADE,
PRIMARY KEY (BOOK_ID,PROGRAMME_ID,CARD_NO));

DESC BOOK_LENDING;
