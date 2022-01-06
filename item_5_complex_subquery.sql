/*
 *  5. ������� ��� ������� (��������������) ������� � �������������� �����������.
 */

USE equipment_bd;

-- ���������� ������������ �� ��������
SELECT 
	(SELECT a2.region_id FROM addresses a2 WHERE a2.house_id = da.address_id) AS region_id
	, (SELECT 
			(SELECT r.name FROM regions r WHERE r.id = a.region_id) AS rn
		FROM addresses a WHERE a.house_id = da.address_id) AS region_name
	, count( DISTINCT da.device_id) device_by_region
FROM devices_addresses da 
GROUP BY region_id 
ORDER BY device_by_region DESC 
;

-- �� �������� ���������� �������, ��������� � ����������� ������
SELECT 
	region_id,
	region_name,
	count( DISTINCT device_id) AS device_by_region,
	sum(amount_total_ports) AS total_ports,
	sum(amount_bysy_ports) AS busy_ports,
	sum(amount_free_ports) AS free_ports,
	sum(amount_faulty_ports) AS faulty_ports
FROM 
	(SELECT 
		(SELECT a.region_id FROM addresses a WHERE a.house_id = da.address_id) AS region_id,
		(SELECT r.name FROM regions r WHERE region_id = r.id) AS region_name,
	 	da.address_id ,
	 	(SELECT d.id FROM devices d WHERE da.device_id = d.id) AS device_id,
	 	(SELECT d.number_ports FROM devices d WHERE da.device_id = d.id) AS amount_total_ports,
	 	(SELECT count(1) FROM ports p WHERE p.device_id = da.device_id 
	 		GROUP BY p.technical_status_id HAVING p.technical_status_id = 1) AS amount_bysy_ports,
	 	(SELECT count(1) FROM ports p WHERE p.device_id = da.device_id 
	 		GROUP BY p.technical_status_id HAVING p.technical_status_id = 2) AS amount_free_ports,
		(SELECT count(1) FROM ports p WHERE p.device_id = da.device_id 
	 		GROUP BY p.technical_status_id HAVING p.technical_status_id = 3) AS amount_faulty_ports 		
	FROM devices_addresses da WHERE da.service_type_id = 1) AS amount_ports
GROUP BY region_id WITH ROLLUP 
ORDER BY region_id
;

-- �� �������� ���������� ������������� ������������ (�������� ������) - � ������� ������� ������
-- ���������� ������������ �����: �����.������� � ������ ���� (�� ������� ������ ������������)
SELECT 
	t.region_id,
	t.region_name,
 	sum(t.number_apartments * ifnull(t.ready_for_sale,0)) AS ready_for_sale,
 	sum(t.number_apartments * ifnull(t.project_for_sale,0)) AS project,
 	sum(t.number_apartments * ifnull(t.not_ready_for_sale,0)) AS not_ready_for_sale,
 	sum(t.number_apartments) AS total_households
FROM 
	(SELECT 
		da.service_type_id AS service_type ,
		da.address_id  AS address,
		(SELECT a.property_type_id FROM addresses a WHERE a.house_id = da.address_id) AS property_type,
		(SELECT a.number_apartments FROM addresses a WHERE a.house_id = da.address_id) AS number_apartments,
		(SELECT (SELECT r.id FROM regions r WHERE a.region_id = r.id) FROM addresses a WHERE a.house_id = da.address_id) AS region_id,
		(SELECT r.name FROM regions r WHERE region_id = r.id) AS region_name,
	 	da.device_id AS device ,
		(SELECT d.id FROM devices d WHERE (da.device_id = d.id) AND (d.access_type_id = 1)) AS device_b2b,
		(SELECT 1 FROM devices d2 WHERE (da.device_id = d2.id) AND (d2.sale_status_id = 1)) AS ready_for_sale,
		(SELECT 1 FROM devices d2 WHERE (da.device_id = d2.id) AND (d2.sale_status_id = 2)) AS project_for_sale,
		(SELECT 1 FROM devices d2 WHERE (da.device_id = d2.id) AND (d2.sale_status_id = 3)) AS not_ready_for_sale
		FROM devices_addresses da) AS t
WHERE  (NOT isnull(t.device_b2b)) AND (t.property_type <> 3)
GROUP BY t.region_id WITH ROLLUP 
ORDER BY t.region_id
;
































































 








	
	
	
	
	
	
	
	





















































