-- Выдать различные фамилии людей и число людей с каждой из этих фамилий,
-- ограничив список фамилиями, встречающимися менее 10 раз на на заочной форме обучения.
-- Для реализации использовать соединение таблиц.

select ФАМИЛИЯ, count(ФАМИЛИЯ)
from Н_ЛЮДИ
group by Н_ЛЮДИ.ФАМИЛИЯ;


select Н_ФОРМЫ_ОБУЧЕНИЯ.НАИМЕНОВАНИЕ
from Н_ЛЮДИ
inner join Н_УЧЕНИКИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
inner join Н_ГРУППЫ_ПЛАНОВ on Н_ГРУППЫ_ПЛАНОВ.ГРУППА = Н_УЧЕНИКИ.ГРУППА
inner join Н_ПЛАНЫ on Н_ПЛАНЫ.ИД = Н_ГРУППЫ_ПЛАНОВ.ПЛАН_ИД
inner join Н_ФОРМЫ_ОБУЧЕНИЯ on Н_ФОРМЫ_ОБУЧЕНИЯ.ИД = Н_ПЛАНЫ.ФО_ИД
group by Н_ФОРМЫ_ОБУЧЕНИЯ.НАИМЕНОВАНИЕ;


select Н_ФОРМЫ_ОБУЧЕНИЯ.НАИМЕНОВАНИЕ
from Н_ЛЮДИ
inner join Н_УЧЕНИКИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
inner join Н_ПЛАНЫ on Н_ПЛАНЫ.ИД = Н_УЧЕНИКИ.ПЛАН_ИД
inner join Н_ФОРМЫ_ОБУЧЕНИЯ on Н_ФОРМЫ_ОБУЧЕНИЯ.ИД = Н_ПЛАНЫ.ФО_ИД
group by Н_ФОРМЫ_ОБУЧЕНИЯ.НАИМЕНОВАНИЕ;


select ФАМИЛИЯ, count(ФАМИЛИЯ)
from Н_ЛЮДИ
inner join Н_УЧЕНИКИ on Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД
inner join Н_ПЛАНЫ on Н_ПЛАНЫ.ИД = Н_УЧЕНИКИ.ПЛАН_ИД
inner join Н_ФОРМЫ_ОБУЧЕНИЯ on Н_ФОРМЫ_ОБУЧЕНИЯ.ИД = Н_ПЛАНЫ.ФО_ИД
where Н_ФОРМЫ_ОБУЧЕНИЯ.НАИМЕНОВАНИЕ = 'Заочная'
group by ФАМИЛИЯ
having count(ФАМИЛИЯ) > 10;


-- where res.count >= 10