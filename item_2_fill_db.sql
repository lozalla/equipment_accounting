/*
 * 2. ��������� ��������� �������� ������, ��������� ��������� �� ������� �
���������� ������� ��� ����� ��� ��� ������, ��� ��� ����� �����. ����������
������ ��������� ���� ��� ����������. � �������� ������ ��������� ���� �� �
�������.
 */

-- ��������� ����������� ����������� � ������

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

-- ALTER TABLE addresses CHANGE prperty_type_id property_type_id TINYINT;
-- ALTER TABLE addresses MODIFY COLUMN property_type_id TINYINT UNSIGNED;

-- ALTER TABLE eqiupment_technical_statuses RENAME equipment_technical_statuses;
-- UPDATE devices SET technical_status_id = round(rand() * 2 + 1);

-- ALTER TABLE devices ADD COLUMN access_type_id TINYINT UNSIGNED NOT NULL DEFAULT 1;
-- UPDATE devices SET access_type_id = round(rand() * 2 + 1);





