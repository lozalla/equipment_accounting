ALTER TABLE 
addresses
CHANGE
prperty_type_id 
property_type_id TINYINT
;

ALTER TABLE 
addresses
MODIFY COLUMN 
property_type_id TINYINT UNSIGNED 
;

ALTER TABLE addresses 
ADD CONSTRAINT addresses_property_type_fk
FOREIGN KEY (property_type_id)
REFERENCES property_types (id)
ON DELETE NO ACTION 
ON UPDATE CASCADE;

ALTER TABLE addresses 
ADD CONSTRAINT addresses_region_fk
FOREIGN KEY (region_id)
REFERENCES regions(id)
ON DELETE NO ACTION
ON UPDATE CASCADE;

ALTER TABLE devices 
ADD CONSTRAINT device_equipment_type_fk
FOREIGN KEY (equipment_type_id)
REFERENCES equipment_types(id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

ALTER TABLE devices 
ADD CONSTRAINT device_sale_status_fk
FOREIGN KEY (sale_status_id)
REFERENCES sale_statuses (id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

ALTER TABLE eqiupment_technical_statuses RENAME equipment_technical_statuses;

UPDATE devices SET technical_status_id = round(rand() * 2 + 1);

ALTER TABLE devices 
ADD CONSTRAINT device_equipment_technical_status_fk
FOREIGN KEY (technical_status_id)
REFERENCES  equipment_technical_statuses (id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

ALTER TABLE devices_addresses 
ADD CONSTRAINT devices_addresses_device_fk
FOREIGN KEY (device_id)
REFERENCES devices(id)
ON DELETE CASCADE
ON UPDATE CASCADE ;

ALTER TABLE devices_addresses 
ADD CONSTRAINT devices_addresses_address_fk
FOREIGN KEY (address_id)
REFERENCES addresses(house_id)
ON DELETE CASCADE
ON UPDATE CASCADE ;

ALTER TABLE devices_addresses 
ADD CONSTRAINT devices_addresses_service_type_fk
FOREIGN KEY (service_type_id)
REFERENCES service_types (id)
ON DELETE NO ACTION 
ON UPDATE CASCADE ;

ALTER TABLE devices 
ADD COLUMN access_type_id TINYINT UNSIGNED NOT NULL DEFAULT 1;

UPDATE devices SET access_type_id = round(rand() * 2 + 1);

ALTER TABLE devices 
ADD CONSTRAINT devices_access_type_fk
FOREIGN KEY (access_type_id)
REFERENCES access_types (id)
ON DELETE NO ACTION 
ON UPDATE CASCADE ;

ALTER TABLE operators_regions 
ADD CONSTRAINT operators_regoins_operator_fk
FOREIGN KEY (operator_id)
REFERENCES operators (id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

ALTER TABLE operators_regions 
ADD CONSTRAINT operators_regoins_region_fk
FOREIGN KEY (region_id)
REFERENCES regions (id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

ALTER TABLE ports 
ADD CONSTRAINT devices_ports_fk
FOREIGN KEY (device_id)
REFERENCES devices (id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

ALTER TABLE ports 
ADD CONSTRAINT ports_technical_status_fk
FOREIGN KEY (technical_status_id)
REFERENCES ports_technical_statuses (id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

