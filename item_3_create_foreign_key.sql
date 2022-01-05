-- ALTER TABLE addresses DROP FOREIGN KEY addresses_property_type_fk;
ALTER TABLE addresses ADD CONSTRAINT addresses_property_type_fk
FOREIGN KEY (property_type_id) REFERENCES property_types (id)
ON DELETE NO ACTION 
ON UPDATE CASCADE;

-- ALTER TABLE addresses DROP FOREIGN KEY addresses_region_fk;
ALTER TABLE addresses ADD CONSTRAINT addresses_region_fk
FOREIGN KEY (region_id) REFERENCES regions(id)
ON DELETE NO ACTION
ON UPDATE CASCADE;

-- ALTER TABLE devices DROP FOREIGN  KEY device_equipment_type_fk;
ALTER TABLE devices ADD CONSTRAINT device_equipment_type_fk
FOREIGN KEY (equipment_type_id) REFERENCES equipment_types(id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

-- ALTER TABLE devices DROP FOREIGN KEY device_sale_status_fk;
ALTER TABLE devices ADD CONSTRAINT device_sale_status_fk
FOREIGN KEY (sale_status_id) REFERENCES sale_statuses (id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

-- ALTER TABLE devices  DROP FOREIGN KEY device_equipment_technical_status_fk;
ALTER TABLE devices ADD CONSTRAINT device_equipment_technical_status_fk
FOREIGN KEY (technical_status_id) REFERENCES  equipment_technical_statuses (id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

-- ALTER TABLE devices_addresses DROP FOREIGN KEY devices_addresses_device_fk;
ALTER TABLE devices_addresses ADD CONSTRAINT devices_addresses_device_fk
FOREIGN KEY (device_id) REFERENCES devices(id)
ON DELETE CASCADE
ON UPDATE CASCADE ;

-- ALTER TABLE devices_addresses DROP FOREIGN KEY devices_addresses_address_fk;
ALTER TABLE devices_addresses ADD CONSTRAINT devices_addresses_address_fk
FOREIGN KEY (address_id) REFERENCES addresses(house_id)
ON DELETE CASCADE
ON UPDATE CASCADE ;

-- ALTER TABLE devices_addresses DROP FOREIGN KEY devices_addresses_service_type_fk;
ALTER TABLE devices_addresses ADD CONSTRAINT devices_addresses_service_type_fk
FOREIGN KEY (service_type_id) REFERENCES service_types (id)
ON DELETE NO ACTION 
ON UPDATE CASCADE ;

 
-- ALTER TABLE devices DROP FOREIGN KEY devices_access_type_fk; 
ALTER TABLE device ADD CONSTRAINT devices_access_type_fk
FOREIGN KEY (access_type_id)
REFERENCES access_types (id)
ON DELETE NO ACTION 
ON UPDATE CASCADE ;

-- ALTER TABLE operators_regions DROP FOREIGN KEY operators_regoins_operator_fk;
ALTER TABLE operators_regions ADD CONSTRAINT operators_regoins_operator_fk
FOREIGN KEY (operator_id) REFERENCES operators (id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

-- ALTER TABLE operators_regions  DROP FOREIGN KEY operators_regoins_region_fk;
ALTER TABLE operators_regions ADD CONSTRAINT operators_regoins_region_fk
FOREIGN KEY (region_id) REFERENCES regions (id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

-- ALTER TABLE ports  DROP FOREIGN KEY devices_ports_fk;
ALTER TABLE ports ADD CONSTRAINT devices_ports_fk
FOREIGN KEY (device_id) REFERENCES devices (id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

-- ALTER TABLE ports DROP FOREIGN KEY ports_technical_status_fk;
ALTER TABLE ports ADD CONSTRAINT ports_technical_status_fk
FOREIGN KEY (technical_status_id)
REFERENCES ports_technical_statuses (id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

-- ALTER TABLE devices DROP FOREIGN KEY device_access_type_fk;
ALTER TABLE devices ADD CONSTRAINT device_access_type_fk
FOREIGN  KEY (access_type_id) REFERENCES access_types(id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

-- ALTER TABLE devices_operators DROP FOREIGN KEY devices_operators_devices_fk;
ALTER TABLE devices_operators ADD CONSTRAINT devices_operators_devices_fk
FOREIGN KEY (device_id) REFERENCES devices(id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;

-- ALTER TABLE devices_operators  DROP FOREIGN KEY devices_operators_operators_fk;
ALTER TABLE devices_operators ADD CONSTRAINT devices_operators_operators_fk
FOREIGN KEY (operator_id) REFERENCES operators(id)
ON DELETE NO ACTION
ON UPDATE CASCADE ;







