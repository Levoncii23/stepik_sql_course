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

-- 1.2.8 Выборка данных по условию WHERE
SELECT author, title, price
FROM book
WHERE amount < 10;

-- 1.2.9 Лог операции AND OR NOT
SELECT title, author, price, amount 
FROM book
WHERE (price > 500 or price < 600) and price * amount > 5000;

-- 1.2.10 ОПераторы BETWEEN IN
SELECT title, author 
FROM book
WHERE (price BETWEEN 540.50 AND 800) and amount IN (2,3,5,7);

-- 1.2.11 Выборка данных с сортировкой
SELECT author, title
FROM book
WHERE (amount BETWEEN 2 AND 14)
ORDER BY author DESC, title ASC;

-- 1.2.12 Оператор LIKE (% любася строка ноль или более символов)
--  (_ любой одиночный символ)
SELECT title, author
FROM book
WHERE (title LIKE "% %" AND title NOT LIKE "_")
        AND
        author LIKE "% %%С.%"
ORDER BY title ASC

-- 1.3.2 Выбор уникальных элементов DISTINCT
SELECT DISTINCT amount
FROM book

-- 1.3.3 Групповые функции SUM COUNT
SELECT author AS "Автор", COUNT(title) AS "Различных_книг", SUM(amount) AS "Количество_экземпляров"
FROM book
GROUP BY author

-- 1.3.4. Групповые функции MIN MAX AVG