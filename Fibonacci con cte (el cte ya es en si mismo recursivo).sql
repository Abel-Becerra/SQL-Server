;WITH cte_numbers (
	c,
	d
	)
AS (
	SELECT CAST(0 AS BIGINT),
		CAST(1 AS BIGINT)
	
	UNION ALL
	
	SELECT d,
		c + d
	FROM cte_numbers
	---para evitar error Arithmetic overflow error converting expression to data type bigint.
	WHERE d <= 7539999999999999999
	)
SELECT 0
UNION ALL
SELECT d FROM cte_numbers;