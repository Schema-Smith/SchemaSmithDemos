SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[ufnGetAccountingEndDate]()
RETURNS [datetime] 
AS 

BEGIN
    RETURN DATEADD(millisecond, -2, CONVERT(datetime, '20040701', 112));
END;

GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'FUNCTION',N'ufnGetAccountingEndDate', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Scalar function used in the uSalesOrderHeader trigger to set the starting account date.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ufnGetAccountingEndDate'
ELSE
BEGIN
	EXEC sys.sp_updateextendedproperty @name=N'MS_Description', @value=N'Scalar function used in the uSalesOrderHeader trigger to set the starting account date.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ufnGetAccountingEndDate'
END

GO