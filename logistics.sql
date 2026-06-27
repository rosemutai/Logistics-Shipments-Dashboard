CREATE SCHEMA logistics;
SET SEARCH_PATH TO logistics;

--  Create TABLE
CREATE TABLE logistics_original(
	shipment_id text,
	origin_warehouse text,
	destination text,
	carrier text,
	shipment_date text,
	delivery_date text,
	weight_kg text, 
	shipping_cost text, 
	status text, 
	distance_miles text, 
	transit_days text
);

-- Verify data was imported 
SELECT COUNT(*) FROM logistics_original;

--  Change data TYPE
-- 1. shipment_id
ALTER TABLE logistics_original
ALTER COLUMN shipment_id TYPE VARCHAR(10) USING shipment_id::VARCHAR;

-- 2. origin_warehouse
ALTER TABLE logistics_original
ALTER COLUMN origin_warehouse TYPE VARCHAR(100) USING origin_warehouse::VARCHAR;

-- 3. destination
ALTER TABLE logistics_original
ALTER COLUMN destination TYPE VARCHAR(100) USING destination::VARCHAR;

-- 4. carrier
ALTER TABLE logistics_original
ALTER COLUMN carrier TYPE VARCHAR(100) USING carrier::VARCHAR;

-- 5. shipment_date
ALTER TABLE logistics_original
ALTER COLUMN shipment_date TYPE DATE USING TO_DATE(shipment_date, 'DD/MM/YYYY');

SELECT shipment_id, shipment_date FROM logistics_original
WHERE shipment_date LIKE 'ship%';

-- Delete invalid dates
DELETE from logistics_original
WHERE shipment_date LIKE 'ship%';

-- 6. delivery_date
ALTER TABLE logistics_original
ALTER COLUMN delivery_date TYPE DATE USING TO_DATE(delivery_date, 'DD/MM/YYYY');

-- 7. weight_kg
ALTER TABLE logistics_original
ALTER COLUMN weight_kg TYPE DECIMAL(6,2) USING weight_kg::DECIMAL(6,2);

-- 8. shipping_cost
ALTER TABLE logistics_original
ALTER COLUMN shipping_cost TYPE DECIMAL(10,2) USING shipping_cost::DECIMAL(10,2);

-- 9. status
ALTER TABLE logistics_original
ALTER COLUMN status TYPE VARCHAR(100) USING status::VARCHAR;

-- 10. distance_miles
ALTER TABLE logistics_original
ALTER COLUMN distance_miles TYPE INTEGER USING distance_miles::INTEGER;

-- 11. transit_days
ALTER TABLE logistics_original
ALTER COLUMN transit_days TYPE INTEGER USING transit_days::INTEGER;

-- Check distinct values in important columns
-- 1. destination
SELECT destination, COUNT(*) AS total from logistics_original
GROUP BY destination
ORDER BY COUNT(*) DESC;

-- 2. carrier
SELECT carrier, COUNT(*) AS total from logistics_original
GROUP BY carrier
ORDER BY COUNT(*) DESC;

-- 3. status
SELECT status, COUNT(*) AS total from logistics_original
GROUP BY status
ORDER BY COUNT(*) DESC;

-- 4. origin_warehouse
SELECT origin_warehouse, COUNT(*) AS total from logistics_original
GROUP BY origin_warehouse
ORDER BY COUNT(*) DESC;

-- Find Missing Values
SELECT *
FROM logistics_original
WHERE shipment_id IS NULL OR TRIM(shipment_id) = ''
	OR origin_warehouse IS NULL OR TRIM(origin_warehouse) = ''
	OR destination IS NULL OR TRIM(destination) = ''
	OR carrier IS NULL OR TRIM(carrier) = ''
	OR shipment_date IS NULL
	OR delivery_date IS NULL
	OR weight_kg IS NULL
	OR shipping_cost IS NULL
	OR status IS NULL OR TRIM(status) = ''
	OR distance_miles IS NULL
	OR transit_days IS NULL;


-- Find Duplicates
SELECT shipment_id, origin_warehouse, destination, carrier, shipment_date,
	delivery_date, weight_kg, shipping_cost, status, distance_miles, transit_days,
	COUNT(*) AS totals
FROM logistics_original
GROUP BY shipment_id, origin_warehouse, destination, carrier, shipment_date,
	delivery_date, weight_kg, shipping_cost, status, distance_miles, transit_days
HAVING COUNT(*) > 1;


-- Find Invalid weight_kg, shipping_cost, distance_miles and transit_days
SELECT *
FROM logistics_original
WHERE weight_kg <= 0
	OR shipping_cost <= 0
	OR distance_miles <= 0
	OR transit_days <= 0;

CREATE TABLE logistics_backup1
AS SELECT * FROM logistics_original;


SELECT delivery_date, status from logistics_original
WHERE delivery_date IS NULL;

SELECT * from logistics_original
WHERE destination IS NULL OR origin_warehouse = '';

-- Delete zero weights
DELETE FROM logistics_original
WHERE weight_kg <= 0;

SELECT * FROM logistics_original
WHERE transit_days <= 0;

SELECT * from logistics_original
WHERE delivery_date IS NULL;

-- Create a backup of cleaned_data
CREATE TABLE shipment_backup_clean AS
SELECT * FROM logistics_original;

						-- Analytics
 -- Key KPIs
-- 1 Total Shipments
SELECT COUNT(*) AS TotalShipments
FROM logistics_original;

-- 2 On-Time Delivery Rate (%)
SELECT 
    (SUM(CASE WHEN status = 'Delivered' THEN 1 ELSE 0 END) * 100.0) 
    / COUNT(*) AS on_time_delivery_rate_pct
FROM logistics_original;


-- 3 Average Transit Days
-- 4 Average Cost per Shipment
-- 5 Cost per Mile
-- 6 Delay Rate (%)
