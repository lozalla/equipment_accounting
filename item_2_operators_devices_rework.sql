-- ------------------------------------------------------------------------------

SELECT count(1) FROM devices_operators;
SELECT operator_id , device_id FROM devices_operators ORDER BY operator_id , device_id ; 
SELECT * FROM operators_regions WHERE operator_id = 13 ORDER BY operator_id ;

-- проверяем есть ли оборудование, регион которого не находится в списке регионов операторов
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


-- временная таблица с неправильными данными, т.е. оборудование, регион которого не находится в списке регионов операторов
DROP TABLE IF EXISTS  no_math_address_operator_device_temp;
CREATE TEMPORARY TABLE no_math_address_operator_device_temp
AS 
(SELECT 
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
ORDER  BY device_id, device_operator )
;

SELECT * FROM no_math_address_operator_device_temp;

-- скопируем данные во временную таблицу и далее будем работать с ней
DROP TABLE IF EXISTS devices_operators_temp;
CREATE TEMPORARY TABLE  devices_operators_temp
AS 
	(SELECT * FROM devices_operators);

SELECT * FROM devices_operators_temp; 

-- SELECT operator_id FROM operators_regions WHERE region_id = 1 ORDER BY rand() LIMIT 1;


-- процедура проходит по строкам таблицы no_math_address_operator_device_temp, 
-- где собраны операторы и оборудования с разными регионами
-- выбирает случайного оператора из региона ооборудования
-- и обновляет соответствующую строку таблицы devices_operators_temp
delimiter //
DROP PROCEDURE IF EXISTS update_devices_operators//
CREATE PROCEDURE update_devices_operators()
BEGIN 
	DECLARE is_end int DEFAULT 0;
	DECLARE device bigint UNSIGNED DEFAULT 1;
	DECLARE operator bigint UNSIGNED DEFAULT 1;
	DECLARE region SMALLINT UNSIGNED DEFAULT 1;
	DECLARE rand_operator bigint UNSIGNED DEFAULT 1;
	-- объявляем курсор для таблицы no_math_address_operator_device_temp
	-- будем считывать оператора, оборудование и регион оператора
	DECLARE curcat CURSOR FOR SELECT device_id, device_operator, device_region FROM no_math_address_operator_device_temp ;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;
	OPEN curcat;
	CYCLE:LOOP 
		-- считываем оператора, оборудование и регион
		FETCH curcat INTO device, operator, region; 
		IF is_end THEN LEAVE CYCLE;
		END IF;
		-- случайным образом выбираем оператора из заданного региона
	/*
		SET rand_device = ifnull((SELECT da.device_id 
									FROM addresses a LEFT JOIN devices_addresses da 
									ON a.house_id = da.address_id WHERE a.region_id = region 
									ORDER BY rand()	DESC LIMIT 1),1);*/
		SET rand_operator = ifnull((SELECT operator_id FROM operators_regions WHERE region_id = region ORDER BY rand() LIMIT 1),1);
		-- для заданных оператора и оборудования обновляем строку в таблице devices_operators_temp 
		UPDATE devices_operators_temp
			SET operator_id = rand_operator WHERE (operator_id = operator) AND (device_id = device);
	END LOOP CYCLE;
	CLOSE curcat;
END//

-- обновляем таблицу devices_operators_temp, т.е. для каждого оператора ищем оборудование из его региона 
CALL update_devices_operators();

SELECT count(1) FROM devices_operators_temp;


-- снова проверяем есть ли оборудование, регион которого не находится в списке регионов операторов
SELECT 
	do.device_id AS device_id,
	do.operator_id AS device_operator,
	or2.l_region AS operator_regions ,
	a.region_id AS device_region
FROM devices_operators_temp do 
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
SELECT 
	d.id AS device_id,
	do.operator_id 
FROM devices d 
	LEFT JOIN devices_operators_temp do 
	ON d.id = do.device_id 
WHERE isnull(do.operator_id) 

-- создаем временную таблицу и вставляем в нее все device_id, у которых нет операторов
DROP TABLE IF EXISTS device_without_operators_temp;
CREATE TEMPORARY TABLE device_without_operators_temp
AS 
(
	SELECT 
		d.id AS device_id,
		do.operator_id 
	FROM devices d 
		LEFT JOIN devices_operators_temp do 
		ON d.id = do.device_id 
	WHERE isnull(do.operator_id) 
);

-- генерируем для них операторов - min из операторов того же региона
DROP TABLE IF EXISTS generate_rand_operators_from_same_regoin;
CREATE TEMPORARY TABLE generate_rand_operators_from_same_regoin
AS (
SELECT 
	dwo.device_id AS device_id,
	or2.operator_id AS operator_id
FROM device_without_operators_temp dwo
	LEFT JOIN (SELECT device_id, address_id FROM devices_addresses WHERE service_type_id = 1) AS da 
		ON dwo.device_id = da.device_id 
		LEFT JOIN addresses a 
			ON da.address_id = a.house_id 
			LEFT JOIN (SELECT min(operator_id) AS operator_id, region_id FROM operators_regions GROUP BY region_id) AS or2
			ON a.region_id = or2.region_id 
ORDER BY device_id
)
;

SELECT * FROM generate_rand_operators_from_same_regoin;

INSERT INTO device_without_operators_temp (device_id, operator_id )
(
	SELECT device_id, operator_id FROM generate_rand_operators_from_same_regoin
); 

DELETE FROM device_without_operators_temp WHERE isnull(operator_id);
SELECT * FROM device_without_operators_temp ORDER BY device_id;

SELECT * FROM devices_operators_temp ORDER BY device_id;

SELECT device_id, operator_id FROM devices_operators_temp 
UNION ALL SELECT device_id, operator_id FROM  device_without_operators_temp
ORDER BY device_id;

-- очищаем таблицу devices_operators и вставляем в нее новые данные
DELETE FROM devices_operators;

INSERT INTO devices_operators (device_id, operator_id)
(
	SELECT device_id, operator_id FROM devices_operators_temp 
	UNION ALL SELECT device_id, operator_id FROM  device_without_operators_temp
);

SELECT * FROM devices_operators;

-- проверяем есть ли оборудование, регион которого не находится в списке регионов операторов
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










