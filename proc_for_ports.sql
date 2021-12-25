delimiter //
DROP PROCEDURE IF EXISTS fill_ports//
CREATE PROCEDURE fill_ports (device_id bigint, number_ports tinyint)
BEGIN 
	DECLARE i INT DEFAULT 1;
	DECLARE tech_status INT DEFAULT 0;
	WHILE i <= number_ports DO 
			SET tech_status = round(rand() * 3 + 1);
			INSERT INTO ports VALUES (device_id, i, tech_status);
		END WHILE;
END//

CREATE PROCEDURE from_device ()
BEGIN 
	DECLARE i int  DEFAULT 1;
	DECLARE n int  DEFAULT 0;
	SET n - (SELECT count(1) FROM devices);
	WHILE i <= n DO
		CALL fill_ports(device_id, number_ports) 
	END WHILE;
END//

delimiter //
DROP TRIGGER IF EXISTS devices_ports//
CREATE TRIGGER devices_ports BEFORE INSERT ON ports 
FOR EACH ROW 
BEGIN 
	DECLARE i INT DEFAULT 1;
	DECLARE tech_status INT DEFAULT 0;
	WHILE i <= NEW.number_port DO 
			SET tech_status = round(rand() * 3 + 1);
			INSERT INTO ports (device_id, number_port, technical_status_id) VALUES (NEW.device_id, i, tech_status);
		END WHILE;
END//

delimiter //
DROP PROCEDURE IF EXISTS viewing_devices//
CREATE PROCEDURE viewing_devices()
BEGIN 
	DECLARE tech_status INT DEFAULT 0;
	DECLARE i INT DEFAULT 1;
	DECLARE is_end int DEFAULT 0;
	DECLARE device_id bigint;
	DECLARE name varchar(200);
	DECLARE number_port TINYINT UNSIGNED DEFAULT 2;
	DECLARE curcat CURSOR FOR SELECT id, number_ports FROM devs;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;
	OPEN curcat;
	CYCLE:LOOP 
		FETCH curcat INTO device_id, number_port;
		IF is_end THEN LEAVE CYCLE;
		END IF;
		WHILE i <= number_port DO 
			SET tech_status = round(rand() * 2 + 1);
		-- UPDATE devs SET name = upper(name) WHERE id = device_id; 
			INSERT INTO ports (device_id, number_port, technical_status_id) VALUES (device_id, i, tech_status);
	 		SET i = i + 1;
		END WHILE;
		SET i = 1;
		-- IF is_end THEN LEAVE CYCLE;
		-- END IF;
	END LOOP CYCLE;
	CLOSE curcat;
END//

delimiter //
DROP PROCEDURE IF EXISTS copy_catalogs//
CREATE PROCEDURE copy_catalogs ()
BEGIN
	DECLARE id INT;
	DECLARE is_end INT DEFAULT 0;
	DECLARE name TINYTEXT;
	DECLARE curcat CURSOR FOR SELECT * FROM catalogs;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;
	OPEN curcat;
	cycle : LOOP
		FETCH curcat INTO id, name;
		IF is_end THEN LEAVE cycle;
		END IF;
		INSERT INTO upcase_catalogs VALUES(id, UPPER(name));
	END LOOP cycle;
	CLOSE curcat;
END//

























