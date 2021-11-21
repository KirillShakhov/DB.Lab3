-- Получить список студентов, зачисленных после первого сентября 2012 года на первый курс заочной формы обучения.
-- В результат включить:
-- номер группы;
-- номер, фамилию, имя и отчество студента;
-- номер и состояние пункта приказа;
-- Для реализации использовать соединение таблиц.

select "Н_ФОРМЫ_ОБУЧЕНИЯ".НАИМЕНОВАНИЕ
from "Н_ЛЮДИ"
inner join "Н_УЧЕНИКИ" on "Н_УЧЕНИКИ"."ЧЛВК_ИД" = "Н_ЛЮДИ"."ИД"
inner join Н_ГРУППЫ_ПЛАНОВ on Н_ГРУППЫ_ПЛАНОВ.ГРУППА = Н_УЧЕНИКИ.ГРУППА
inner join Н_ПЛАНЫ on Н_ПЛАНЫ.ИД = Н_ГРУППЫ_ПЛАНОВ.ПЛАН_ИД
inner join Н_ФОРМЫ_ОБУЧЕНИЯ on Н_ФОРМЫ_ОБУЧЕНИЯ.ИД = Н_ПЛАНЫ.ФО_ИД
group by Н_ФОРМЫ_ОБУЧЕНИЯ.НАИМЕНОВАНИЕ;


select ГРУППА,
       "Н_ЛЮДИ"."ИД" as Номер, ФАМИЛИЯ, ИМЯ, ОТЧЕСТВО,
       split_part("Н_УЧЕНИКИ"."ПРИМЕЧАНИЕ", ' ', 1) as Номер_приказа, "Н_УЧЕНИКИ".СОСТОЯНИЕ
from "Н_УЧЕНИКИ"
inner join "Н_ЛЮДИ" on "Н_ЛЮДИ"."ИД" = "ЧЛВК_ИД"
inner join "Н_ПЛАНЫ" on "Н_УЧЕНИКИ"."ПЛАН_ИД" = "Н_ПЛАНЫ"."ИД"
inner join "Н_ФОРМЫ_ОБУЧЕНИЯ" on "Н_ПЛАНЫ"."ФО_ИД" = "Н_ФОРМЫ_ОБУЧЕНИЯ"."ИД"
where "Н_УЧЕНИКИ"."ПРИМЕЧАНИЕ" SIMILAR TO '%(01.09.00)%(Зачислить)%'
  and "Н_ФОРМЫ_ОБУЧЕНИЯ"."НАИМЕНОВАНИЕ" = 'Очная';


select ГРУППА,
       "Н_ЛЮДИ"."ИД" as Номер, ФАМИЛИЯ, ИМЯ, ОТЧЕСТВО,
       split_part("Н_УЧЕНИКИ"."ПРИМЕЧАНИЕ", ' ', 1) as Номер_приказа, "Н_УЧЕНИКИ".СОСТОЯНИЕ
from "Н_УЧЕНИКИ"
inner join "Н_ЛЮДИ" on "Н_ЛЮДИ"."ИД" = "ЧЛВК_ИД"
inner join "Н_ПЛАНЫ" on "Н_УЧЕНИКИ"."ПЛАН_ИД" = "Н_ПЛАНЫ"."ИД"
inner join "Н_ФОРМЫ_ОБУЧЕНИЯ" on "Н_ПЛАНЫ"."ФО_ИД" = "Н_ФОРМЫ_ОБУЧЕНИЯ"."ИД"
where "Н_УЧЕНИКИ"."ПРИМЕЧАНИЕ" SIMILAR TO '%(01.09.12)%(Зачислить)%'
  and "Н_ФОРМЫ_ОБУЧЕНИЯ"."НАИМЕНОВАНИЕ" = 'Заочная';