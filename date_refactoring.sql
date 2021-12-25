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
 
CALL viewing_devices(); 

SELECT * FROM ports  ORDER BY device_id ;
SELECT count(1) FROM ports p ;
SELECT count(1) FROM devs;

USE shop;
DROP TABLE IF EXISTS upcase_catalogs;
CREATE TABLE upcase_catalogs (
id SERIAL PRIMARY KEY,
name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет-магазина';

CALL copy_catalogs();

SELECT * FROM upcase_catalogs;