/*
 * 2. ��������� ��������� �������� ������, ��������� ��������� �� ������� �
���������� ������� ��� ����� ��� ��� ������, ��� ��� ����� �����. ����������
������ ��������� ���� ��� ����������. � �������� ������ ��������� ���� �� �
�������.
 */

-- ��������� ����������� ��������������, �.�. ��������������� ���������� ������� (�������� ���������) 
USE equipment_bd;

truncate TABLE  property_types;
INSERT INTO property_types (name) VALUES 
	('��������������� ���'),
	('������� ���'),
	('�������� ������� ������')
	;

truncate TABLE sale_statuses; 	
INSERT INTO sale_statuses (name) VALUES 
	('����� � �������'),
	('�������������'),
	('������ �� �������')
	;
truncate TABLE equipment_technical_statuses ;
INSERT INTO equipment_technical_statuses (name) VALUES 
	('��������'),
	('����������'),
	('������������')
	;

truncate ports_technical_statuses ;
INSERT INTO ports_technical_statuses (name) VALUES 
	('�����'),
	('��������'),
	('����������')
	;

truncate TABLE equipment_types ;
INSERT INTO equipment_types (name) VALUES 
	('����������'),
	('�������������'),
	('��������')
	;

truncate TABLE access_types ;
INSERT INTO  access_types (name) VALUES 
	('�������� �������'),
	('������������� �������'),
	('���������')
	;

truncate TABLE service_types ;
INSERT INTO  service_types (name) VALUES 
	('����� ��������� ������������'),
	('�������������� ����� ������������')
	;

-- --------------------------------------------- devices -------------------------
-- ��������� ������� devices: ��������� �����, ������������ �������, ���� �������, ������� ��� ������
UPDATE devices SET technical_status_id = round(rand() * 2 + 1);
UPDATE devices SET access_type_id = round(rand() * 2 + 1);
UPDATE devices SET sale_status_id = round(rand() * 2 + 1);
-- --------------------------------------------- devices -------------------------

-- --------------------------------------------- addresses -------------------------
-- ��������� ������� addresses: 
-- ���� ��� ������������ - ������� ������, �� ���������� ������� � ���� ��������� �� ������ 4
-- ���� ��� ������������ - �������� ������� ������ - �� ���������� ������� � ���� ��������� 0
UPDATE addresses SET number_apartments = round(rand() * 3 + 1) WHERE property_type_id = 2;
UPDATE addresses SET number_apartments = 0 WHERE property_type_id = 3;
-- --------------------------------------------- addresses -------------------------

-- --------------------------------------------- operators_regions -------------------------
-- ����� ��������� ������ � ������� operators_regions 
-- �������� ���� �� ������ ��� ��������� - ������� ������ ���� ������
SELECT 
	r.id ,
	or2.operator_id 
FROM regions r LEFT JOIN operators_regions or2 ON r.id = or2.region_id WHERE isnull(or2.operator_id);

-- ���������, ���� �� �������� ��� ������� - ������� ������ ���� ������
SELECT 
	o.id , 	
	or2.region_id 
FROM operators o LEFT JOIN operators_regions or2 ON o.id = or2.operator_id WHERE isnull(or2.region_id);
-- --------------------------------------------- operators_regions -------------------------

-- --------------------------------------------- devices_addresses -------------------------
-- ����� ��������� ������ � ������� devices_addresses  
-- ��������� ����������  ���������� ��� ������ ��������� ������������
-- �.�. ������������ �� ����� ���� ����������� �� ���� �������  
-- ������ ���� ������ �������
SELECT 
	device_id ,
	count(address_id) AS count_address,
	min(address_id) AS min_adddress_id,
	group_concat(address_id) AS group_address
FROM devices_addresses 
WHERE service_type_id = 1 
GROUP BY device_id 
HAVING count_address > 1
ORDER BY device_id ;

-- ���������, ���� �� ������, ����� ����� ��������� ������������ ����� � �������������� ����� ������������
-- ��� ����� ������� ������ main_address, � ������� ����� ��������� address_id, � �������� service_type_id = 1
-- ������ ���� ������ �������
SELECT * 
FROM 
	(SELECT 
		device_id ,
		address_id ,
		service_type_id ,
		FIRST_VALUE(address_id) OVER(PARTITION BY device_id ORDER BY service_type_id)  AS main_address
	FROM devices_addresses
	ORDER BY device_id, service_type_id
	) AS t
WHERE 
(t.service_type_id = 2) AND (t.address_id = t.main_address)
-- --------------------------------------------- devices_addresses -------------------------


-- --------------------------------------------- devices_operators -------------------------
-- ����� ��������� ������� devices_operators
-- ��������� ���� �� ������������, ������ �������� �� ��������� � ������ �������� ����������
-- ������ ���� ������ �������
SELECT 
	do.device_id AS device_id,
	do.operator_id AS device_operator,
	or2.l_region AS operator_regions ,
	a.region_id AS device_region
FROM devices_operators do 
	LEFT JOIN  
	(SELECT operator_id , group_concat(region_id) AS l_region FROM operators_regions GROUP BY operator_id) AS or2
	ON do.operator_id = or2.operator_id
		LEFT JOIN 
			(SELECT device_id, address_id FROM devices_addresses WHERE service_type_id = 1) AS da
		ON do.device_id = da.device_id
			LEFT JOIN addresses a 
			ON a.house_id = da.address_id   
WHERE a.region_id NOT IN (SELECT region_id FROM operators_regions WHERE operator_id = do.operator_id)
ORDER  BY device_id, device_operator
;

-- ��������, ���� �� ������������ ��� ���������
-- ������ ���� ������ �������
SELECT 
	d.id AS device_id,
	do.operator_id 
FROM devices d 
	LEFT JOIN devices_operators do 
	ON d.id = do.device_id 
WHERE isnull(do.operator_id) 
-- --------------------------------------------- devices_operators -------------------------

-- ----------------------------------------- ports ----------------------------------------
-- ����� ���������� ������� ports �������� ���������� ������ ���������� ������ �� ����� ������������ 
-- ��  ������� device � �� ������� ports

SELECT 
d.id 
, IF (d.number_ports = count(p.number_port), 1, 0 ) AS check_number_ports
FROM devices d JOIN ports p ON d.id = p.device_id 
GROUP BY d.id 
HAVING check_number_ports = 0
;













