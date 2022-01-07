/*
 * -10. ��� ������ �� ��������, ��������� � ������ 6, �������� �����������. � ��������
������ ��������� ����� ���������� �������, ��� ������ � �������� ��������,
������� �������� ������������� �������.
 */

USE equipment_bd;

 -- �� �������� ���������� �������, ��������� � ����������� ������
SELECT 
	r.id 
	, r.name
	, count(DISTINCT da.device_id) AS device_by_region
	, count(DISTINCT if(isnull(da.device_id), NULL, concat_ws('_', p.device_id, p.number_port))) AS total_ports
	, count(DISTINCT IF(p.technical_status_id = 1 , concat_ws('_', p.device_id, p.number_port), NULL)) AS busy_ports
 	, count(DISTINCT IF(p.technical_status_id = 2 , concat_ws('_', p.device_id, p.number_port), NULL)) AS free_ports
 	, count(DISTINCT IF(p.technical_status_id = 3 , concat_ws('_', p.device_id, p.number_port), NULL)) AS faulty_ports
 	FROM regions r 
		LEFT JOIN addresses a 
		ON a.region_id = r.id 
			LEFT JOIN devices_addresses da 
			ON da.address_id = a.house_id 
				LEFT JOIN ports p 
				ON da.device_id = p.device_id 
 	GROUP BY r.id WITH ROLLUP 
 	ORDER BY r.id  
;

-- ������� ���� ���������� ������� 
-- � ��������� ����� ��. item_10_table_eaxplain_with_fk.html � ������������ item_10_explain_with_fk.png
-- �.�. ���� ��� ������� �����, �� � �� ����. ��� � ��� ����� �������� �����������. 
-- � �������������� ��������� ��������, � �� ����� ������, ��������� ��� �����������
-- ��������� ������� �� ��������� � ���� ��� ������� �����, ������� �������� ���������. 
-- ��� ������������ ����������� - ������ ������� ���� 

ALTER TABLE addresses drop foreign key addresses_region_fk;

-- ������� ���� ���������� �������
-- � ��������� ����� ��. item_10_table_eaxplain_without_fk.html � ������������ item_10_explain_without_fk.png
-- ������� ��������� ���������: �� ������� a(address) ���� ������� 500 �����, ��� ������� ������� ���� 25 �����.
-- ��� ��������� ����� ��������� ������� �� �������
-- ��������� ������� 20 ����� �� ������� r(regions) ���������� �� ������� ������

-- ���������� ������ � �������� ������� ���������
create index addresses_region_idx on addresses(region_id);

























