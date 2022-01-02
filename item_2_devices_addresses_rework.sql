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