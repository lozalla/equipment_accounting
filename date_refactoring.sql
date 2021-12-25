-- вставка данных в таблицу devices
INSERT INTO devices 
SELECT * FROM devs;

-- заполенние таблицы  ports
DROP TABLE IF EXISTS ports;
CREATE TABLE ports 
(
	device_id bigint UNSIGNED NOT NULL comment 'id устройства',
	number_port TINYINT UNSIGNED NOT NULL DEFAULT 0 comment 'номер порта устройства',
	technical_status_id TINYINT UNSIGNED NOT NULL comment 'id технического состояния порта',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица портов устройств'
 
CALL fill_ports(); 

SELECT * FROM ports  ORDER BY device_id ;
SELECT count(1) FROM ports p ;
SELECT count(1) FROM devs;

-- замена number_ports = 24,32,64,96,144  на 2,4,8
UPDATE devices 
	SET number_ports = 16 WHERE number_ports = 144;
UPDATE devices 
	SET number_ports = 8 WHERE number_ports  IN (64,96);
UPDATE devices 
	SET number_ports = 4 WHERE number_ports IN (24,32);