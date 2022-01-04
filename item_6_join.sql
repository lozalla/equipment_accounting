-- количество оборудования по регионам
SELECT 
r.id 
, r.name 
, count(DISTINCT a.house_id ) AS amount_address
, group_concat(DISTINCT a.house_id) l_address
, count(DISTINCT da.device_id) AS amount_device
FROM regions r 
	LEFT JOIN addresses a 
	ON r.id = a.region_id 
		LEFT JOIN devices_addresses da 
		ON da.address_id = a.house_id 
GROUP BY r.id 
HAVING amount_device = 0
ORDER BY amount_device DESC 
;
 

-- по регионам количество занятых, свободных и неисправных портов
SELECT 
	a.region_id 
	, r.name
	, count(DISTINCT da.device_id) AS amount_device
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
 	GROUP BY a.region_id 
 	ORDER BY amount_device DESC 
;



-- по регионам количество обслуживаемых домохозяйств (массовый сектор) - в разрезе статуса продаж
-- количество домохозяйств равно: колич.квартир в каждом доме (по каждому адресу обслуживания)
SELECT 
	 a.region_id 
	, r.name 
 	, sum(IF(d.sale_status_id = 1, a.number_apartments, 0)) AS rfs
 	, sum(IF(d.sale_status_id = 2, a.number_apartments, 0)) AS pfs
 	, sum(IF(d.sale_status_id = 3, a.number_apartments, 0)) AS nrfs 	
	, sum(a.number_apartments) AS householder
	FROM regions r
		LEFT JOIN addresses a 
		ON a.region_id = r.id 
			LEFT JOIN devices_addresses da 
			ON da.address_id = a.house_id 
				LEFT JOIN devices d 
				ON d.id = da.device_id 
 	WHERE d.access_type_id = 1 AND a.property_type_id <> 3
	GROUP BY a.region_id 
	ORDER BY a.region_id 
;		
	
	
	
	
	
	
	
	
	
	
	
	
	



















































