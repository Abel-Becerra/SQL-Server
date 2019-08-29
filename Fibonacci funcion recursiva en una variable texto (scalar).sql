CREATE FUNCTION dbo.Fibonacci (
	@Num INT,
	@prev INT,
	@next INT
	)
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @returnValue AS VARCHAR(MAX) = CAST(@prev AS VARCHAR(MAX))

	IF (@Num > 0)
	BEGIN
		IF (LEN(@returnValue) > 0)
		BEGIN
			SET @returnValue = @returnValue + ','
		END

		SET @returnValue = @returnValue + dbo.Fibonacci(@Num - 1, @next, @next + @prev)
	END

	RETURN @returnValue
END
GO
SELECT dbo.Fibonacci(30, 0, 1)