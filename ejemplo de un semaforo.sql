DECLARE @s1 BIT = 1,
	@s2 BIT = 0,
	@s3 BIT = 0,
	@s4 BIT = 0,
	@c TINYINT = 1,
	@l TINYINT = 4,
	@t TINYINT = 20,
	@f DATETIME = getdate(),
	@s NVARCHAR(100)

PRINT 'limite de semaforos ' + cast(@l AS VARCHAR)
PRINT 'intervalo ' + cast(@t AS VARCHAR)
PRINT 'tiempo inicio ' + cast(@f AS VARCHAR)
PRINT 'semaforo actual ' + cast(@c AS VARCHAR)

PRINT 'estado de semaforo pte-ote ' + cast(@s1 AS VARCHAR)
PRINT 'estado de semaforo nte-sur ' + cast(@s2 AS VARCHAR)
PRINT 'estado de semaforo ote-pte ' + cast(@s3 AS VARCHAR)
PRINT 'estado de semaforo sur-norte ' + cast(@s4 AS VARCHAR)

SET @f = DATEADD(SECOND, @t, GETDATE())

WHILE (1 = 1)
BEGIN
	IF @c = @l
		SET @c = 0

	IF DATEDIFF(SECOND, @f, getdate()) > 0
	BEGIN
		SET @c = @c + 1

		SELECT @s1 = CASE @c WHEN 1 THEN 1 ELSE 0 END,
			@s2 = CASE @c WHEN 1 THEN 1 ELSE 0 END,
			@s3 = CASE @c WHEN 1 THEN 1 ELSE 0 END,
			@s4 = CASE @c WHEN 1 THEN 1 ELSE 0 END,
			@f = DATEADD(SECOND, @t, GETDATE())

		PRINT '-------------------'
		PRINT 'estado de semaforo pte-ote ' + cast(@s1 AS VARCHAR)
		PRINT 'estado de semaforo nte-sur ' + cast(@s2 AS VARCHAR)
		PRINT 'estado de semaforo ote-pte ' + cast(@s3 AS VARCHAR)
		PRINT 'estado de semaforo sur-norte ' + cast(@s4 AS VARCHAR)
		PRINT 'semaforo actual ' + cast(@c AS VARCHAR)
	END
END