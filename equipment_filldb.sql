CREATE TABLE addresses
(
	house_id SERIAL PRIMARY KEY comment 'id ���� (������� �����, ����, ������ ���� �� �������������)',
	prperty_type_id TINYINT UNSIGNED  NOT NULL comment '��� ������������',
	number_apartments SMALLINT UNSIGNED NOT NULL DEFAULT 0 comment '���������� �������',
	region_id SMALLINT UNSIGNED NOT NULL DEFAULT 0 comment 'id �������',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
	) comment '������� �������'
	;

CREATE TABLE regions 
(
	id SMALLINT UNSIGNED NOT NULL DEFAULT 0 PRIMARY KEY ,
	name varchar(250) NOT NULL  comment '�������� �������',
	created_at datetime DEFAULT current_timestamp,
	updated_at datetime DEFAULT current_timestamp ON UPDATE current_timestamp
) comment '������� ��������'
;

CREATE TABLE devs
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

CREATE TABLE operators
(
	id serial PRIMARY KEY ,
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

