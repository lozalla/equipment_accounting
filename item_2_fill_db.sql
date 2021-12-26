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


