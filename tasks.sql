-- Курс на Stepik.org "Интерактивный тренажер по SQL"


-- 1 Секция
-- 1.8.8 Создание базы
CREATE TABLE book(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    author VARCHAR(30),
    price DECIMAL(8, 2),
    amount INT
    );

-- 1.8.9 Вставка записей в таблицу
INSERT book(title, author, price, amount)
VALUES ('Мастер и Маргарита', "Булгаков М.А.", 670.99, 3);
SELECT * FROM book;

-- 1.8.10 Занести записис в таблицу
INSERT INTO book(title, author, price, amount)
VALUES ('Белая гвардия', 'Булгаков М.А.', 540.50, 5),
('Идиот', 'Достоевский Ф.М.', 460.00, 10),
('Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 2);
SELECT * FROM book

-- 1.2.2 Выборка всех данных из таблицы
SELECT * FROM book

-- 1.2.3 Выборка отдельных столбцов
SELECT author, title, price FROM book

-- 1.2.4 Выборка новых столбцов и переименование их
SELECT title AS "Название", author AS "Автор" FROM book

-- 1.2.5 Выборка данных с созданием вычисляемого столбца
SELECT title, amount, 
    amount * 1.65 AS pack
FROM book;

-- 1.2.6 Вычисляемые столбцы, мат. функции
SELECT title, author, amount,
    ROUND(price-(price*30/100),2) AS new_price
FROM book;

-- 1.2.7 Логические вычисления IF
SELECT author, title,
    ROUND(IF(author = "Булгаков М.А.", price*1.1, IF(author = "Есенин С.А.", price*1.05, price)), 2) AS new_price
FROM book;