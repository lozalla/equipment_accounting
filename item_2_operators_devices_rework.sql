-- ------------------------------------------------------------------------------

SELECT count(1) FROM devices_operators;
SELECT operator_id , device_id FROM devices_operators ORDER BY operator_id , device_id ; 
SELECT * FROM operators_regions WHERE operator_id = 13 ORDER BY operator_id ;

-- ïðîâåðÿåì åñòü ëè îáîðóäîâàíèå, ðåãèîí êîòîðîãî íå íàõîäèòñÿ â ñïèñêå ðåãèîíîâ îïåðàòîðîâ
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


-- âðåìåííàÿ òàáëèöà ñ íåïðàâèëüíûìè äàííûìè, ò.å. îáîðóäîâàíèå, ðåãèîí êîòîðîãî íå íàõîäèòñÿ â ñïèñêå ðåãèîíîâ îïåðàòîðîâ
DROP TABLE IF EXISTS  no_math_address_operator_device_temp;
CREATE TEMPORARY TABLE no_math_address_operator_device_temp
AS 
(SELECT 
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
ORDER  BY device_id, device_operator )
;

SELECT * FROM no_math_address_operator_device_temp;

-- ñêîïèðóåì äàííûå âî âðåìåííóþ òàáëèöó è äàëåå áóäåì ðàáîòàòü ñ íåé
DROP TABLE IF EXISTS devices_operators_temp;
CREATE TEMPORARY TABLE  devices_operators_temp
AS 
	(SELECT * FROM devices_operators);

SELECT * FROM devices_operators_temp; 

-- SELECT operator_id FROM operators_regions WHERE region_id = 1 ORDER BY rand() LIMIT 1;


-- ïðîöåäóðà ïðîõîäèò ïî ñòðîêàì òàáëèöû no_math_address_operator_device_temp, 
-- ãäå ñîáðàíû îïåðàòîðû è îáîðóäîâàíèÿ ñ ðàçíûìè ðåãèîíàìè
-- âûáèðàåò ñëó÷àéíîãî îïåðàòîðà èç ðåãèîíà îîáîðóäîâàíèÿ
-- è îáíîâëÿåò ñîîòâåòñòâóþùóþ ñòðîêó òàáëèöû devices_operators_temp
delimiter //
DROP PROCEDURE IF EXISTS update_devices_operators//
CREATE PROCEDURE update_devices_operators()
BEGIN 
	DECLARE is_end int DEFAULT 0;
	DECLARE device bigint UNSIGNED DEFAULT 1;
	DECLARE operator bigint UNSIGNED DEFAULT 1;
	DECLARE region SMALLINT UNSIGNED DEFAULT 1;
	DECLARE rand_operator bigint UNSIGNED DEFAULT 1;
	-- îáúÿâëÿåì êóðñîð äëÿ òàáëèöû no_math_address_operator_device_temp
	-- áóäåì ñ÷èòûâàòü îïåðàòîðà, îáîðóäîâàíèå è ðåãèîí îïåðàòîðà
	DECLARE curcat CURSOR FOR SELECT device_id, device_operator, device_region FROM no_math_address_operator_device_temp ;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;
	OPEN curcat;
	CYCLE:LOOP 
		-- ñ÷èòûâàåì îïåðàòîðà, îáîðóäîâàíèå è ðåãèîí
		FETCH curcat INTO device, operator, region; 
		IF is_end THEN LEAVE CYCLE;
		END IF;
		-- ñëó÷àéíûì îáðàçîì âûáèðàåì îïåðàòîðà èç çàäàííîãî ðåãèîíà
	/*
		SET rand_device = ifnull((SELECT da.device_id 
									FROM addresses a LEFT JOIN devices_addresses da 
									ON a.house_id = da.address_id WHERE a.region_id = region 
									ORDER BY rand()	DESC LIMIT 1),1);*/
		SET rand_operator = ifnull((SELECT operator_id FROM operators_regions WHERE region_id = region ORDER BY rand() LIMIT 1),1);
		-- äëÿ çàäàííûõ îïåðàòîðà è îáîðóäîâàíèÿ îáíîâëÿåì ñòðîêó â òàáëèöå devices_operators_temp 
		UPDATE devices_operators_temp
			SET operator_id = rand_operator WHERE (operator_id = operator) AND (device_id = device);
	END LOOP CYCLE;
	CLOSE curcat;
END//

-- îáíîâëÿåì òàáëèöó devices_operators_temp, ò.å. äëÿ êàæäîãî îïåðàòîðà èùåì îáîðóäîâàíèå èç åãî ðåãèîíà 
CALL update_devices_operators();

SELECT count(1) FROM devices_operators_temp;


-- ñíîâà ïðîâåðÿåì åñòü ëè îáîðóäîâàíèå, ðåãèîí êîòîðîãî íå íàõîäèòñÿ â ñïèñêå ðåãèîíîâ îïåðàòîðîâ
SELECT 
	do.device_id AS device_id,
	do.operator_id AS device_operator,
	or2.l_region AS operator_regions ,
	a.region_id AS device_region
FROM devices_operators_temp do 
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

-- ïðîâåðèì, åñòü ëè îáîðóäîâàíèå áåç îïåðàòîðà
SELECT 
	d.id AS device_id,
	do.operator_id 
FROM devices d 
	LEFT JOIN devices_operators_temp do 
	ON d.id = do.device_id 
WHERE isnull(do.operator_id) 

-- ñîçäàåì âðåìåííóþ òàáëèöó è âñòàâëÿåì â íåå âñå device_id, ó êîòîðûõ íåò îïåðàòîðîâ
DROP TABLE IF EXISTS device_without_operators_temp;
CREATE TEMPORARY TABLE device_without_operators_temp
AS 
(
	SELECT 
		d.id AS device_id,
		do.operator_id 
	FROM devices d 
		LEFT JOIN devices_operators_temp do 
		ON d.id = do.device_id 
	WHERE isnull(do.operator_id) 
);

-- ãåíåðèðóåì äëÿ íèõ îïåðàòîðîâ - min èç îïåðàòîðîâ òîãî æå ðåãèîíà
DROP TABLE IF EXISTS generate_rand_operators_from_same_regoin;
CREATE TEMPORARY TABLE generate_rand_operators_from_same_regoin
AS (
SELECT 
	dwo.device_id AS device_id,
	or2.operator_id AS operator_id
FROM device_without_operators_temp dwo
	LEFT JOIN (SELECT device_id, address_id FROM devices_addresses WHERE service_type_id = 1) AS da 
		ON dwo.device_id = da.device_id 
		LEFT JOIN addresses a 
			ON da.address_id = a.house_id 
			LEFT JOIN (SELECT min(operator_id) AS operator_id, region_id FROM operators_regions GROUP BY region_id) AS or2
			ON a.region_id = or2.region_id 
ORDER BY device_id
)
;

SELECT * FROM generate_rand_operators_from_same_regoin;

INSERT INTO device_without_operators_temp (device_id, operator_id )
(
	SELECT device_id, operator_id FROM generate_rand_operators_from_same_regoin
); 

DELETE FROM device_without_operators_temp WHERE isnull(operator_id);
SELECT * FROM device_without_operators_temp ORDER BY device_id;

SELECT * FROM devices_operators_temp ORDER BY device_id;

SELECT device_id, operator_id FROM devices_operators_temp 
UNION ALL SELECT device_id, operator_id FROM  device_without_operators_temp
ORDER BY device_id;

-- î÷èùàåì òàáëèöó devices_operators è âñòàâëÿåì â íåå íîâûå äàííûå
DELETE FROM devices_operators;

INSERT INTO devices_operators (device_id, operator_id)
(
	SELECT device_id, operator_id FROM devices_operators_temp 
	UNION ALL SELECT device_id, operator_id FROM  device_without_operators_temp
);

SELECT * FROM devices_operators;

-- ïðîâåðÿåì åñòü ëè îáîðóäîâàíèå, ðåãèîí êîòîðîãî íå íàõîäèòñÿ â ñïèñêå ðåãèîíîâ îïåðàòîðîâ
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

