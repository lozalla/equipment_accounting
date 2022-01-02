/*
 *1.  ���������������� ������-������ ���������� � ������� ��������� ���� ������,
������� ����� �������������� ��� �������� ������ ����� ����������. � ����
������ ������ ���� ������� ������ ������. ���� ������ ���������� �����
�������� �� ������������� ������������ ������ ����������� ���������� � ��
��������� ��� ����������. � �������� ������ �� ���� ����� ������� ����������
��������� ������� �������� ������.
 */

/*
 * ��������� ���� ������ - "���� �������������"
 */

CREATE DATABASE equipment_bd;
USE equipment_bd;

DROP TABLE IF EXISTS addresses;
CREATE TABLE addresses
(
	house_id SERIAL PRIMARY KEY comment 'id ���� (������� �����, ����, ������� �� ������������� ��� ��������)',
	prperty_type_id TINYINT UNSIGNED  NOT NULL comment '��� ������������',
	number_apartments SMALLINT UNSIGNED NOT NULL DEFAULT 0 comment '���������� �������',
	region_id SMALLINT UNSIGNED NOT NULL DEFAULT 0 comment 'id �������',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
	) comment '������� �������'
	;

DROP TABLE IF EXISTS regions; 
CREATE TABLE regions 
(
	id SMALLINT UNSIGNED NOT NULL DEFAULT 0 PRIMARY KEY ,
	name varchar(250) NOT NULL  comment '�������� �������',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� ��������'
;

DROP TABLE IF EXISTS property_types;
CREATE TABLE property_types
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� ����� ������������'
;

DROP TABLE IF EXISTS sale_statuses;
CREATE TABLE sale_statuses
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� �������� ��� ������� ����� �� ������������'
;

DROP TABLE IF EXISTS eqiupment_technical_statuses;
CREATE TABLE eqiupment_technical_statuses
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� �������� ������������ ��������� ������������'
;

DROP TABLE IF EXISTS ports_technical_statuses;
CREATE TABLE ports_technical_statuses
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� �������� ������������ ��������� ������'
;

DROP TABLE IF EXISTS equipment_types;
CREATE TABLE equipment_types
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� ����� ������������'
;

DROP TABLE IF EXISTS access_types;
CREATE TABLE access_types
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� ����� �������'
;

DROP TABLE IF EXISTS service_types;
CREATE TABLE service_types
(
	id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� ����� ������������ ������'
;

DROP TABLE IF EXISTS devices;  
CREATE TABLE devices
(
	id serial PRIMARY KEY,
	name varchar(200) NOT NULL ,
	equipment_type_id TINYINT UNSIGNED NOT NULL comment '��� ������������',
	number_ports TINYINT UNSIGNED NOT NULL DEFAULT 2 comment '���������� ������',
	sale_status_id TINYINT UNSIGNED NOT NULL DEFAULT 1 comment '������ ������������ ��� �������',
	technical_status_id TINYINT UNSIGNED NOT NULL DEFAULT 1 comment '����������� ������ ������������',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� ���������'
;

CREATE TABLE devices_addresses 
(
	device_id bigint UNSIGNED NOT NULL comment 'id ����������',
	address_id bigint UNSIGNED NOT NULL comment 'id ������',
	service_type_id TINYINT UNSIGNED NOT NULL comment 'id ��� ������������ ������',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� ������ ����������-������, 
			�� ������ ����� ���� ��������� ���������,
			���������� ����� ����������� ��������� �������'
;


CREATE TABLE ports 
(
	device_id bigint UNSIGNED NOT NULL comment 'id ����������',
	number_port TINYINT UNSIGNED NOT NULL DEFAULT 1 comment '����� ����� ����������',
	technical_status_id TINYINT UNSIGNED NOT NULL comment 'id ������������ ��������� �����',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� ������ ���������'
;

DROP TABLE IF EXISTS operators;
CREATE TABLE operators
(
	id serial PRIMARY KEY ,
	first_name varchar(250) NOT NULL  comment '��� ���������',
	last_name varchar(250) NOT NULL comment '������� ��������',
	email varchar(200) NOT NULL ,
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� ����������, ������� ����� ���� ������������ � ��'
;

CREATE TABLE operators_regions
(
	operator_id bigint UNSIGNED NOT NULL comment 'id ���������',
	region_id smallint UNSIGNED NOT NULL comment 'id �������',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� ������ ���������� � ��������, ������� ��� �����������
			���� �������� ����� ����������� ��������� ��������,
			� ������� ����� ���� ��������� ���������� '
;

CREATE TABLE devices_operators 
(
	device_id bigint unsigned NOT NULL comment 'id ������������',
	operator_id bigint unsigned NOT NULL comment 'id ���������',
	created_at datetime DEFAULT CURRENT_TIMESTAMP,
    updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) comment '������� ����� ������������ - ��������
			�������� � ������������� ����� ������ ���������
			�������� ����� �������� � ������ �������������';