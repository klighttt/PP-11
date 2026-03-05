
-- Показать все товары (артикул, название, цену), у которых цена выше 5000 рублей.
SELECT 
    tovar.Артикул,
    name_tovara.name_tov AS Название,
    tovar.Цена
FROM tovar
JOIN name_tovara ON tovar.id_name_tov = name_tovara.id_name_tov
WHERE tovar.Цена > 5000;


-- Найти всех клиентов с фамилией "Степанов".
SELECT surname_sotrud AS Фамилия, name_sotrud AS Имя
FROM client
WHERE surname_sotrud = 'Степанов';


--Вывести список всех ПВЗ (пунктов выдачи) с полным адресом (улица, дом).
SELECT 
    adress_pvz.id_pvz,
    street.name_street AS Улица,
    adress_pvz.num_house AS Дом
FROM adress_pvz
JOIN street ON adress_pvz.id_street = street.id_street;


--Показать все заказы, которые были сделаны после 1 марта 2025 года.
SELECT id_zakaz, nom_zak, date_zak
FROM zakaz
WHERE date_zak > '2025-03-01';


--Вывести информацию по заказам: номер заказа, артикул товара, количество, название статуса заказа.
SELECT 
    zakaz.nom_zak AS Номер_заказа,
    zakaz.Артикул AS Артикул,
    zakaz.count AS Количество,
    status_zakaza.name_status AS Статус
FROM zakaz
JOIN status_zakaza ON zakaz.id_status = status_zakaza.id_status;


--Показать, какие товары поставлял поставщик "Kari" (название товара, цена, артикул).
SELECT 
    tovar.Артикул,
    name_tovara.name_tov AS Название,
    tovar.Цена
FROM tovar
JOIN name_tovara ON tovar.id_name_tov = name_tovara.id_name_tov
JOIN postav ON tovar.id_postav = postav.id_postav
WHERE postav.name_postav = 'Kari';


--Посчитать, сколько товаров находится в каждой категории ("Женская обувь", "Мужская обувь").
SELECT 
    category_tov.name_category AS Категория,
    COUNT(tovar.Артикул) AS Количество_товаров
FROM tovar
JOIN category_tov ON tovar.id_category = category_tov.id_category
GROUP BY category_tov.name_category;


--Найти общую сумму каждого заказа (стоимость товаров * количество).
SELECT 
    zakaz.nom_zak AS Номер_заказа,
    SUM(tovar.Цена * zakaz.count) AS Общая_сумма
FROM zakaz
JOIN tovar ON zakaz.Артикул = tovar.Артикул
GROUP BY zakaz.nom_zak;


--Каких товаров на складе меньше 5 штук (нужно дозаказывать)?
SELECT 
    Артикул,
    name_tovara.name_tov AS Название,
    Количество_на_складе
FROM tovar
JOIN name_tovara ON tovar.id_name_tov = name_tovara.id_name_tov
WHERE Количество_на_складе < 5;