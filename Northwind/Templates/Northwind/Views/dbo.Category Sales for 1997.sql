SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER view [dbo].[Category Sales for 1997] AS

SELECT "Product Sales for 1997".CategoryName, Sum("Product Sales for 1997".ProductSales) AS CategorySales
FROM "Product Sales for 1997"
GROUP BY "Product Sales for 1997".CategoryName

GO
