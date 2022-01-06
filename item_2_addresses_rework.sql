-- ���������� ������� addresses ����� ��������� �������� ������ : 
-- ���� ��� ������������ - ������� ������, �� ���������� ������� � ���� ��������� �� ������ 4
-- ���� ��� ������������ - �������� ������� ������ - �� ���������� ������� � ���� ��������� 0

SELECT 
pt.id 
, pt.name 
, a.number_apartments 
FROM addresses a
	LEFT JOIN property_types pt ON a.property_type_id = pt.id 
;

UPDATE addresses SET number_apartments = round(rand() * 3 + 1) WHERE property_type_id = 2;
UPDATE addresses SET number_apartments = 0 WHERE property_type_id = 3;
