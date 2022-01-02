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

ALTER TABLE addresses CHANGE prperty_type_id property_type_id TINYINT;
ALTER TABLE addresses MODIFY COLUMN property_type_id TINYINT UNSIGNED;

ALTER TABLE eqiupment_technical_statuses RENAME equipment_technical_statuses;
UPDATE devices SET technical_status_id = round(rand() * 2 + 1);

ALTER TABLE devices ADD COLUMN access_type_id TINYINT UNSIGNED NOT NULL DEFAULT 1;
UPDATE devices SET access_type_id = round(rand() * 2 + 1);





