/*
 *  9. Создать триггер
 */

USE equipment_bd;

-- проверка условия: оператор и оборудование имеют один регион

delimiter //
DROP TRIGGER  IF EXISTS check_device_operator_region_before_ins //
CREATE TRIGGER check_device_operator_region_before_ins BEFORE INSERT ON devices_operators
FOR EACH ROW 
BEGIN 
	DECLARE region_device SMALLINT UNSIGNED ;
		
	SET region_device = (SELECT DISTINCT a.region_id
						FROM devices_addresses da JOIN addresses a ON da.address_id = a.house_id 
						WHERE da.device_id = NEW.device_id);
	IF(region_device NOT IN (SELECT or2.region_id 	
							FROM operators_regions or2 WHERE  NEW.operator_id = or2.operator_id)
		) THEN 
		SIGNAL SQLSTATE '45000' SET message_text = 'insert canseled: the region of the equipment does not match the region of the operator';
	END IF;
END //

delimiter //
DROP TRIGGER IF EXISTS check_device_operator_region_before_upd //
CREATE TRIGGER check_device_operator_region_before_upd BEFORE UPDATE ON devices_operators
FOR EACH ROW 
BEGIN 
	DECLARE region_device SMALLINT UNSIGNED ;
		
	SET region_device = (SELECT DISTINCT a.region_id
						FROM devices_addresses da JOIN addresses a ON da.address_id = a.house_id 
						WHERE da.device_id = NEW.device_id);
	IF(region_device NOT IN (SELECT or2.region_id 	
							FROM operators_regions or2 WHERE  NEW.operator_id = or2.operator_id)
		) THEN 
		SIGNAL SQLSTATE '45000' SET message_text = 'insert canseled: the region of the equipment does not match the region of the operator';
	END IF;
END //


-- поиск корректных данных
-- поиск региона для оборудования
SELECT 
	DISTINCT a.region_id
FROM devices_addresses da JOIN addresses a ON da.address_id = a.house_id 
WHERE da.device_id = 2;

-- поиск операторов из этого региона
SELECT 
	DISTINCT or2.operator_id 
FROM operators_regions or2 
WHERE  or2.region_id = 19
ORDER BY or2.operator_id 
;

						
INSERT INTO devices_operators (device_id, operator_id) VALUES (1,27); -- недопустимые данные
INSERT INTO devices_operators (device_id, operator_id) VALUES (1,3); -- допустимые данные
UPDATE devices_operators SET device_id = 2 WHERE operator_id = 8; -- недопустимые данные
UPDATE devices_operators SET device_id = 2 WHERE operator_id = 10; -- допустимые данные



 








