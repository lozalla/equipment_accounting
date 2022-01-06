-- ---------------- ��������� ������� operators_regions

USE equipment_bd;

-- �������� ���� �� ������ ��� ��������� -----------------------------------------
SELECT 
	r.id ,
	or2.operator_id 
FROM regions r 
LEFT JOIN operators_regions or2 
ON r.id = or2.region_id 
WHERE isnull(or2.operator_id)
;

-- ������� ��������� ������� 
CREATE TEMPORARY TABLE region_without_operator
AS 
(
SELECT 
	r.id ,
	or2.operator_id 
FROM regions r 
LEFT JOIN operators_regions or2 
ON r.id = or2.region_id 
WHERE isnull(or2.operator_id)
);
SELECT * FROM region_without_operator;

-- ���������� ��� ��� ���������� - ��������� ������� �� ��������� (1, @amount_operators)
SET @amount_operators = (SELECT count(1) FROM operators) - 1;
SELECT @amount_operators;

UPDATE region_without_operator SET  operator_id = round(rand() * @amount_operators + 1);
SELECT * FROM region_without_operator;

INSERT INTO operators_regions (operator_id, region_id)
(
	SELECT operator_id, id FROM region_without_operator
);
	   
-- ��� ��� �������� ���� �� ������ ��� ���������
SELECT 
	r.id ,
	or2.operator_id 
FROM regions r 
LEFT JOIN operators_regions or2 
ON r.id = or2.region_id 
WHERE isnull(or2.operator_id)
;

-- ���������, ���� �� �������� ��� ������� --------------------------

SELECT 
	o.id ,
	or2.region_id 
FROM operators o 
LEFT JOIN operators_regions or2 
ON o.id = or2.operator_id 
WHERE isnull(or2.region_id)
;

-- ������� ��������� ������� 
CREATE TEMPORARY TABLE operator_without_region
AS 
(
	SELECT 
		o.id ,
		or2.region_id 
	FROM operators o 
	LEFT JOIN operators_regions or2 
	ON o.id = or2.operator_id 
	WHERE isnull(or2.region_id)
);
SELECT * FROM operator_without_region;

-- ���������� ��� ��� ������� - ��������� ������� �� ��������� (1, @amount_regions)
SET @amount_regions = (SELECT count(1) FROM regions) - 1;
SELECT @amount_regions;

UPDATE operator_without_region SET  region_id = round(rand() * @amount_regions + 1);
SELECT * FROM operator_without_region;

INSERT INTO operators_regions (operator_id, region_id)
(
	SELECT id, region_id FROM operator_without_region
);

-- ���������, ���� �� �������� ��� �������

SELECT 
	o.id ,
	or2.region_id 
FROM operators o 
LEFT JOIN operators_regions or2 
ON o.id = or2.operator_id 
WHERE isnull(or2.region_id)
;

-- ------------------ ����� ��������� ������� operators_regions