-- 1. Таблица Отделения КООП
CREATE TABLE отделение_кооп (
    идентификатор VARCHAR(10) PRIMARY KEY,
    фамилия_заведующего VARCHAR(100) NOT NULL,
    адрес VARCHAR(100) NOT NULL,
    комиссионные_проценты NUMERIC(5, 2) NOT NULL
);

-- 2. Таблица Потребители
CREATE TABLE потребитель (
    идентификатор VARCHAR(10) PRIMARY KEY,
    фамилия VARCHAR(100) NOT NULL,
    адрес VARCHAR(100) NOT NULL,
    кредит_проценты NUMERIC(5, 2) NOT NULL
);

-- 3. Таблица Товары
CREATE TABLE товар (
    идентификатор VARCHAR(10) PRIMARY KEY,
    наименование VARCHAR(100) NOT NULL,
    цена_единицы NUMERIC(10, 2) NOT NULL,
    склад VARCHAR(100) NOT NULL,
    макс_заказ INT NOT NULL
);

-- 4. Таблица Закупки (связующая таблица)
CREATE TABLE закупки (
    номер_договора INT PRIMARY KEY,
    дата VARCHAR(20) NOT NULL, -- На фото даты указаны как названия месяцев, используем VARCHAR
    отделение_кооп_id VARCHAR(10) NOT NULL,
    потребитель_id VARCHAR(10) NOT NULL,
    товар_id VARCHAR(10) NOT NULL,
    кол_во INT NOT NULL,
    итого_руб NUMERIC(12, 2) NOT NULL,
    
    -- Ограничения внешних ключей для поддержки целостности
    CONSTRAINT fk_отделение FOREIGN KEY (отделение_кооп_id) REFERENCES отделение_кооп(идентификатор),
    CONSTRAINT fk_потребитель FOREIGN KEY (потребитель_id) REFERENCES потребитель(идентификатор),
    CONSTRAINT fk_товар FOREIGN KEY (товар_id) REFERENCES товар(идентификатор)
);	