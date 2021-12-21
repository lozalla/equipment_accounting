CREATE TABLE addresses
(
	house_id SERIAL PRIMARY KEY comment 'id дома (таблицы домов, улиц, городв пока не проектируются)',
	prperty_type_id TINYINT UNSIGNED  NOT NULL comment 'тип недвижимости',
	number_apartments SMALLINT UNSIGNED NOT NULL DEFAULT 0 comment 'количество квартир',
	region_id SMALLINT UNSIGNED NOT NULL DEFAULT 0 comment 'id региона',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
	) comment 'таблица адресов'
	;

CREATE TABLE regions 
(
	id SMALLINT UNSIGNED NOT NULL DEFAULT 0 PRIMARY KEY ,
	name varchar(250) NOT NULL  comment 'название региона',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment 'таблица регионов'
;

CREATE TABLE devs
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

