SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[ufnGetProductStandardCost](@ProductID [int], @OrderDate [datetime])
RETURNS [money] 
AS 

-- Returns the standard cost for the product on a specific date.
BEGIN
    DECLARE @StandardCost money;

    SELECT @StandardCost = pch.[StandardCost] 
    FROM [Production].[Product] p 
        INNER JOIN [Production].[ProductCostHistory] pch 
        ON p.[ProductID] = pch.[ProductID] 
            AND p.[ProductID] = @ProductID 
            AND @OrderDate BETWEEN pch.[StartDate] AND COALESCE(pch.[EndDate], CONVERT(datetime, '99991231', 112)); -- Make sure we get all the prices!

    RETURN @StandardCost;
END;

GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'FUNCTION',N'ufnGetProductStandardCost', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Scalar function returning the standard cost for a given product on a particular order date.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ufnGetProductStandardCost'
ELSE
BEGIN
	EXEC sys.sp_updateextendedproperty @name=N'MS_Description', @value=N'Scalar function returning the standard cost for a given product on a particular order date.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ufnGetProductStandardCost'
END

GO