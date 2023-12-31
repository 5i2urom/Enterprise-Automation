﻿
Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	ОбщаяСумма = Товары.Итог("Стоимость") + Услуги.Итог("Стоимость"); 
КонецПроцедуры 

Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	// регистр ВзаиморасчетыСКонтрагентами Приход
	Движения.ВзаиморасчетыСКонтрагентами.Записывать = Истина;
	Движение = Движения.ВзаиморасчетыСКонтрагентами.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.Период = Дата;
	Движение.Контрагент = Покупатель;
	Движение.Баланс = ОбщаяСумма;


	// регистр ЗаказыПокупателей 
	Движения.ЗаказыПокупателей.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.ЗаказыПокупателей.Добавить();
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
		Движение.Покупатель = Покупатель;
		Движение.Количество = ТекСтрокаТовары.Количество;
		Движение.Сумма = ТекСтрокаТовары.Стоимость;
	КонецЦикла;

	// регистр ЗаказыПокупателей 
	Движения.ЗаказыПокупателей.Записывать = Истина;
	Для Каждого ТекСтрокаУслуги Из Услуги Цикл
		Движение = Движения.ЗаказыПокупателей.Добавить();
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаУслуги.Номенклатура;
		Движение.Покупатель = Покупатель;
		Движение.Количество = ТекСтрокаУслуги.Количество;
		Движение.Сумма = ТекСтрокаУслуги.Стоимость;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

