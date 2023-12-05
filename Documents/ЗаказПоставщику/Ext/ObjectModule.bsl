﻿
Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	ОбщаяСумма = Товары.Итог("Стоимость") + Услуги.Итог("Стоимость"); 
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр ВзаиморасчетыСКонтрагентами Расход
	Движения.ВзаиморасчетыСКонтрагентами.Записывать = Истина;
	Движение = Движения.ВзаиморасчетыСКонтрагентами.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
	Движение.Период = Дата;
	Движение.Контрагент = Поставщик;
	Движение.Баланс = ОбщаяСумма;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
