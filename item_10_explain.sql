/*
 * -10. Для одного из запросов, созданных в пункте 6, провести оптимизацию. В качестве
отчета приложить планы выполнения запроса, ваш анализ и показать действия,
которые улучшили эффективность запроса.
 */

USE equipment_bd;

 -- по регионам количество занятых, свободных и неисправных портов
SELECT 
	r.id 
	, r.name
	, count(DISTINCT da.device_id) AS device_by_region
	, count(DISTINCT if(isnull(da.device_id), NULL, concat_ws('_', p.device_id, p.number_port))) AS total_ports
	, count(DISTINCT IF(p.technical_status_id = 1 , concat_ws('_', p.device_id, p.number_port), NULL)) AS busy_ports
 	, count(DISTINCT IF(p.technical_status_id = 2 , concat_ws('_', p.device_id, p.number_port), NULL)) AS free_ports
 	, count(DISTINCT IF(p.technical_status_id = 3 , concat_ws('_', p.device_id, p.number_port), NULL)) AS faulty_ports
 	FROM regions r 
		LEFT JOIN addresses a 
		ON a.region_id = r.id 
			LEFT JOIN devices_addresses da 
			ON da.address_id = a.house_id 
				LEFT JOIN ports p 
				ON da.device_id = p.device_id 
 	GROUP BY r.id WITH ROLLUP 
 	ORDER BY r.id  
;

-- получен план вылолнения запроса 
-- в табличной форме см. item_10_table_eaxplain_with_fk.html и визуализация item_10_explain_with_fk.png
-- т.к. есть все внешние ключи, то я не вижу. как и где можно провести оптимизацию. 
-- Я протестировала несколько запросов, и не нашла запрос, пригодный для оптимизации
-- Структура учебной БД несложная и есть все внешние ключи, которые являются индексами. 
-- Для демонстрации оптимизации - удалаю внешний ключ 

ALTER TABLE addresses drop foreign key addresses_region_fk;

-- получаю план выполнения запроса
-- в табличной форме см. item_10_table_eaxplain_without_fk.html и визуализация item_10_explain_without_fk.png
-- получаю ожидаемый результат: из таблицы a(address) было выбрано 500 строк, при наличии индекса было 25 строк.
-- что увеличило общую стоимость запроса на порядок
-- уменьшить выборку 20 строк из таблицы r(regions) невозможно по условию задачи

-- возвращаем индекс и получаем прежний результат
create index addresses_region_idx on addresses(region_id);

























