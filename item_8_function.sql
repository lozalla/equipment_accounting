/*
 *  8. Создать пользовательскую функцию
 */

USE equipment_bd;
-- функция возвращает количество неисправных портов оборудования из таблицы ports
-- применялась при создании представления (п.7)
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