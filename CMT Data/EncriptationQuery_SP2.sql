CREATE FUNCTION [dbo].[fn_CMT_Enc] (@data VARCHAR(10), @data2 VARCHAR(10)) 
RETURNS BINARY(16) AS
BEGIN
DECLARE @hash BINARY(16)
EXEC master.dbo.XP_MD5_EncodeKeyVal @data, @data2, @hash OUT
RETURN @hash
END 
