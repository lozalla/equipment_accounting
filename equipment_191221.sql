CREATE DATABASE equipment_bd;
USE equipment_bd;

DROP TABLE IF EXISTS addresses;
CREATE TABLE addresses
(
	house_id SERIAL PRIMARY KEY comment 'id дома (таблицы домов, улиц, городов пока не проектируются)',
	prperty_type_id TINYINT UNSIGNED  NOT NULL comment 'тип недвижимости',
	number_apartments SMALLINT UNSIGNED NOT NULL DEFAULT 0 comment 'количество квартир',
	region_id SMALLINT UNSIGNED NOT NULL DEFAULT 0 comment 'id региона',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
	) comment 'таблица адресов'
	;

DROP TABLE IF EXISTS regions; 
CREATE TABLE regions 
(
	id SMALLINT UNSIGNED NOT NULL DEFAULT 0 PRIMARY KEY ,
	name varchar(250) NOT NULL  comment 'название региона',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица регионов'
;

DROP TABLE IF EXISTS property_types;
CREATE TABLE property_types
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица типов недвижимости'
;

DROP TABLE IF EXISTS sale_statuses;
CREATE TABLE sale_statuses
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица статусов для продажи услуг на оборудовании'
;

DROP TABLE IF EXISTS eqiupment_technical_statuses;
CREATE TABLE eqiupment_technical_statuses
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица статусов технического состояния оборудования'
;

DROP TABLE IF EXISTS ports_technical_statuses;
CREATE TABLE ports_technical_statuses
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица статусов технического состояния портов'
;

DROP TABLE IF EXISTS equipment_types;
CREATE TABLE equipment_types
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица типов оборудования'
;

DROP TABLE IF EXISTS access_types;
CREATE TABLE access_types
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица типов доступа'
;

DROP TABLE IF EXISTS service_types;
CREATE TABLE service_types
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица типов обслуживания адреса'
;

DROP TABLE IF EXISTS devices;  
CREATE TABLE devices
(
	id serial PRIMARY KEY,
	name varchar(200) NOT NULL ,
	equipment_type_id TINYINT UNSIGNED NOT NULL comment 'тип оборудования',
	number_ports TINYINT UNSIGNED NOT NULL DEFAULT 2 comment 'количество портов',
	sale_status_id TINYINT UNSIGNED NOT NULL DEFAULT 1 comment 'статус оборудования для продажи',
	technical_status_id TINYINT UNSIGNED NOT NULL DEFAULT 1 comment 'технический статус оборудования',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица устройств'
;

CREATE TABLE devices_addresses 
(
	device_id bigint UNSIGNED NOT NULL comment 'id устройства',
	address_id bigint UNSIGNED NOT NULL comment 'id адреса',
	service_type_id TINYINT UNSIGNED NOT NULL comment 'id тип обслуживания адреса',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица связей устройства-адреса, 
			на адресе может быть несколько устройств,
			устройство может обслуживать несколько адресов'
;


CREATE TABLE ports 
(
	device_id bigint UNSIGNED NOT NULL comment 'id устройства',
	number_port TINYINT UNSIGNED NOT NULL DEFAULT 1 comment 'номер порта устройства',
	technical_status_id TINYINT UNSIGNED NOT NULL comment 'id технического состояния порта',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица портов устройств'
;

DROP TABLE IF EXISTS operators;
CREATE TABLE operators
(
	id serial PRIMARY KEY ,
	email varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица операторов, которые ведут учет оборудования в БД'
;

CREATE TABLE operators_regions
(
	operator_id bigint UNSIGNED NOT NULL comment 'id оператора',
	region_id smallint UNSIGNED NOT NULL comment 'id региона',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица связей операторов и регионов, которые они обслуживают
			один оператор может обслуживать тесколько регионов,
			в регионе может быть несколько операторов '
;

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
