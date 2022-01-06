/*
 * 7. Создать два представления, в основе которых лежат сложные запросы.
 */
USE equipment_bd;

-- функция возвращает количество неисправных портов оборудования из таблицы ports
delimiter //
DROP FUNCTION IF EXISTS get_amount_faulty_ports //
CREATE FUNCTION get_amount_faulty_ports(device_id bigint UNSIGNED)
RETURNS int DETERMINISTIC 
BEGIN
	RETURN (SELECT 
				count(1) 
			FROM ports p 
			WHERE p.device_id = device_id 
			GROUP BY p.technical_status_id 
			HAVING p.technical_status_id = 3);
END //

-- представление для 
-- проверки соответствия статуса оборудования "неисправное" количеству неисправных портов
-- оборудование считается неисправным, если у него более 50% неисправных портов,
-- в противном случае статус оборудования "неисправен" некорректен и требует исправления
-- DROP VIEW IF EXISTS check_faulty_euipment;
CREATE OR REPLACE VIEW check_faulty_euipment
AS 
SELECT 
r.id AS region_id
, r.name AS region_name
, d.id AS device_id
, d.name AS device_name
, et.name 
, get_amount_faulty_ports(d.id) AS faulty_ports
, d.number_ports AS total_ports
, round((get_amount_faulty_ports(d.id)/d.number_ports)*100) AS percent_faulty_ports
, IF (round((get_amount_faulty_ports(d.id)/d.number_ports)*100) > 50, 1, 0) AS check_faulty_eq_ports
FROM devices d 
	JOIN  devices_addresses da ON  d.id = da.device_id 
		JOIN addresses a ON a.house_id = da.address_id 
			JOIN regions r ON r.id  = a.region_id 
				JOIN equipment_types et ON et.id = d.equipment_type_id 
WHERE d.technical_status_id  = 2 
GROUP BY d.id 
HAVING check_faulty_eq_ports = 0 
ORDER BY r.id 
;

-- применение: можно сделать запрос, есть ли в определенном регионе несоответствие
SELECT * FROM check_faulty_euipment 
-- WHERE region_id = 7
;

-- представление для отчета количество оборудования по операторам
-- DROP VIEW IF EXISTS number_equipment_by_operator;
CREATE OR REPLACE VIEW number_equipment_by_operator
AS 
SELECT 
r.id AS region_id
, r.name AS region_name
, concat_ws(' ', o.first_name, o.last_name) AS operator_name
, o.email AS operator_email
, count(do.device_id) AS operator_device
FROM operators o 
	JOIN devices_operators do ON o.id = do.device_id 
		JOIN operators_regions or2 ON or2.operator_id = o.id 
			JOIN regions r ON r.id = or2.region_id 
GROUP BY o.id 
ORDER BY operator_device  DESC 
;
 
-- применение 
 SELECT * FROM number_equipment_by_operator nebo 
 WHERE region_id = 1
;
 
 
 
 
 
 