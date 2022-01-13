﻿#language: ru

@tree

Функционал: создание документа Заказ

Как Менеджер по закупкам я хочу
создать документ Заказ
чтобы оформить заказ на товары

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: создание документа Заказ
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа	
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Закупочная'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Мосхлеб ОАО'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Строящийся склад'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
* Заполнение товарной части	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000031' | 'Босоножки'    |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2 000,00'
	И я запоминаю значение поля с именем "ТоварыЦена" как "$Цена$"
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И я запоминаю значение поля с именем "ТоварыКоличество" как "$Количество$"
	И в таблице "Товары" я активизирую поле с именем "ТоварыСумма"
	И Я запоминаю значение выражения 'Строка(Формат($Цена$ * $Количество$, "ЧДЦ=2"))' в переменную "$Сумма$"
* Проверка заполнения табличной части
	Тогда поле таблицы "Товары" "ТоварыСумма" равно переменной "Сумма"
	И в таблице "Товары" я завершаю редактирование строки







	
			
