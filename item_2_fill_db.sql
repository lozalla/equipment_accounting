/*
 * 2. Используя генератор тестовых данных, заполнить созданную БД данными в
количестве минимум сто строк для тех таблиц, где это имеет смысл. Доработать
данные запросами если это необходимо. В качестве отчёта приложить дамп БД с
данными.
 */

-- Небольшие справочники заполняются в ручную


INSERT INTO property_types (name) VALUES 
	('Многоквартирный дом'),
	('Частный дом'),
	('Отдельно стоящее здание')
	;
	
INSERT INTO sale_statuses (name) VALUES 
	('Готов к продаже'),
	('Проектируется'),
	('Запрет на продажу')
	;

INSERT INTO eqiupment_technical_statuses (name) VALUES 
	('Исправен'),
	('Неисправен'),
	('Демонтирован')
	;

INSERT INTO ports_technical_statuses (name) VALUES 
	('Занят'),
	('Свободен'),
	('Неисправен')
	;

INSERT INTO equipment_types (name) VALUES 
	('Коммутатор'),
	('Маршрутизатор'),
	('Сплиттер')
	;

INSERT INTO  access_types (name) VALUES 
	('Массовый сегмент'),
	('Корпоративный сегмент'),
	('Агрегация')
	;

INSERT INTO  service_types (name) VALUES 
	('Адрес установки оборудования'),
	('Дополнительный адрес обслуживания')
	;

-- заполенние таблицы ports
delimiter //
DROP PROCEDURE IF EXISTS fill_ports//
/*
 * В процедуре происходит построчный просмотр таблицы devices, из которой
 * извлекаются  id, number_ports (количество портов оборудования)
 * далее в таблицу ports добавлются строки в количестве  соответствующему количеству портов
 * при этом случайным образом выбирается техническое состояние порта
 */
CREATE PROCEDURE fill_ports()
BEGIN 
	DECLARE tech_status INT DEFAULT 0;  
	DECLARE i INT DEFAULT 1;
	DECLARE is_end int DEFAULT 0;
	DECLARE device_id bigint;
	DECLARE name varchar(200);
	DECLARE number_port TINYINT UNSIGNED DEFAULT 2;
	DECLARE curcat CURSOR FOR SELECT id, number_ports FROM devices;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;
	OPEN curcat;
	CYCLE:LOOP 
		FETCH curcat INTO device_id, number_port;
		IF is_end THEN LEAVE CYCLE;
		END IF;
		WHILE i <= number_port DO 
			SET tech_status = round(rand() * 2 + 1); -- случайным образом выбирается техническое состояние порта
			INSERT INTO ports (device_id, number_port, technical_status_id) VALUES (device_id, i, tech_status);
	 		SET i = i + 1;
		END WHILE;
		SET i = 1;
	END LOOP CYCLE;
	CLOSE curcat;
END//

CALL fill_ports(); 



-- ----------------------------------доработка таблицы devices_addresses -----------------------------
-- цель: добиться тоого, чтобы основной и дополнительные адреса обслуживания были из одного региона

-- с помощью генератора получили тестовые данные, где service_type_id было задано равным 1 (Адрес установки оборудования)
-- но сгенерировались дубликаты в столбце device_id
-- нужно удалить дубликаты в столбце device_id, т.к. оборудование не может быть установлено по нескольким адресам
-- убеждаемся, что такие случаи есть 
SELECT 
	device_id ,
	service_type_id,
	count(address_id) AS count_address,
	min(address_id) AS min_adddress_id,
	group_concat(address_id) AS group_address
FROM devices_addresses 
GROUP BY device_id 
HAVING count_address > 1
ORDER BY device_id ;

-- создаем временную таблицу и вставляем туда уникальные значения
DROP TABLE IF EXISTS unique_main_address_temp;
CREATE TEMPORARY TABLE unique_main_address_temp
AS
	(SELECT 
		device_id ,
		count(address_id) AS count_address,
		min(address_id) AS address_id
	FROM devices_addresses
	GROUP BY device_id 
	HAVING count_address > 1
	ORDER BY device_id
	)
;

SELECT * FROM unique_main_address_temp ORDER BY device_id;

-- удаляем все строки из таблицы devices_addresses, чтобы затем вставить в нее уникальные значения
DELETE FROM devices_addresses ;

-- модифицируем стобец service_type_id таблицы devices_addresses, добавляя значение по умолчанию
ALTER TABLE devices_addresses MODIFY COLUMN service_type_id TINYINT UNSIGNED NOT NULL DEFAULT 1;

-- вставляем в таблицу devices_addresses данные из временной таблицы с уникальными адресами установки оборудования
INSERT INTO devices_addresses (device_id, address_id) (SELECT device_id, address_id FROM unique_main_address_temp);

-- проверяем наличие дубликатов - получаем пустую таблицу 
SELECT 
	device_id ,
	service_type_id,
	count(address_id) AS count_address,
	min(address_id) AS min_adddress_id,
	group_concat(address_id) AS group_address
FROM devices_addresses 
GROUP BY device_id 
HAVING count_address > 1
ORDER BY device_id ;


-- выясняем для каких device_id не сгенерировались адреса
SELECT 
	d.id,
	da.address_id 
FROM devices d
LEFT JOIN devices_addresses da
ON d.id = da.device_id 
WHERE isnull(da.address_id) 
ORDER BY d.id 
; 

-- создаем временную таблицу, и вставляем в нее все device_id, у которых нет адресов
DROP TABLE IF EXISTS device_without_address_temp;
CREATE TEMPORARY TABLE device_without_address_temp
AS 
	(SELECT 
		d.id AS device_id,
		da.address_id AS address_id
	FROM devices d
	LEFT JOIN devices_addresses da
	ON d.id =da.device_id 
	WHERE isnull(da.address_id) 
	ORDER BY d.id
	) 
; 

SELECT * FROM device_without_address_temp;
-- генерируем для них адреса - случайная выборка из количества адресов
SET @amount_address = (SELECT count(1) FROM addresses) - 1;
SELECT @amount_address; -- 499
UPDATE device_without_address_temp SET address_id = round(rand()*@amount_address + 1);
SELECT * FROM device_without_address_temp;

-- заполняем недостающие данные в таблице devices_addresses
SELECT count(1) FROM devices_addresses; -- 239

INSERT INTO devices_addresses (device_id, address_id)
(
	SELECT * FROM device_without_address_temp
);
SELECT count(1) FROM devices_addresses; --  500

SELECT * FROM devices_addresses da ORDER BY device_id ;

-- проверяем наличие дубликатов - получаем пустую таблицу 
SELECT 
	device_id ,
	service_type_id,
	count(address_id) AS count_address,
	min(address_id) AS min_adddress_id,
	group_concat(address_id) AS group_address
FROM devices_addresses 
GROUP BY device_id 
HAVING count_address > 1
ORDER BY device_id ;

-- теперь нужно добавить адреса, у которых service_type_id = 2 (Дополнительный адрес обслуживания)
-- нужно, чтобы оно было из того же региона
-- узнаем, к каким регионам привязано оборудование
SELECT 
	da.device_id,
	da.address_id ,
	a.region_id 
FROM devices_addresses da 
LEFT JOIN addresses a 
ON da.address_id = a.house_id 
ORDER BY da.device_id 
;

-- получим таблицу, в которой в столбец rand_address будет случайным образом попдать адрес из региона
SELECT 
	da.device_id,
	a.region_id AS region,
	all_addresses.addresses,
	(SELECT house_id FROM addresses WHERE addresses.region_id = region ORDER BY rand() LIMIT 1) AS rand_address,
	2 AS service_type_id
FROM devices_addresses da 
LEFT JOIN addresses a 
ON da.address_id = a.house_id
-- для проверки добавим список адресов региона
LEFT JOIN 
(SELECT group_concat(house_id) AS addresses, region_id FROM addresses GROUP BY addresses.region_id) AS all_addresses
ON a.region_id = all_addresses.region_id 
ORDER BY da.device_id 
;

-- -----------------------------
-- 3 раза сделаем нижеследующее для генерации неспольких дополнительных адресов обслуживания
-- -------------------------------- 
-- создаем временную таблицу и вставляем в нее device, region , rand_address
DROP TABLE IF EXISTS device_region_rand_addresst_temp;
CREATE TEMPORARY TABLE device_region_rand_addresst_temp
AS 
	(
	SELECT 
		da.device_id,
		a.region_id AS region,
		(SELECT house_id FROM addresses WHERE addresses.region_id = region ORDER BY rand() LIMIT 1) AS rand_address,
		2 AS service_type_id
	FROM devices_addresses da 
	LEFT JOIN addresses a 
	ON da.address_id = a.house_id 
	ORDER BY da.device_id 
	)
;
SELECT * FROM device_region_rand_addresst_temp;
-- добавляем эти данные в таблицу devices_addresses
INSERT INTO devices_addresses (device_id, address_id, service_type_id)
	(
	SELECT device_id, rand_address, service_type_id FROM device_region_rand_addresst_temp
	);
SELECT * FROM devices_addresses ORDER BY device_id, service_type_id ;
-- -------------------------------------

-- проверяем, есть ли случаи, когда адрес установки оборудования попал в дополнительный адрес обслуживания
-- для этого добавим стобец main_address, в котором будем указывать address_id, у когорого service_type_id = 1
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
-- (t.service_type_id = 1)
-- OR  
-- ((t.address_id <> t.main_address) AND (t.service_type_id = 2))
;

-- создаем временную таблицу, исключающую такие случаи
DROP TABLE IF EXISTS check_main_address_temp;
CREATE TEMPORARY TABLE check_main_address_temp
AS 
	(
	SELECT * FROM 
		(SELECT 
			device_id ,
			address_id ,
			service_type_id ,
			FIRST_VALUE(address_id) OVER(PARTITION BY device_id ORDER BY service_type_id) AS main_address
		FROM devices_addresses
		ORDER BY device_id, service_type_id
		) AS t
	WHERE 
	(t.service_type_id = 1)
	OR  
	((t.address_id <> t.main_address) AND (t.service_type_id = 2))
	)
;

SELECT * FROM check_main_address_temp ;
SELECT count(1) FROM check_main_address_temp ;

-- удаляем все строки таблицы  devices_addresses и вставляем в нее данные временной таблицы check_main_address_temp 
DELETE FROM devices_addresses ;

INSERT INTO devices_addresses (device_id, address_id, service_type_id)
(
	SELECT device_id, address_id, service_type_id FROM  check_main_address_temp 
);

SELECT * FROM devices_addresses ORDER BY device_id, service_type_id ; 

-- еще раз проверяем, есть ли случаи, когда адрес установки оборудования попал в дополнительный адрес обслуживания
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

-- ----------------------------------- конец доработки таблицы devices_addresses

-- ---------------- доработка таблицы operators_regions
-- проверим есть ли регион без оператора
SELECT 
	r.id ,
	or2.operator_id 
FROM regions r 
LEFT JOIN operators_regions or2 
ON r.id = or2.region_id 
WHERE isnull(or2.operator_id)
;

-- создаем временную таблицу 
CREATE TEMPORARY TABLE region_without_operator
AS 
(
SELECT 
	r.id ,
	or2.operator_id 
FROM regions r 
LEFT JOIN operators_regions or2 
ON r.id = or2.region_id 
WHERE isnull(or2.operator_id)
);
SELECT * FROM region_without_operator;

-- генерируем для них операторов - случайная выборка из диапазона (1, @amount_operators)
SET @amount_operators = (SELECT count(1) FROM operators) - 1;
SELECT @amount_operators;

UPDATE region_without_operator SET  operator_id = round(rand() * @amount_operators + 1);
SELECT * FROM region_without_operator;

INSERT INTO operators_regions (operator_id, region_id)
(
	SELECT operator_id, id FROM region_without_operator
);
	   
-- еще раз проверим есть ли регион без оператора
SELECT 
	r.id ,
	or2.operator_id 
FROM regions r 
LEFT JOIN operators_regions or2 
ON r.id = or2.region_id 
WHERE isnull(or2.operator_id)
;

-- проверяем, есть ли оператор без региона

SELECT 
	o.id ,
	or2.region_id 
FROM operators o 
LEFT JOIN operators_regions or2 
ON o.id = or2.operator_id 
WHERE isnull(or2.region_id)
;
-- ------------------ конец доработки таблицы operators_regions
