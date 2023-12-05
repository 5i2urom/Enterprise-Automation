﻿
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ЗаказПокупателя") Тогда
		// Заполнение шапки
		Сумма = ДанныеЗаполнения.ОбщаяСумма;
		Контрагент = ДанныеЗаполнения.Покупатель;
		ВидОперации = Перечисления.ВидыПоступленийСредств.ОплатаОтПокупателя; 
	ИначеЕсли ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ВозвратПоставщику") Тогда
		// Заполнение шапки
		Сумма = ДанныеЗаполнения.ОбщаяСумма;
		Контрагент = ДанныеЗаполнения.Поставщик;
		ВидОперации = Перечисления.ВидыПоступленийСредств.ВозвратОтПоставщика; 
	ИначеЕсли ТипЗнч(ДанныеЗаполнения) = Тип("СправочникСсылка.СчетаОрганизации") Тогда
		// Заполнение шапки
		Счет = ДанныеЗаполнения.Ссылка;
	КонецЕсли;
	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)
		Движения.ВзаиморасчетыСКонтрагентами.Записывать = Истина;
		Движение = Движения.ВзаиморасчетыСКонтрагентами.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Контрагент = Контрагент;
		Движение.Баланс = Сумма;
КонецПроцедуры
