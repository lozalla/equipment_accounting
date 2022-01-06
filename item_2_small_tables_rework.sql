/*
 * 2. Используя генератор тестовых данных, заполнить созданную БД данными в
количестве минимум сто строк для тех таблиц, где это имеет смысл. Доработать
данные запросами если это необходимо. В качестве отчёта приложить дамп БД с
данными.
 */

-- Небольшие справочники перезапизываем, т.к. сгенерировались нечитаемые символы (неверная кодировка) 
USE equipment_bd;

truncate TABLE  property_types;
INSERT INTO property_types (name) VALUES 
	('Многоквартирный дом'),
	('Частный дом'),
	('Отдельно стоящее здание')
	;

truncate TABLE sale_statuses; 	
INSERT INTO sale_statuses (name) VALUES 
	('Готов к продаже'),
	('Проектируется'),
	('Запрет на продажу')
	;
truncate TABLE equipment_technical_statuses ;
INSERT INTO equipment_technical_statuses (name) VALUES 
	('Исправен'),
	('Неисправен'),
	('Демонтирован')
	;

truncate ports_technical_statuses ;
INSERT INTO ports_technical_statuses (name) VALUES 
	('Занят'),
	('Свободен'),
	('Неисправен')
	;

truncate TABLE equipment_types ;
INSERT INTO equipment_types (name) VALUES 
	('Коммутатор'),
	('Маршрутизатор'),
	('Сплиттер')
	;

truncate TABLE access_types ;
INSERT INTO  access_types (name) VALUES 
	('Массовый сегмент'),
	('Корпоративный сегмент'),
	('Агрегация')
	;

truncate TABLE service_types ;
INSERT INTO  service_types (name) VALUES 
	('Адрес установки оборудования'),
	('Дополнительный адрес обслуживания')
	;

-- --------------------------------------------- devices -------------------------
-- доработка таблицы devices: случайный выбор, технического статуса, типа доступа, статуса для продаж
UPDATE devices SET technical_status_id = round(rand() * 2 + 1);
UPDATE devices SET access_type_id = round(rand() * 2 + 1);
UPDATE devices SET sale_status_id = round(rand() * 2 + 1);
-- --------------------------------------------- devices -------------------------

-- --------------------------------------------- addresses -------------------------
-- доработка таблицы addresses: 
-- если тип недвижимости - частный сектор, то количество квартир в доме поставить не больше 4
-- если тип недвижимостм - отдельно стоящее здание - то количество квартир в доме поставить 0
UPDATE addresses SET number_apartments = round(rand() * 3 + 1) WHERE property_type_id = 2;
UPDATE addresses SET number_apartments = 0 WHERE property_type_id = 3;
-- --------------------------------------------- addresses -------------------------

-- --------------------------------------------- operators_regions -------------------------
-- после доработки данных в таблице operators_regions 
-- проверим есть ли регион без оператора - таблица должна быть пустой
SELECT 
	r.id ,
	or2.operator_id 
FROM regions r LEFT JOIN operators_regions or2 ON r.id = or2.region_id WHERE isnull(or2.operator_id);

-- проверяем, есть ли оператор без региона - таблица должна быть пустой
SELECT 
	o.id , 	
	or2.region_id 
FROM operators o LEFT JOIN operators_regions or2 ON o.id = or2.operator_id WHERE isnull(or2.region_id);
-- --------------------------------------------- operators_regions -------------------------

-- --------------------------------------------- devices_addresses -------------------------
-- после доработки данных в таблице devices_addresses  
-- проверяем отсутствие  дубликатов для адреса установки оборудование
-- т.к. оборудование не может быть установлено по двум адресам  
-- должна быть пустая таблица
SELECT 
	device_id ,
	count(address_id) AS count_address,
	min(address_id) AS min_adddress_id,
	group_concat(address_id) AS group_address
FROM devices_addresses 
WHERE service_type_id = 1 
GROUP BY device_id 
HAVING count_address > 1
ORDER BY device_id ;

-- проверяем, есть ли случаи, когда адрес установки оборудования попал в дополнительный адрес обслуживания
-- для этого добавим стобец main_address, в котором будем указывать address_id, у когорого service_type_id = 1
-- должна быть пустая таблица
SELECT * 
FROM 
	(SELECT 
		device_id ,
		address_id ,
		service_type_id ,
		FIRST_VALUE(address_id) OVER(PARTITION BY device_id ORDER BY service_type_id)  AS main_address
	FROM devices_addresses
	ORDER BY device_id, service_type_id
	) AS t
WHERE 
(t.service_type_id = 2) AND (t.address_id = t.main_address)
-- --------------------------------------------- devices_addresses -------------------------


-- --------------------------------------------- devices_operators -------------------------
-- после доработки таблицы devices_operators
-- проверяем есть ли оборудование, регион которого не находится в списке регионов операторов
-- должна быть пустая таблица
SELECT 
	do.device_id AS device_id,
	do.operator_id AS device_operator,
	or2.l_region AS operator_regions ,
	a.region_id AS device_region
FROM devices_operators do 
	LEFT JOIN  
	(SELECT operator_id , group_concat(region_id) AS l_region FROM operators_regions GROUP BY operator_id) AS or2
	ON do.operator_id = or2.operator_id
		LEFT JOIN 
			(SELECT device_id, address_id FROM devices_addresses WHERE service_type_id = 1) AS da
		ON do.device_id = da.device_id
			LEFT JOIN addresses a 
			ON a.house_id = da.address_id   
WHERE a.region_id NOT IN (SELECT region_id FROM operators_regions WHERE operator_id = do.operator_id)
ORDER  BY device_id, device_operator
;

-- проверим, есть ли оборудование без оператора
-- должна быть пустая таблица
SELECT 
	d.id AS device_id,
	do.operator_id 
FROM devices d 
	LEFT JOIN devices_operators do 
	ON d.id = do.device_id 
WHERE isnull(do.operator_id) 
-- --------------------------------------------- devices_operators -------------------------

-- ----------------------------------------- ports ----------------------------------------
-- после заполнения таблицы ports проверим совпадение общего количества портов по всему оборудованию 
-- по  таблице device и по таблице ports

SELECT 
d.id 
, IF (d.number_ports = count(p.number_port), 1, 0 ) AS check_number_ports
FROM devices d JOIN ports p ON d.id = p.device_id 
GROUP BY d.id 
HAVING check_number_ports = 0
;













