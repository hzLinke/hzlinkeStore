USE [LinkeDisV4]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetPurchaeBatchNotMatch]    Script Date: 2026-04-10 04:16:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Sp_GetPurchaeBatchNotMatch]
    @BillNumber VARCHAR(20) = ''
AS
/**采购没有匹配**/
SET NOCOUNT ON

DECLARE @SaleNotMatch TABLE (
    Idkey VARCHAR(50),
    ProductCode VARCHAR(50),
    DownUnit VARCHAR(50),
    SaleType INT,
    num DECIMAL(18, 4),
    numEx DECIMAL(18, 4),
    salePrice DECIMAL(18, 4),
    BatchNumber VARCHAR(50),
    billnumber VARCHAR(50),
    DeliveryAt DATETIME,
    Name VARCHAR(100),
    Spec VARCHAR(100)
)

INSERT INTO @SaleNotMatch
EXEC Sp_GetSaleBatchNotMatch '' 

SELECT 
    a.Idkey,
    a.ProductCode,
    a.DownUnit,
    a.SaleType,
    a.num AS 入库数量,
    a.numEx AS 入库结算量,
    ISNULL(c.匹配数量, 0) AS 匹配数量,
    ISNULL(c.匹配结算量, 0) AS 匹配结算量,
    a.num - ISNULL(c.匹配数量, 0) AS 剩余数量,
    a.numEx - ISNULL(c.匹配结算量, 0) AS 剩余结算量,
    a.costprice,
    a.BatchNumber,
    a.billnumber,
    a.DeliveryAt,
    b.Name,
    b.Spec
FROM L_Bill_Purchases_Tab a
INNER JOIN L_Basic_Product_Tab b ON a.ProductCode = b.IdCode
LEFT JOIN (
    SELECT 
        ProductCode,
        SaleType,
        BatchNumber,
        SUM(num) AS 匹配数量,
        SUM(NumEx) AS 匹配结算量
    FROM L_Bill_Sales_Tabs 
    WHERE billnumber = @BillNumber
    GROUP BY ProductCode, SaleType, BatchNumber
) c ON a.ProductCode = c.ProductCode 
    AND a.SaleType = c.SaleType 
    AND a.BatchNumber = c.BatchNumber
WHERE a.BillNumber = @BillNumber
    AND (a.num - ISNULL(c.匹配数量, 0) > 0 
        OR a.numEx - ISNULL(c.匹配结算量, 0) > 0)
    AND EXISTS (
        SELECT 1 FROM @SaleNotMatch d
        WHERE d.ProductCode = a.ProductCode
            AND d.SaleType = a.SaleType
    )

SET NOCOUNT OFF
