﻿
Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	ОбщаяСумма = Товары.Итог("Стоимость") + Услуги.Итог("Стоимость"); 
КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ЗаказПокупателя") Тогда
		// Заполнение шапки
		ВидЦены = ДанныеЗаполнения.ВидЦены;
		ОбщаяСумма = ДанныеЗаполнения.ОбщаяСумма;
		Покупатель = ДанныеЗаполнения.Покупатель;
		Для Каждого ТекСтрокаТовары Из ДанныеЗаполнения.Товары Цикл
			НоваяСтрока = Товары.Добавить();
			НоваяСтрока.Количество = ТекСтрокаТовары.Количество;
			НоваяСтрока.Номенклатура = ТекСтрокаТовары.Номенклатура;
			НоваяСтрока.Стоимость = ТекСтрокаТовары.Стоимость;
			НоваяСтрока.Цена = ТекСтрокаТовары.Цена;
		КонецЦикла;
		Для Каждого ТекСтрокаУслуги Из ДанныеЗаполнения.Услуги Цикл
			НоваяСтрока = Услуги.Добавить();
			НоваяСтрока.Количество = ТекСтрокаУслуги.Количество;
			НоваяСтрока.Номенклатура = ТекСтрокаУслуги.Номенклатура;
			НоваяСтрока.Стоимость = ТекСтрокаУслуги.Стоимость;
			НоваяСтрока.Цена = ТекСтрокаУслуги.Цена;
		КонецЦикла;
	КонецЕсли;
	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)
	Движения.ТоварыНаСкладах.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.ТоварыНаСкладах.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
		Движение.Склад = Склад;
		Движение.Количество = ТекСтрокаТовары.Количество;
	КонецЦикла;
	
	Движения.Записать();
	
	Если Константы.КонтрольОстатков.Получить() Тогда 
		Отказ = ОтменаПроведения.ОтказПроведения(Ссылка.Метаданные().Имя, "Товары", Ссылка, Склад, МоментВремени());
	КонецЕсли;

	// регистр Продажи 
	Движения.Продажи.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.Продажи.Добавить();
		Движение.Период = Дата;
		Движение.Склад = Склад;
		Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
		Движение.Покупатель = Покупатель;
		Движение.Количество = ТекСтрокаТовары.Количество;
		Движение.Сумма = ТекСтрокаТовары.Стоимость;
		Движение.Менеджер = Менеджер;
	КонецЦикла;
	Для Каждого ТекСтрокаУслуги Из Услуги Цикл
		Движение = Движения.Продажи.Добавить();
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаУслуги.Номенклатура;
		Движение.Покупатель = Покупатель;
		Движение.Количество = ТекСтрокаУслуги.Количество;
		Движение.Сумма = ТекСтрокаУслуги.Стоимость;
		Движение.Менеджер = Менеджер;
	КонецЦикла;
КонецПроцедуры
